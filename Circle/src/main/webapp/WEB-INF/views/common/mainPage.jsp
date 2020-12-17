<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/mainPage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
	</div>
	<div class="leftBar">
		<jsp:include page="mainLeftBar.jsp" />
	</div>
	<div class="container">
		<div class="content">
			<div class="boardArea">
				<div class="boardList0">
					<div class="boardList0_1">
						<a class="weatherwidget-io" href="https://forecast7.com/en/37d57126d98/seoul/" data-label_1="SEOUL" data-label_2="WEATHER" data-theme="original" >SEOUL WEATHER</a>
					</div>
				</div>

				<div class="boardList4">
					<div class="boardList4_1">
						<div class="textTop1">알림</div>
						<div class="textTop2">등록일</div>
						<div class="textTitle1">업데이트 준비중입니다.</div><div class="textTitle2">2020-12-15</div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
					</div>
				</div>
				<div class="boardList5">
					<div class="boardList5_1">
					<div class="textTop1">쪽지</div>
						<div class="textTop2">등록일</div>
						<div class="textTitle1">업데이트 준비중입니다.</div><div class="textTitle2">2020-12-15</div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
					</div>
				</div>
				<div class="boardList6">
					<div class="boardList6_1">
						<c:import url="../schedule/miniCalendar.jsp"/>
					</div>
				</div>
			
				
				<div class="boardList2">
					<div class="boardList2_1">
						<div class="textTop1">전자결재</div>
						<div class="textTop2">등록일</div>
							<c:forEach var="list1" items="${list1}">
								<div class="result" onclick="location='${pageContext.request.contextPath}/sign/signSelectOne?signCode=<c:out value="${list1.sign_code}"/>'">
									<div class="textTitle1">${list1.sign_title}</div><div class="textTitle2">${list1.sign_wdat}</div>
								</div>
							</c:forEach>				
					</div>
				</div>
				<div class="boardList3">
					<div class="boardList3_1">
						<div class="textTop1">게시판</div>
						<div class="textTop2">등록일</div>
						<div class="textTitle1">업데이트 준비중입니다.</div><div class="textTitle2">2020-12-15</div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>					
					</div>
				</div>
			
				
				<div class="boardList2">
					<div class="boardList2_1">
						<div class="textTop1">커뮤니티</div>
						<div class="textTop2">등록일</div>
						<div class="textTitle1">업데이트 준비중입니다.</div><div class="textTitle2">2020-12-15</div>
						
						<!-- <div class="textTitle1">목록2</div><div class="textTitle2">목록날짜1</div>
						<div class="textTitle1">목록3</div><div class="textTitle2">목록날짜1</div>
						<div class="textTitle1">목록4</div><div class="textTitle2">목록날짜1</div>
						<div class="textTitle1">목록5</div><div class="textTitle2">목록날짜1</div>	 -->
					</div>
				</div>
				<div class="boardList3">
					<div class="boardList3_1">
						<div class="textTop1">프로젝트</div>
						<div class="textTop2">등록일</div>
						<div class="textTitle1">업데이트 준비중입니다.</div><div class="textTitle2">2020-12-15</div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
						<div class="textTitle1"></div><div class="textTitle2"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
<!-- SCRIPT 영역 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
	</script>
	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		if(leftBar <= window) {
    			$(".leftBar").addClass("fixed");
    		} else {
    			$(".leftBar").removeClass("fixed");
    			}
    		})
    	});
    </script>
</body>
</html>