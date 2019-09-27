var idConfirm = 1;
var pwConfirm = 1;

$(document).ready(function() {
   
   $("#memberForm").submit(function() {
      return joinCheck();
   });
   // 아이디 중복 여부 여부 확인
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
               if (resultData == "1") {
                  var idcheck = document.getElementById("idcheck");
                  // 중복된 아이디가 있음
                  idcheck.innerHTML = "중복된 아이디가 있습니다";
                  idcheck.style.color = "red";
                  idConfirm = 1;
                  idok = false;

               } else {
                  var idcheck = document.getElementById("idcheck");
                  // 중복된 아이디가 없음
                  idcheck.innerHTML = "사용가능한 아이디";
                  idcheck.style.color = "blue";
                  idConfirm = 2;
                  idok = true;
               }

            }
         });
      }

   });
   // 비밀번호와 비밀번호 확인 일치 여부 확인
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
});


// 입력값 체크
function joinCheck() {
   var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
   var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   // 이메일이 적합한지 검사할 정규식

   var id = document.getElementById("m_id");
   var pw = document.getElementById("m_pw");


   // ------------ 이메일 까지 -----------

   if (!check(re2, id, "적합하지 않은 ID 형식입니다.")) {
      return false;
   }
   if (idConfirm == 1) {
      alert("중복된 아이디가 있습니다.");
      return false;
   }
   if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
      return false;
   }
   if (pwConfirm == 1) {
      alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
      memberForm.m_pwCheck.focus();
      return false;
   }
   if (memberForm.m_name.value == "") {
      alert("이름을 입력해 주세요");
      memberForm.m_name.focus();
      return false;
   }
    
   if (memberForm.m_phone.value == "") {
      alert("핸드폰번호 입력해 주세요");
      memberForm.m_phone.focus();
      return false;
   }
   idPwdCheck();
   alert("회원가입이 완료되었습니다.");
   
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