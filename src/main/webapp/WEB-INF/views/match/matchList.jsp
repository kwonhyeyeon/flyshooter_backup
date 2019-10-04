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
<title>FLY SHOOTER</title>

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script src="/resources/js/matchList.js"></script>
</head>
<body>

	<div id="wrapper">
		
		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
		
			<h2 class="articleTit">매치 신청</h2>
		
			<%-- 리스트 상세보기 폼 --%>
			<form name="matchViewForm" id="matchViewForm">
				<input type="hidden" name="mb_no" id="mb_no" />
			</form>
			
			<%-- 매치신청 등록--%>
			<div class="insertArea">
				<input type="button" value="매치신청 등록" id="insertBtn" />
			</div>
			<%-- 매치신청 등록 종료 --%>
			
			<section class="itemArea">
				<table class="listTbl">
					<tr class="bgTr">
						<th>번호</th>
						<th>매치 형태</th>
						<th>구장명</th>
						<th>매치일자</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>신청 여부</th>
					</tr>
					<c:choose>
						<c:when test="${not empty matchList}">
							<c:forEach var="match" items="${matchList}" varStatus="status">
								<tr class="goDetail" data-num="${match.mb_no}">
									<td>${status.index+1}</td>
									<td>${match.mb_type}</td>
									<td>${match.mb_name}</td>
									<td>${match.mb_m_date}</td>
									<td>${match.m_name}</td>
									<td>${match.mb_regdate}</td>
									<td>
										<c:if test="${match.mb_progress == 1}">가능</c:if>
										<c:if test="${match.mb_progress == 0}">종료</c:if>
										<c:if test="${match.mb_progress == -1}">마감</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							<tr>
								<td colspan="7">등록된 매치가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</section>
			
			<div id="dialog" class="matchList"></div>
			
			<%-- 검색 --%>
			<div id="searchArea">
				<form id="m_search" name="m_search">
					<input type="hidden" id="page" name="page" value="${data.page}" />
					
					<input type="search" name="keyword" id="keyword" class="search-field" placeholder="작성자명" />
					<button id="searchDataBtn" class="search-btn">검색</button>
				</form>
			</div>
			
			<!-- pagination -->
			<div class="pagination">
				<tag:paging page="${data.page}" total="${total}" list_size="${data.pageSize}" />
			</div>
			<!-- pagination -->

		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
	
</body>
<script>
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
</script>
</html>