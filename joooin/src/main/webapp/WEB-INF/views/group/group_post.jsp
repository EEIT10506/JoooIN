<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/grouptype.css'/>">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://code.jquery.com/jquery-1.12.4.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 50px;
}
</style>
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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
		<jsp:include page="${request.contextPath}/group/group_navbar" />
		
		
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <form:form
			method="POST" modelAttribute="groupPostBean" 
			enctype="multipart/form-data" class="text-center">
			<table>

				<tr>
					<th><label for="groupPostTitle">文章標題 : </label> <form:input
							path="groupPostTitle" type='text' id="groupPostTitle" /></th>
				</tr>
				<tr>
					<th><form:input
							path="groupId" type="hidden" id="groupId" value="${groupMain.groupId}"/></th>
				</tr>
				<tr>
					<th><form:input
							path="memberId" type="hidden" id="memberId" value="${member.memberId}"/></th>
				</tr>

				<tr>
					<th>${member.memberName}</th>
				</tr>
				
				<tr>
					<img src="<c:url value='/getMemberImage/${member.memberId}.jpg' />">
				</tr>
				
				<!-- 				放文章內容 -->
				<tr>
					<td><textarea rows="10" cols="60"></textarea></td>
				</tr>
				<!-- 				放文章內容 -->
				
				<tr>
					<td class="text-right"><label for="multipartFile">上傳文章照片</label>
						<form:input type="file" accept="image/*" path="multipartFile"
							id="multipartFile" onchange="checkImage(this)"></form:input> 
							<input type="submit" value="送出">
					</td>
				</tr>
			</table>

		</form:form>
	</div>
	<!-- 請把所有內容寫在此div內 -->

</body>
</html>