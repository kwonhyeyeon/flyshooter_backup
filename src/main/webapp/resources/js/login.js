/**
 * 
 */
$(function(){
	errCodeCheck()
	$('#m_id', '#m_pw').bind("keyup", function(){
		$(this).parents("div").find("error").html("");
	});
});

