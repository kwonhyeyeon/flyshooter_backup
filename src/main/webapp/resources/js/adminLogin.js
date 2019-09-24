/**
 * 
 */
// 뒤로가기 불가
window.history.forward();

		function noBack() {
			window.history.forward();
		}
		
$(document).ready(function(){
	
	var try_count = 0;
	var lock_start;
	
	$("form").submit(function(){
		return loginCheck();
	});
	
	
	
	function loginLock(){
		if( !(try_count % 5) ){
			lock_start = new Date().getTime();
			alert("5회 연속 실패 \n30초후에 다시 시도하십시오.");
			
			$(".login").attr("disabled", true);
			setTimeout("location.reload()", 30000);
		}
	}
	
	
	function loginCheck(){
		
		var result = false;
		
		
		var id = $("#adminId").val();
		var pw = $("#adminPw").val();
		var error_msg;
		
		if( id == "admin",  pw == "admin1234" ){
			return true;
		}
		
		$("#adminPw").val("");
		error_msg = "로그인 정보가 틀렸습니다";
		try_count++;
		
		if( !id ){
			error_msg = "아이디를 입력해 주세요";
			result = false;
		}
		else if( !pw ){
			error_msg = "비밀번호를 입력해 주세요";
			result = false;
		}
		
		$(".error_msg").attr('style', 'color:red');
		$(".error_msg").text(error_msg);
		loginLock();
		return eval(result);
	}
	
});