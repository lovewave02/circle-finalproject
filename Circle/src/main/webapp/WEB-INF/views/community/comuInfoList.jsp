<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/community/comuList.css">

<style>
#listArea {
	color: black;
	font-size: 17px;
	font-weight: bolder;
}
</style>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../community/comuLeftBar.jsp" />
			</div>
			<div class="content">
				<div>
					<jsp:include page="../community/comuHomeBar.jsp" />
					<jsp:include page="../community/comuInfoListBar.jsp" />
				</div>
				<div class="resultArea1">

					<div class="table-area">
						<table align="center" id="listArea">
							<tr>
								<th width="100px">글번호</th>
								<th width="100px">글제목</th>
								<th width="100px">작성자</th>
								<th>조회수</th>
								<th width="100px">작성일</th>
							</tr>
							<c:forEach var="n" items="${ requestScope.list }">
								<tr>
									<td><c:out value="${ n.nno }" /></td>
									<td><c:out value="${ n.nTitle }" /></td>
									<td><c:out value="${ n.nickName }" /></td>
									<td><c:out value="${ n.nCount }" /></td>
									<td><c:out value="${ n.nDate }" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<br>
					<div>
						<jsp:include page="../community/comuHomeListBar2.jsp" />
					</div>
										
				<div class="resultArea1">
				
			<table align="center" id="listArea">
				<tr>
					<th width="100px">글번호</th>
					<th width="100px">카테고리</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
				<c:forEach var="b" items="${ requestScope.list }">
					<tr>
						<td><c:out value="${ b.qNo }"/></td>
						<td><c:out value="${ b.qCategory }"/></td>
						<td><c:out value="${ b.qTitle }"/></td>
						<td><c:out value="${ b.memberShipNumber }"/></td>
						<td><c:out value="${ b.qPageView }"/></td>
						<td><c:out value="${ b.qWriteDate }"/></td>
					</tr>
				</c:forEach>
			</table>
						
						
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>