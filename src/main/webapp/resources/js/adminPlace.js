/**
 * 관리자 - 구장 관리
 */
$(document).ready(function() {
	
	// 구장 상태 변경 시 발생하는 이벤트
	$(".placeStatus").on("change", function(){
		
		$("#placeStatusForm").attr({
			"method" : "get",
			"action" : "/admin/place/placeList.do"
		});
		
		$("#placeStatusForm").submit();
		
	});
	
	// 구장 상세페이지 링크 이동
	$(".placeDetail").click(function() {
		
		var num = $(this).attr("data-num");
		$("#p_num").val(num);
		
		$("#detailForm").attr({
			"method" : "get",
			"action" : "/admin/place/placeDetail.do"
		});
		
		$("#detailForm").submit();
		
	});
	
	// 구장 승인 버튼 클릭 시
	$("#placeAcceptBtn").click(function() {
		
		var result = confirm("구장 승인을 하시겠습니까?\n변경 시 수정이 불가합니다");
		
		if(result) {
			$("#saveForm").attr({
				"method" : "post",
				"action" : "/admin/place/updatePok.do"
			});
			
			$("#saveForm").submit();
		}
		
	});
	
	// 폐업 등록 버튼 클릭 시 이벤트
	$(".delete").click(function() {
		
		var rentalCnt = $("#rentalCnt").val();
		var result = confirm("폐업 등록을 하시겠습니까?\n변경 시 수정이 불가합니다");
		
		if(!eval(rentalCnt)) {
			if(result) {
				$("#closeForm").attr({
					"method" : "post",
					"action" : "/admin/place/updateClose.do"
				});
				
				$("#closeForm").submit();
			}
		} else if(eval(rentalCnt) > 0) {
			alert("해당 구장에 예약된 경기장이 있습니다\n대관이 있을 경우 폐업 등록이 불가합니다");
		}
		
	});
	
	// 경기장 상세 페이지로 이동
	$(".stadiumDetail").click(function() {
		
		var sno = $(this).attr("data-num");
		$("#s_no").val(sno);
		
		$("#stdmDetailForm").attr({
			"method" : "get",
			"action" : "/admin/stadium/stadiumDetail.do"
		});
		
		$("#stdmDetailForm").submit();
				
	});
	
	// 경기장 승인
	$("#accept").click(function() {
		
		if (confirm("경기장을 등록하시겠습니까?")){
		
		var pok = $("#actok").val();
		var pstatus = $("#actstatus").val();
		
		if(pok == 0) {
			alert("승인되지 않은 구장입니다\n구장 승인 후에 경기장 승인이 가능합니다");
			return false;
		} else if(pok == 1) {
			stdmAct();
		}
		
	}
	});
	
});

function stdmAct() {
	$("#stdmAccept").attr({
		"method" : "post",
		"action" : "/admin/stadium/stadiumAccept.do"
	});
	
	$("#stdmAccept").submit();
}
