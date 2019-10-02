/**
 * 구장 등록 js
 */
// 등록 버튼 클릭 시 처리 이벤트
// 유효성 체크

function stadiumCheck() {
	
	var re = /^[0-9]{5,6}$/; // 구장요금 정규식
	var re1 = /^[0-9]{1,2}$/; // 수용인원 정규식
	
	
	var sdfee= document.getElementById("s_d_fee");
	var snfee= document.getElementById("s_n_fee");
	var sdfeew= document.getElementById("s_d_fee_w");
	var snfeew= document.getElementById("s_n_fee_w");
	var speople= document.getElementById("s_people");
	
	
	
	// 체크여부
	if(!check(re, sdfee, "평일 주간 요금(5자~6자 이내)을 확인해주세요")){  
		return false;
	}
	if(!check(re, snfee, "평일 야간 요금(5자~6자 이내)을 확인해주세요")){  
		return false;
	}
	if(!check(re, sdfeew, "주말 주간 요금(5자~6자 이내)을 확인해주세요")){  
		return false;
	}
	if(!check(re, snfeew, "주말 야간 요금(5자~6자 이내)을 확인해주세요")){  
		return false;
	}
	if (s_hours.value == "") {
		alert("최소 이용 가능 시간을 선택해주세요");
		return false;
	}
	if(!check(re1, speople, "수용인원을 확인해주세요(2자리이내)")){  
		return false;
	}
	if (s_name.value == "") {
		alert("경기장 이름을 넣어주세요");
		return false;
	}
	
	if (s_size.value == "") {
		alert("경기장 사이즈 선택해주세요");
		return false;
	}
	if (s_in_out.value == "") {
		alert("실내/외 선택해주세요");
		return false;
	}
	var chk1 = document.getElementById('s_img1');
	if(!chk1.value){
		alert('이미지1을 선택해주세요');
		return false;
	}
	var chk2 = document.getElementById('s_img2');
	if(!chk2.value){
		alert('이미지2을 선택해주세요');
		return false;
	}
	var chk3 = document.getElementById('s_img3');
	if(!chk3.value){
		alert('이미지3을 선택해주세요');
		return false;
	}

	// file(s_register)type(gif, png, jpg) 제어 -> 이미지1
	if ($("#s_img1").val() != "") {
		var ext = $('#s_img1').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n첫번째 사진을 교체해주세요');
			return false;
		}
	}
	// file(s_account_copy)type(gif, png, jpg) 제어 -> 이미지2
	if ($("#s_img2").val() != "") {
		var ext = $('#s_img2').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n두번째 사진을 교체해주세요');
			return false;
		}
	}
	// file(s_property)type(gif, png, jpg) 제어 -> 이미지3
	if ($("#s_img3").val() != "") {
		var ext = $('#s_img3').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n세번째 사진을 교체해주세요');
			return false;
		}
	}
	
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
	
	
	var file_img1= $("#s_img1").val();
	var file_img2= $("#s_img2").val();
	var file_img3= $("#s_img3").val();
	$("#fileupload").submit();
	
}

