/**
 * 
 */
$(document).ready(function(){
	$(document).on("click",".detailPage",function(){
		var s_no =  $(this).parents("tr").attr("data-num");
		$("#s_no").val(s_no);
		$("#datailForm").submit(); 
	});
	
	//페이지 로드..
	$(".tab_content").hide();//content 모두 숨김
	$("ul.tabs li:first").addClass("active").show();
	$(".tab_content:first").show();

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();

		var activeTab = $(this).find("a").attr("href");
		$(activeTab).fadeIn();
		return false;
	});
	$("#placeChoice").change(function() {

		if ($("#placeChoice").val() != '선택') {
			var query = {p_num : $("#placeChoice").val()};
			SIList(query);
		} else {
			$("#List").text("구장을 선택해주세요");
		}
	});
	
	$(document).on("click", "#IPlus", function() {
		var $TABLE = $('#table');

		var $clone = $TABLE.find('tr.hide').clone(true).removeClass('hide');
		$TABLE.find('table').append($clone);
	});

	$(document).on("click", ".IRemove", function() {
		if (confirm('용품을 삭제 하시겠습니까?')) {
			var I_no =  $(this).parents("tr").attr("data-num");
			query = {i_no : I_no}
			$.ajax({
				url : "/mypage/itemDelete.do",
				type : "get",
				data : query,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					if (resultData == '1') {
						alert('삭제 성공');
						query = {p_num : $("#placeChoice").val()};
						SIList(query);
					}else{
						alert('삭제 실패');
					}
					
				}
			});
		}
		
	});
	
	$(document).on("click", ".toggle", function() {
		var I_no =  $(this).parents("tr").attr("data-num");
		
		query = {i_no : I_no}
		if ($('input:checkbox[id="'+I_no+'"]').is(":checked")) {
			itemActive(query);
		}else{
			itemUnActive(query);
		}
	});
	
	$(document).on("click", "#placeInsert", function() {
		location.href = "/mypage/placecheck.do";
	});
});
function itemActive(query) {
	$.ajax({
		url : "/mypage/itemActive.do",
		type : "get",
		data : query,
		error : function() {
			alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			if (resultData == '1') {
				alert('활성화 성공');
				query = {p_num : $("#placeChoice").val()};
				SIList(query);
				return false;
			}else{
				alert('활성화 실패');
			}
			}
	});
}

function itemUnActive(query) {
	$.ajax({
		url : "/mypage/itemUnActive.do",
		type : "get",
		data : query,
		error : function() {
			alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			if (resultData == '1') {
				alert('비활성화 성공');
				query = {p_num : $("#placeChoice").val()};
				SIList(query);
				return false;
			}else{
				alert('비활성화 실패');
			}
			}
	});
}
function SIList(query) {
	$.ajax({
		url : "/mypage/stadiumList.do",
		type : "get",
		data : query,
		error : function() {
			alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			$("#List").text("");
			$("#List").append(resultData);

			$(".tab_content").hide();
			activeTab = $('.active').find("a").attr("href");
			$(activeTab).fadeIn();
			return false;
		}
	});
}