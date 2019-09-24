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
<title>용병지원 게시판</title>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/board.css">
<link rel="stylesheet" 	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

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
			location.href = "/support/supportList.do"
		});
		
		var id = "";
		id += $("#m_id").val();

		// 등록 버튼 클릭 시 등록 페이지로 이동 (미 로그인 시 등록 불가) id 값이 없으면 500 에러
		$("#insertButton").click(function() {
			if (id != "") { 
				var url = "/support/supportInsertForm.do";
				location.href = url;
			} else {
				alert("로그인 후 등록 할 수 있습니다.")
				return;
			} 
		});

		var url = "/support/supportView.do";

		// 리스트 클릭시 상세 보기 페이지로 이동
		$(".sListView").click(function() {
			var hs_no = $(this).parents("tr").attr("data-num");
			var data = $("#hs_no").val(hs_no);
			$.ajax({
				type : "get",
				url : url,
				data : data,
				success: function(result) { 
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
			"action" : "/support/supportList.do"
		});
		$("#s_search").submit();
	}

	// 상단 메뉴 설정 스크립트
	$(function() {
		$("#gnb").hover(function() {
			$(".menu-wrap").slideDown(500);
		});
		$(".menu-wrap").mouseleave(function() {
			$(".menu-wrap").slideUp(500);
		});
	})
</script>

</head>
<body>

	<div id="header-wrap">
		<header id="header">
			<h1>
				<a href="/">FLY SHOOTER</a>
			</h1>

			<nav id="gnb">
				<ul>
					<li><a href="/">대관</a></li>
					<li><a href="/match/matchList.do">매치</a></li>
					<li><a href="/support/supportList.do">용병</a></li>
					<li><a href="/member/mypage/modifyLogin.do">마이페이지</a></li>
				</ul>
			</nav>

			<nav id="lnb">
				<ul>
					<c:if test="${empty mvo.m_id}">
						<li><a href="/member/join.do">회원가입</a></li>
						<li><a href="/member/login.do">로그인</a></li>
					</c:if>
					<c:if test="${not empty mvo.m_id}">
						<li><a href="/member/logout.do">로그아웃</a></li>
					</c:if>
				</ul>
			</nav>
		</header>

		<div class="menu-wrap">
			<div class="menu">
				<c:if test="${empty mvo.m_id || mvo.m_type=='1'}">
					<ul>
						<li><a href="/user/rental/location.do">대관 예약</a></li>
						<li><a href="/">대관 확인</a></li>
					</ul>
					<ul>
						<li><a href="/match/matchList.do">매치 신청</a></li>
					</ul>
					<ul>
						<li><a href="/support/supportList.do">용병 지원</a></li>
						<li><a href="/recruit/recruitList.do">용병 모집</a></li>
					</ul>
					<ul>
						<li><a href="/member/mypage/modifyLogin.do">회원 정보 수정</a></li>
					</ul>
				</c:if>

				<c:if test="${mvo.m_type=='0'}">
					<ul class="member-menu">
						<li><a href="/client/rental/rentalList.do">대관 예약 현황</a></li>
						<li><a href="/">대관 환불 현황</a></li>
						<li><a href="/">오프라인 대관 관리</a></li>
					</ul>
					<ul>
						<li><a href="/match/matchList.do">매치 신청</a></li>
					</ul>
					<ul>
						<li><a href="/support/supportList.do">용병 지원</a></li>
						<li><a href="/recruit/recruitList.do">용병 모집</a></li>
					</ul>
					<ul>
						<li><a href="/member/mypage/modifyLogin.do">회원 정보 수정</a></li>
						<li><a href="/mypage/placeList.do">구장</a></li>
						<li><a href="/">경기장/용품</a></li>
						<li><a href="/">정산 관리</a></li>
						<li><a href="/">통계</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>

	<div id="modal" class="modal" style="width: 1800px;">
		<div id="title">
			<h2>용병지원</h2>
		</div>
		<%-- 리스트 상세보기 --%>
		<form name="supportViewForm" id="supportViewForm">
			<input type="hidden" name="hs_no" id="hs_no" />
		</form>
		<%-- 리스트 상세보기 --%>

		<%-- 용병지원 등록--%>
		<div class="insertBtn">
			<input type="button" value="용병지원 등록" id="insertButton"
				width="100px" height="40px">
		</div>
		<%-- 용병지원 등록 종료 --%>

		<%-- 로그인 아이디 --%>
		<input type="hidden" id="m_id" name="m_id" value="${mvo.m_id}">
		<%-- 로그인 아이디 --%>

		<%-- 리스트 시작 --%>
		<div id="listStart">
			<table summary="게시판 리스트">
				<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="30%" />
					<col width="10%" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th id="tableHeader">글번호</th>
						<th id="tableHeader">지역</th>
						<th id="tableHeader">가능시간</th>
						<th id="tableHeader">작성자</th>
						<th id="tableHeader">작성일자</th>
						<th id="tableHeader">진행상태</th>
					</tr>
				</thead>
				<!-- 데이터 출력 -->
				<tbody class="listContent">
					<c:choose>
						<c:when test="${not empty supportList}">
							<c:forEach var="support" items="${supportList}" varStatus="status">
								<tr class="list" data-num="${support.hs_no}">
									<td>${status.index+1 }</td>
									<td class="sListView">${support.hs_area}</td>
									<td class="sListView">${support.hs_date}  ${support.hs_time}</td>
									<td>${support.m_name}</td>
									<td>${support.hs_regdate}</td>
									<td class="listProgress"><span class="lsitStatus">
											<c:choose>
												<c:when test="${support.hs_progress == '1'}">가능</c:when>
												<c:when test="${support.hs_progress == '0'}">종료</c:when>
												<c:when test="${support.hs_progress == '-1'}">마감</c:when>
											</c:choose>
									</span></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">등록된 지원글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- 리스트 종료 --%>

		<%-- 검색기능 시작 --%>

		<div id="listSearch">
			<form id="s_search" name="s_search">
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

		<%-- 검색기능 종료--%>

		<%-- 페이지 네비게이션 시작 --%>
		<div id="npage">
			<tag:paging page="${data.page}" total="${total}"
				list_size="${data.pageSize}" />
		</div>
		<%-- 페이지 네비게이션 종료 --%>

	</div>
</body>
</html>