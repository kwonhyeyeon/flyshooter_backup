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
			//휴대폰번호 합치기
			$("#m_phone").val($("#m_phone1").val()+'-'+$("#m_phone2").val()+'-'+$("#m_phone3").val());
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
	});
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
				<label for="phone">핸드폰번호 </label>
				<div>
					<select name="m_phone1" id="m_phone1">
						<option value="010" selected>010</option>
						<option value="012">012</option>
						<option value="013">013</option>
						<option value="019">019</option>
					</select>
						 - 
					<input type="text" id="m_phone2" name="m_phone2" maxlength="4"
						placeholder="Phone Number">
						 - 
					<input type="text" id="m_phone3" name="m_phone3" maxlength="4"
						placeholder="Phone Number">
					<input type="hidden" name="m_phone" id="m_phone"/>
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
			<input type="submit" value="비밀번호 찾기" id="serchPw" name="serchPw" />
		</form>
	</div>
</body>
</html>