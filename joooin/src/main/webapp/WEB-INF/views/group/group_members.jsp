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
<!-- 限制字數 -->
<script>
$( document ).ready(function() {
var $len = 15; // 超過15個字以"..."取代
$(".textacc").each(function(){
	console.log($(this).text());
    if($(this).text().length > $len){
        var $text=$(this).text().substring(0,$len-1)+"...";
        $(this).text($text);
    }
});
});
</script>
<!-- 限制字數 -->
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	
	
	
	
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	
<jsp:include page="${request.contextPath}/group/group_navbar" />	
		<!-- 	test -->
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
		<div class="content">
			<div class="container mt-3">
				<div class="card-columns">
					<c:forEach var="member" items="${memberInfos}">
						<div class="card" style="width: 18rem; height: 40rem">
							<img
								src="<c:url value='/getMemberImage/${member.memberId}.jpg' />"
								class="img-fluid card-img-top img-thumbnail rounded-circle"
								src="logo.jpg" alt="Responsive image">
							<div class="card-body">
								<h3 class="card-title">
									<a href="${pageContext.request.contextPath}/member/other/${member.memberId}">${member.memberName}</a>
								</h3>
								<p>會員介紹 : </p>
								<p class="card-text textacc">${member.memberIntro }</p>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">發文 :  ${member.postCount } 次</li>
								<li class="list-group-item">回文 :  ${member.replyCount } 次</li>
								<li class="list-group-item">登入 :  ${member.logins } 次</li>
<!-- 								<li class="list-group-item">Vestibulum at eros</li> -->
							</ul>
								<div class="card-body">
								<c:if test="${leaderId == sessionScope.memberId }">
								<form action="${pageContext.request.contextPath}/group/${groupMain.groupId}/members/delete/${member.memberId}" method="post">
									<button type="submit" class="float-right btn btn-outline-danger" id="${member.memberId}"><strong>刪除成員</strong></button>
								</form>
								</c:if>
								</div>
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