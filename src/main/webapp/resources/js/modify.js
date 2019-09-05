/**
 * 
 */
$(document).ready(function(){
	$("#modifyForm").submit(function() {
		return modifyCheck();
	});
	$("#m_pwCheck, #m_pw").blur(function() {
		var m_pw = $("#m_pw").val();

		var pwcheck = document.getElementById("pwcheck");

		if ($("#m_pw").val() != $("#m_pwCheck").val()) {
			pwcheck.innerHTML = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
			pwcheck.style.color = "red";
			$("#m_pwCheck").val("");
			pwConfirm = 1;
			return false;
		} else {
			pwcheck.innerHTML = " ";
			pwConfirm = 2;
			return true;
		}

	});
	$("#home").click(function() {
		location.href = "/";
	});
	errCodeCheck();
});
function errCodeCheck() {
	var errCode = '<c:out value = "${errCode}"/>';
	var retry = '<c:out value = "${retry}"/>';
	if (errCode != "") {
		//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
		switch (parseInt(errCode)) {
		case 1:
			alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요. ("
					+ retry + "/5회) 시도");
			return false;
		case 2:
			alert("로그인 후 이용 바랍니다.");
			return false;
		case 3:
			alert("회원 유형이 일치하지 않습니다.\n다시 시도해 주세요");
			return false;
		case 6:
			alert("5번이상 로그인 시도로 30초동안 로그인 할 수 없습니다.\n잠시 후 다시  시도해 주세요");
			return false;
		case 9:
			alert("이메일 인증이 이루어져 있지 않습니다. \n이메일 인증을 해주세요.");
			return false;
		}
	}
}
				

		


