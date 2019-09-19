/**
 * 
 */
$(document).ready(function(){
	$(document).on("click",".detailPage",function(){
		var s_no =  $(this).parents("tr").attr("data-num");
		$("#s_no").val(s_no);
		$("#datailForm").submit(); 
	});
});