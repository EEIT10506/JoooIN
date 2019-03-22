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
</style>
<title>JoooIn</title></head>
<body class="everyPage">
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
<!-- 		<div style="border:1px solid black;width:1200px;height:400px;margin:auto"> -->
		<img style="background-color:#CAE1FF;width:1200px;height:400px;margin:auto" src="<c:url value='/resources/img/logo_JoooIn.png'/>"/>
<!-- 		</div> -->
		<div class="title" style="border:solid 1px black;width:1200px;height:100px;"></div>
			
<!-- 	event		===================== -->
<c:forEach var="topEvent" items="${top8Events}" varStatus="loop">

	<p>${topEvent.eventId}</p>
	<p>${topEvent.eventName}</p>
	<p>${topEvent.eventDateStart}</p>
	<p>${topEvent.eventDateEnd}</p>
	<p>${topEvent.eventLocation}</p>
	<p>${topEvent.eventAddress}</p>
	<p>${topEvent.eventContent}</p>
	<p>${topEvent.eventTypeId}</p>
	<p>${topEvent.eventInviterId}</p>
	<p>${topEvent.eventLike}</p>
	<p>${topEvent.eventMemberLimit}</p>
	<p>${topEvent.eventCurrentMembers}</p>
	<p>${topEvent.isFull}</p>
	<p>${topEvent.eventStatus}</p>
	<p>${topEvent.eventCreateDate}</p>
<%-- 	<p><img src="<c:url value='/getEventImage/${topEvent.eventId}.jpg' />"/></p> --%>
	
</c:forEach>

<!-- ================================= -->
				<div class="bd-example" style="width:1200px;height:500px;margin:auto;background-color:#20B2AA;border-radius:40px;">
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
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">${topEvent[0].eventName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">${topEvent[1].eventName}</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">${topEvent[2].eventName}</p>
					     </div>
					 
					  <a href="#"><img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;"></a>
					  

				      <a href="#"><img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;"></a>


				       <a href="#"><img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
					     </div>
<!-- 					     備用 -->
					      <div style="margin-top:30px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團</p>  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名</p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">人數已滿</p>
					     </div>
<!-- 					     讚 -->
					     <span style="position:absolute;top:283px;left:290px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 111 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:635px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 101 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:980px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 100 <i class="far fa-thumbs-up"></i></span>
					    
					     
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">HOT 熱門活動</h5>
				   	   </div>
				</div>
					   <!-- 	第二頁			======	       -->  
				 <div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
					  	 <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">個團我個團個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">我個個團我個團</p>
					     </div>
					 
					   <a href="#"><img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;"></a>
					  

				       <a href="#"><img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;"></a>


				       <a href="#"><img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
					     </div>
<!-- 					     備用 -->
 						<div style="margin-top:30px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團</p>  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名</p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">人數已滿</p>
					    </div>
<!-- 					     讚 -->
					     <span style="position:absolute;top:283px;left:290px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 111 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:635px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 101 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:980px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 100 <i class="far fa-thumbs-up"></i></span>
					    
					     
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">HOT 熱門活動</h5>
				   	   </div>
				</div>
					     <!-- 	第三頁			======	       -->
				<div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
				  <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">個團我個團個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">我個個團我個團</p>
				  </div>
					 
					  <a href="#"><img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;"></a>
					  

				      <a href="#"><img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;"></a>


				       <a href="#"><img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
					     </div>
<!-- 					     備用 -->
 						 <div style="margin-top:30px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團</p>  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名</p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">人數已滿</p>
					     </div>
<!-- 					     讚 -->
					     <span style="position:absolute;top:283px;left:290px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 111 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:635px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 101 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:980px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 100 <i class="far fa-thumbs-up"></i></span>
					    
					     
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:	#FF0000;font-famliy:微軟正黑體 !important;font-weight:bold!important;">HOT 熱門活動</h5>
				   	   </div>
				 </div>
					   
					 <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev" style="background-color:#363636;width:40px;height:150px;margin-top:175px;">
				      	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				        <span class="sr-only">Previous</span>
				   	 </a>
				     <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next"  style="background-color:#363636;width:40px;height:150px;margin-top:175px;">
				        <span class="carousel-control-next-icon" aria-hidden="true" ></span>
				        <span class="sr-only">Next</span>
				     </a>
				 </div>
				</div>
	
