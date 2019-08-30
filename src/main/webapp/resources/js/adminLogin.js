/**
 * 
 */

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
			
			$("#login").attr("disabled", true);
			setTimeout("location.reload()", 30000);
		}
	}
	
	
	function loginCheck(){
		
		var result = false;
		
		
		var id = $("#adminId").val();
		var pw = $("#adminPw").val();
		var message;
		
		if( id == "admin",  pw == "admin1234" ){
			return true;
		}
		
		message = "로그인 정보가 틀렸습니다";
		try_count++;
		
		if( !id ){
			message = "아이디를 입력하십시오.";
			result = false;
		}
		else if( !pw ){
			message = "비밀번호를 입력하십시오.";
			result = false;
		}
		
		$("#message").attr('style', 'color:red');
		$("#message").text(message);
		loginLock();
		return eval(result);
	}
	
});