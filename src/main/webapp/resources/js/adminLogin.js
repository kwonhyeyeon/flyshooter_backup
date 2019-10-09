/**
 * 
 */
// 뒤로가기 불가
window.history.forward();

		function noBack() {
			window.history.forward();
		}
		
$(document).ready(function(){
	
	
	$("form").submit(function(){
		return loginCheck();
	});
	
	
	
});

function loginCheck(){
	
	var result = true;
	
	
	var id = $("#adminId").val();
	var pw = $("#adminPw").val();
	var error_msg;
	
	
	if( !id ){
		error_msg = "아이디를 입력해 주세요";
		result = false;
	}
	else if( !pw ){
		error_msg = "비밀번호를 입력해 주세요";
		result = false;
	}
	
	$(".error_msg").text(error_msg);
	return eval(result);
}