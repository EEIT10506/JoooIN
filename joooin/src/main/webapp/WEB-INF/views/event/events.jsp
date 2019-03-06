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
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function () {
    $("#new").click(function () {
    	$("#newdiv").show();
    	$("#getdiv").hide();  	
    });
    
    $("#get").click(function () {
    	$("#newdiv").hide();
    	$("#getdiv").show();
    });
});


</script>

</head>
<body>
<jsp:include page="/navbar/navbar.jsp" />
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<button id="new">開新活動</button>
	<button id="get">尋找活動</button>
	<div id="newdiv" style="display: none">

		
		<form:form modelAttribute="NewEvent" 
			method='POST'>
			<p>
			
			活動名稱:<form:input path='eventName' /><p>
			開始日期:<form:input path='eventDateStart' /><p>
			結束日期:<form:input path='eventDateEnd' /><p>
			
			
			活動地區:<form:input path='eventLocation' /><p>			
			活動地址:<form:input path='eventAddress' /><p>
			活動座標經度:<form:input path='eventLatitude' /><p>
			活動座標緯度:<form:input path='eventLongitude' /><p>
			
			活動內容:<form:input path='eventContent' /><p>
			
		
			人員上限:<form:input path='eventMemberLimit' /><p>
			參加費:<form:input path='eventFee' /><p>

			<br> 
			<br> 
			<input type='submit' value='提交'> 
			<input type='reset' value='還原'> 
			<br> 
			<br> 
			<a href='${pageContext.request.contextPath}/index'>回到首頁</a>
		</form:form>

	
	</div>
	<div id="getdiv" style="display: none">
	
	找活動
	
	</div>
	

	
	
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>