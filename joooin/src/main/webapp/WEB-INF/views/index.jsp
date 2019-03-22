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

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
	#main {
 		width: 1200px; 
		margin: auto;
		position: relative;
		top: 0px;
	}
	.everyPage{
/* 		background-color:#DCDCDC; */
		background-color:#F5F5F5; 
	}
	.hover{
 		 opacity:0.9; 
 		 border-radius:10px;
/* 		-webkit-filter:brightness(1); */
	}
	.hover:hover{
		
 		 opacity:5; 
/* 		-webkit-filter:drop-shadow(5); */
	}
</style>
<title>JoooIN</title></head>
<body class="everyPage">
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
<!-- 		<div style="border:1px solid black;width:1200px;height:400px;margin:auto"> -->
		<img style="background-color:#CAE1FF;width:1200px;height:400px;margin:auto" src="<c:url value='/resources/img/logo_JoooIn.png'/>"/>
<!-- 		</div> -->
		<div class="title" style="width:1200px;height:20px;"></div>
			
<!-- 	event		===================== -->
<!-- ================================= -->
				<div class="bd-example" style="width:1200px;height:500px;margin:auto;background-color:#696969;border-radius:40px;">
					<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" style="height:500px;">
					  <ol class="carousel-indicators">
					     <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
					     <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					     <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
					  </ol>
					<div class="carousel-inner">
