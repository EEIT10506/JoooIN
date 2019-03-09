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
	
	.a{
   		 text-decoration:none;
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
/* 		margin-right: 15px;  */
/*   		margin-left: 15px; */
	}
	.left{
	
	}
	.right{
		padding-left:10px;
	}
	.eventname{
/* 		position:relative; */
		padding-left:30px;
 		padding-top:40px; 
		font-size:40px;
		font-weight:bold;
		
	}
	.leavemessage{
		margin-top:30px;
/* 		border:1px solid black; */
		margin-bottom:30px;
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
/* 	positive:relative; */
		text-decoration:none;
		padding-top:25px;
		padding-right:100px;
		font-size:20px;
		float:right;	
	}
	.eventtype{
		position:relative;
		padding:5px 5px;
		border-radius:30px;
		border:solid 1px #FF0000;
		font-size:15px;
		bottom:8px;
		
	}
	.eventliketotal{
	margin-left:370px;
		margin-top:5px;
		margin-right:5px;
/* 		float:right; */
	}
	.eventtypeimg{
		width:20px;
		
	}
	.eventimg{
		width:430px;
		height:300px;
		padding-left:10px;
	}
	.eventjoinmember{
		
	}
	#liked{
		background-color:#EEEEE0;
	}
 	.eventNotLike{ 
 		background-color:#CDCDC1 !important;  
 		font-weight:bold !important;
 		width:80px;
 	} 
 	.eventLike{ 
  		background-color:#4876FF !important;  
		
 	} 
	.eventJoin{
		position:relative;
		background-color:#8B4500;
		color:white;
		padding:8px 30px !important;
		font-family:微軟正黑體 !important;
		font-size:18px !important;
		font-weight:bold !important;
 		left:180px; 
		
	}
	.eventCancels{
		position:relative;
 		left:180px; 
		top:3px;
		font-weight:bold !important;
	}
	.textArea{
		width:70%;
		height:50px;
		margin-left:136px;
		border-radius:10px;
		border:solid 2px #FF8C00;
		overflow:hidden;
	}
	.messageContent{
		width:70%;
		margin:auto;
	}
	.writeMessage{
		width:70% !important;
		margin:auto;
	}
	.hr{
		width:70%;
		margin:auto;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#e${event.eventId }").click(function(){
			var liked = $("#e${event.eventId }");
			if(liked.val= "<i class='far fa-thumbs-up'></i> 讚"){
			    $(this).addClass("eventLike");
			    $(this).html("<i class='far fa-thumbs-up'></i> 收回");
			    return;
			}else if(liked.val = "<i class='far fa-thumbs-up'></i> 收回"){
				$(this).addClass("eventNotLike");
			    $(this).html("<i class='far fa-thumbs-up'></i> 讚");
			    return;
			}
			
		});
		
	});
	
</script>
<title>Insert title here</title></head>
<body class="body">
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
<%-- 		 <c:set var="eventId" value="${eventId}"/> --%>
<div class="outer">
		<div class="eventname">
			<span >${event.eventName}</span>
			<span class="eventtype"> 
			<img class="eventtypeimg" src="<c:url value='/resources/img/icon_${eventtype.eventType}_01.png' />" />${eventtype.eventType}</span>
			<span class="eventtype" id="eventfull">已滿團</span>
			<span class="eventtype" id="eventnofull">未滿團</span>
			 <span class="eventmodify"><i class="fas fa-cog"></i><a class="a" href="#">活動管理</a></span>
			 
		 </div>
		
			<div class="row">
    			  <div class="col-md-6 left">
    				<img class="eventimg" src="<c:url value='/resources/img/cover_${eventtype.eventType}.jpg'/>" />${event.eventImage}
    				<p class="eventliketotal"><i class="far fa-thumbs-up"></i> ${event.eventLike}</p>
    				<hr>
    				<p>
    				 <span id="likedspan">
    				 <button type="button" id="e${event.eventId }" class="btn btn-default eventNotLike"><i class="far fa-thumbs-up"></i> &nbsp讚</button></span>
    				<span id="joinOrNot">
    				
    				 <button type="button" class="btn btn-success eventJoin">報名</button>
    				</span>
    				<span>
    				 <button type="button" class="btn btn-danger eventCancels">退出</button>
    				 </span> 
    				 </p>
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
      				<p class="eventjoinmember">目前人數 : 
      				<span>${event.eventCurrentMembers}</span>  人
      				</p>
      				<p>人數限制 : 
      				<span>${event.eventMemberLimit}</span>
      				</p>
      				<p>活動內容 : 
      				<span> ${event.eventContent}</span>
      				</p>
     			 </div>
   			</div>
  	   <div class="leavemessage">
  	   	<hr/>
  	   	<div id="allMessage">
<!--   	   	各留言 -->
  	   		<p class="messageContent">
  	   	
  	   		
  	   		
  	   		<span id="leaveMessageName">${eventbuildname.memberName} </span><br/>
  	   				今天天氣真好今天天氣
<!--   	   				內文 -->
  	   		<br/><br/>
  	   		<hr class="hr"/>
  	   		</p>
  	   	<!--   	   	各留言 -->
  	   	</div>
  	   	<form action="#" method="Post">
  	   	<textarea class="textArea" ></textarea>
      	<input type="submit" value="留言" class="btn btn-primary btn-md btn-block writeMessage"/>
      	</form>
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