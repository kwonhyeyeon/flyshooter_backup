/**
 * 
 * 
 */
$(document).ready(function(){
	$("#placeChoice").change(function() {

		if ($("#placeChoice").val() != '선택') {
			var p_num = $("#placeChoice").val();
			var query = {p_num : $("#placeChoice").val()};
			$("#calculateTotal").text("구장을 선택되었습니다");
			calculateList(query);
		} else {
			$("#calculateTotal").text("구장을 선택해주세요");
		}
	});
	$('#c_apply').click(function() {
		alert('되랏');
		var p_num = $("#placeChoice").val();
		location.href="/mypage/calculateInsert.do?p_num="+p_num;
	});
});
function calculateList(query) {
	$.ajax({
		url : "/mypage/calculateTotal.do",
		type : "get",
		data : query,
		error : function() {
			alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			$("#calculateTotal").text("");
			$("#calculateTotal").append(resultData);
			return false;
		}
	});
}