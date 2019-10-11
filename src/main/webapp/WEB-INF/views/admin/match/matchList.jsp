<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>FLY SHOOTER</title>
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="/resources/js/boardCheck.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css" />
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
                location.href = "/admin/match/matchList.do"
            });

            var url = "/admin/match/matchView.do";

            // 리스트 클릭시 상세 보기 페이지로 이동
            $(".mListView").click(function() {
                var mb_no = $(this).parents("tr").attr("data-num");
                var data = $("#mb_no").val(mb_no);
                $.ajax({
                    type: "get",
                    url: url,
                    data: data,
                    success: function(result) {
                        $('#matchViewForm').text("");
                        $('#matchViewForm').show();
                        $('#matchViewForm').append(result);
                        $("#matchViewForm").dialog({
                            autoOpen: false,
                            width: "600px",
                            modal: true,
                            closeOnEscape: false,
                            open: function(event, ui) {
                                $(".ui-dialog-titlebar", $(this).parent()).hide();
                            }
                        });

                        $("#matchViewForm").dialog("open");

                    }
                });
            });

        })

        // 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을  위한 스크립트
        function goPage(page) {
            $("#page").val(page);
            $("#m_search").attr({
                "method": "get",
                "action": "/admin/match/matchList.do"
            });
            $("#m_search").submit();
        }
    </script>
</head>

<body>

    <div id="wrapper">
        <div id="header-wrap">
            <div id="header">
                <h1 id="logo"><a href="/admin/main.do">FLY SHOOTER 관리자</a></h1>
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

                    <h2 class="con-subject">매치</h2>

                    <!-- 리스트 상세보기 -->
                    <form id="matchViewForm">
                        <input type="hidden" name="mb_no" id="mb_no" />
                    </form>
                    <!-- 리스트 상세보기 -->

                    <!-- 매치 리스트 -->
                    <table class="table-style">
                        <tr>
                            <th width="100">글번호</th>
                            <th width="150">매치형태</th>
                            <th width="300">구장명</th>
                            <th width="200">매치일자</th>
                            <th width="200">작성자</th>
                            <th width="200">작성일자</th>
                            <th width="150">신청여부</th>
                            <th>글 상태</th>
                        </tr>
                        <c:choose>
                            <c:when test="${not empty adminMatchList}">
                                <c:forEach var="match" items="${adminMatchList}" varStatus="status">
                                    <tr class="list" data-num="${match.mb_no}">
                                        <td>${status.index+1 }</td>
                                        <td>${match.mb_type}</td>
                                        <td class="mListView">${match.mb_name}</td>
                                        <td class="mListView">${match.mb_m_date}</td>
                                        <td>${match.m_name}</td>
                                        <td>${match.mb_regdate}</td>
                                        <td class="mListProgress">
                                            <c:choose>
                                                <c:when test="${match.mb_progress == '1'}">가능</c:when>
                                                <c:when test="${match.mb_progress == '0'}">종료</c:when>
                                                <c:when test="${match.mb_progress == '-1'}">마감</c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${match.mb_status == '1'}">공개</c:when>
                                                <c:when test="${match.mb_status == '0'}">삭제</c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td class="empty" colspan="8">등록된 매치가 없습니다</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </table>
                    <!-- 매치 리스트 -->
				    
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

</html>