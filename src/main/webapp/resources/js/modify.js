/**
 * 
 */
var pwConfirm;
$(document).ready(function() {
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
		// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
		switch (parseInt(errCode)) {
		case 1:
			alert("페이지에 오류가 발생하였습니다. 다시 시도해 주세요.");
			return false;
		}
	}
}
function modifyCheck() {
	var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 이메일이 적합한지 검사할 정규식

	var pw = document.getElementById("m_pw");

	// ------------ 이메일 까지 -----------
	if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		return false;
	}
	if (pwConfirm == 1) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		return false;
	}

	if (modifyForm.m_name.value == "") {
		alert("이름을 입력해 주세요");
		modifyForm.m_name.focus();
		return false;
	}

	if (modifyForm.m_phone.value == "") {
		alert("핸드폰번호 입력해 주세요");
		modifyForm.m_phone.focus();
		return false;
	}

	idPwdCheck();
	alert("수정이 완료되었습니다.");
}
function check(re, what, message) {
	if (re.test(what.value)) {
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
	// return false;
}
// 아이디에 비밀번호 포함 여부 확인
function idPwdCheck() {
	var m_id = $("#m_id").val();
	var m_pw = $("#m_pw").val();
	if (m_pw.indexOf(m_id) > -1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#m_pw").val("");
		$("#m_pw").focus();
		return false;
	} else {
		return true;
	}
}
