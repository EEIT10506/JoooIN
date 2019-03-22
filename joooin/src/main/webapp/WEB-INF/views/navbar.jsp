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
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
  <script src="https://apis.google.com/js/client:platform.js?onload=start" async defer></script>
  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content='486218648179-mlo3cr1e8u32mg2tpj27ib91qk9lggjp.apps.googleusercontent.com'>
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
			$("#loginNregister").css("display", "none");
		} else {
			$("#loginNregister").css("display", "none");
		}
	});
</script>
<script>
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
	});
}
function onLoad() {
    gapi.load('auth2', function() {
      gapi.auth2.init();
    });
  }
</script>
<body>
<nav class="navbar navbar-expand bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="${pageContext.request.contextPath}">
    <img src="<c:url value='/resources/img/logo_94x94_07.png'/>" alt="logo" style="width:45px;">
  </a>
  
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/member">會員</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/events">活動</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/groups">社團</a>
    </li>
    <li id="loginNregister" class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/login">登入／註冊</a>
    </li>
    <li id="hasLogin" class="nav-item">
      <a class="nav-link hasLogin" href="${pageContext.request.contextPath}/member">${memberName}</a>
    </li>
    <li id="hasLogin" class="nav-item">
      <a class="nav-link hasLogin" href="${pageContext.request.contextPath}/admin">${admin}</a>
    </li>
    <li id="logout" class="nav-item">
      <a id="googleLogout" class="nav-link logout" href="${pageContext.request.contextPath}/logout" onclick="return(confirm('您確定要登出帳號嗎？'))">${logout}</a>
    </li>
    <li id="logout" class="nav-item">
      <a class="nav-link logout" href="${pageContext.request.contextPath}/logout" onclick='signOut()'>${googleLogout}</a>
    </li>
  </ul>
</nav>
</body>
</html>