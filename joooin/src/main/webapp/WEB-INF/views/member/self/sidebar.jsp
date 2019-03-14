<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function(){
		if (location.href.search("profile") != -1)
			$("#profile").attr("class", "list-group-item list-group-item-action active");
		else if (location.href.search("friend") != -1)
			$("#friend").attr("class", "list-group-item list-group-item-action active");
		else if (location.href.search("event") != -1)
			$("#event").attr("class", "list-group-item list-group-item-action active");
		else if (location.href.search("group") != -1)
			$("#group").attr("class", "list-group-item list-group-item-action active");
		else if (location.href.search("message") != -1)
			$("#message").attr("class", "list-group-item list-group-item-action active");
		else 
			$("#home").attr("class", "list-group-item list-group-item-action active");
	});
</script>
<style>
	#memberImage{text-align: center;}
	#memberName{font-size: 20px;}
	.list-group{text-align: center;}
	#userImage {border-radius: 100px;}
</style>
<div id="memberImage" >
	<img id="userImage" src="<c:url value='/getMemberImage/${memberId}.jpg' />" width="160px" />
	<p id="memberName">${memberName}</p>
</div>
<br />
<div class="list-group">
	<a id="home" href="${pageContext.request.contextPath}/member/my" class="list-group-item list-group-item-action">會員首頁</a>
	<a id="profile" href="${pageContext.request.contextPath}/member/my/profile" class="list-group-item list-group-item-action">會員資訊</a>
	<a id="friend" href="${pageContext.request.contextPath}/member/self/friend/my_friend" class="list-group-item list-group-item-action">好友清單</a>
	<a id="event" href="${pageContext.request.contextPath}/member/my/event" class="list-group-item list-group-item-action">活動清單</a>
	<a id="group" href="${pageContext.request.contextPath}/member/my/group" class="list-group-item list-group-item-action">社團清單</a>
	<a id="message" href="${pageContext.request.contextPath}/member/my/message" class="list-group-item list-group-item-action">訊息匣</a>
</div>

