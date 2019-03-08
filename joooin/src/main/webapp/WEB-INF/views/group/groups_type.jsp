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
<title>社團分類結果</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<table style="border:3px #cccccc solid;" cellpadding="10" border='1'>
	<tr><th>種類</th><th>社團名稱</th><th>人數</th></tr>
	<c:forEach var='group_main' item='${groupsType}' >
	
	<tr><td>${group_main.groupType}</td>
	<td>${group_main.groupName}</td>
	<td>${group_main.groupCurrentMembers}</td>
	<td>
	<button>加入社團</button>
	</td>
	
	</tr>
	
	</c:forEach>
	</table>

	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>