/**
 * 오프라인 대관등록 
 */

$(document).ready(function(){
	
	// datepicker 설정
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' 
        ,showOtherMonths : true 
        ,showMonthAfterYear : true 
        ,changeYear: true 
        ,changeMonth: true              
        ,showOn: "both" 
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" 
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
	
});
	

function getStadium(p_num){
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
			
			alert("성공");
			if( result == "Empty" ){
				
				return;
			}else{
				return;
			}
			
			
		}
		
	});
	
	
}