<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/grouptype.css'/>">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://code.jquery.com/jquery-1.12.4.min.css">	
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
<title>Insert title here</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<jsp:include page="${request.contextPath}/group/group_navbar" />
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> 
	
	<form class="text-center">
		<table >
	
		<tr>
    		<th>標題:<input type="text"></input></th>
  		</tr>
  		<tr>
  			<th></th>
  		</tr>
  		<tr>
    		<td><textarea rows="10" cols="60"></textarea></td> 
  		</tr>
		<tr>
			<td class="text-right"><button>上傳檔案</button><button>送出</button></td>
		</tr>
		</table>
	
	</form>
<!-- 	回覆呈現出內容區塊 -->
	<form>
	我是回覆內容
	</form>
<!-- 	回覆呈現出內容區塊 -->
<!-- 	回覆輸出區域 -->
	<form class="text-center" action="${pageContext.request.contextPath}/group/postReply" enctype="multipart/form-data">
	<table>
		<tr>
    		<td><textarea rows="10" cols="60"></textarea></td> 
  		</tr>
  		<tr>
			<td class="text-right"><button class="multipartFile">上傳檔案</button><button type="submit" >回覆</button></td>
		</tr>
  	</table>	
	</form>
	
	<!-- 	回覆輸出區域 -->
	</div>

<!-- 請把所有內容寫在此div內 -->

</body>
</html>