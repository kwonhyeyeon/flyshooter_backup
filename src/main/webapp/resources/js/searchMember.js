$(document).ready(function() {
		$("#searchFormId").submit(function() {
				var re = /^[가-힣]{2,50}$/;//이름 한글로 (2~50자)
				var re1 = /^01([0|1|6|9]?)-?([0-9]{4})-?([0-9]{4})$/;// 핸드폰 번호 정규식
				//휴대폰번호 합치기
				$("#m_phone").val($("#m_phone1").val()+'-'+$("#m_phone2").val()+'-'+$("#m_phone3").val());
				
				var mname = document.getElementById("m_name");
				var mphone = document.getElementById("m_phone");
				
				if (!check(re, mname, "이름 형식을 확인해주세요(한글로 2~50자).")) {
				    return false;
				}
				if (!check(re1, mphone, "핸드폰번호 010,011,016,019 형식을 맞춰주세요.")) {
				   return false;
				}
				//라디오 버튼(첨부파일 유형) 유효성 검사
				if ($('input[name="m_type"]:checked').val()) {
					m_type = $('input[name="m_type"]:checked').val();
				}else{
					alert("회원 유형을 선택해주세요.");
					return false;
				}
				
				
			});
		$("#searchFormPw").submit(function() {
				var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				var mid = document.getElementById("m_id");
				
				if(!check(re2, mid, "아이디(이메일) 형식 맞춰주세요.")){
					return false;
				}
		});
		//check 정규식에 사용
		function check(re, what, message) {
		    if(re.test(what.value)) {
		        return true;
		    }
		    alert(message);
		    what.value = "";
		    what.focus();
		   // return false;
		  
		}
	});