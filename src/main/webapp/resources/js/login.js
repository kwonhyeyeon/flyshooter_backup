/**
 * 
 */
$(document).ready(function() {
	
	$("#loginForm").submit(function() {
		return loginCheck();
	});
});

//입력값 체크
function loginCheck() {
	var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 이메일이 적합한지 검사할 정규식

	var id = document.getElementById("m_id");
	var pw = document.getElementById("m_pw");

	if (!check(re2, id, "적합하지 않은 ID 형식입니다.")) {
		return false;
	}
	if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		return false;
	}
	
	alert("로그인이 완료되었습니다.");
	
}
function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}
