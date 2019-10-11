/**
 * 
 */
var pwConfirm;
$(document).ready(function() {
	$(".m_phone0 option").each(function() {
		if ($(this).val() == "${mvo.m_phone0}") {
			$(this).attr("selected", "selected");
		}
	});
	$("#modifyForm").submit(function() {
		return modifyCheck();
		errCodeCheck();
	});
	function errCodeCheck() {
		var errCode = '<c:out value = "${errCode}"/>';
		if (errCode != "") {
			//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				alert("페이지에 문제가 있어 회원 탈퇴에 실패하였습니다. 다시 로그인해 주세요. ");
				return false;
			case 3:
				alert("페이지에 문제가 있어 회원 수정에 실패하였습니다. 다시 로그인해 주세요. ");
				return false;
			}
		}
	}
	$("#delete").click(function(){
		location.href = "/member/delete.do";
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
	var re2 = /^[0-9]*$/; // 숫자 정규식
	var re4 = /[a-z]/i;  //적어도 한개의 a-z 확인
	var re5 = /\d/;  //적어도 한개의 0-9 확인
	//휴대폰번호 합치기
	$("#m_phone").val($("#m_phone0").val()+'-'+$("#m_phone1").val()+'-'+$("#m_phone2").val());
	   
	var m_phone1 = document.getElementById("m_phone1");
	var m_phone2 = document.getElementById("m_phone2");
	var pw = document.getElementById("m_pw");

	// ------------ 이메일 까지 -----------
	if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		return false;
	}
	if(!check(re4, pw, "숫자와 문자 포함 형태의 6~12자리 이내")){
		return false;
	}
	if(!check(re5, pw, "숫자와 문자 포함 형태의 6~12자리 이내")){
		return false;
	}
	if (!check(re2, m_phone1, "핸드폰 번호는 숫자로만 입력하세요!")) {
		return false;
	}
	if (!check(re2, m_phone2, "핸드폰 번호는 숫자로만 입력하세요!!")) {
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
}
function check(re, what, message) {
	if (re.test(what.value)) {
		return true;
	}
	alert(message);
	return false;
}
