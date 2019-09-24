<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<!-- <script src="https://cdn.tiny.cloud/1/zzvl36atvabdpymbt6fdl36ae1wcs6p60oz1qlb6znjiuti8/tinymce/5/tinymce.min.js"></script> -->
<script src="/resources/js/lib/tinymce/tinymce.min.js"></script>
<script src="/resources/js/tiny.js"></script>
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
            	
            		<h2 class="con-subject">이용 약관</h2>
            		
            		<form id="editorForm" action="post">
            			<input type="hidden" name="getData" id="getData" />
            			<textarea id="editor"></textarea>
            			
            			<input id="editorSave" type="submit" value="저장" />
            		</form>
				    
            	</article><!-- contents -->
            </div><!-- container -->

        </div><!-- con_wrap -->
	
	</div>

</body>

</html>