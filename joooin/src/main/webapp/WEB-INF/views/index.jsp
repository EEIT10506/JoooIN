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
		top: 70px;
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
	.font{
	     font-family:微軟正黑體;
	     font-weight:bold;
	}
	.indexTitle{
		 background-color:#F5F5F5;width:1200px;height:400px;margin:auto;
	}
	.titleContent{
		 font-size:40px;
		 text-align:center;
		 background-color:#38B0AE;
	}
	.title{
		 width:1200px;
		 height:60px; 
	}
 	.titles{ 
/*  		 border-left:solid 1px #9C9C9C;  */
/*  		 border-right:solid 1px #9C9C9C;  */
 		 border-bottom:solid 1px #9C9C9C; 
 		 width:1200px; 
 		 height:101px; 
		  
 	} 
	.buttonE{
		 font-size:30px;
		 text-align:center;
	     border-right:solid 1px #9C9C9C; 
	  	 width:600px;
	     height:100px; 
	  	 float:left;
	  	 background-color:#E6E6E6;
	}
	.buttonE:hover{
	     background-color:#CCCCCC;
	       cursor:pointer;
	       font-size:40px;
	}
	.spanE{ 
		 position:relative;
		 top:22px;		
	}
	.buttonG{
		 font-size:30px;
		 text-align:center;
		 float:right;
	  	 width:600px; 
	     height:100px; 
	  	 background-color:#E6E6E6;
	}
	.buttonG:hover{
	     background-color:#CCCCCC;
	     cursor:pointer;
	     font-size:40px;
	}
	.actives{
		 background-color:#94CFD1 !important;
	}
	.spanG{
	    position:relative;
		top:22px;	
	}
	.iconsG{
		position:relative;
		top:8px;
		font-size:50px;
		color:	#00008B;	
	}
	.iconsE{
		position:relative;
		top:8px;
		font-size:50px; 
		 color:Red;	
	}
	.firstCarousel{
		width:1200px;margin:auto;margin-top: 30px;
	}
	.radiusCarousel{
		background-color:#3F5867;height:500px;border-radius:40px;
	}
	.insideCarousel{
		width:1200px;height:380px;margin-top:80px;
	}
	.eventFname{
		font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;
	}
	.eventSname{
		font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;
	}
	.eventTname{
		font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;
	}
	.noEventFNow{
		font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;bottom:20px;text-align:center;display:inline;width:300px;color:white;
	}
	.noEventSNow{
		font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;bottom:20px;text-align:center;display:inline;width:300px;color:white;
	}
	.noEventTNow{
		font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;bottom:20px;text-align:center;display:inline;width:300px;color:white;
	}
	.imgFirst{
		margin-left:90px;width:320px;height:230px;
	}
	.imgSecond{
		margin-left:20px;width:320px;height:230px;
	}
	.imgThird{
		margin-left:20px;width:320px;height:230px;
	}
	.eventTime{
		font-size:18px;font-weight:1200px;font-family:微軟正黑體;position:absolute;text-align:left;display:inline;width:300px;color:	black;
	}
	.eventInviter{
		font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;text-align:left;display:inline;width:300px;color:white;
	}
	.eventStatusUncheck{
		font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;
	}
	.eventStatusYes{
		font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:85px;border-radius:10px;color:white;background-color:red;
	}
	.eventStatusUncheckSe{
		font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;
	}
	.eventStatusYesSe{
		font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:85px;border-radius:10px;color:white;background-color:red;
	}
	.eventStatusUncheckTh{
		font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;
	}
	.eventStatusYesTh{
		font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:85px;border-radius:10px;color:white;background-color:red;
	}
	.eventLikeNum{
		position:absolute;top:288px;font-size:20px;font-family:微軟正黑體;color:black;
	}
	.eventCurrentNum{
		position:absolute;top:288px;font-size:20px;font-family:微軟正黑體;color:black;
	}
	.TopEvent{
		font-size:30px !important;color:white;font-famliy:微軟正黑體 !important;font-weight:bold!important;
	}
	.SecondPage{
		width:1200px;height:380px;margin-top:80px;
	}