<!-- 	第一頁			======	       -->
				<div class="carousel-item active" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">${top8Events[0].eventName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">${top8Events[1].eventName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">${top8Events[2].eventName}</p>
					     </div>
					 
					  <a href="<c:url value='/event/${top8Events[0].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[0].eventId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 

				      <a href="<c:url value='/event/${top8Events[1].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[1].eventId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>


				      <a href="<c:url value='/event/${top8Events[2].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[2].eventId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;"><i class="fas fa-clock"></i> ${top8Events[0].eventDateStart}</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;"><i class="fas fa-clock"></i> ${top8Events[1].eventDateStart}</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;"><i class="fas fa-clock"></i> ${top8Events[2].eventDateStart}</p>
					     </div>
<!-- 					     備用 -->
					      <div style="margin-top:30px;">
<!-- 					     第一頁第一張 三種狀態======= --> 
					      <c:if test="${(top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers) < 5 and top8Events[0].eventMemberLimit != top8Events[0].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers} 人</p>  
						  </c:if>
						   <c:if test="${(top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers} 人</p>  
						  </c:if> 
						  <c:if test="${top8Events[0].eventMemberLimit == top8Events[0].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers) < 5 and top8Events[1].eventMemberLimit != top8Events[1].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers} 人</p>
						  </c:if> 
						  <c:if test="${(top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers} 人</p>
						  </c:if>
						  <c:if test="${top8Events[1].eventMemberLimit == top8Events[1].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers) < 5 and top8Events[2].eventMemberLimit != top8Events[2].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers} 人</p>
						  </c:if> 
						  <c:if test="${(top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers} 人</p>
						  </c:if>
						  <c:if test="${top8Events[2].eventMemberLimit == top8Events[2].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>
						  </c:if>  
					     </div>
<!-- 					     人數+讚數 -->
					     <span style="position:absolute;top:283px;left:300px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[0].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     <span style="position:absolute;top:283px;left:645px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[1].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     <span style="position:absolute;top:283px;left:990px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[2].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    
					     <span style="position:absolute;top:283px;left:360px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[0].eventLike} <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:705px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[1].eventLike} <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:1050px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[2].eventLike} <i class="far fa-thumbs-up"></i></span>
					    
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">HOT 熱門活動</h5>
				   	   </div>
				</div>
					   <!-- 	第二頁			======	       -->  
				 <div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">${top8Events[3].eventName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">${top8Events[4].eventName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">${top8Events[5].eventName}</p>
					     </div>
					 
					  <a href="<c:url value='/event/${top8Events[3].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[3].eventId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					  

				      <a href="<c:url value='/event/${top8Events[4].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[4].eventId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>


				      <a href="<c:url value='/event/${top8Events[5].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[5].eventId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;"><i class="fas fa-clock"></i> ${top8Events[3].eventDateStart}</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;"><i class="fas fa-clock"></i> ${top8Events[4].eventDateStart}</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;"><i class="fas fa-clock"></i> ${top8Events[5].eventDateStart}</p>
					     </div>
<!-- 					     備用 -->
					      <div style="margin-top:30px;">
<!-- 					     第一頁第一張 三種狀態======= --> 
					      <c:if test="${(top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers) < 5 and top8Events[3].eventMemberLimit != top8Events[3].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers} 人</p>  
						  </c:if>
						   <c:if test="${(top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers} 人</p>  
						  </c:if> 
						  <c:if test="${top8Events[3].eventMemberLimit == top8Events[3].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers) < 5 and top8Events[4].eventMemberLimit != top8Events[4].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers} 人</p>
						  </c:if> 
						  <c:if test="${(top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers} 人</p>
						  </c:if>
						  <c:if test="${top8Events[4].eventMemberLimit == top8Events[4].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers) < 5 and top8Events[5].eventMemberLimit != top8Events[5].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers} 人</p>
						  </c:if> 
						  <c:if test="${(top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers} 人</p>
						  </c:if>
						  <c:if test="${top8Events[5].eventMemberLimit == top8Events[5].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>
						  </c:if>  
					     </div>
<!-- 					     人數+讚數 -->
					     <span style="position:absolute;top:283px;left:300px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[3].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     <span style="position:absolute;top:283px;left:645px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[4].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     <span style="position:absolute;top:283px;left:990px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[5].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    
					     <span style="position:absolute;top:283px;left:360px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[3].eventLike} <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:705px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[4].eventLike} <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:1050px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[5].eventLike} <i class="far fa-thumbs-up"></i></span>
					    
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">HOT 熱門活動</h5>
				   	   </div>
				</div>
					     <!-- 	第三頁			======	       -->
				<div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">${top8Events[6].eventName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">${top8Events[7].eventName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">${top8Events[8].eventName}</p>
					     </div>
					 
					  <a href="<c:url value='/event/${top8Events[6].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[6].eventId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					  

				      <a href="<c:url value='/event/${top8Events[7].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[7].eventId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>


				      <a href="<c:url value='/event/${top8Events[8].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[8].eventId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;"><i class="fas fa-clock"></i> ${top8Events[6].eventDateStart}</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;"><i class="fas fa-clock"></i> ${top8Events[7].eventDateStart}</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;"><i class="fas fa-clock"></i> ${top8Events[8].eventDateStart}</p>
					     </div>
<!-- 					     備用 -->
					      <div style="margin-top:30px;">
<!-- 					     第一頁第一張 三種狀態======= --> 
					      <c:if test="${(top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers) < 5 and top8Events[6].eventMemberLimit != top8Events[6].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers} 人</p>  
						  </c:if>
						   <c:if test="${(top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers} 人</p>  
						  </c:if> 
						  <c:if test="${top8Events[6].eventMemberLimit == top8Events[6].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers) < 5 and top8Events[7].eventMemberLimit != top8Events[7].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers} 人</p>
						  </c:if> 
						  <c:if test="${(top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers} 人</p>
						  </c:if>
						  <c:if test="${top8Events[7].eventMemberLimit == top8Events[7].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers) < 5 and top8Events[8].eventMemberLimit != top8Events[8].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">即將成團 尚餘 ${top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers} 人</p>
						  </c:if> 
						  <c:if test="${(top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers) > 5}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">開放報名 尚餘 ${top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers} 人</p>
						  </c:if>
						  <c:if test="${top8Events[8].eventMemberLimit == top8Events[8].eventCurrentMembers}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:red;">人數已滿</p>
						  </c:if>  
					     </div>
<!-- 					     人數+讚數 -->
					     <span style="position:absolute;top:283px;left:300px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[6].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     <span style="position:absolute;top:283px;left:645px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[7].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     <span style="position:absolute;top:283px;left:990px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[8].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    
					     <span style="position:absolute;top:283px;left:360px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[6].eventLike} <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:705px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[7].eventLike} <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:1050px;font-size:20px;font-family:微軟正黑體;color:black;">${top8Events[8].eventLike} <i class="far fa-thumbs-up"></i></span>
					    
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">HOT 熱門活動</h5>
				   	   </div>
				</div>
<!-- x		next prev			   =============== -->
					 <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev" style="background-color:#363636;width:40px;height:150px;margin-top:175px;">
				      	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				        <span class="sr-only">Previous</span>
				   	 </a>
				     <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next"  style="background-color:#363636;width:40px;height:150px;margin-top:175px;">
				        <span class="carousel-control-next-icon" aria-hidden="true" ></span>
				        <span class="sr-only">Next</span>
				     </a>
<!-- x		next prev			   =============== -->				     
				 </div>
				</div>
	
<!-- 		event	===================== -->
<div style="width:1200px;height:20px;"></div>
<!-- =======group==================================== -->
			<div class="bd-example" style="width:1200px;height:500px;margin:auto;background-color:#828282;border-radius:40px;">
					<div id="groups" class="carousel slide" data-ride="carousel" style="height:500px;">
					  <ol class="carousel-indicators">
					     <li data-target="#groups" data-slide-to="0" class="active"></li>
					     <li data-target="#groups" data-slide-to="1"></li>
					     <li data-target="#groups" data-slide-to="2"></li>
					  </ol>
					<div class="carousel-inner">
<!-- 	第一頁			======	       -->
				<div class="carousel-item active" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[0].groupName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[1].groupName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[2].groupName}</p>
					     </div>
					 
					  <a href="<c:url value='/group/${top8Groups[0].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[0].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 

				      <a href="<c:url value='/group/${top8Groups[1].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[1].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>


				      <a href="<c:url value='/group/${top8Groups[2].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[2].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
<!-- =====================開團者 -->
						  <div style="margin-top:10px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">創立者 : <span style="color:black">${top8Groups[0].groupLeaderId}</span></p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:black">${top8Groups[1].groupLeaderId}</span></p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:black">${top8Groups[2].groupLeaderId}</span></p>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
<!-- 						 1 -->
						 <c:if test="${top8Groups[0].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[0].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[0].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[0].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[1].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[2].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[2].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[2].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[2].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">其他類</span></p>
					   	  </c:if>   
					   
					    </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[0].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						  
<!-- 					     第一頁第二張======= -->						  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[1].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						
<!-- 					     第一頁第3張======= -->	
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[2].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">人氣社團</h5>
				   	   </div>
				</div>
					   <!-- 	第二頁			======	       -->  
				 <div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[3].groupName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[4].groupName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[5].groupName}</p>
					     </div>
					 
					  <a href="<c:url value='/group/${top8Groups[3].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[3].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 

				      <a href="<c:url value='/group/${top8Groups[4].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[4].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>


				      <a href="<c:url value='/group/${top8Groups[5].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[5].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
<!-- =====================開團者 -->
						  <div style="margin-top:10px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">創立者 : <span style="color:black">${top8Groups[3].groupLeaderId}</span></p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:black">${top8Groups[4].groupLeaderId}</span></p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:black">${top8Groups[5].groupLeaderId}</span></p>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
						   <c:if test="${top8Groups[3].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[3].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[3].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[3].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[4].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[5].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[5].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[5].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[5].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">其他類</span></p>
					   	  </c:if> 
					     </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[3].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						  
<!-- 					     第一頁第二張======= -->						  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[4].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						
<!-- 					     第一頁第3張======= -->	
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[5].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">人氣社團</h5>
				   	   </div>
				</div>
					     <!-- 	第三頁			======	       -->
				 <div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[6].groupName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[7].groupName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">${top8Groups[8].groupName}</p>
					     </div>
					 
					  <a href="<c:url value='/group/${top8Groups[6].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[6].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 

				      <a href="<c:url value='/group/${top8Groups[7].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[7].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>


				      <a href="<c:url value='/group/${top8Groups[8].groupId}' />"><img src="<c:url value='/getEventImage/${top8Groups[8].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
<!-- =====================開團者 -->
						  <div style="margin-top:10px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">創立者 : <span style="color:black">${top8Groups[6].groupLeaderId}</span></p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:black">${top8Groups[7].groupLeaderId}</span></p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:black">${top8Groups[8].groupLeaderId}</span></p>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
						   <c:if test="${top8Groups[6].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[6].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[6].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[6].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[7].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:black">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[8].groupType == 'sport'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[8].groupType == 'entertainment'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[8].groupType == 'food'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[8].groupType == 'other'}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:black">其他類</span></p>
					   	  </c:if> 
					     </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[6].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						  
