/**
 * 
 */

$(document).ready(function(){
	//구장등록 버튼 클릭시 처리 이벤트(구장 리스트->약관동의)
	$("#insertPlaceBtn").click(function() {
		location.href= "/mypage/placecheck.do";
	});
	/* 리스트 클릭시 대관신청페이지로 이동 */
	$(".goRental").click(function(){
		var p_num =  $(this).attr("data-num");	
		$("#p_num").val(p_num);
		
		//대관신청페이지로 이동하기 위해 form추가 (id : rentalInsertForm) 
		$("#rentalInsertForm").attr({
			"method":"post",
			"action":"/user/rental/rentalStadium.do"
		});
		
		$("#rentalInsertForm").submit(); 
	});
	/* 리스트 클릭시 대관신청페이지로 이동 */
	$(".detailPage").click(function(){
		var p_num =  $(this).parents("tr").attr("data-num");
		$("#p_num").val(p_num);
		
		$("#datailForm").submit(); 
	});
});