</style>
<script>
	$(document).ready(function(){
		$(".buttonE").click();
		$(".buttonE").addClass("actives");
		$(".spanE").css("font-size","40px");
		$("#groupDiv").hide();
		
		$(".buttonE").click(function(){
			$("#eventDiv").fadeIn(500);
			$("#groupDiv").fadeOut(500);
			$(".buttonE").addClass("actives");
			$(".buttonG").removeClass("actives");
			$(".spanE").css("font-size","40px");
			$(".spanG").css("font-size","30px");
		});
		$(".buttonG").click(function(){
			$("#groupDiv").fadeIn(500);
			$("#eventDiv").fadeOut(500);
			$(".buttonG").addClass("actives");
			$(".buttonE").removeClass("actives");
			$(".spanG").css("font-size","40px");
			$(".spanE").css("font-size","30px");
		});

	});

</script>
<title>JoooIN</title></head>
<body class="everyPage">
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
<!-- 		<div style="border:1px solid black;width:1200px;height:400px;margin:auto"> -->
		<img class="indexTitle" src="<c:url value='/resources/img/logo_JoooIn.png'/>"/>
<!-- 		</div> -->
		<div class="title">
			<p class="font titleContent">~~~~ 大家一起揪團趣  ~~~~</p>
		</div>	
 		<div class="titles">
			<p class="buttonE">
			<span class="font spanE" id="findEvents"><i class="fas fa-flag iconsE"></i> 熱門活動 </span>
			</p>
			<p class="buttonG">
			<span class="font spanG" id="findGroups"><i class="fas fa-globe-americas iconsG"></i> 人氣社團</span>
			</p> 
		</div> 
	
			
<!-- 	event		===================== -->
<!-- ================================= -->
	<div  id="eventDiv" class="bd-example firstCarousel" style="">
		<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					     <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
					     <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					     <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
					  </ol>
			<div class="carousel-inner radiusCarousel" style="">
<!-- 	第一頁			======	       -->
				<div class="carousel-item active insideCarousel" style="">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						  <c:if test="${!empty top8Events[0]}">				 	 
						    <p class="eventFname" style="">1. ${top8Events[0].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[1]}">
						    <p class="eventSname" style="">2. ${top8Events[1].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[2]}"> 
						    <p class="eventTname" style=" ">3. ${top8Events[2].eventName}</p>
					      </c:if>
					     </div>
					     
					     <div style="">
					 	   <c:if test="${empty top8Events[0]}">
						   <p class="noEventFNow" style="">目前暫無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[1]}">
						   <p class="noEventSNow" style="">目前暫無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[2]}">
						   <p class="noEventTNow" style="">目前暫無活動</p>
					       </c:if>	
					     </div>
					 <c:if test="${!empty top8Events[0]}">    
					  <a href="<c:url value='/event/${top8Events[0].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[0].eventId}.jpg' />" alt="其他"  style="" class="hover imgFirst"></a>
					 </c:if>
					 <c:if test="${empty top8Events[0]}">    
					  <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[0].eventId}.jpg' />" alt="其他"  style="" class="hover imgFirst"></a>
					 </c:if>
					 <c:if test="${!empty top8Events[1]}">
				      <a href="<c:url value='/event/${top8Events[1].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[1].eventId}.jpg' />"  alt="運動"  style="" class="hover imgSecond"></a>
					 </c:if>
					 <c:if test="${empty top8Events[1]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[1].eventId}.jpg' />"  alt="運動"  style="" class="hover imgSecond"></a>
					 </c:if>
					 <c:if test="${!empty top8Events[2]}">
				      <a href="<c:url value='/event/${top8Events[2].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[2].eventId}.jpg' />" alt="食物"  style="" class="hover imgThird"></a>
					 </c:if>
					  <c:if test="${empty top8Events[2]}"> 
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[2].eventId}.jpg' />" alt="食物"  style="" class="hover imgThird"></a>
					 </c:if>
<!-- 						時間  -->
						 <div style="margin-top:10px;">
						 <c:if test="${!empty top8Events[0]}">
						   <p class="eventTime" style="left:90px;"><i class="fas fa-clock"></i> ${top8Events[0].eventDateEnd}</p>
						 </c:if>
						 <c:if test="${!empty top8Events[1]}">  
						   <p class="eventTime" style="left:435px;"><i class="fas fa-clock"></i> ${top8Events[1].eventDateEnd}</p>
						 </c:if>
						 <c:if test="${!empty top8Events[2]}">  
						   <p class="eventTime" style="left:780px;"><i class="fas fa-clock"></i> ${top8Events[2].eventDateEnd}</p>
					     </c:if>
					     </div>
