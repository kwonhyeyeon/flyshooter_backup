/**
 * 
 */
$(document).ready(function() {
	var p_num = $('#p_num').val();
	// 등록 버튼 클릭 시 처리 이벤트
	$("#p_placeModifyForm").submit(function() {
		return placeCheck();
	});

	$(".p_holiday option").each(function() {
		if ($(this).val() == "${pvo.p_holiday}") {
			$(this).attr("selected", "selected");
		}
	});

	$(".p_open option").each(function() {
		if ($(this).val() == "${pvo.p_open}") {
			$(this).attr("selected", "selected");
		}
	});

	$(".p_close option").each(function() {
		if ($(this).val() == "${pvo.p_close}") {
			$(this).attr("selected", "selected");
		}
	});
	
	$(".p_bank option").each(function() {
		if ($(this).val() == "${pvo.p_bank}") {
			$(this).attr("selected", "selected");
		}
	});

	$("#p_status").change(function() {
		var closePlace = document.getElementById("closePlace");
		if ($("#p_status").val() == "2") {
			jQuery('#p_holidaydate').show();
			closePlace.innerHTML = "";
		} else if ($("#p_status").val() == "3") {
			jQuery('#p_holidaydate').hide();
			var query = {
				p_num : p_num
			};
			$.ajax({
				url : "/mypage/closePlace.do",
				type : "post",
				data : query,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					if (resultData == "1") {
						// 대관 예약이 있습니다.
						closePlace.innerHTML = "대관 예약이 있습니다.";
						closePlace.style.color = "red";
						closeConfirm = 1;

					} else {
						// 대관 예약이 없습니다.
						closePlace.innerHTML = "폐업 상태로 전환 가능합니다.";
						closePlace.style.color = "blue";
						closeConfirm = 2;
					}

				}
			});
		} else {
			jQuery('#p_holidaydate').hide();
			closePlace.innerHTML = "";
		}

	});
});

//유효성 검사
function placeCheck(){
   //체크여부
   if(p_name.value == ""){
      alert("구장명을 입력해주세요");
      p_name.focus();
      return false;
   }
   if(p_ceo.value == ""){
      alert("대표자명 입력해주세요");
      p_ceo.focus();
      return false;
   }
   if(p_phone.value == ""){
      alert("구장 전화번호를 입력해주세요");
      p_phone.focus();
      return false;
   }
   if(sample6_postcode.value == ""){
      alert("우편번호를 넣어주세요");
      return false;
   }
   if(sample6_address.value == ""){
      alert("주소를 넣어주세요");
      return false;
   }
   if(p_account.value == ""){
      alert("예금주명을 입력해주세요");
      p_account.focus();
      return false;
   }
   if(p_account_num.value == ""){
      alert("입금계좌번호를 입력해주세요");
      p_account_num.focus();
      return false;
   }   
   if(p_intro.value == ""){
	      alert("소개글을 입력해주세요");
	      p_intro.focus();
	      return false;
   }
   checking();
  
}

//다음 우편주소 api 복사 붙여넣기
function sample6_execDaumPostcode() {
	 new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수
           var extraAddr = ''; // 참고항목 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }

           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
           if(data.userSelectedType === 'R'){
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraAddr !== ''){
                   extraAddr = ' (' + extraAddr + ')';
               }
               // 조합된 참고항목을 해당 필드에 넣는다.
               document.getElementById("sample6_extraAddress").value = extraAddr;
           
           } else {
               document.getElementById("sample6_extraAddress").value = '';
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('sample6_postcode').value = data.zonecode;
           document.getElementById("sample6_address").value = addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById("sample6_detailAddress").focus();
       }
   }).open();
}
//우편주소
function checking() {
	var ad1 = $("#sample6_postcode").val();
	var ad2 = $("#sample6_address").val();
	var ad3 = $("#sample6_detailAddress").val();
	var ad4 = $("#sample6_extraAddress").val();
	var address = ad1 + "*" + ad2 + "*" + ad3 + "*" + ad4;
	alert(address);
	$("#p_address").val(address);
	return true;
}