<!-- 					     第一頁第二張======= -->						  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[7].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						
<!-- 					     第一頁第3張======= -->	
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:black;">${top8Groups[8].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">人氣社團</h5>
				   	   </div>
				</div>
<!-- 			====================NEXT PREV 		    -->
					 <a class="carousel-control-prev" href="#groups" role="button" data-slide="prev" style="background-color:#363636;width:40px;height:150px;margin-top:175px;">
				      	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				        <span class="sr-only">Previous</span>
				   	 </a>
				     <a class="carousel-control-next" href="#groups" role="button" data-slide="next"  style="background-color:#363636;width:40px;height:150px;margin-top:175px;">
				        <span class="carousel-control-next-icon" aria-hidden="true" ></span>
				        <span class="sr-only">Next</span>
				     </a>
<!-- 			NEXT	     ======== -->
				 </div>
				</div>
			
			
<!-- 		group	=========== -->
<div style="margin-top:20px;border:solid black 1px;width:1200px;height:60px;background-color:blue;"></div>
<!--測試資料區 		===================	 -->
<%-- <c:forEach var="topGroup" items="${top8Groups}"> --%>
<%-- 	<p>${topGroup.groupId}</p> --%>
<%-- 	<p>${topGroup.groupType}</p> --%>
<%-- 	<p>${topGroup.groupName}</p> --%>
<%-- 	<p>${topGroup.groupLeaderId}</p> --%>
<%-- 	<p>${topGroup.groupCurrentMembers}</p> --%>
<%-- 	<p>${topGroup.groupCreateDate}</p> --%>
<%-- 	<p>${topGroup.groupIntro}</p> --%>
<%-- 	<p><img src="<c:url value='/getGroupImage/${topGroup.groupId}.jpg' />"/></p> --%>
<%-- 	</c:forEach> --%>
<!-- 測試資料		===================	 -->
			
	</div>
<!-- 請把所有內容寫在此div內 -->
	</div>
</body>
</html>