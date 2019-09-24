/**
 * 
 * 
 */
$(document).ready(function(){
	$("#placeChoice").change(function() {

		if ($("#placeChoice").val() != '선택') {
			alert('그래프다 이새키야~');
		} else {
			alert('되나');
			location.href='/mypage/stats.do';
		}
	});
});
