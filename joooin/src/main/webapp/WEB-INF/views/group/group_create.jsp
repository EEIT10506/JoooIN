<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function checkImage(image) {
		var validExts = new Array(".jpg", ".png", ".gif");
		var fileExt = image.value;

		fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
		if (validExts.indexOf(fileExt) == -1) {
			alert("檔案類型錯誤，僅接受以下檔案類型： jpg、png、gif");
			image.value = null;
			return false;
		}

		var fileSize = 0;
		var fileMaxSize = 1024;
		var filePath = image.value;
		if (filePath) {
			fileSize = image.files[0].size;
			var size = fileSize / 1024;
			if (size > fileMaxSize) {
				alert("圖片容量不可超過 1 MB");
				image.value = null;
				return false;
			}
		}
		return true;
	}
</script>
<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 120px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<div id="main">
		<h1>創建社團初版</h1>
		<hr>
		<!-- 		使用表格物件 -->
		<form:form method="POST" modelAttribute="groupMainBean"
			enctype="multipart/form-data">
			<fieldset>
				<label for="groupType">社團型態</label>
				<form:select path='groupType' required="required" id="groupType">
					<form:option value="sport">運動</form:option>
					<form:option value="food">美食</form:option>
					<form:option value="entertainment">娛樂</form:option>
					<form:option value="other">其他</form:option>
				</form:select>

				<label for="groupName">團名</label>
				<form:input path="groupName" type='text' id="groupName" required="required"/>

				<label for="groupIntro">社團介紹</label>
				<form:input path="groupIntro" type='text' id="groupIntro" />

				<label for="multipartFile">上傳社團照片(不傳使用預設)</label>
				<form:input type="file" accept="image/*" path="multipartFile"
					id="multipartFile" onchange="checkImage(this)"></form:input>

				<input type="submit" value="送出">
			</fieldset>
		</form:form>

	</div>
</body>
</html>