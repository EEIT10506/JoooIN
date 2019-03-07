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
		 <a href="event/members/${eventId}">活動詳細成員/event/members/Id</a>
		<p>活動名稱 : ${event.eventName}</p>
		<p>活動開始 : ${event.eventDateStart}</p>
		<p>活動結束 : ${event.eventDateEnd}</p>
		<p>縣市 : ${event.eventLocation}</p>
		<p>地址 : ${event.eventAddress}</p>
		<p>報名人數 : ${event.eventCurrentMembers}/${event.eventMemberLimit}</p>
		<p>活動發起人ID : ${event.eventInviterId}</p>
		<p>活動發起人姓名 : ${eventbuildname.memberName}</p>
		
		<p>活動種類 : ${eventtype.eventType}</p>
		<p>活動內容描述 : ${event.eventContent}</p>
		<p>活動參加會員人數(不含額外人) : ${totalmember}</p>
		<c:forEach var="eventmember" items="${eventmember}">
			<p>活動成員ID : ${eventmember.memberId}</p>
			
		</c:forEach>
<%-- 		<c:forEach var="eventmembers" items="${eventmembers}"> --%>
			<p>活動成員Name : ${eventmembers.memberName}</p>
			
<%-- 		</c:forEach> --%>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>