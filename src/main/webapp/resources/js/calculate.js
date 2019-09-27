/**
 * 
 * 
 */
$(document).ready(function(){
	$('.calculateInsert').click(function() {
		if (confirm('정산 신청 하시겠습니까?')) {
			var index = $(".calculateInsert").index(this);
			var data = $(".calculateInsert:eq("+index+")").parent().parent().attr("data-num");
			var arr = data.split(',');
			
			$("#p_num").val(arr[0]);
			$("#c_rental_cnt").val(arr[1]);
			$("#c_return_cnt").val(arr[2]);
			$("#c_payment").val(arr[3]);
			$('#calculateIn').submit();
		}
	});
});
function goPage(page){
	$("#page").val(page);
	$("#f_search").attr({
		"method":"get",
		"action":"/mypage/calculate.do"
	});
	
	$("#f_search").submit();
}