<!-- 					   開團者  ============ -->
						<div style="margin-top:40px;">
						  <c:if test="${!empty top8Events[0]}">
						   <p class="eventInviter" style="left:90px;">開團人 : ${top8EventInviterNames[0]}</p>
						  </c:if>																																						   		
						  <c:if test="${!empty top8Events[1]}"> 
						   <p class="eventInviter" style="left:435px;">開團人 :  ${top8EventInviterNames[1]}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[2]}"> 
						   <p class="eventInviter" style="left:780px;">開團人 :  ${top8EventInviterNames[2]}</p>
						  </c:if>
						</div>
<!-- 					     備用 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 三種狀態======= --> 
					      <c:if test="${(top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers) < 5 and top8Events[0].eventMemberLimit != top8Events[0].eventCurrentMembers and !empty top8Events[0]}">
						   <p class="eventStatusUncheck" style="">即將成團 尚餘 ${top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers} 個名額</p>  
						  </c:if>
						   <c:if test="${(top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers) > 5 and !empty top8Events[0]}">
						   <p class="eventStatusUncheck" style="">開放報名中 尚餘 ${top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers} 個名額</p>  
						  </c:if> 
						  <c:if test="${top8Events[0].eventMemberLimit == top8Events[0].eventCurrentMembers and !empty top8Events[0]}">
						   <p class="eventStatusYes" style="">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers) < 5 and top8Events[1].eventMemberLimit != top8Events[1].eventCurrentMembers and !empty top8Events[1]}">
						   <p class="eventStatusUncheckSe" style="">即將成團 尚餘 ${top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers) > 5 and !empty top8Events[1]}">
						   <p class="eventStatusUncheckSe" style="">開放報名中 尚餘 ${top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[1].eventMemberLimit == top8Events[1].eventCurrentMembers and !empty top8Events[1]}">
						   <p class="eventStatusYesSe" style="">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers) < 5 and top8Events[2].eventMemberLimit != top8Events[2].eventCurrentMembers and !empty top8Events[2]}">
						   <p class="eventStatusUncheckTh" style="">即將成團 尚餘 ${top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers) > 5 and !empty top8Events[2]}">
						   <p class="eventStatusUncheckTh" style="">開放報名中 尚餘 ${top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[2].eventMemberLimit == top8Events[2].eventCurrentMembers and !empty top8Events[2]}">
						   <p class="eventStatusYesTh" style="">人數已滿</p>
						  </c:if>  
					     </div>
<!-- 					     人數+讚數 -->
						 <c:if test="${!empty top8Events[0]}">
					     <span class="eventLikeNum" style="left:300px;">${top8Events[0].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     </c:if>
					     <c:if test="${!empty top8Events[1]}">
					     <span class="eventLikeNum" style="left:645px;">${top8Events[1].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     </c:if>
					     <c:if test="${!empty top8Events[2]}">
					     <span class="eventLikeNum" style="left:990px;">${top8Events[2].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					     </c:if>
					     
					     <c:if test="${!empty top8Events[0]}">
					     <span class="eventCurrentNum" style="left:360px;">${top8Events[0].eventLike} <i class="far fa-thumbs-up"></i></span>
					     </c:if>
					     <c:if test="${!empty top8Events[1]}">
					     <span class="eventCurrentNum" style="left:705px;">${top8Events[1].eventLike} <i class="far fa-thumbs-up"></i></span>
					     </c:if>
					     <c:if test="${!empty top8Events[2]}">
					     <span class="eventCurrentNum" style="left:1050px;">${top8Events[2].eventLike} <i class="far fa-thumbs-up"></i></span>
					     </c:if>
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 class="TopEvent" style="">TOP 9 熱門活動</h5>
				   	   </div>
				</div>
					   <!-- 	第二頁			======	       -->  
				 <div class="carousel-item SecondPage">
<!-- 					   名稱 -->
						<div style="margin-bottom:50px;">
						  <c:if test="${!empty top8Events[3]}">
						   <p class="eventFname">4. ${top8Events[3].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[4]}"> 
						   <p class="eventSname">5. ${top8Events[4].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[5]}">
						   <p class="eventTname">6. ${top8Events[5].eventName}</p>
					      </c:if>	
					     </div>
<!-- ================= 沒團時顯示===================== -->
						
					 	 <div style="margin-bottom:50px;">
					 	   <c:if test="${empty top8Events[3]}">
						   <p class="noEventFNow">目前暫無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[4]}">
						   <p class="noEventSNow">目前暫無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[5]}">
						   <p class="noEventTNow">目前暫無活動</p>
					       </c:if>	
					     </div>
					 <c:if test="${!empty top8Events[3]}">
					  <a href="<c:url value='/event/${top8Events[3].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[3].eventId}.jpg' />" alt="其他"  class="hover imgFirst"></a>
					 </c:if> 
					 <c:if test="${empty top8Events[3]}">
					  <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[3].eventId}.jpg' />" alt="其他" class="hover imgFirst"></a>
					 </c:if> 
					 <c:if test="${!empty top8Events[4]}">
				      <a href="<c:url value='/event/${top8Events[4].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[4].eventId}.jpg' />"  alt="運動"  class="hover imgSecond"></a>
					 </c:if>
					 <c:if test="${empty top8Events[4]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[4].eventId}.jpg' />"  alt="運動"  class="hover imgSecond"></a>
					 </c:if>
					 <c:if test="${!empty top8Events[5]}">
				      <a href="<c:url value='/event/${top8Events[5].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[5].eventId}.jpg' />" alt="食物"  class="hover imgThird"></a>
					 </c:if>
					 <c:if test="${empty top8Events[5]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[5].eventId}.jpg' />" alt="食物"  class="hover imgThird"></a>
					 </c:if>
