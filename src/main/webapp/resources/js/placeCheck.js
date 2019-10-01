/**
 * 
 */

$(document).ready(function(){
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
	});
});	

//약관 동의 한번에 2개 모두 체크 
function cAll(){
	if($("#checkAll").is(':checked')){
		$("input[type=checkbox]").prop("checked", true);
	}else {
		$("input[type=checkbox]").prop("checked", false);
	}
}
