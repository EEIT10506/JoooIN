<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<style>
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
</style>
<title>Insert title here</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
		<p>hello</p>
<%-- 		 <c:set var="eventId" value="${eventId}"/> --%>
		          
		 <a href="event/${eventId}">活動詳細資訊有ID=2</a>
		 <a href="event/${eventId}">活動詳細資訊有ID=3</a>
		<p>${event.eventName}</p>
		<p>${event.eventInviterId}</p>
		<p>${eventtype.eventType}</p>
		<p>${event.eventContent}</p>
		<p>${totalmember}</p>
		<c:forEach var="eventmember" items="${eventmember}">
			<p>${eventmember.memberId}</p>
			
		</c:forEach>
<%-- 		<c:forEach var="eventmembers" items="${eventmembers}"> --%>
			<p>${eventmembers.memberName}</p>
			
<%-- 		</c:forEach> --%>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>