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
<title>登入畫面</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<div style="text-align: center;color: red;">
	<h4 >${name}</h4>
	<h4>${welcome}</h4>
	</div>
	<form:form action="loginProcess" method="POST" modelAttribute="memberMainBean">
  <div class="form-group">
    <label for="email">帳號</label>
    <form:input type="email" class="form-control" id="email" placeholder="Email" path="email"/>
  </div>
  <div class="form-group">
    <label for="password">密碼</label>
    <form:input type="password" class="form-control" id="password" placeholder="Password" path="password"/>
  </div>
<!--   <div class="checkbox"> -->
<!--     <label> -->
<!--       <input type="checkbox"> 記住我 -->
<!--     </label> -->
<!--   </div> -->
  <button type="submit" class="btn btn-primary">登入</button>
  <button type="button" class="btn btn-primary" onclick="location.href='/joooin/register'">註冊</button>
</form:form>
 
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>