<!-- 						時間  -->
						 <div style="margin-top:10px;">
						   <c:if test="${!empty top8Events[3]}">
						   <p class="eventTime" style="left:90px;"><i class="fas fa-clock"></i> ${top8Events[3].eventDateEnd}</p>
						   </c:if>
						   <c:if test="${!empty top8Events[4]}">
						   <p class="eventTime" style="left:435px;"><i class="fas fa-clock"></i> ${top8Events[4].eventDateEnd}</p>
						   </c:if>
						   <c:if test="${!empty top8Events[5]}">
						   <p class="eventTime" style="left:780px;"><i class="fas fa-clock"></i> ${top8Events[5].eventDateEnd}</p>
					       </c:if>
					     </div>
					     <!-- 					   開團者  ============ -->
						<div style="margin-top:40px;">
						  <c:if test="${!empty top8Events[3]}">
						   <p class="eventInviter" style="left:90px;">開團人 : ${top8EventInviterNames[3]}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[4]}"> 
						   <p class="eventInviter" style="left:435px;">開團人 :  ${top8EventInviterNames[4]}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[5]}"> 
						   <p class="eventInviter" style="left:780px;">開團人 :  ${top8EventInviterNames[5]}</p>
						  </c:if>
						</div>
<!-- 					     備用 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 三種狀態======= --> 
					      <c:if test="${(top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers) < 5 and top8Events[3].eventMemberLimit != top8Events[3].eventCurrentMembers and !empty top8Events[3]}">
						   <p class="eventStatusUncheck" style="left:90px;">即將成團 尚餘 ${top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers} 個名額</p>  
						  </c:if>
						   <c:if test="${(top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers) > 5 and !empty top8Events[3]}">
						   <p class="eventStatusUncheck" style="left:90px;">開放報名中 尚餘 ${top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers} 個名額</p>  
						  </c:if> 
						  <c:if test="${top8Events[3].eventMemberLimit == top8Events[3].eventCurrentMembers and !empty top8Events[3]}">
						   <p class="eventStatusYes">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers) < 5 and top8Events[4].eventMemberLimit != top8Events[4].eventCurrentMembers and !empty top8Events[4]}">
						   <p class="eventStatusUncheckSe" >即將成團 尚餘 ${top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers) > 5 and !empty top8Events[4]}">
						   <p class="eventStatusUncheckSe" >開放報名中 尚餘 ${top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[4].eventMemberLimit == top8Events[4].eventCurrentMembers and !empty top8Events[4]}">
						   <p class="eventStatusYesSe">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers) < 5 and top8Events[5].eventMemberLimit != top8Events[5].eventCurrentMembers and !empty top8Events[5]}">
						   <p class="eventStatusUncheckTh">即將成團 尚餘 ${top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers) > 5 and !empty top8Events[5]}">
						   <p class="eventStatusUncheckTh">開放報名中 尚餘 ${top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[5].eventMemberLimit == top8Events[5].eventCurrentMembers and !empty top8Events[5]}">
						   <p class="eventStatusYesTh">人數已滿</p>
						  </c:if>  
					     </div>
