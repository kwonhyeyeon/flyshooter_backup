/**
 * 
 */

$(document).ready(function() {
	var id = $("#m_id").val();
	var pw = $("#m_pw").val();
	
	$("#loginForm").submit(function() {
		if (!(id)) {
			alert("아이디를 입력하세요");
			alert(id)
			return false;
		}
		if (!(pw)) {
			alert("비밀번호를 입력하세요");
			return false;
		}else{
			return true;
		}
		
	});
	
	
});

