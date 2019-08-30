<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Member!</title>
</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		//아이디 중복 여부 여부 확인
		$("#m_id").blur(function() {
			var m_id = $("#m_id").val();

			var idcheck = document.getElementById("idcheck");

			if (m_id.length == 0) {
				idcheck.innerHTML = "필수 입력사항입니다.";
				idcheck.style.color = "red";
				ok = false;

			} else if (m_id.length > 0) {
				idcheck.innerHTML = " ";

				var query = {
					m_id : $("#m_id").val()
				};

				$.ajax({
					url : "/member/userIdConfirm.do",
					type : "post",
					data : query,
					error : function() {
						alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
					},
					success : function(resultData) {
						console.log("resultData:" + resultData);
						if (resultData == "1") {
							var idcheck = document.getElementById("idcheck");
							// 중복된 아이디가 있음
							idcheck.innerHTML = "중복된 아이디가 있습니다";
							idcheck.style.color = "red";
							idok = false;

						} else {
							var idcheck = document.getElementById("idcheck");
							// 중복된 아이디가 없음
							idcheck.innerHTML = "사용가능한 아이디";
							idcheck.style.color = "blue";
							idok = true;
						}

					}
				});
			}

		});
		//비밀번호와 비밀번호 확인 일치 여부 확인
		$("#m_pwCheck, #m_pw").blur(function() {
			var m_pw = $("#m_pw").val();

			var pwcheck = document.getElementById("pwcheck");

			if ($("#m_pw").val() != $("#m_pwCheck").val()) {
				pwcheck.innerHTML = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
				pwcheck.style.color = "red";
				$("#m_pwCheck").val("");
				return false;
			} else {
				pwcheck.innerHTML = " ";
				return true;
			}

		});
		$("#joinCancel").click(function() {
			location.href = "/member/login.do";
		});
	});
</script>
<body>
	<div>
		<form id="memberForm" action="/member/join.do" method="post">
			<div>
				<input type="radio" name="m_type" value="1" id="m_type"/>일반 
				<input type="radio" name="m_type" value="0" id="m_type"/>사업자
			</div>
			<div>
				<label for="id">ID</label>
				<div>
					<input type="email" id="m_id" name="m_id" placeholder="User ID" /><span
						id="idcheck"> </span>
				</div>
			</div>
			<div>
				<label for="pw">비밀 번호</label>
				<div>
					<input type="password" id="m_pw" name="m_pw" maxlength="15"
						placeholder="Password">
				</div>
			</div>
			<div>
				<label for="pwCheck">비밀번호 확인 </label>
				<div>
					<input type="password" id="m_pwCheck" name="m_pwCheck"
						maxlength="15" placeholder="Password Confirm"> <span
						id="pwcheck"></span>
				</div>
			</div>
			<div>
				<label for="userName">회원이름</label>
				<div>
					<input type="text" id="m_name" name="m_name" maxlength="10"
						placeholder="NAME">
				</div>
			</div>
			<div>
				<label for="phone">핸드폰번호 </label>
				<div>
					<input type="text" id="m_phone" name="m_phone" maxlength="15"
						placeholder="Phone Number">
				</div>
			</div>
			<div>
				<div>
					<input type="submit" value="확인" id="joinInsert" /> 
					<input type="reset" value="재작성" id="joinReset" /> <input type="button"
						value="취소" id="joinCancel" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>