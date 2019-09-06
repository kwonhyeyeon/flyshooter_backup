<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Serch ID/PW</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<script>
	$(document).ready(function() {
		$("#searchFormId").submit(function() {
			var m_name = $("#m_name").val();
			var m_phone = $("#m_phone").val();
			if (!(m_name)) {
				alert("이름을 입력하세요");
				return false;
			}
			if (!(m_phone)) {
				alert("핸드폰번호를 입력하세요");
				return false;
			}
		});
		$("#searchFormPw").submit(function() {
			var m_id = $("#m_id").val();
			if (!(m_id)) {
				alert("아이디를 입력하세요");
				return false;
			}
		});
		errCodeCheck();
	});
	function errCodeCheck() {
		var errCode = '<c:out value = "${errCode}"/>';
		if (errCode != "") {
			//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				alert("일치하는 아이디가 존재하지 않습니다.");
				return false;
			case 3:
				alert("이메일이 발송되었습니다. 이메일을 확인해주세요");
				return false;
			}
		}
	}
</script>
<body>
	<div>
		<label for="namaing">ID 찾기</label>
		<form id="searchFormId" action="/member/serchId.do" method="post">
			<div>
				<input type="radio" name="m_type" value="1" required />일반
				<input type="radio" name="m_type" value="0" required />사업자
			</div>
			<div>
				<label for="id">이름</label>
				<div>
					<input type="text" id="m_name" name="m_name" placeholder="User Name" />
				</div>
			</div>
			<div>
				<label for="pw">전화번호</label>
				<div>
					<input type="text" id="m_phone" name="m_phone" placeholder="Phone">
				</div>
			</div>
			<input type="submit" value="아이디 찾기" id="serchId" name="serchId" />
		</form>
	</div>
	<div>
		<label for="namaing">PW 찾기</label>
		<form id="searchFormPw" action="/member/serchPw.do" method="post">
			<div>
				<label for="id">ID</label>
				<div>
					<input type="email" id="m_id" name="m_id" placeholder="User ID" />
				</div>
			</div>
			<input type="submit" value="아이디 찾기" id="serchPw" name="serchPw" />
		</form>
	</div>
</body>
</html>