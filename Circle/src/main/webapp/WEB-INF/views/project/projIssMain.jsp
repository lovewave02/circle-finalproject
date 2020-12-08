<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../project/projSidebar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../project/projHomebar.jsp" />
				<jsp:include page="../project/projConsole.jsp" />
			</div>
			<div class="content">
			
			<!-- 본문 -->
			
			<!-- 개수로 보기 -->
<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${postCount.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${postCount.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${postCount.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${postCount.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div>
	<!-- 전체 게시판 불러오기 -->
		<table class="projParts">
		<tr>
			<th class="pro_code">업무 코드</th>
			<th class="pro_title">업무명</th>
			<th class="pro_manager">담당자</th>
			<th class="pro_sdate">업무 진행단계</th>
			<th class="pro_edate">업무 상황</th>
		</tr>
	<c:forEach var="projIssMain" items="${projIssMain}">
		<tr>
			<td>${projIssMain.iss_code}</td>
			<td><a href='<c:url value='/project/projIssMain?iss_code=${projIssMain.iss_code}'/>'>${projIssMain.iss_title}</a></td>
			<td>${projIssMain.emp_info_name}</td>
			<td>${projIssMain.prog_title}</td>
			<td>${projIssMain.situ_title}</td>
		</tr>
	</c:forEach>
	</table>
		
	<!-- 뷰 페이징 처리 -->
<div>
<c:set var="Post"/>
<c:if test="${paging.startPage != 1}">
<a href="${pageContext.request.contextPath}/project/projMain?nowPage=${paging.startPage - 1}&cntPerPage${paging.cntPerPage}">&lt;</a>
</c:if>
<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p">
<c:choose>
<c:when test="${p == paging.nowPage }">
<b>${p}</b>
</c:when>
<c:when test="${ p != paging.nowPage }">
<a href="${pageContext.request.contextPath}/project/projMain?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
</c:when>

</c:choose>
</c:forEach>
<c:if test="${paging.endPage != paging.lastPage }">
	<a href="${pageContext.request.contextPath}/project/projMain?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
</c:if>

</div>
	<br>
	 
	 
	 
	 
	<!-- 검색 -->
	
	<div id="postSearch">
	<form id="searchForm" method="get" action="${pageContext.request.contextPath}/project/projSearch">
	<select name="type">
	<option value="">선택하기</option>
	<option value="pro_title">제목</option>
	<option value="pro_intro">내용</option>
	<option value="pro_manager">관리자</option>
	
	</select>
	<input type="text" name="keyword">
	<input type="submit" id="searchBtn" value="검색">
	</form>
	
	</div>
		<!--  본문 종료 -->
			</div>
		</div>
		</div>


</body>
</html>


