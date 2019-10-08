/**
 * 구장별 경기장별 대관 예약 현황
 */

$(document).ready(function(){
	
	var p_num = $(".placeName-op:selected").val();	
	var s_no = $(".s_no").val();
	var name = '';
	
	// datepicker 설정
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' // Input Display Format 변경
        ,showOtherMonths : true // 빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
        ,showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: false // 콤보박스에서 년 선택 가능
        ,changeMonth: false // 콤보박스에서 월 선택 가능                
        ,showOn: "both" // button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고 버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "/resources/img/calendar.png" // 버튼 이미지 경로
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
	
	getList();
	
	
	
	$(".placeName").on("change", function(){
		
		getList();
		
	});
	
	$("#datepicker").change(function(){
		
		getList();
		
	});
	
	// 리스트 클릭 시 상세페이지 오픈
	$(document).on("click",".rental",function(){
		var index = $(".rental").index(this);
		
		var rvo = setRentalVo(index);
		
		// 오프라인 대관시 상세페이지 이용불가.
		if( !eval(rvo) ){
			return
		}
		
		showDetail(rvo);
		
	 });
		// 온라인 대관 환불요청
		$(document).on("click", ".r_refund", function(e){
			// 부모의 클릭이벤트가 전파되지 않도록 방지
			e.stopPropagation();
			
			var index = $(".r_refund").index(this);
			var data = $(".r_refund:eq("+index+")").parent().parent().attr("data-num");
			var r_no = data.split(",");
			if( confirm("환불요청후 수정이 불가합니다.\n계속 진행하시겠습니까 ? ") ){
			$.ajax({
				type : "post",
				url : "/client/rental/refundUpdate.do",
				data : {
					r_no : r_no[0]
				},
				error : function() {
					alert("시스템 오류입니다. 관리자에게 문의하세요");
				},
				success : function(result) {
					if(result == 0){
						alert("요청에 실패했습니다.\n다시 시도해주십시오.");
					}else{
						getList();
						alert("환불 요청되었습니다.");
					}
				}
				
				});
			}
			
		});
		
		// 오프라인 대관취소
		$(document).on("click", ".r_cancle", function(e){
			// 부모의 클릭이벤트가 전파되지 않도록 방지
			e.stopPropagation();
			
			var index = $(".r_cancle").index(this);
			var data = $(".r_cancle:eq("+index+")").parent().parent().attr("data-num");
			var r_no = data.split(",");
			if( confirm("오프라인으로 등록한 대관입니다.\n대관취소하시겠습니까 ?") ){
			$.ajax({
				type : "post",
				url : "/client/rental/deleteRental.do",
				data : {
					r_no : r_no[0]
				},
				error : function() {
					alert("시스템 오류입니다. 관리자에게 문의하세요");
				},
				success : function(result) {
					if(result == 0){
						alert("요청에 실패했습니다.\n다시 시도해주십시오.");
					}else{
						getList();
						alert("대관이 취소되었습니다.");
					}
				}
				
				});
			}
		});
		
		$(document).on("change", ".toggle", function(){
			
			var index = $(".toggle").index(this);
			var ir_return_status = $(".toggle:eq("+index+")").val();
			var list_index = $("#list-index").val();
			
			
			if( ir_return_status == '1' ){
				if( confirm("반납 완료로 변경하시겠습니까 ?") ){
					setItems_status(index, ir_return_status, list_index);
				}else{
					var rvo = setRentalVo(list_index);
					showDetail(rvo);
				}
			}
			
			if( ir_return_status == '2' ){
				if( confirm("대여중 상태로 변경하시겠습니까?") ){
					setItems_status(index, ir_return_status, list_index);
				}else{
					var rvo = setRentalVo(list_index);
					showDetail(rvo);
				}
			}
			
			return;
		});

});
	
		// 대여된 아이템에 관하여 상태변경 함수
		function setItems_status(index, ir_return_status, list_index){
			
			
			// 토글버튼 change시 비동기로 상태변경
			var ir_no = $(".toggle:eq("+index+")").parent().parent().attr("data-num");
			
			$.ajax({
				type : "post",
				url : "/client/rental/updateItems_rental.do",
				data : {
					ir_return_status : ir_return_status,
					ir_no : ir_no
				},
				async : false, // 동기
				error : function() {
					alert("시스템 오류입니다. 관리자에게 문의하세요");
				},
				success : function(result) {
					if( result == '0' ){
						alert("변경에 실패했습니다.\n다시 시도해주십시오");
						return;
					}
					// 상세페이지 reload
					var rvo = setRentalVo(list_index);
					showDetail(rvo);
				}
			});
			
		}
	
		
		// 대관리스트를 가져옴
		function getList(){
			
			var p_num = $("#placeName").val();
			var selectDay = $("#datepicker").val();
			
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
					return;
				}
				
			});
		}
		
		// 객체 가져오는 함수
		function setRentalVo(index){
			
			var r_info = $(".rental:eq("+index+")").attr("data-num");
			var param = r_info.split(",");
			
			var stadiumName = $(".rental:eq("+index+")").parents().parents().prev(".itemName").text();
			var td = $(".rental:eq("+index+")").children();
			
			var status = td.eq(4).text();
			if( status == '오프라인' ){
				alert("오프라인 대관은 \n상세페이지를 이용할 수 없습니다.");
				return false;
			}
			
			var rvo = {
				index : index,
				r_no : param[0],
				r_regdate : param[1],
				r_total_pay : param[2],
				m_id : td.eq(0).text(),
				r_reserve_date : td.eq(2).text(),
				r_start : stadiumName,
				r_account : td.eq(1).text(),
				r_recall_time : td.eq(3).text()
			};
			
			name = td.eq(0).text();
			
			return rvo;
		}
		
		// 상세페이지 모달창
		function openDialog(){
			
			$("#dialog").dialog({
				title : name + ' 님의 예약 정보',
				modal : true,
				width : '900',
				minHeight : '400',
				resizable : false,
				closeOnEscape : false,
				draggable : false,
				appendTo : false,
				dialogClass: 'custom-dialog-style',
				open:function(event, ui){
					$(".ui-dialog-titlebar-close", $(this).parent()).hide();
					// 모달 오버레이 설정
	                $(".ui-widget-overlay").css({
	                    opacity: 0.5,
	                    filter: "Alpha(Opacity=50)",
	                    backgroundColor: "black"
	                });
				},
				show : {
					duration : 500
				},
				hide : {
					duration : 500
				},
				buttons:[
					{
						text:'확인',
						click:function(){
							$(this).dialog("close");
							
							getList();
						}
					}
				]
			});
		}
		
		
		function showDetail(rvo){
			
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
		}