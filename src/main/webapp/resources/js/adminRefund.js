/**
 * adminRefund.js
 */
$(document).ready(function() {
	
	// 환불 상태 변경 시 발생하는 이벤트
	$(".payStatus").on("change", function(){
		
		$("#payStatusForm").attr({
			"method" : "get",
			"action" : "/admin/place/updateRefund.do"
		});
		
		$("#payStatusForm").submit();
		
	});
	
	// 환불 상세페이지 링크 이동
	$(".detailRefund").click(function() {
		
		var rno = $(this).attr("data-num");
		$("#r_no").val(rno);
		
		$("#detailForm").attr({
			"method" : "get",
			"action" : "/admin/place/refundDetail.do"
		});
		
		$("#detailForm").submit();
		
	});
	
	$("#refundBtn").click(function() {
		
		var result = confirm("환불액을 지급하시겠습니까?");
		
		if(result) {
			$("#refundAccept").attr({
				"method" : "get",
				"action" : "/admin/place/updateRefundStatus.do"
			});
			
			$("#refundAccept").submit();
		}
		
	});
	
});