<!-- 					     人數+讚數 -->
						<c:if test="${!empty top8Events[3]}">
					     <span class="eventLikeNum" style="left:300px;">${top8Events[3].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    <c:if test="${!empty top8Events[4]}"> 
					     <span class="eventLikeNum" style="left:645px;">${top8Events[4].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    <c:if test="${!empty top8Events[5]}">  
					     <span class="eventLikeNum" style="left:990px;">${top8Events[5].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    
					    <c:if test="${!empty top8Events[3]}">
					     <span class="eventCurrentNum" style="left:360px;">${top8Events[3].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					    <c:if test="${!empty top8Events[4]}">
					     <span class="eventCurrentNum" style="left:705px;">${top8Events[4].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					    <c:if test="${!empty top8Events[5]}"> 
					     <span  class="eventCurrentNum" style="left:1050px;">${top8Events[5].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 class="TopEvent">TOP 9 熱門活動</h5>
				   	   </div>
				</div>
					     <!-- 	第三頁			======	       -->
				<div class="carousel-item SecondPage">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						  <c:if test="${!empty top8Events[6]}">
						   <p class="eventFname">7. ${top8Events[6].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[7]}">
						   <p class="eventSname" >8. ${top8Events[7].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[8]}">
						   <p class="eventTname" >9. ${top8Events[8].eventName}</p>
					      </c:if>
					     </div>
					 
					 	<div style="margin-bottom:50px;">
					 	   <c:if test="${empty top8Events[6]}">
						   <p class="noEventFNow">目前尚無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[7]}">
						   <p class="noEventSNow">目前尚無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[8]}">
						   <p class="noEventTNow">目前尚無活動</p>
					       </c:if>	
					     </div>
				 	<c:if test="${!empty top8Events[6]}">  
					  <a href="<c:url value='/event/${top8Events[6].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[6].eventId}.jpg' />" alt="其他"  class="hover imgFirst"></a>
					</c:if>  
				 	<c:if test="${empty top8Events[6]}">   
					  <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[6].eventId}.jpg' />" alt="其他"  class="hover imgFirst"></a>
					</c:if>  
   					<c:if test="${!empty top8Events[7]}">
				      <a href="<c:url value='/event/${top8Events[7].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[7].eventId}.jpg' />"  alt="運動"  class="hover imgSecond"></a>
					</c:if>
   					<c:if test="${empty top8Events[7]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[7].eventId}.jpg' />"  alt="運動"  class="hover imgSecond"></a>
					</c:if>
					<c:if test="${!empty top8Events[8]}">
				      <a href="<c:url value='/event/${top8Events[8].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[8].eventId}.jpg' />" alt="食物"  class="hover imgThird"></a>
					</c:if>
					<c:if test="${empty top8Events[8]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[8].eventId}.jpg' />" alt="食物"  class="hover imgThird"></a>
					</c:if>

<!-- 						時間  -->
						 <div style="margin-top:10px;">
						  <c:if test="${!empty top8Events[6]}">
						   <p class="eventTime" style="left:90px;"><i class="fas fa-clock"></i> ${top8Events[6].eventDateEnd}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[7]}">
						   <p class="eventTime" style="left:435px;"><i class="fas fa-clock"></i> ${top8Events[7].eventDateEnd}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[8]}">
						   <p class="eventTime" style="left:780px;"><i class="fas fa-clock"></i> ${top8Events[8].eventDateEnd}</p>
					      </c:if>
					     </div>
					     <!-- 					   開團者  ============ -->
						<div style="margin-top:40px;">
						  <c:if test="${!empty top8Events[6]}">
						   <p class="eventInviter" style="left:90px;">開團人 : ${top8EventInviterNames[6]}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[7]}"> 
						   <p class="eventInviter" style="left:435px;">開團人 :  ${top8EventInviterNames[7]}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[8]}"> 
						   <p class="eventInviter" style="left:780px;">開團人 :  ${top8EventInviterNames[8]}</p>
						  </c:if>
						</div>
