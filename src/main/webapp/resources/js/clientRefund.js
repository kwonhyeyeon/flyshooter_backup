/**
 * clientRefund
 */

$(document).ready(function() {
	
	getToday();
	
	var year = getToday().split("/")[0];
	var month = getToday().split("/")[1];
	var registerYear = $("#register").val().split("/")[0]; // 가입 년도
	var registerMonth = $("#register").val().split("/")[1]; // 가입 월
	
	// default
	$("#year").text(year);
	
	for(var i = year; i >= registerYear; i--) {
		$("#year").append("<option value='" + i + "'>" + i + "년</option>");
	}
	
	$("#month").empty();
	for(var j = 1; j <= month; j++) {
		if(j < 10) {
			j = "0" + j;
		}
		$("#month").append("<option value='" + j + "'>" + j + "월</option>");
		$("#month").val(month);
	}
	
	$("#p_ok").val("1");
	
	// year값 변경 시
	$("#year").change(function() {
		
		$("#p_ok").val("2");
		
		$("#month").empty();
		$("#month").append("<option value=''>월 선택</option>");
		
		var sYear = $("#year").val();
		var sMonth = $("#month").val();
		
		if(sYear == registerYear) { // 가입한 해이면
			
			for(var j = registerMonth; j <= 12; j++) { // 가입한 달부터 출력
				if(j == registerMonth) {
					j = "" + j;
				} else if(j < 10) {
					j = "0" + j;
				}
				
				$("#month").append("<option value='" + j + "'>" + j + "월</option>");
			}
			
		} else if(sYear == year) { // 해당 년도
			for(var j = 1; j <= month; j++) {
				if(j < 10) {
					j = "0" + j;
				}
				$("#month").append("<option value='" + j + "'>" + j + "월</option>");
			}
		} else {
			for(var j = 1; j <= 12; j++) {
				if (j < 10) {
					j = "0" + j;
				}
				
				$("#month").append("<option value='" + j + "'>" + j + "월</option>");
			}
		}
		
	});
	
	$("#month").change(function() {
		
		$("#p_ok").val("3");
		
		var sYear = $("#year").val();
		
		if(sYear == registerYear) { // 가입한 해이면
			
			for(var j = registerMonth; j <= 12; j++) { // 가입한 달부터 출력
				if(j == registerMonth) {
					j = "" + j;
				} else if(j < 10) {
					j = "0" + j;
				}
				
				$("#month").append("<option value='" + j + "'>" + j + "월</option>");
			}
			
		} else if(sYear == year) { // 해당 년도
			for(var j = 1; j <= month; j++) {
				if(j < 10) {
					j = "0" + j;
				}
				$("#month").append("<option value='" + j + "'>" + j + "월</option>");
			}
		} else {
			for(var j = 1; j <= 12; j++) {
				if (j < 10) {
					j = "0" + j;
				}
				
				$("#month").append("<option value='" + j + "'>" + j + "월</option>");
			}
		}
		
	});
	
	// 년, 월로 환불 현황 검색하는 폼
	$("#refundSearch").click(function() {
		
		$("#refundListForm").attr({
			"method" : "get",
			"action" : "/client/rental/refundList.do"
		});
		
		$("#refundListForm").submit();
		
	});
	
	// 상세 페이지 이동 폼
	$("#getR_no").click(function() {
		
		var num = $("#getR_no").attr("data-num");
		$("#r_no").val(num);
		
		$("#detailRefund").attr({
			"method" : "post",
			"action" : "/client/rental/detailRefund.do"
		});
		
		$("#detailRefund").submit();
		
	});
	
});

// 현재 날짜
function getToday(){
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1; //1월이 0으로 되기때문에 +1을 함.

    if((month + "").length < 2){ //2자리가 아니면 0을 붙여줌.
        month = "0" + month;
    } else {
         // ""을 빼면 year + month(숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
        month = "" + month;
    }
    
    return today = year + "/" + month;
}