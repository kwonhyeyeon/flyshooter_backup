/**
 * 구장 등록 js
 */
// 등록 버튼 클릭 시 처리 이벤트
$(document).ready(function() {
	$("#stadiumForm").submit(function() {
		return stadiumCheck();
	});
	// 추가 버튼 클릭 시 처리 이벤트
	$("#stadiumPlus").click(function() {
		$("#select").attr({
			"value" : "1"
		});

		$("#stadiumForm").submit();
	});

});

// 유효성 체크

function stadiumCheck() {
	// 체크여부
	if (s_d_fee.value == "") {
		alert("평일 주간 요금을 입력해주세요");
		s_d_fee.focus();
		return false;
	}
	if (s_n_fee.value == "") {
		alert("평일 야간 요금 입력해주세요");
		s_n_fee.focus();
		return false;
	}
	if (s_d_fee_w.value == "") {
		alert("주말 주간 요금를 입력해주세요");
		s_d_fee_w.focus();
		return false;
	}
	if (s_n_fee_w.value == "") {
		alert("주말 야간 요금를 입력해주세요");
		s_n_fee_w.focus();
		return false;
	}
	if (s_hours.value == "") {
		alert("최소 이용 가능 시간을 선택해주세요");
		return false;
	}
	if (s_people.value == "") {
		alert("수용 인원을 입력해주세요");
		s_people.focus();
		return false;
	}
	if (s_name.value == "") {
		alert("경기장 명을 입력해주세요");
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

	// file(s_register)type(gif, png, jpg) 제어 -> 사업등록증
	if ($("#s_img1").val() != "") {
		var ext = $('#s_img1').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n첫번째 사진을 교체해주세요');
			return false;
		}
	}
	// file(s_account_copy)type(gif, png, jpg) 제어 -> 통장사본
	if ($("#s_img2").val() != "") {
		var ext = $('#s_img2').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n두번째 사진을 교체해주세요');
			return false;
		}
	}
	// file(s_property)type(gif, png, jpg) 제어 -> 부동산종합공부
	if ($("#s_img3").val() != "") {
		var ext = $('#s_img3').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n세번째 사진을 교체해주세요');
			return false;
		}
	}
}

