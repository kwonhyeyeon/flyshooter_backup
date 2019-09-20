<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 용병모집 리스트</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- end datepicker -->
<script type="text/javascript">
$(function() {
	//검색 후 검색 대상과 검색 단어 출력 
	var word = "<c:out value='${data.keyword}' />";
	var value = "";
	
	// 한 페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정
	if (word != "") {
		$("#keyword").val("<c:out value='${data.keyword}' />");
	}

	if ("<c:out value='${data.pageSize}'/>" != "") {
		$("#pageSize").val("<c:out value='${data.pageSize}'/>");
	}

	// 한 페이지에 보여줄 레코드 수 변경 될 때마다 처리 스크립트
	$("#pageSize").change(function() {
		goPage(1);
	});

	// 검색 버튼 클릭 시 처리 이벤트
	$("#searchDataBtn").click(function() {
		if (!chkSubmit($('#keyword'), "검색어를")) {
			return;
		}
		goPage(1);
	});

	// 전체 리스트 확인 버튼 클릭 시 처리 이벤트
	$("#allData").click(function() {
		location.href = "/admin/recruit/recruitList.do"
	});
	
	var id = "";
	id += $("#m_id").val();

	var url = "/admin/recruit/recruitView.do";

	// 리스트 클릭시 상세 보기 페이지로 이동
	$(".rListView").click(function() {
		var hr_no = $(this).parents("tr").attr("data-num");
		var data = $("#hr_no").val(hr_no);
		$.ajax({
			type : "get",
			url : url,
			data : data,
			success: function(result) { 
				$('#recruitViewForm').text("");
				$('#recruitViewForm').show();
				$('#recruitViewForm').append(result);
				$("#recruitViewForm").dialog({
					autoOpen:false,
					width : "600px",
					modal:true,
					closeOnEscape: false,
					open: function(event, ui) {
						$(".ui-dialog-titlebar", $(this).parent()).hide();
					}
				});
				
				
				$("#recruitViewForm").dialog("open");
				
			}
		});
	}); 

});

// 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을  위한 스크립트
function goPage(page) {
	$("#page").val(page);
	$("#r_search").attr({
		"method" : "get",
		"action" : "/admin/recruit/recruitList.do"
	});
	$("#r_search").submit();
}
</script>

</head>
<body>
		<div id="wrapper">
		<div id="header-wrap">
			<div id="header">
				<h1 id="logo">
					<a href="/admin/main.do">FLY SHOOTER 관리자</a>
				</h1>
				<c:if test="${not empty adminId}">
					<a href="/admin/logout.do" class="logout">로그아웃</a>
				</c:if>
			</div><!-- header -->
		</div><!-- header-wrap -->

		<div id="content-wrap">
			<aside id="subNavi">
				<jsp:include page="../templates/subNavi.jsp" flush="true" />
			</aside><!-- subNavi -->

			<div id="container">
				<article id="contents">
				
				<h2 class="con-subject">용병모집</h2>

		<!-- 리스트 상세보기 -->
		<div id="recruitViewForm" style="display: none">
			<input type="hidden" name="hr_no" id="hr_no" />
		</div>
		<!-- 리스트 상세보기 -->

		<!-- 리스트 시작 -->
		<div id="listStart">
			<table summary="게시판 리스트" class="table-style">
				<colgroup>
					<col width="5%" />
					<col width="20%" />
					<col width="20%" />
					<col width="10%" />
					<col width="10%" />
					<col width="20%" />
					<col width="10%" />
					<col width="5%" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>매치일자</th>
						<th>구장명</th>
						<th>모집인원</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>진행상태</th>
						<th>글 상태</th>
					</tr>
				</thead>
				<!-- 데이터 출력 -->
				<tbody class="listContent">
					<c:choose>
						<c:when test="${not empty adminRecruitList}">
							<c:forEach var="recruit" items="${adminRecruitList}" varStatus="status">
								<tr class="list" data-num="${recruit.hr_no}">
									<td>${status.index+1 }</td>
									<td class="rListView">${recruit.hr_m_date}</td>
									<td class="rListView">${recruit.hr_name}</td>
									<td class="rListView">${recruit.hr_people} 명</td>
									<td>${recruit.m_name}</td>
									<td>${recruit.hr_regdate}</td>
									<td class="rListProgress"><span class="recruitStatus">
											<c:choose>
												<c:when test="${recruit.hr_progress == '1'}">가능</c:when>
												<c:when test="${recruit.hr_progress == '0'}">종료</c:when>
												<c:when test="${recruit.hr_progress == '-1'}">마감</c:when>
											</c:choose>
									</span></td>
									<td>
											<c:choose>
												<c:when test="${recruit.hr_status == '1'}">공개</c:when>
												<c:when test="${recruit.hr_status == '0'}">삭제</c:when>
											</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">등록된 모집이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!-- 리스트 종료 -->

		<!-- 검색기능 시작 -->
		<div id="listSearch">
			<form id="r_search" name="r_search">
				<input type="hidden" id="page" name="page" value="${data.page}" />
				<table summary="검색">
					<tr>
						<td id="btd1"><input type="text" name="keyword" id="keyword"
							placeholder="작성자 이름을 입력하세요" /> <input type="button" value="검색"
							id="searchDataBtn" name="searchDataBtn" /> <input type="button"
							value="전체리스트" id="allData" name="allData" /></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 검색기능 종료-->

		<!-- 페이지 네비게이션 시작 -->
		<div id="npage">
			<tag:paging page="${data.page}" total="${total}"
				list_size="${data.pageSize}" />
		</div>
		<!-- 페이지 네비게이션 종료 -->
				
				
				</article><!-- contents -->
			</div><!-- container -->
		</div><!-- con_wrap -->
	</div>
</body>
</html>