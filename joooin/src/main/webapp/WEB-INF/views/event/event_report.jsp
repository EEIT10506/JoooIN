<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
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
	.backButton{
	    margin-left:630px;
	}
	
	.backsButton:hover{
		background-color:#1C1C1C !important;;
	}
</style>
<title>檢舉頁面</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
	<h1 class="mt-4 mb-3 font-weight-bold">檢舉頁面
        <small>Report</small>
         
         <span class="backButton">
   		   <a href="${pageContext.request.contextPath}/event/${event.eventId}" id="backbutton" class="btn btn-secondary btn-lg backsbutton" role="button" aria-pressed="true">返回活動</a>
   		 </span>
   	</h1> 
      <div class="row">
        <div class="col-md-11">
        </div>

      </div>
      <ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">首頁</a></li>
        <li class="breadcrumb-item active">檢舉頁面</li>
      </ol>
      
      <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ahh:mm:ss"); %>
		<div style="text-align: center;color: red;">
			<h4 >${success}</h4>
		</div>
      <form:form method="POST" modelAttribute="eventReportBean" action="${pageContext.request.contextPath}/event/report/${event.eventId}">
		<div class="form-group">
			<label for="reportMemberId">檢舉人：${memberName}</label>
			<form:input type="hidden" value='${memberId}' path="reportMemberId" id="reportMemberId"/>
		</div>
		
		<div class="form-group">
			<label for="reportViolatorId">被檢舉人： ${bean.memberName }   </label>
			<form:input type="hidden" path="reportViolatorId" id="reportViolatorId"/>
		</div>
		
		<div class="form-group">
			<label for="reportDate">檢舉時間： <%=sdf.format(new Date()).toString() %>   </label>
			<form:input type="hidden" value='<%=sdf.format(new Date()).toString() %>' path="reportDate" id="reportDate"/>
		</div>
		
		<div class="form-group">
			<label for="reportType">檢舉類型： 活動留言不當</label>
			<form:input type="hidden" name="reportType" id="reportType" path="reportType" class="form-control"/>
		</div>
		<div class="form-group">
			<label for=reportContent>內容： </label>
			<form:textarea class="form-control" id="reportContent" rows="3" path="reportContent"/>
		</div>
		
		<form:input type="hidden" value="false" path="isDone" id="isDone"/>
		<button type="submit" class="btn btn-primary">送出檢舉</button>
      </form:form>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>