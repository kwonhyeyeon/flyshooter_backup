/**
 * 구장 등록 js
 */
//등록 버튼 클릭 시 처리 이벤트
$(document).ready(function(){
	$("#p_placeForm").submit(function() {
		return placeCheck();
	});
	//사업자번호 중복
	$("#p_num").blur(function(){
		var p_num = $("#p_num").val();
		
		var pncheck = document.getElementById("pncheck");
		if(p_num.length == 0){
			pncheck.innerHTML = "필수 입력사항입니다.";
			pncheck.style.color = "red";
			ok = false;
		}else if (p_num.length > 0){
			pncheck.innerHTML = "";
			
			var query = {
					p_num : $("#p_num").val()
			};
			$.ajax({
				url:"/mypage/pnumConfirm.do",
				type: "post",
				data: query,
				error: function(){
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도 해주세요.');
				},
				success : function(resultData){
					if(resultData == "1"){
						var pncheck = document.getElementById("pncheck");
						//중복된 사업자 번호가 있음
						pncheck.innerHTML = "중복된 사업자 번호가 있습니다.";
						pncheck.style.color = "red";
						pnConfirm = 1;
						pnok = false;
					}else{
						var pncheck = document.getElementById("pncheck");
						//중복된 사업자 번호가 없음
						pncheck.innerHTML = "사용가능한 사업자 번호";
						pncheck.style.color = "blue";
						pnConfirm = 2;
						pnok = true;
					}
				}
			});
		}
	});
});



//우편주소
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
	if(p_num.value == ""){
		alert("사업자 번호를 입력해주세요");
		p_num.focus();
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
	
	

	//라디오 버튼(첨부파일 유형) 유효성 검사
	var radio = document.getElementsByName("p_file");
	p_file = 0; // undefined을 0으로 설정
	if ($('input[name="p_file"]:checked').val()) {
		p_file = $('input[name="p_file"]:checked').val();
	}
	if(p_file == 0){
		alert("첨부파일 유형을 선택해주세요.");
			return false;
		}
    
	
	//라디오 버튼 선택(첨부파일 선택)시 사업등록증,통장사본,부동산종합공부 유효성 검사
	
	if(p_file == 1){
		if(txt.value == ""){
			alert("사업등록증 넣어주세요..");
			txt.focus();
			return false;
		}
		if(txt1.value == ""){
			alert("통장사본 넣어주세요");
			txt.focus();
			return false;
		}
		if(txt2.value == ""){
			alert("부동산종합공부 넣어주세요");
			txt.focus();
			return false;
		}
	}
	
	//file(p_register)type(gif, png, jpg) 제어 -> 사업등록증
	if($("#p_register").val()!= ""){
		var ext = $('#p_register').val().split('.').pop().toLowerCase();
		if($.inArray(ext,['gif','png','jpg']) == -1){
			alert('사업자등록증은 gif, png, jpg 파일만 업로드 가능');
			return false;
		}
	}
	//file(p_account_copy)type(gif, png, jpg) 제어 -> 통장사본
	if($("#p_account_copy").val()!= ""){
		var ext = $('#p_account_copy').val().split('.').pop().toLowerCase();
		if($.inArray(ext,['gif','png','jpg']) == -1){
			alert('통장사본은 gif, png, jpg 파일만 업로드 가능');
			return false;
		}
	}
	//file(p_property)type(gif, png, jpg) 제어 -> 부동산종합공부 
	if($("#p_property").val()!= ""){
		var ext = $('#p_property').val().split('.').pop().toLowerCase();
		if($.inArray(ext,['gif','png','jpg']) == -1){
			alert('부동산종합공부은 gif, png, jpg 파일만 업로드 가능');
			return false;
		}
	}
	
	
	checking();
}

//목록 버튼 클릭 시 처리 이벤트
$(function(){
	$("#placeListBtn").click(function(){
	location.href="/mypage/placeList.do";	
	});
});

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
//라디오(서류첨부 유형) 클릭 시 클릭에 맞는 div를 밑에 보여줌
function checkBox(){
	var check_Box = document.getElementsByName("p_file");//체크박스 name
	for (j = 0; j < check_Box.length; j++){
		var disign = document.getElementById([j+1]);//보여줄 내용
		if(check_Box[j].checked == true){
			disign.style.display = "block";
		}else{
			check_Box[j].checked = false;
			disign.style.display = "none";
		}
	}
}
//우편주소
function checking(){
	var ad1 = $("#sample6_postcode").val();
	var ad2 = $("#sample6_address").val();
	var ad3 = $("#sample6_detailAddress").val();
	var ad4 = $("#sample6_extraAddress").val();
	var address = ad1+"*"+ad2+"*"+ad3+"*"+ad4;
	alert(address);
	$("#p_address").val(address);
	return true;
}
