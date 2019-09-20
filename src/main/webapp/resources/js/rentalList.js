/**
 * 구장별 경기장별 대관 예약 현황
 */

$(document).ready(function(){
	
	var p_num = $(".placeName-op:selected").val();	
	var s_no = $(".s_no").val();
	
	
	// datepicker 설정
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' // Input Display Format 변경
        ,showOtherMonths : true // 빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
        ,showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true // 콤보박스에서 년 선택 가능
        ,changeMonth: true // 콤보박스에서 월 선택 가능                
        ,showOn: "both" // button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고 버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" // 버튼 이미지 경로
        ,buttonImageOnly: true // 기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" // 버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" // 달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] // 달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] // 달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] // 달력의 요일 부분 Tooltip 텍스트
        ,maxDate: "+1M" // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });                    
    
    // 초기값을 오늘 날짜로 설정
	$("#datepicker").datepicker("setDate", "today");
	//(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	
	var p_num = $("#placeName").val();
	var selectDay = $("#datepicker").val();
	getList(p_num, selectDay);
	
	// 구장명 값 변경 시 해당 경기장 리스트 가져오는 이벤트
	$(".placeName").on("change", function(){
		
		p_num = $("#placeName").val();
		selectDay = $("#datepicker").val();
		
		
		getList(p_num, selectDay);
		
	});
	
	$("#datepicker").change(function(){
		p_num = $("#placeName").val();
		selectDay = $("#datepicker").val();
		
		getList(p_num, selectDay);
	});
	
	$(document).on("click",".rental",function(){
		var index = $(".rental").index(this);
		
		var rvo = setRentalVo(index);
		
		// 오프라인 대관시 상세페이지 이용불가.
		if( !eval(rvo) ){
			return
		}
		
		$.ajax({
			type : "post",
			url : "/client/rental/showDetail.do",
			data : rvo,
			error : function() {
				alert("시스템 오류입니다. 관리자에게 문의하세요");
			},
			success : function(result) {
				$(".rentalDetail").text("");
				$(".rentalDetail").append(result);
				openDialog();
			}
			
			});
	 });
	
});


		function getList(p_num, selectDay){
			
			$.ajax({
				type : "post",
				url : "/client/rental/getList.do",
				data : {
					p_num : p_num,
					selectDay : selectDay
				},
				error : function() {
					alert("시스템 오류입니다. 관리자에게 문의하세요");
				},
				success : function(result) {
					$(".stadiumList").text("");
					$(".stadiumList").append(result);
				}
				
			});
		}
		
		
		function setRentalVo(index){
			
			var r_info = $(".rental:eq("+index+")").attr("data-num");
			param = r_info.split(",");
			
			
			var stadiumName = $(".rental:eq("+index+")").parent().parent().parent().prev().prev().prev().text();
			var td = $(".rental:eq("+index+")").children();
			
			var status = td.eq(4).text();
			if( status == '오프라인' ){
				alert("오프라인 대관은 \n상세페이지가 없습니다.");
				return false;
			}
			
			var rvo = {
				r_no : param[0],
				r_regdate : param[1],
				r_total_pay : param[2],
				m_id : td.eq(0).text(),
				r_reserve_date : td.eq(2).text(),
				r_start : stadiumName,
				r_account : td.eq(1).text(),
				r_recall_time : td.eq(3).text()
			};
			
			return rvo;
		}
		
		// 상세페이지 모달창
		function openDialog(){
			$("#dialog").dialog({
				title : '대관 상세페이지',
				model : true,
				width : '450',
				height : '350',
				closeOnEscape:false,
				open:function(event, ui){
					$(".ui-dialog-titlebar-close", $(this).parent()).hide();
				},
				resizeable : false,
				show : {
					effect : "blind",
					duration : 1000
				},
				hide : {
					effect : "explode",
					duration : 1000
				},
				buttons:[
					{
						// 버튼 텍스트
						text:'환불요청',
						click:function(){
							
						}
					},
					{
						text:'확인',
						click:function(){
							confirm("확인시 변경사항은 저장됩니다.");
							$(this).dialog("close");
						}
					}
				]
			});
		}