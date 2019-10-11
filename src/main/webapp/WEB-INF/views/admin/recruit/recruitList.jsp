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
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/js/adminRecruitList.js"></script>
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
		<div id="recruitViewForm" >
			<input type="hidden" name="hr_no" id="hr_no" />
		</div>
		<!-- 리스트 상세보기 -->

			<table class="table-style">
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
					<c:choose>
						<c:when test="${not empty adminRecruitList}">
							<c:forEach var="recruit" items="${adminRecruitList}" varStatus="status">
								<tr class="list" data-num="${recruit.hr_no}">
									<td class="rListView">${status.index+1 }</td>
									<td class="rListView">${recruit.hr_m_date}</td>
									<td class="rListView">${recruit.hr_name}</td>
									<td class="rListView">${recruit.hr_people} 명</td>
									<td class="rListView">${recruit.m_name}</td>
									<td class="rListView">${recruit.hr_regdate}</td>
									<td class="rListView">
											<c:choose>
												<c:when test="${recruit.hr_progress == '1'}">가능</c:when>
												<c:when test="${recruit.hr_progress == '0'}">종료</c:when>
												<c:when test="${recruit.hr_progress == '-1'}">마감</c:when>
											</c:choose>
									</td>
									<td  class="rListView">
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
			</table>

		<!-- 검색기능 시작 -->
				 <!-- 페이지 네비게이션 시작 -->
                    <div class="pagination">
                        <tag:paging page="${data.page}" total="${total}" list_size="${data.pageSize}" />
                    </div>
                    <!-- 페이지 네비게이션 종료 -->
                    
				    <!-- 검색 -->
				    <div class="search">
				    	<form id="m_search" name="m_search">
                            <input type="hidden" id="page" name="page" value="${data.page}" />
                            <input type="search" name="keyword" id="keyword" class="search-field" placeholder="작성자명" /> 
                            <button type="submit" id="searchDataBtn" class="search-btn">찾기</button>
                        </form>
				    </div>
				    <!-- 검색 -->
				</article><!-- contents -->
			</div><!-- container -->
		</div><!-- con_wrap -->
	</div>
</body>

<script type="text/javascript">
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