/**
 * 오프라인 대관등록 
 */

$(document).ready(function(){
	
	// datepicker 설정
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' 
        ,showOtherMonths : true 
        ,showMonthAfterYear : true 
        ,changeYear: false 
        ,changeMonth: false              
        ,showOn: "both" 
        ,buttonImage: "/resources/img/calendar.png" 
        ,buttonImageOnly: true 
        ,buttonText: "선택"               
        ,yearSuffix: "년" 
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
        ,dayNamesMin: ['일','월','화','수','목','금','토'] 
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
        ,maxDate: "+1M"  
    });                    
    
    // 초기값을 오늘 날짜로 설정
	$("#datepicker").datepicker("setDate", "today");
	
	
	
	
	// 구장 selectBox선택시 경기장 SelectBox설정
	$("#placeName").change(function(){
		
		var p_num = $("#placeName").val();
		
		getStadium(p_num);

	});
	
	// 대관가능한 시간 조회 - 경기장 변경시
	$(document).on("change","#stadiumSelectBox",function(){ 
		
		var s_no = $("#stadiumSelectBox").val();
		var selectDay = $("#datepicker").val();

		if( s_no ) getPossibleTimeList(s_no, selectDay);
		
	});
	
	// 대관가능한 시간 조회 - 날짜변경시
	$(document).on("change","#datepicker",function(){ 
		
		var s_no = $("#stadiumSelectBox").val();
		var selectDay = $("#datepicker").val();

		if( s_no ) getPossibleTimeList(s_no, selectDay);
		
	});
	
	
	// 대관현황 페이지 이동
	$(document).on("click","#goRentalList",function(){ 
		location.href = "/client/rental/rentalList.do";
	});
	
	
	// 오프라인 대관등록
	$(document).on("click","#offRegister",function(){ 
		
		
		// 시간이 선택되지 않았을 경우
		if( !($('input:radio[name=reservationTime]').is(':checked')) ){
		
			alert("예약시간을 선택해주십시오.");
			return;
		}
		
		if( !(confirm("오프라인대관 등록입니다.\n등록하시겠습니까?")) ) return;
			
		var s_no = $("#stadiumSelectBox").val();
		var r_reserve_date = $("#datepicker").val();
		var arg = $("input:radio[name='reservationTime']:checked").val();
		var reserve_time = arg.split(",");
		var r_start = reserve_time[0];
		
		var rvo = {
			s_no : s_no,
			r_reserve_date : r_reserve_date,
			r_start : r_start
		};
		
		
		var param = makeOverlapKey();
			// 선택된 시간대가 현재 예약이 진행중인지 확인하는 동기처리
			$.ajax({
				type:"post",
				url:"/user/rental/reservationCheck.do",
				async : false, // 동기
				data:{overlapKey : param},
				error: function() {
					alert("시스템에러\n관리자에게 문의하십시오.")
				},
				success:function(result){
					if(eval(result)){
						// 오프라인 대관등록
						offlineRentalInsert(rvo);
						// 예약가능한 시간대 리로드
						getPossibleTimeList(s_no, r_reserve_date);
					}else{
						alert("해당시간은 현재 온라인예약이 진행중입니다.");
					}
					
					
				}
				
			});
	});
	
});


function offlineRentalInsert(rvo){
	
	
	$.ajax({
		type:"post",
		url:"/client/rental/offlineInsert.do",
		async : false, // 동기
		data:rvo,
		error: function() {
			 alert("시스템에러\n관리자한테 문의하십시오");
		},
		success:function(result){
			if(result == '1'){
				alert("대관등록이 완료되었습니다");
			}else{
				alert("대관등록이 실패하였습니다.\n잠시후 다시 등록해주십시오");
			}
		}
		
	});
	
}

	
function makeOverlapKey(){
	var selectDay = $("#datepicker").val();
	var arg1 = $("input:radio[name='reservationTime']:checked").val();
	var result = arg1.split(",");
	var s_no = $("#stadiumSelectBox").val();
	
	// 예약중인 대관테이블에 저장될 key값
	var param = s_no+""+selectDay+""+result[0];
	
	return param;
}

function getStadium(p_num){
	
	$("#selectTime").html("");
	
	$.ajax({
		type:"post",
		url:"/client/rental/getStadium.do",
		data:{p_num : p_num
				},
		error: function() {
			 alert("대관시간 조회에 실패하였습니다.\n다시 시도해주십시오.");
		},
		success:function(result){
			if( result == "Empty" ){
				$("#stadiumSelectBox option").remove();
				$("#stadiumSelectBox").append("<option>경기장 없음</option>");
				return;
			}else{
				$("#stadiumSelectBox option").remove();
				$("#stadiumSelectBox").append(result);
				return;
			}
			
			
		}
		
	});
}

function getPossibleTimeList(s_no, selectDay){
	
	
	$.ajax({
		type:"post",
		url:"/client/rental/searchTime.do",
		data:{
			s_no : s_no,
			selectDay : selectDay
				},
		error: function() {
			 alert("대관시간 조회에 실패하였습니다.\n다시 시도해주십시오.");
		},
		success:function(result){
			
			$("#selectTime p").remove();
			$("#selectTime").html(result);
		}
		
	});
	
	
}