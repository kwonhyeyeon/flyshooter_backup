/**
 * 
 */
$(document).ready(function() {
	// 한 페이지에 보여줄 레코드 수 변경 될 때마다 처리 스크립트
	$("#pageSize").change(function() {
		goPage(1);
	});

	// 검색 버튼 클릭 시 처리 이벤트
	$("#searchDataBtn").click(function() {
		goPage(1);
	});

	var id = "";
	id += $("#m_id").val();

	// 등록 버튼 클릭 시 등록 페이지로 이동 (미 로그인 시 등록 불가) id 값이 없으면 500 에러
	$("#insertSupport").click(function() {
		if (id != "") { 
			var url = "/support/supportInsertForm.do";
			location.href = url;
		} else {
			alert("로그인 후 등록 할 수 있습니다.")
			return;
		} 
	});

	// 리스트 클릭시 상세 보기 페이지로 이동
	$(".goDetail").click(function() {
		
		var hs_no = $(this).attr("data-num");
		var data = $("#hs_no").val(hs_no);
		var index = $(".goDetail").index(this);
		
		$.ajax({
			type : "get",
			url : "/support/supportView.do",
			data : data,
			error : function() {
				alert("시스템 오류입니다. 관리자에게 문의하세요");
			},
			success: function(result) { 
				$('.supportList').text("");
				$('.supportList').append(result);
				
				openDialog(index);
			}
		});
	}); 

});

function openDialog(index) {
	
	var id = $("#m_id").val();
	var boardID = $("#boardID").val();
	var data = $(".goDetail:eq("+index+")").attr("data-num");
	
	console.log(data);
	
	$("#dialog").dialog({
		title : '용병 지원 정보',
		modal : true,
		width : '900',
		minHeight : '400',
		resizable : false,
		closeOnEscape : false,
		draggable : false,
		appendTo : false,
		dialogClass: 'custom-dialog-style',
		open:function(event, ui){
			$(".ui-dialog-titlebar-close", $(this).parent()).hide();
			
			// 모달 오버레이 설정
            $(".ui-widget-overlay").css({
                opacity: 0.5,
                filter: "Alpha(Opacity=50)",
                backgroundColor: "black"
            });
		},
		show : {
			duration : 500
		},
		hide : {
			duration : 500
		},
		buttons:[
			{
				text:'수정',
				click:function(){
					if (id != "" && id == boardID) {
						var url = "/support/supportUpdateForm.do";
						url = url + "?hs_no=" + data;
						location.href = url;
					} else if (id == "") {
						alert("로그인 후 수정 할 수 있습니다.");
						location.href = "/support/supportList.do";
					} else if ( id != boardID) {
						alert("다른 회원의 글은 수정 할 수 없습니다.")
						location.href = "/support/supportList.do";
					}
				}
			},
			{
				text:'확인',
				click:function(){
					location.href = "/support/supportList.do";
				}
			}
		]
	});
	
}

// 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을  위한 스크립트
function goPage(page) {
	$("#page").val(page);
	$("#s_search").attr({
		"method" : "get",
		"action" : "/support/supportList.do"
	});
	$("#s_search").submit();
}

