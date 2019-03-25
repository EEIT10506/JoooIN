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
		top: 70px;
	}
</style>
<title>忘記密碼</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<div class="container" style="margin-left:50px">
 
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">忘記密碼</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item active">忘記密碼</li>
		</ol>

		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
			<div class="col-md-6 offset-3 newPassBox mt-5 pt-3">
			<div style="font-size:10em; color:#E63F00" class="text-center">
		<i class="fas fa-unlock-alt"></i>
		</div>
		<hr>
			<p class="text-center">${message}</p>
			<a href="<c:url value='/' />"><button  class="btn btn-primary btn-block">回到首頁</button></a>
			</div>
		</div>
		<!-- /.row -->

	</div>
	
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>