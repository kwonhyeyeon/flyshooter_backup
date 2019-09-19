/**
 * 
 */

function stadiumModifyCheck(){
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