<!-- 					     備用 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 三種狀態======= --> 
					      <c:if test="${(top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers) < 5 and top8Events[6].eventMemberLimit != top8Events[6].eventCurrentMembers and !empty top8Events[6]}">
						   <p class="eventStatusUncheck" style="left:90px;">即將成團 尚餘 ${top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers} 個名額</p>  
						  </c:if>
						   <c:if test="${(top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers) > 5 and !empty top8Events[6]}">
						   <p class="eventStatusUncheck" style="left:90px;">開放報名中 尚餘 ${top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers} 個名額</p>  
						  </c:if> 
						  <c:if test="${top8Events[6].eventMemberLimit == top8Events[6].eventCurrentMembers and !empty top8Events[6]}">
						   <p class="eventStatusYes">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers) < 5 and top8Events[7].eventMemberLimit != top8Events[7].eventCurrentMembers and !empty top8Events[7]}">
						   <p class="eventStatusUncheckSe" style="left:435px;">即將成團 尚餘 ${top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers) > 5 and !empty top8Events[7]}">
						   <p class="eventStatusUncheckSe"  style="left:435px;">開放報名中 尚餘 ${top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[7].eventMemberLimit == top8Events[7].eventCurrentMembers and !empty top8Events[7]}">
						   <p class="eventStatusYesSe">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers) < 5 and top8Events[8].eventMemberLimit != top8Events[8].eventCurrentMembers and !empty top8Events[8]}">
						   <p class="eventStatusUncheckTh" style="left:780px;">即將成團 尚餘 ${top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers) > 5 and !empty top8Events[8]}">
						   <p class="eventStatusUncheckTh" style="left:780px;">開放報名中 尚餘 ${top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[8].eventMemberLimit == top8Events[8].eventCurrentMembers and !empty top8Events[8]}">
						   <p class="eventStatusYesTh">人數已滿</p>
						  </c:if>  
					     </div>