<!-- 		event	===================== -->
<div style="border:1px solid black;width:1200px;height:100px;"></div>
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
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">個團我個團個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">我個個團我個團</p>
					     </div>
					 
					  <a href="#"><img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;"></a>
					  

				      <a href="#"><img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;"></a>


				       <a href="#"><img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
					     </div>
<!-- 					     備用 -->
 						 <div style="margin-top:30px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團</p>  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名</p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">人數已滿</p>
					     </div>
<!-- 					     讚 -->
					     <span style="position:absolute;top:283px;left:290px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 111 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:635px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 101 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:980px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 100 <i class="far fa-thumbs-up"></i></span>
					    
					     
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:#0000FF;font-famliy:微軟正黑體 !important;font-weight:bold!important;">人氣社團</h5>
				   	   </div>
				</div>
					   <!-- 	第二頁			======	       -->  
				 <div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
					  	 <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">個團我個團個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">我個個團我個團</p>
					     </div>
					 
					   <a href="#"><img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;"></a>
					  

				       <a href="#"><img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;"></a>


				       <a href="#"><img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
					     </div>
<!-- 					     備用 -->
 						 <div style="margin-top:30px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團</p>  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名</p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">人數已滿</p>
					     </div>
<!-- 					     讚 -->
					     <span style="position:absolute;top:283px;left:290px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 111 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:635px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 101 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:980px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 100 <i class="far fa-thumbs-up"></i></span>
					    
					     
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:#0000FF;font-famliy:微軟正黑體 !important;font-weight:bold!important;">人氣社團</h5>
				   	   </div>
				</div>
					     <!-- 	第三頁			======	       -->
				<div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
				  <div style="margin-bottom:50px;">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">個團我個團個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">個團我個團</p>
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">我個個團我個團</p>
				  </div>
					 
					  <a href="#"><img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;"></a>
					  

				      <a href="#"><img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;"></a>


				       <a href="#"><img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;"></a>
<!-- 						時間  -->
						 <div style="margin-top:2px;">
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
						   <p style="font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	black;">2019-12-22 12:00</p>
					     </div>
<!-- 					     備用 -->
						 <div style="margin-top:30px;">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">即將成團</p>  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">開放報名</p>
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;">人數已滿</p>
					     </div>
<!-- 					     讚 -->
					     <span style="position:absolute;top:283px;left:290px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 111 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:635px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 101 <i class="far fa-thumbs-up"></i></span>
					     <span style="position:absolute;top:283px;left:980px;font-size:20px;font-family:微軟正黑體;color:black;">10 <i class="fas fa-user-check"></i> 100 <i class="far fa-thumbs-up"></i></span>
					    
					     
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:#0000FF;font-famliy:微軟正黑體 !important;font-weight:bold!important;">人氣社團</h5>
				   	   </div>
				 </div>
					   
					 <a class="carousel-control-prev" href="#groups" role="button" data-slide="prev" style="background-color:#363636;width:40px;height:150px;margin-top:175px;">
				      	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				        <span class="sr-only">Previous</span>
				   	 </a>
				     <a class="carousel-control-next" href="#groups" role="button" data-slide="next"  style="background-color:#363636;width:40px;height:150px;margin-top:175px;">
				        <span class="carousel-control-next-icon" aria-hidden="true" ></span>
				        <span class="sr-only">Next</span>
				     </a>
				 </div>
				</div>
			
			
<!-- 		group	=========== -->
<!--測試資料區 		===================	 -->

<!-- 測試資料		===================	 -->
			
	</div>
<!-- 請把所有內容寫在此div內 -->
	</div>
</body>
</html>