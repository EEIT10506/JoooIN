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
	top: 120px;
}
#imgposter{
-webkit-clip-path: circle(42.5% at 50% 50%);
clip-path: circle(42.5% at 50% 50%);
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
<script>

$(document).ready(function(){
	
	$('#area, #groupPostTitle').keyup(function() {
		var area = $("#area").val().trim();
		var title = $("#groupPostTitle").val().trim();
	    if( (area != "") && (title != "")){
	        $('.btn').prop('disabled', false);
	    }
	    else {
	        $('.btn').prop('disabled', true);
	    }
	});
	
});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	
		<jsp:include page="${request.contextPath}/group/group_navbar" />
	
		
		<main role="main" class="container">
		
		<c:choose>
			<c:when test="${Permission}">
		 <form:form
			method="POST" modelAttribute="groupPostBean" 
			enctype="multipart/form-data" class="text-center">
			<table style="margin-left:20%; " class="table  col-xs-6 col-sm-3 table-dark"   >

				<tr>
					<th rowspan="2" width="20%"><img id="imgposter" class="card-img-right flex-auto d-none d-lg-block" alt="Thumbnail [200x200]"  style="width: 200px; height: 200px;" src="<c:url value='/getMemberImage/${member.memberId}.jpg' />"></th>
					<th width="70%" class="text-left"style="font-size:25px;font-weight:bold;margin:5px;">社團名稱:${groupMain.groupName}</th>
					
				</tr>
				

				<tr>
					<th class="text-left" colspan="1"><label for="groupPostTitle"style='margin:5px;'>文章標題 : </label> <form:input
							path="groupPostTitle" type='text' id="groupPostTitle" />
						<p style='margin:5px;' class="text-left">發文人: <span style="margin:20px;"> ${member.memberName}</span></p>
							
							</th>
				</tr>
				
<!-- 				<tr><th class="text-left" colspan="1">321</th></tr> -->
				
				<tr>
					<form:input
							path="groupId" type="hidden" id="groupId" value="${groupMain.groupId}"/>
					<form:input
							path="memberId" type="hidden" id="memberId" value="${member.memberId}"/>		
				</tr>
				
				<!-- 				放文章內容 -->
				
				<tr>
					<td colspan="2" ><form:textarea wrap="hard"  id="area" rows="10" cols="100" path="groupPostText"/></td>
				</tr>
				<!-- 				放文章內容 -->
				
				<tr>
					<td colspan="2" class="text-right "><label for="multipartFile">上傳文章照片</label>
						<form:input type="file" accept="image/*" path="multipartFile" style="color:Red;"
							id="multipartFile" onchange="checkImage(this)"></form:input> 

							<input class="btn-primary btn" type="submit" value="送出" disabled>
							<button type="button" id="oneSetpost" class="btn btn-success">一鍵填入</button><br>
							
<script>
// oneSet
$('#oneSetpost').click(function(){ 
		$('#groupPostTitle').val('大家好'); 
		$('#area').val('如果喜歡我的文章，請幫我按喜歡');
 	});
// oneSet
</script>		
							
					</td>
				</tr>
			</table>

		</form:form>
		</c:when>
		<c:otherwise>
				<span class="d-block p-2 bg-dark text-white">
					社團成員才可以發文
				</span>
            </c:otherwise>
	 </c:choose>
	</div>
	<!-- 請把所有內容寫在此div內 -->

</body>
</html>