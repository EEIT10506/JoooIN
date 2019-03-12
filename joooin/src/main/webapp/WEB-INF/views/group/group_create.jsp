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
	<div id="main">
		<h1>創建社團初版</h1>
		<hr>
		<!-- 		使用表格物件 -->
		<form:form method="POST" modelAttribute="groupMainBean" enctype="multipart/form-data">
			<fieldset>
				<label for="groupName">團名</label>
				<form:input path="groupName" type='text' id="groupName"/>
				
				<label for="">社團型態</label>
				<form:input path="" type='text' id=""/>
				
				<label for="">社團管理人</label>
				<form:input path="" type='text' id=""/>
				
				<label for="groupCreateDate">創立時間</label>
				<form:input path="groupCreateDate" type='text' id="groupCreateDate"/>
				
				<input type="submit" value="送出"> 
			</fieldset>
		</form:form>

	</div>
</body>
</html>