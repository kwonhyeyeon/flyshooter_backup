/**
 * 
 */

// 유효성 체크, 메시지 내용
// 등록 시 유효성 검사
// 메세지는 alert으로 알려준다.

function chkSubmit(item, msg) {
   if (item.val().replace(/\s/g, "") == "") {
      alert(msg + " 입력해 주세요.");
      item.val("");
      item.focus();
      return false;
   } else {
      return true;
   }
}

//유효성 체크, 메시지 내용
//검색 시 유효성 검사
//메세지는 alert으로 알려준다.

function checkForm(item, msg) {
   var message = "";
   if (item.val().replace(/\s/g,"")=="") {
      message = msg + "입력해주세요.";
      item.attr("placeholder", message);
      return false;
   } else {
      return true;
   }
}


