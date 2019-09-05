/**
 * 
 */

$(document).ready(function(){
	
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
	
	//구장등록 버튼 클릭시 처리 이벤트(구장 리스트->약관동의)
	$("#insertPlaceBtn").click(function() {
		location.href= "/mypage/placecheck.do";
	});
	
	//동의 버튼 클릭시 처리 이벤트(약관 동의-> 구장 등록)
	$("#insertPlaceBtns").click(function() {
		//이용약관 체크여부
		if(!($('#c1').is(":checked"))){
			alert("이용약관에 동의하지 않았습니다.");
			return false;
		}
		//개인정보 수집 체크여부
		if(!($('#c2').is(":checked"))){
			alert("개인정보 수집에 동의하지 않았습니다.");
			return false;
		}
		location.href= "/mypage/placeForm.do";
	});
	
	
});
//약관 동의 한번에 2개 모두 체크 비체크
function cAll(){
	if($("#checkAll").is(':checked')){
		$("input[type=checkbox]").prop("checked", true);
	}else {
		$("input[type=checkbox]").prop("checked", false);
	}
}

