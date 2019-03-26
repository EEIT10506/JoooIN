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
		top: 120px;
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
			<div class="col-lg-8 mb-4">
				<form action="${pageContext.request.contextPath}/forgotPassword" method="post">

					<div class="control-group form-group">
						<div class="controls">
							<label>電子信箱<span style="color: red">*</span></label>
<!-- 							<button type="button" id="emailButton" class="btn btn-success">一鍵填入</button> -->
							<input type="email" class="form-control" name="email" id="forgotemail" placeholder="請輸入在本網站使用的電子信箱"/>
						</div>
					</div>

					<input type="submit" class="btn btn-primary" id="sendMessageButton"
						value="重設密碼" />
				</form>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<!-- Footer -->



	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>