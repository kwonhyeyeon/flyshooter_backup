/**
 * 
 */

$(document).ready(function() {

		// 한 페이지에 보여줄 레코드 수 변경 될 때마다 처리 스크립트
		$("#pageSize").change(function() {
			goPage(1);
		});

		var url = "/admin/support/supportView.do";

		// 리스트 클릭시 상세 보기 페이지로 이동
		$(".sListView").click(function() {
			var hs_no = $(this).parents("tr").attr("data-num");
			var data = $("#hs_no").val(hs_no);
			$.ajax({
				type : "get",
				url : url,
				data : data,
				success : function(result) {
					$('#supportViewForm').text("");
					$('#supportViewForm').show();
					$('#supportViewForm').append(result);
					$("#supportViewForm").dialog({
						autoOpen:false,
						width : "600px",
						modal:true,
						closeOnEscape: false,
						open: function(event, ui) {
							$(".ui-dialog-titlebar", $(this).parent()).hide();
						}
					});

					$("#supportViewForm").dialog("open");

				}
			});
		});

	});

	// 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을  위한 스크립트
	function goPage(page) {
		$("#page").val(page);
		$("#s_search").attr({
			"method" : "get",
			"action" : "/admin/support/supportList.do"
		});
		$("#s_search").submit();
	}