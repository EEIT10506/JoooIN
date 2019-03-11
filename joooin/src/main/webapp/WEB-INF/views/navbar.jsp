<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<style>
	#loginNregister {
		position: absolute;
		right: 30px;
	}
	#hasLogin {
		position: absolute;
		right: 75px;
	}
	#logout{
		position: absolute;
		right: 30px;
	}
</style>
<script>
	$(document).ready(function(){
		if ($(".hasLogin").text() != ""){
			$("#loginNregister").css("visibility", "hidden");
		} else {
			$("#loginNregister").css("visibility", "visible");
		}
	});
</script>
<body>
<nav class="navbar navbar-expand bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="${pageContext.request.contextPath}">
    <img src="<c:url value='/resources/img/logo_94x94_07.png'/>" alt="logo" style="width:45px;">
  </a>
  
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="member">會員</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="events">活動</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="groups">社團</a>
    </li>
    <li id="loginNregister" class="nav-item">
      <a class="nav-link" href="login">登入／註冊</a>
    </li>
    <li id="hasLogin" class="nav-item">
      <a class="nav-link hasLogin" href="/joooin/member">${memberName}</a>
    </li>
    <li id="hasLogin" class="nav-item">
      <a class="nav-link hasLogin" href="/joooin/admin">${admin}</a>
    </li>
    <li id="logout" class="nav-item">
      <a class="nav-link logout" href="/joooin/logout" onclick="return(confirm('您確定要登出帳號嗎？'))">${logout}</a>
    </li>
  </ul>
</nav>
</body>
</html>