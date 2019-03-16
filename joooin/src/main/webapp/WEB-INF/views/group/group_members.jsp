<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 50px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
		<!-- 	test -->
		<div class="content">
			<div class="container mt-3">
				<div class="card-columns">
					<c:forEach var="member" items="${membersInGroup}">
						<div class="card" style="width: 18rem; height: 40rem">
							<img
								src="<c:url value='/getMemberImage/${member.memberId}.jpg' />"
								class="img-fluid card-img-top img-thumbnail rounded-circle"
								src="logo.jpg" alt="Responsive image">
							<div class="card-body">
								<h3 class="card-title">
									<a href="/member/other/${member.memberId}">${member.memberName}</a>
								</h3>
								<p class="card-text">會員自我介紹:</p>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">發文數量 : xxx</li>
								<li class="list-group-item">Dapibus ac facilisis in</li>
								<li class="list-group-item">Vestibulum at eros</li>
							</ul>
							<!-- 							<div class="card-body"> -->
							<!-- 								<a href="#" class="card-link">Card link</a> <a href="#" -->
							<!-- 									class="card-link">Another link</a> -->
							<!-- 							</div> -->
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 	test -->
	</div>
	<!-- 請把所有內容寫在此div內 -->
</body>
</html>