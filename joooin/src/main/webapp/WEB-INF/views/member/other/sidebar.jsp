<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
		else 
			$("#home").attr("class", "list-group-item list-group-item-action active");
	});
</script>
<style>
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
	#memberImage{
		text-align: center;
	}
	#memberName{
		font-size: 20px;
	}
	.list-group{
		text-align: center;
	}
	#root{
		visibility: hidden;
	}
	.friendBtn {
		display: none;
	}
	#userImage {
		border-radius: 100px;
	}
</style>
<body>
	<div id="memberImage" >
		<img id="userImage" src="<c:url value='/getMemberImage/${memberMainBean.memberId}.jpg' />" width="160px" />
		<p id="memberName">${memberMainBean.memberName}</p>
	</div>
	<br />
	<div class="list-group">
		<a id="home" href="${pageContext.request.contextPath}/member/other/${memberMainBean.memberId}" class="list-group-item list-group-item-action">會員首頁</a>
		<a id="profile" href="${pageContext.request.contextPath}/member/other/profile/${memberMainBean.memberId}" class="list-group-item list-group-item-action">會員資訊</a>
		<a id="friend" href="${pageContext.request.contextPath}/member/other/friend/${memberMainBean.memberId}" class="list-group-item list-group-item-action">好友清單</a>
		<a id="event" href="${pageContext.request.contextPath}/member/other/event/${memberMainBean.memberId}" class="list-group-item list-group-item-action">活動清單</a>
		<a id="group" href="${pageContext.request.contextPath}/member/other/group/${memberMainBean.memberId}" class="list-group-item list-group-item-action">社團清單</a>
	</div>
</body>
</html>