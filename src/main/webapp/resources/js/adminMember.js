/**
 * 
 */


$(document).ready(function(){
	
	var chk = '';
	
	// 회원 상태 변경 버튼 클릭 시
	$(".memberEdit").click(function() {
		
		var index = $(".memberEdit").index(this);
		chk = $(".m_status:eq("+index+")").val();
		setTd(index);
	});
	
	// 회원상태 변경후 저장버튼 클릭시
	$(".goUpdate").click(function(){
		
		
		var index = $(".goUpdate").index(this);
		setUpdateForm(index);
		
		var changeChk =  $(".m_status:eq("+index+")").val();
		
		// 회원상태 변경없이 저장버튼이 눌렸을경우
		if( chk == changeChk ){
			alert("회원상태가 변경되지 않았습니다.");
			return;
		}
		
		if(confirm("수정하시겠습니까 ? ")){
			
			
			var query = {
					m_id : $("#m_id").val(),
					m_type : $("#m_type").val()
					};
			
			
			$.ajax({
				type:"post",
				url:"/admin/member/searchReservedCnt.do",
				data:query,
				error: function() {
					 alert("System 오류입니다.\n다시 시도해주십시오.");
				},
				success:function(result){
					if(!eval(result)){
						alert("수정완료.");
						$("#memberUpdate").attr({
							"method":"post",
							"action":"/admin/member/updateMember.do"
						});
							$("#memberUpdate").submit();
					}else if(result == -1){
						alert("System 오류..\n관리자에게 문의하십시오");
					}else if(result == -2){
						alert("해당 사업자는 등록된 구장이 있습니다. \n구장 폐업처리후 변경 가능합니다.");
					}else if(result == -3){
						alert("해당 회원은 대관 내역이 있습니다. \n환불처리후 변경 가능합니다.")
					}
					
				}
				
			});
		
		
		}
		
	});

	
	var arg = $("#p_status").text();
	if(arg){
		$("#status").val(arg);
	}
	
	
	$("#status").change(function(){
		$("#search_status").attr({
			"method":"get",
			"action":"/admin/member/memberList.do"
		});
		$("#search_status").submit();
	});
});

	function setTd(index){
		// 회원상태 / 버튼값 초기화
		$(".goUpdate").css("display","none");
		$(".m_status").css("display","none");
		$(".statusText").show();
		$(".memberEdit").show();
		
		// 선택된 행 값 변경
		$(".statusText:eq("+index+")").css("display","none");
		$(".m_status:eq("+index+")").show();
		$(".memberEdit:eq("+index+")").css("display","none");
		$(".goUpdate:eq("+index+")").show();
	}
	
	function setUpdateForm(index){
		
		var m_id = $(".m_id:eq("+index+")").text();
		var m_status = $(".m_status:eq("+index+")").val();
		var m_type = $(".m_type:eq("+index+")").attr("data-type");
		$("#m_id").val(m_id);
		$("#m_type").val(m_type);
		$("#m_status").val(m_status);
		
	}
	
	function goPage(page){
		$("#page").val(page);
		$("#f_search").attr({
			"method":"get",
			"action":"/admin/member/memberList.do"
		});
		
		$("#f_search").submit();
	}
	