<!-- 					     人數+讚數 -->
						<c:if test="${!empty top8Events[6]}">
					     <span class="eventLikeNum" style="left:300px;">${top8Events[6].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    <c:if test="${!empty top8Events[7]}"> 
					     <span style="left:645px;">${top8Events[7].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    <c:if test="${!empty top8Events[8]}">
					     <span style="left:990px;">${top8Events[8].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    
					    <c:if test="${!empty top8Events[6]}">
					     <span class="eventCurrentNum" style="left:360px;">${top8Events[6].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					    <c:if test="${!empty top8Events[7]}">
					     <span style="left:705px;">${top8Events[7].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					    <c:if test="${!empty top8Events[8]}">
					     <span style="left:1050px;">${top8Events[8].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 class="TopEvent" >TOP 9 熱門活動</h5>
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
	</div>
<!-- 		event	===================== -->
<div style="width:1200px;height:0px;"></div>
<!-- =======group==================================== -->
	<div id="groupDiv" class="bd-example" style="width:1200px; margin:auto;margin-top:30px;">
		<div id="groups" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					     <li data-target="#groups" data-slide-to="0" class="active"></li>
					     <li data-target="#groups" data-slide-to="1"></li>
					     <li data-target="#groups" data-slide-to="2"></li>
					  </ol>
			<div class="carousel-inner" style="background-color:#3F5867;height:500px;border-radius:40px;">
<!-- 	第一頁			======	       -->
				<div class="carousel-item active" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
					 	  <c:if test="${!empty top8Groups[0]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">1. ${top8Groups[0].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[1]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">2. ${top8Groups[1].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[2]}"> 
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">3. ${top8Groups[2].groupName}</p>
					      </c:if>
					     </div>
					     
					     <div style="margin-bottom:50px;">
					      <c:if test="${empty top8Groups[0]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[1]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[2]}"> 
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
					      </c:if>
					     </div>
					 <c:if test="${!empty top8Groups[0]}">
					  <a href="<c:url value='/group/${top8Groups[0].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[0].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[0]}">
					  <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[0].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[1]}">
				      <a href="<c:url value='/group/${top8Groups[1].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[1].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[1]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[1].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[2]}">
				      <a href="<c:url value='/group/${top8Groups[2].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[2].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[2]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[2].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
<!-- =====================開團者 -->
						 <div style="margin-top:10px;">
						  <c:if test="${!empty top8Groups[0]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">創立者 : <span style="color:white">${top8GroupLeaderNames[0]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[1]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:white">${top8GroupLeaderNames[1]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[2]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:white">${top8GroupLeaderNames[2]}</span></p>
					      </c:if>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
<!-- 						 1 -->
						 <c:if test="${top8Groups[0].groupType == 'sport' and !empty top8Groups[0]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[0].groupType == 'entertainment' and !empty top8Groups[0]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[0].groupType == 'food' and !empty top8Groups[0]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[0].groupType == 'other' and !empty top8Groups[0]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[1].groupType == 'sport' and !empty top8Groups[1]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'entertainment' and !empty top8Groups[1]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'food' and !empty top8Groups[1]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'other' and !empty top8Groups[1]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[2].groupType == 'sport' and !empty top8Groups[2]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[2].groupType == 'entertainment' and !empty top8Groups[2]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[2].groupType == 'food' and !empty top8Groups[2]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[2].groupType == 'other' and !empty top8Groups[2]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">其他類</span></p>
					   	  </c:if>   
					   
					    </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						  <c:if test="${!empty top8Groups[0]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[0].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						  </c:if>
<!-- 					     第一頁第二張======= -->
						  <c:if test="${!empty top8Groups[1]}">						  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[1].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  </c:if>
<!-- 					     第一頁第3張======= -->	
						  <c:if test="${!empty top8Groups[2]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[2].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  </c:if>
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h1 style="font-size:30px !important;color:	white;font-famliy:微軟正黑體 !important;font-weight:bold!important;">TOP 9 人氣社團</h1>
				   	   </div>
				</div>
					   <!-- 	第二頁			======	       -->  
				 <div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
					 	  <c:if test="${!empty top8Groups[3]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">4. ${top8Groups[3].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[4]}"> 
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">5. ${top8Groups[4].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[5]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">6. ${top8Groups[5].groupName}</p>
					      </c:if>
					     </div>
					     
					     <div style="margin-bottom:50px;">
					      <c:if test="${empty top8Groups[3]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[4]}"> 
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[5]}"> 
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
					      </c:if>
					     </div>
					 <c:if test="${!empty top8Groups[3]}">
					  <a href="<c:url value='/group/${top8Groups[3].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[3].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[3]}">
					  <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[3].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[4]}">
				      <a href="<c:url value='/group/${top8Groups[4].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[4].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[4]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[4].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[5]}">
				      <a href="<c:url value='/group/${top8Groups[5].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[5].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[5]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[5].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
<!-- =====================開團者 -->
						 <div style="margin-top:10px;">
						  <c:if test="${!empty top8Groups[3]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">創立者 : <span style="color:white">${top8GroupLeaderNames[3]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[4]}"> 
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:white">${top8GroupLeaderNames[4]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[5]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:white">${top8GroupLeaderNames[5]}</span></p>
					      </c:if>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
						   <c:if test="${top8Groups[3].groupType == 'sport' and !empty top8Groups[3]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[3].groupType == 'entertainment' and !empty top8Groups[3]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[3].groupType == 'food' and !empty top8Groups[3]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[3].groupType == 'other' and !empty top8Groups[3]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[4].groupType == 'sport' and !empty top8Groups[4]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'entertainment' and !empty top8Groups[4]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'food' and !empty top8Groups[4]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'other' and !empty top8Groups[4]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[5].groupType == 'sport' and !empty top8Groups[5]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[5].groupType == 'entertainment' and !empty top8Groups[5]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[5].groupType == 'food' and !empty top8Groups[5]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[5].groupType == 'other' and !empty top8Groups[5]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">其他類</span></p>
					   	  </c:if> 
					     </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						   <c:if test="${!empty top8Groups[3]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[3].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						   </c:if>
<!-- 					     第一頁第二張======= -->						  
						   <c:if test="${!empty top8Groups[4]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[4].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						   </c:if>						
<!-- 					     第一頁第3張======= -->	
						   <c:if test="${!empty top8Groups[5]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[5].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						   </c:if>
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:white;font-famliy:微軟正黑體 !important;font-weight:bold!important;">TOP 9 人氣社團</h5>
				   	   </div>
				</div>
					     <!-- 	第三頁			======	       -->
				 <div class="carousel-item" style="width:1200px;height:380px;margin-top:80px;">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
					 	  <c:if test="${!empty top8Groups[6]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;text-align:center;display:inline;width:300px;color:white;">7. ${top8Groups[6].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[7]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;text-align:center;display:inline;width:300px;color:white;">8. ${top8Groups[7].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[8]}"> 
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;text-align:center;display:inline;width:300px;color:white;">9. ${top8Groups[8].groupName}</p>
						  </c:if>					     
					     </div>
					     
					     <div style="margin-bottom:50px;">
					      <c:if test="${empty top8Groups[6]}"> 
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:100px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[7]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:445px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[8]}">
						   <p style="font-size:30px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:790px;bottom:20px;text-align:center;display:inline;width:300px;color:white;">尚無創立社團</p>
					      </c:if>
					     </div>
					 <c:if test="${!empty top8Groups[6]}">
					  <a href="<c:url value='/group/${top8Groups[6].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[6].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[6]}">
					  <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[6].groupId}.jpg' />" alt="其他"  style="margin-left:90px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[7]}">
				      <a href="<c:url value='/group/${top8Groups[7].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[7].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[7]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[7].groupId}.jpg' />"  alt="運動"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[8]}">
				      <a href="<c:url value='/group/${top8Groups[8].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[8].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[8]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[8].groupId}.jpg' />" alt="食物"  style="margin-left:20px;width:320px;height:230px;" class="hover"></a>
					 </c:if>
<!-- =====================開團者 -->
						  <div style="margin-top:10px;">
						   <c:if test="${!empty top8Groups[6]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">創立者 : <span style="color:white">${top8GroupLeaderNames[6]}</span></p>
						   </c:if>
						   <c:if test="${!empty top8Groups[7]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:white">${top8GroupLeaderNames[7]}</span></p>
						   </c:if>
						   <c:if test="${!empty top8Groups[8]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">創立者 : <span style="color:white">${top8GroupLeaderNames[8]}</span></p>
					       </c:if>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
						   <c:if test="${top8Groups[6].groupType == 'sport' and !empty top8Groups[6]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[6].groupType == 'entertainment' and !empty top8Groups[6]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[6].groupType == 'food' and !empty top8Groups[6]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[6].groupType == 'other' and !empty top8Groups[6]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[7].groupType == 'sport' and !empty top8Groups[7]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'entertainment' and !empty top8Groups[7]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'food' and !empty top8Groups[7]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'other' and !empty top8Groups[7]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;">社團類型 : <span style="color:white">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[8].groupType == 'sport' and !empty top8Groups[8]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[8].groupType == 'entertainment' and !empty top8Groups[8]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[8].groupType == 'food' and !empty top8Groups[8]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[8].groupType == 'other' and !empty top8Groups[8]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:	white;">社團類型 : <span style="color:white">其他類</span></p>
					   	  </c:if> 
					     </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						   <c:if test="${!empty top8Groups[6]}">
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:90px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[6].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						   </c:if>
<!-- 					     第一頁第二張======= -->	
						   <c:if test="${!empty top8Groups[7]}">					  
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:435px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[7].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						   </c:if>
<!-- 					     第一頁第3張======= -->
						   <c:if test="${!empty top8Groups[8]}">	
						   <p style="font-size:20px;font-weight:1200px;font-family:微軟正黑體;position:absolute;left:780px;text-align:left;display:inline;width:300px;color:white;"> 目前團員  :  <span style="color:white;">${top8Groups[8].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						   </c:if>
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 style="font-size:30px !important;color:white;font-famliy:微軟正黑體 !important;font-weight:bold!important;">TOP 9 人氣社團</h5>
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
			</div>
<!-- 		group	=========== -->
<!-- 			<footer style="margin-left:0px;margin-top:30px;border:solid black 1px;height:150px;background-color:#4F4F4F;"> -->
<!-- 				<p style="margin:auto;text-align:center;">聯絡方式<span></span><span></span></p> -->
<!-- 			    <p style="width:500px;height:20px;text-align:center;"><span style="text-align:center;display:inline;"> e-mail: EEIT10506@gmail.com</span></p> -->
<!-- 			    <p style="width:500px;height:20px;text-align:center;"><span style="text-align:center;display:inline;"> e-mail: EEIT10506@gmail.com</span></p> -->
			    
<!-- 			    <p style="width:500px;height:20px;text-align:center;"><span style="text-align:left;"> Phone : 02-2193-6666</span></p> -->
			   
<!-- 			</footer>	 -->
		
</div>
 <jsp:include page="${request.contextPath}/footerbar"/>
<!-- 請把所有內容寫在此div內 -->
	

</body>
</html>