/**
 * 
 */

$(document).ready(function(){
	$(document).on("click",".goDetail",function(){
		var s_no =  $(this).attr("data-num");
		$("#s_no").val(s_no);
		$("#datailForm").submit(); 
	});
	
	//페이지 로드..
	$(".tab-content").hide(); //content 모두 숨김
	$("ul.tabs li:first").addClass("active").show();
	$(".tab-container:first").show();

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab-content").hide();

		var activeTab = $(this).find("a").attr("href");
		$(activeTab).fadeIn();
		return false;
	});
	
	$("#placeChoice").change(function() { // 구장 select 변경시
		if ($("#placeChoice").val() != '선택') {
			var p_num = $("#placeChoice").val();
			var query = {p_num : $("#placeChoice").val()};
			SIList(query);
		} else {
			$("#List").html("<p class='noItem'>구장을 선택해주세요</p>");
		}
	});
	
	$(document).on("click", "#IPlus", function() {
		var test = $("#placeChoice").val();
		$("#modalP_num").val(test);
		openDialog();
	});

	$(document).on("click", "#IRemove", function() {
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
						alert('삭제가 완료되었습니다');
						query = {p_num : $("#placeChoice").val()};
						SIList(query);
					}else{
						alert('삭제에 실패했습니다');
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
				alert('변경 시 회원에게 용품이 노출됩니다');
				query = {p_num : $("#placeChoice").val()};
				SIList(query);
				return false;
			}else{
				alert('변경에 실패했습니다');
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
				alert('변경 시 회원에게 용품이 노출되지 않습니다');
				query = {p_num : $("#placeChoice").val()};
				SIList(query);
				return false;
			}else{
				alert('변경에 실패했습니다');
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

			$(".tab-content").hide();
			activeTab = $('.active').find("a").attr("href");
			$(activeTab).fadeIn();
			return false;
		}
	});
}


//결제창 모달창
function openDialog(){
	
	$("#dialog").dialog({
		title : '용품 등록',
		modal : true,
		width : '500',
		minHeight : '300',
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
	             // 버튼 텍스트
	             text:'취소',
	             click:function(){
	                $(this).dialog("close");
	                $("#itemInsertForm").each( function () {
	                    this.reset();
	                });
	             }
	          },
	          {
	             text:'용품 등록',
	             click:function(){
	                //$(this).dialog("close");
	                if(confirm("용품 등록 하시겠습니까?")){
	             	 //입력여부
	                	if($('#modalI_name').val() == ""){
	                		  alert("용품 이름을 입력하세요");
	                		  return false;
	                	}
	                		
	                	if($('#modalI_rental_fee').val() == ""){
	                		alert("용품가격을 입력하세요");
	                		return false;
	                	}  
	             	$(this).dialog("close");
	             	
	                 var P_num =  $('#modalP_num').val();
	                 var I_name =  $('#modalI_name').val();
	                 var I_rental_fee =  $('#modalI_rental_fee').val();
	                 $("#itemInsertForm").find("input[type='text']").val("");
	                   query = {p_num : P_num,
	                 		  i_name : I_name,
	                 		  i_rental_fee : I_rental_fee}
	                   $.ajax({
	               		url : "/mypage/itemInsert.do",
	               		type : "post",
	               		data : query,
	               		error : function() {
	               			alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
	               		},
	               		success : function(resultData) {
	               			if (resultData == '1') {
	               				alert('용품 등록 성공');
	               				query = {p_num : $("#placeChoice").val()};
	               				SIList(query);
	               				return false;
	               			}else{
	               				alert('용품 등록 실패');
	               			}
	               			}
	               	});
	                }
	             }
	          }
	       ]
	});

}