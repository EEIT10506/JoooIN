<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='<c:url value="/resources/css/event.css"/>'  type="text/css" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<style>
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
	.body{
		font-family:微軟正黑體;
		background-color:#F5F5F5;
		font-weight:bold;
	}
	.outer{
		background-color:#FFFFFF;
		width:75%;
		margin: auto;
		border:1px solid #DCDCDC;
		
	}
	.row{
		padding:10px;
		
	}
	.left{
	
	}
	.right{
		
	}
	.eventname{
		position:relative;
		padding-left:30px;
		padding-top:40px;
		font-size:40px;
		font-weight:bold;
		
	}
	.leavemessage{
		margin-top:30px;
		border:1px solid black;
	}
	.eventbuilder{
		font-size:25px;
	}
	.eventtime{
		font-size:15px;
		color:#FFA500;
	}
	.eventaddress{
	
	}
	.eventmodify{
	positive:relative;
		padding-top:25px;
		padding-right:100px;
		font-size:20px;
		float:right;	
	}
	.eventtype{
		font-size:20px;
	}
	.eventliketotal{
	margin-left:370px;
		margin-top:5px;
		margin-right:5px;
/* 		float:right; */
	}
</style>
<title>Insert title here</title></head>
<body class="body">
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
<%-- 		 <c:set var="eventId" value="${eventId}"/> --%>
<div class="outer">
		<div class="eventname">
			${event.eventName}
			<span class="eventmodify"> 活動設定按鈕</span>
			<span class="eventtype"> <img src="<c:url value='/resources/img/cover_${eventtype.eventType}.jpg' />" />${eventtype.eventType}</span>
		 </div>
			<div class="row">
    			  <div class="col-md-6 left">
    				<p>${event.eventImage}</p>
    				<p class="eventliketotal"><i class="far fa-thumbs-up"></i> ${event.eventLike}</p>
    				<hr>
    				讚   分享
     			 </div>
    		 	 <div class="col-md-6 right">
      				<p class="eventbuilder">
<!--       				<span></span>頭像 -->
      				<span> ${eventbuildname.memberName}</span>
      				</p>
      				<p>
      				<i class="fas fa-clock"></i>
      				<span class="eventtime">${event.eventDateStart}</span>
      				</p>
      				<p class="eventaddress">
      				<i class="fas fa-map-marker-alt"></i>
<!--       				位置icon圖 -->
						<span> ${event.eventLocation} ,${event.eventAddress}</span>
      				</p>
      				<p></p>
     			 </div>
   			</div>
  	   <div class="leavemessage">
      	12312412414244
       </div>
 </div>
		 
		 
		 
		 
		 
		  <a href="event/${eventId}">活動詳細資訊有ID=2</a>
		 
		 
		<p>活動名稱 : ${event.eventName}</p>
		<p>活動開始 : ${event.eventDateStart}</p>
		<p>活動結束 : ${event.eventDateEnd}</p>
		<p>縣市 : ${event.eventLocation}</p>
		<p>地址 : ${event.eventAddress}</p>
		<p>報名人數 : ${event.eventCurrentMembers}/${event.eventMemberLimit}</p>
		<p>活動發起人ID : ${event.eventInviterId}</p>
		<p>活動發起人姓名 : ${eventbuildname.memberName}</p>
		
		<p>活動種類 : ${eventtype.eventType}</p>
		<p>活動內容描述 : ${event.eventContent}</p>
		<p>活動參加會員人數(不含額外人) : ${totalmember}</p>
		<c:forEach var="eventmember" items="${eventmember}">
			<p>活動成員ID : ${eventmember.memberId}</p>
			
		</c:forEach>
		<c:forEach var="eventmembers" items="${eventmembers}">
			<p>活動成員Name : ${eventmembers.memberName}</p>
			
		</c:forEach>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>