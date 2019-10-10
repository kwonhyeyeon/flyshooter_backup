/**
 * 
 */
$(document).ready(function name() {
	
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
	$("#insertRecruit").click(function() {
		if (id != "") {
			var url = "/recruit/recruitInsertForm.do";
			location.href = url;
		 } else {
			alert("로그인 후 등록 할 수 있습니다.")
			return;
		} 
	});

	// 리스트 클릭시 상세 보기 페이지로 이동
	$(".goDetail").click(function() {
		
		var hr_no = $(this).attr("data-num");
		var data = $("#hr_no").val(hr_no);
		var index = $(".goDetail").index(this);
		
		$.ajax({
			type : "get",
			url : "/recruit/recruitView.do",
			data : data,
			error : function() {
				alert("시스템 오류입니다. 관리자에게 문의하세요");
			},
			success: function(result) { 
				$('.recruitList').text("");
				$('.recruitList').append(result);
					
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
		title : '용병 모집 정보',
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
						var url = "/recruit/recruitUpdateForm.do";
						url = url + "?hr_no=" + data;
						location.href = url;
					} else if (id == "") {
						alert("로그인 후 수정 할 수 있습니다.");
						location.href = "/recruit/recruitList.do";
					} else if ( id != boardID) {
						alert("다른 회원의 글은 수정 할 수 없습니다.")
						location.href = "/recruit/recruitList.do";
					}
				}
			},
			{
				text:'확인',
				click:function(){
					location.href = "/recruit/recruitList.do";
				}
			}
		]
	});
	
}

// 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을  위한 스크립트
function goPage(page) {
	$("#page").val(page);
	$("#r_search").attr({
		"method" : "get",
		"action" : "/recruit/recruitList.do"
	});
	$("#r_search").submit();
}
