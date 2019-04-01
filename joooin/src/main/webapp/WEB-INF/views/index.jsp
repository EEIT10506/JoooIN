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
		 background-color:#F5F5F5;
		 width:1200px;
		 height:400px;
		 margin:auto;
	}
	.titleContent{
		 font-size:40px;
		 text-align:center;
/* 		 background-color:#38B0AE; */
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
	.buttonE,.buttonG{
		 font-size:22px;
		 text-align:center;
	  	 width:600px;
	     height:100px; 
	  	 float:left;
	  	 background-color:#E6E6E6;
	}
	.floatLeft{
		 float:left;
		 border-right:solid 1px #9C9C9C;
	}
	.floatRight{
		 float:right;
	}
	.buttonE:hover{
	     background-color:#CCCCCC;
	       cursor:pointer;
	       font-size:25px;
	}
	.spanE{ 
		 position:relative;
		 top:34px;		
	}
	.buttonG:hover{
	     background-color:#CCCCCC;
	     cursor:pointer;
	     font-size:25px;
	}
	.actives{
		 background-color:#94CFD1 !important;
	}
	.spanG{
	    position:relative;
		top:34px;	
	}
	.iconsG{
		position:relative;
		top:3px;
		font-size:27px;
		color:	#00008B;	
	}
	.iconsE{
		position:relative;
		top:3px;
		font-size:27px; 
		color:Red;	
	}
	.firstCarousel{
		width:1200px;
		margin:auto;
		margin-top: 30px;
	}
	.radiusCarousel{
/*  		opacity:0.8;   */
/*  		background-color:#005B61;  */
/*   		background-color:#FFF5EE;   */
/*跟活動依樣 		background-color:#FFEDCB; */
/* 		background-color:#00BFFF ; */
		background-color:#5F999B;
		height:500px;
		border-radius:40px;
		border:3px solid black;
	}
	.insideCarousel{
		width:1200px;
		height:380px;
		margin-top:80px;
	}
	.eventFname{
		font-size:24px;
		font-weight:1200px;
		font-family:微軟正黑體;
		position:absolute;
		text-align:center;
		display:inline;
		width:300px;
		color:white;
	}
	.nameF{
		left:100px;
	}
	.nameS{
		left:445px;
	}
	.nameT{
		left:790px;
	}
	.noEventFNow{
		font-size:24px;
		font-weight:1200px;
		font-family:微軟正黑體;
		position:absolute;
		bottom:20px;
		text-align:center;
		display:inline;
		width:300px;
		color:white;
	}
	.imgg{
		width:320px;
		height:230px;
	}
	.imgFirst{
		margin-left:90px;
	}
	.imgSecond{
		margin-left:20px;
	}
	.imgThird{
		margin-left:20px;
	}
	.eventTime{
		font-size:15px;
		font-weight:1200px;
		font-family:微軟正黑體;
		position:absolute;
		top:285px;
		text-align:left;
		display:inline;
		width:300px;
		color:black;
	}
	.eventInviter{
		font-size:18px;
		font-weight:1200px;
		font-family:微軟正黑體;
		position:absolute;
		text-align:left;
		display:inline;
		width:300px;
		color:white;
	}
	.eventStatusAll{
		font-size:18px; 
		font-weight:1200px;
		font-family:微軟正黑體;
		position:absolute;
		display:inline;
		color:white;
	}
	.eventStatusUncheck{
		left:90px;
		text-align:left;
		width:300px;
	}
	.eventStatusYes{
		left:90px;
		text-align:center;
		width:85px;
		border-radius:10px;
		color:white;
		background-color:red;
	}
	.eventStatusUncheckSe{
		left:435px;
		text-align:left;
		width:300px;
	}
	.eventStatusYesSe{
		left:435px;
		text-align:left;
		width:85px;
		border-radius:10px;
		background-color:red;
	}
	.eventStatusUncheckTh{
		left:780px;
		text-align:left;
		width:300px;
	}
	.eventStatusYesTh{
		left:780px;
		text-align:left;
		width:85px;
		border-radius:10px;
		background-color:red;
	}
	.eventLikeNum,.eventCurrentNum{
		position:absolute;
		top:281px;
		font-size:20px;
		font-family:微軟正黑體;
		color:black;
	}
	.TopEvent{
		font-size:30px !important;
		color:white;
		font-famliy:微軟正黑體 !important;
		font-weight:bold!important;
	}
	.groupType{
		font-size:18px; 
		font-weight:1200px;
		font-family:微軟正黑體;
		position:absolute;
		text-align:left;
		display:inline;
		width:300px;
		color:white;
	}
	.white{
		color:white;
	}
	.leftAndRight{
		background-color:#363636;
		width:40px;
		height:150px;
		margin-top:175px;
	}
</style>
<script>
	$(document).ready(function(){
		$(".buttonE").click();
		$(".buttonE").addClass("actives");
		$(".spanE").css("font-size","25px");
		$("#groupDiv").hide();
		
		$(".buttonE").click(function(){
			$("#eventDiv").fadeIn(500);
			$("#groupDiv").fadeOut(500);
			$(".buttonE").addClass("actives");
			$(".buttonG").removeClass("actives");
			$(".spanE").css("font-size","25px");
			$(".spanG").css("font-size","22px");
		});
		$(".buttonG").click(function(){
			$("#groupDiv").fadeIn(500);
			$("#eventDiv").fadeOut(500);
			$(".buttonG").addClass("actives");
			$(".buttonE").removeClass("actives");
			$(".spanG").css("font-size","25px");
			$(".spanE").css("font-size","22px");
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
			<div class="font titleContent" style="width:1200px;height:100px;"> </div >
		</div>	
 		<div class="titles">
			<p class="buttonE floatLeft">
			<span class="font spanE" id="findEvents"><i class="fas fa-flag iconsE"></i> 熱門活動 </span>
			</p>
			<p class="buttonG floatRight"> 
			<span class="font spanG" id="findGroups"><i class="fas fa-globe-americas iconsG"></i> 人氣社團</span>
			</p> 
		</div> 
	
			
<!-- 	event		===================== -->
<!-- ================================= -->
	<div  id="eventDiv" class="bd-example firstCarousel">
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
						    <p class="eventFname nameF" style="">1. ${top8Events[0].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[1]}">
						    <p class="eventFname nameS" style="">2. ${top8Events[1].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[2]}"> 
						    <p class="eventFname nameT" style=" ">3. ${top8Events[2].eventName}</p>
					      </c:if>
					     </div>
					     
					     <div style="">
					 	   <c:if test="${empty top8Events[0]}">
						   <p class="noEventFNow nameF" style="">目前暫無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[1]}">
						   <p class="noEventFNow nameS" style="">目前暫無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[2]}">
						   <p class="noEventFNow nameT" style="">目前暫無活動</p>
					       </c:if>	
					     </div>
					 <c:if test="${!empty top8Events[0]}">    
					  <a href="<c:url value='/event/${top8Events[0].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[0].eventId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Events[0]}">    
					  <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[0].eventId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Events[1]}">
				      <a href="<c:url value='/event/${top8Events[1].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[1].eventId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Events[1]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[1].eventId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Events[2]}">
				      <a href="<c:url value='/event/${top8Events[2].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[2].eventId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
					  <c:if test="${empty top8Events[2]}"> 
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[2].eventId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
<!-- 						時間  -->
						 <div style="margin-top:10px;">
						 <c:if test="${!empty top8Events[0]}">
						   <p class="eventTime" style="left:90px;"><i class="fas fa-clock"></i> ${top8Events[0].eventDateEnd} End</p>
						 </c:if>
						 <c:if test="${!empty top8Events[1]}">  
						   <p class="eventTime" style="left:435px;"><i class="fas fa-clock"></i> ${top8Events[1].eventDateEnd} End</p>
						 </c:if>
						 <c:if test="${!empty top8Events[2]}">  
						   <p class="eventTime" style="left:780px;"><i class="fas fa-clock"></i> ${top8Events[2].eventDateEnd} End</p>
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
					      <c:if test="${(top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers) <= 5 and top8Events[0].eventMemberLimit != top8Events[0].eventCurrentMembers and !empty top8Events[0]}">
						   <p class="eventStatusUncheck eventStatusAll">即將成團 尚餘 ${top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers} 個名額</p>  
						  </c:if>
						   <c:if test="${(top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers) > 5 and !empty top8Events[0]}">
						   <p class="eventStatusUncheck eventStatusAll">開放報名中 尚餘 ${top8Events[0].eventMemberLimit-top8Events[0].eventCurrentMembers} 個名額</p>  
						  </c:if> 
						  <c:if test="${top8Events[0].eventMemberLimit == top8Events[0].eventCurrentMembers and !empty top8Events[0]}">
						   <p class="eventStatusYes eventStatusAll">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers) <= 5 and top8Events[1].eventMemberLimit != top8Events[1].eventCurrentMembers and !empty top8Events[1]}">
						   <p class="eventStatusUncheckSe eventStatusAll">即將成團 尚餘 ${top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers) > 5 and !empty top8Events[1]}">
						   <p class="eventStatusUncheckSe eventStatusAll">開放報名中 尚餘 ${top8Events[1].eventMemberLimit-top8Events[1].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[1].eventMemberLimit == top8Events[1].eventCurrentMembers and !empty top8Events[1]}">
						   <p class="eventStatusYesSe eventStatusAll">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers) <= 5 and top8Events[2].eventMemberLimit != top8Events[2].eventCurrentMembers and !empty top8Events[2]}">
						   <p class="eventStatusUncheckTh eventStatusAll">即將成團 尚餘 ${top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers) > 5 and !empty top8Events[2]}">
						   <p class="eventStatusUncheckTh eventStatusAll">開放報名中 尚餘 ${top8Events[2].eventMemberLimit-top8Events[2].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[2].eventMemberLimit == top8Events[2].eventCurrentMembers and !empty top8Events[2]}">
						   <p class="eventStatusYesTh eventStatusAll">人數已滿</p>
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
						   	<h5 class="TopEvent">TOP 9 熱門活動</h5>
				   	   </div>
				</div>
					   <!-- 	第二頁			======	       -->  
				 <div class="carousel-item insideCarousel">
<!-- 					   名稱 -->
						<div style="margin-bottom:50px;">
						  <c:if test="${!empty top8Events[3]}">
						   <p class="eventFname nameF">4. ${top8Events[3].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[4]}"> 
						   <p class="eventFname nameS">5. ${top8Events[4].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[5]}">
						   <p class="eventFname nameT">6. ${top8Events[5].eventName}</p>
					      </c:if>	
					     </div>
<!-- ================= 沒團時顯示===================== -->
						
					 	 <div style="margin-bottom:50px;">
					 	   <c:if test="${empty top8Events[3]}">
						   <p class="noEventFNow nameF">目前暫無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[4]}">
						   <p class="noEventFNow nameS" >目前暫無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[5]}">
						   <p class="noEventFNow nameT">目前暫無活動</p>
					       </c:if>	
					     </div>
					 <c:if test="${!empty top8Events[3]}">
					  <a href="<c:url value='/event/${top8Events[3].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[3].eventId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if> 
					 <c:if test="${empty top8Events[3]}">
					  <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[3].eventId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if> 
					 <c:if test="${!empty top8Events[4]}">
				      <a href="<c:url value='/event/${top8Events[4].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[4].eventId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Events[4]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[4].eventId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Events[5]}">
				      <a href="<c:url value='/event/${top8Events[5].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[5].eventId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Events[5]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[5].eventId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
<!-- 						時間  -->
						 <div style="margin-top:10px;">
						   <c:if test="${!empty top8Events[3]}">
						   <p class="eventTime" style="left:90px;"><i class="fas fa-clock"></i> ${top8Events[3].eventDateEnd} End</p>
						   </c:if>
						   <c:if test="${!empty top8Events[4]}">
						   <p class="eventTime" style="left:435px;"><i class="fas fa-clock"></i> ${top8Events[4].eventDateEnd} End</p>
						   </c:if>
						   <c:if test="${!empty top8Events[5]}">
						   <p class="eventTime" style="left:780px;"><i class="fas fa-clock"></i> ${top8Events[5].eventDateEnd} End</p>
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
					      <c:if test="${(top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers) <= 5 and top8Events[3].eventMemberLimit != top8Events[3].eventCurrentMembers and !empty top8Events[3]}">
						   <p class="eventStatusUncheck eventStatusAll" style="left:90px;">即將成團 尚餘 ${top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers} 個名額</p>  
						  </c:if>
						   <c:if test="${(top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers) > 5 and !empty top8Events[3]}">
						   <p class="eventStatusUncheck eventStatusAll" style="left:90px;">開放報名中 尚餘 ${top8Events[3].eventMemberLimit-top8Events[3].eventCurrentMembers} 個名額</p>  
						  </c:if> 
						  <c:if test="${top8Events[3].eventMemberLimit == top8Events[3].eventCurrentMembers and !empty top8Events[3]}">
						   <p class="eventStatusYes eventStatusAll">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers) <= 5 and top8Events[4].eventMemberLimit != top8Events[4].eventCurrentMembers and !empty top8Events[4]}">
						   <p class="eventStatusUncheckSe eventStatusAll" >即將成團 尚餘 ${top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers) > 5 and !empty top8Events[4]}">
						   <p class="eventStatusUncheckSe eventStatusAll" >開放報名中 尚餘 ${top8Events[4].eventMemberLimit-top8Events[4].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[4].eventMemberLimit == top8Events[4].eventCurrentMembers and !empty top8Events[4]}">
						   <p class="eventStatusYesSe eventStatusAll">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers) <= 5 and top8Events[5].eventMemberLimit != top8Events[5].eventCurrentMembers and !empty top8Events[5]}">
						   <p class="eventStatusUncheckTh eventStatusAll">即將成團 尚餘 ${top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers) > 5 and !empty top8Events[5]}">
						   <p class="eventStatusUncheckTh eventStatusAll">開放報名中 尚餘 ${top8Events[5].eventMemberLimit-top8Events[5].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[5].eventMemberLimit == top8Events[5].eventCurrentMembers and !empty top8Events[5]}">
						   <p class="eventStatusYesTh eventStatusAll">人數已滿</p>
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
				<div class="carousel-item insideCarousel">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
						  <c:if test="${!empty top8Events[6]}">
						   <p class="eventFname nameF">7. ${top8Events[6].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[7]}">
						   <p class="eventFname nameS" >8. ${top8Events[7].eventName}</p>
						  </c:if>
						  <c:if test="${!empty top8Events[8]}">
						   <p class="eventFname nameT" >9. ${top8Events[8].eventName}</p>
					      </c:if>
					     </div>
					 
					 	<div style="margin-bottom:50px;">
					 	   <c:if test="${empty top8Events[6]}">
						   <p class="noEventFNow nameF">目前尚無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[7]}">
						   <p class="noEventFNow nameS">目前尚無活動</p>
						   </c:if>
						   <c:if test="${empty top8Events[8]}">
						   <p class="noEventFNow nameT">目前尚無活動</p>
					       </c:if>	
					     </div>
				 	<c:if test="${!empty top8Events[6]}">  
					  <a href="<c:url value='/event/${top8Events[6].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[6].eventId}.jpg' />" class="hover imgFirst imgg"></a>
					</c:if>  
				 	<c:if test="${empty top8Events[6]}">   
					  <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[6].eventId}.jpg' />" class="hover imgFirst imgg"></a>
					</c:if>  
   					<c:if test="${!empty top8Events[7]}">
				      <a href="<c:url value='/event/${top8Events[7].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[7].eventId}.jpg' />" class="hover imgSecond imgg"></a>
					</c:if>
   					<c:if test="${empty top8Events[7]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[7].eventId}.jpg' />" class="hover imgSecond imgg"></a>
					</c:if>
					<c:if test="${!empty top8Events[8]}">
				      <a href="<c:url value='/event/${top8Events[8].eventId}' />"><img src="<c:url value='/getEventImage/${top8Events[8].eventId}.jpg' />" class="hover imgThird imgg"></a>
					</c:if>
					<c:if test="${empty top8Events[8]}">
				      <a href="<c:url value='/events' />"><img src="<c:url value='/getEventImage/${top8Events[8].eventId}.jpg' />" class="hover imgThird imgg"></a>
					</c:if>

<!-- 						時間  -->
						 <div style="margin-top:10px;">
						  <c:if test="${!empty top8Events[6]}">
						   <p class="eventTime" style="left:90px;"><i class="fas fa-clock"></i> ${top8Events[6].eventDateEnd} End</p>
						  </c:if>
						  <c:if test="${!empty top8Events[7]}">
						   <p class="eventTime" style="left:435px;"><i class="fas fa-clock"></i> ${top8Events[7].eventDateEnd} End</p>
						  </c:if>
						  <c:if test="${!empty top8Events[8]}">
						   <p class="eventTime" style="left:780px;"><i class="fas fa-clock"></i> ${top8Events[8].eventDateEnd} End</p>
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
					      <c:if test="${(top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers) <= 5 and top8Events[6].eventMemberLimit != top8Events[6].eventCurrentMembers and !empty top8Events[6]}">
						   <p class="eventStatusUncheck eventStatusAll" style="left:90px;">即將成團 尚餘 ${top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers} 個名額</p>  
						  </c:if>
						   <c:if test="${(top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers) > 5 and !empty top8Events[6]}">
						   <p class="eventStatusUncheck eventStatusAll" style="left:90px;">開放報名中 尚餘 ${top8Events[6].eventMemberLimit-top8Events[6].eventCurrentMembers} 個名額</p>  
						  </c:if> 
						  <c:if test="${top8Events[6].eventMemberLimit == top8Events[6].eventCurrentMembers and !empty top8Events[6]}">
						   <p class="eventStatusYes eventStatusAll">人數已滿</p>  
						  </c:if>
<!-- 					     第一頁第二張 三種狀態======= -->						  
						  <c:if test="${(top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers) <= 5 and top8Events[7].eventMemberLimit != top8Events[7].eventCurrentMembers and !empty top8Events[7]}">
						   <p class="eventStatusUncheckSe eventStatusAll" style="left:435px;">即將成團 尚餘 ${top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers) > 5 and !empty top8Events[7]}">
						   <p class="eventStatusUncheckSe eventStatusAll"  style="left:435px;">開放報名中 尚餘 ${top8Events[7].eventMemberLimit-top8Events[7].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[7].eventMemberLimit == top8Events[7].eventCurrentMembers and !empty top8Events[7]}">
						   <p class="eventStatusYesSe eventStatusAll">人數已滿</p>
						  </c:if> 
						   
<!-- 					     第一頁第3張 三種狀態======= -->	
						   <c:if test="${(top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers) <= 5 and top8Events[8].eventMemberLimit != top8Events[8].eventCurrentMembers and !empty top8Events[8]}">
						   <p class="eventStatusUncheckTh eventStatusAll" style="left:780px;">即將成團 尚餘 ${top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers} 個名額</p>
						  </c:if> 
						  <c:if test="${(top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers) > 5 and !empty top8Events[8]}">
						   <p class="eventStatusUncheckTh eventStatusAll" style="left:780px;">開放報名中 尚餘 ${top8Events[8].eventMemberLimit-top8Events[8].eventCurrentMembers} 個名額</p>
						  </c:if>
						  <c:if test="${top8Events[8].eventMemberLimit == top8Events[8].eventCurrentMembers and !empty top8Events[8]}">
						   <p class="eventStatusYesTh eventStatusAll">人數已滿</p>
						  </c:if>  
					     </div>
<!-- 					     人數+讚數 -->
						<c:if test="${!empty top8Events[6]}">
					     <span class="eventLikeNum" style="left:300px;">${top8Events[6].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    <c:if test="${!empty top8Events[7]}"> 
					     <span class="eventLikeNum" style="left:645px;">${top8Events[7].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    <c:if test="${!empty top8Events[8]}">
					     <span class="eventLikeNum" style="left:990px;">${top8Events[8].eventCurrentMembers} <i class="fas fa-user-check"></i> </span>
					    </c:if>
					    
					    <c:if test="${!empty top8Events[6]}">
					     <span class="eventCurrentNum" style="left:360px;">${top8Events[6].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					    <c:if test="${!empty top8Events[7]}">
					     <span class="eventCurrentNum" style="left:705px;">${top8Events[7].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					    <c:if test="${!empty top8Events[8]}">
					     <span class="eventCurrentNum" style="left:1050px;">${top8Events[8].eventLike} <i class="far fa-thumbs-up"></i></span>
					    </c:if>
					     
					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h5 class="TopEvent" >TOP 9 熱門活動</h5>
				   	   </div>
				</div>
<!-- x		next prev			   =============== -->
					 <a class="carousel-control-prev leftAndRight" href="#carouselExampleCaptions" role="button" data-slide="prev" style="width:40px;">
				      	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				        <span class="sr-only">Previous</span>
				   	 </a>
				     <a class="carousel-control-next leftAndRight" href="#carouselExampleCaptions" role="button" data-slide="next" style="width:40px;">
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
	<div id="groupDiv" class="bd-example firstCarousel">
		<div id="groups" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					     <li data-target="#groups" data-slide-to="0" class="active"></li>
					     <li data-target="#groups" data-slide-to="1"></li>
					     <li data-target="#groups" data-slide-to="2"></li>
					  </ol>
			<div class="carousel-inner radiusCarousel">
<!-- 	第一頁			======	       -->
				<div class="carousel-item active insideCarousel">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
					 	  <c:if test="${!empty top8Groups[0]}">
						   <p class="eventFname nameF">1. ${top8Groups[0].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[1]}">
						   <p class="eventFname nameS">2. ${top8Groups[1].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[2]}"> 
						   <p class="eventFname nameT">3. ${top8Groups[2].groupName}</p>
					      </c:if>
					     </div>
					     
					     <div style="margin-bottom:50px;">
					      <c:if test="${empty top8Groups[0]}">
						   <p class="noEventFNow nameF">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[1]}">
						   <p class="noEventFNow nameS">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[2]}"> 
						   <p class="noEventFNow nameT">尚無創立社團</p>
					      </c:if>
					     </div>
					 <c:if test="${!empty top8Groups[0]}">
					  <a href="<c:url value='/group/${top8Groups[0].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[0].groupId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[0]}">
					  <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[0].groupId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[1]}">
				      <a href="<c:url value='/group/${top8Groups[1].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[1].groupId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[1]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[1].groupId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[2]}">
				      <a href="<c:url value='/group/${top8Groups[2].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[2].groupId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[2]}">
				      <a href="<c:url value='/groups' />"><img style="color:black;" src="<c:url value='/getGroupImage/${top8Groups[2].groupId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
<!-- =====================開團者 -->
						 <div style="margin-top:10px;">
						  <c:if test="${!empty top8Groups[0]}">
						   <p class="eventInviter" style="left:90px;">創立者 : <span class="white">${top8GroupLeaderNames[0]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[1]}">
						   <p class="eventInviter" style="left:435px;">創立者 : <span class="white">${top8GroupLeaderNames[1]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[2]}">
						   <p class="eventInviter" style="left:780px;">創立者 : <span class="white">${top8GroupLeaderNames[2]}</span></p>
					      </c:if>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
<!-- 						 1 -->
						 <c:if test="${top8Groups[0].groupType == 'sport' and !empty top8Groups[0]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[0].groupType == 'entertainment' and !empty top8Groups[0]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[0].groupType == 'food' and !empty top8Groups[0]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[0].groupType == 'other' and !empty top8Groups[0]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[1].groupType == 'sport' and !empty top8Groups[1]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'entertainment' and !empty top8Groups[1]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'food' and !empty top8Groups[1]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[1].groupType == 'other' and !empty top8Groups[1]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[2].groupType == 'sport' and !empty top8Groups[2]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[2].groupType == 'entertainment' and !empty top8Groups[2]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[2].groupType == 'food' and !empty top8Groups[2]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[2].groupType == 'other' and !empty top8Groups[2]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">其他類</span></p>
					   	  </c:if>   
					   
					    </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						  <c:if test="${!empty top8Groups[0]}">
						   <p class="groupType" style="left:90px;"> 目前團員  :  <span class="white">${top8Groups[0].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						  </c:if>
<!-- 					     第一頁第二張======= -->
						  <c:if test="${!empty top8Groups[1]}">						  
						   <p class="groupType" style="left:435px;"> 目前團員  :  <span class="white">${top8Groups[1].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  </c:if>
<!-- 					     第一頁第3張======= -->	
						  <c:if test="${!empty top8Groups[2]}">
						   <p class="groupType" style="left:780px;"> 目前團員  :  <span class="white">${top8Groups[2].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  </c:if>
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h1 class="TopEvent">TOP 9 人氣社團</h1>
				   	   </div>
				</div>
					   <!-- 	第二頁			======	       -->  
	<div class="carousel-item insideCarousel">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
					 	  <c:if test="${!empty top8Groups[3]}">
						   <p class="eventFname nameF">4. ${top8Groups[3].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[4]}">
						   <p class="eventFname nameS">5. ${top8Groups[4].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[5]}"> 
						   <p class="eventFname nameT">6. ${top8Groups[5].groupName}</p>
					      </c:if>
					     </div>
					     
					     <div style="margin-bottom:50px;">
					      <c:if test="${empty top8Groups[3]}">
						   <p class="noEventFNow nameF">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[4]}">
						   <p class="noEventFNow nameS">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[5]}"> 
						   <p class="noEventFNow nameT">尚無創立社團</p>
					      </c:if>
					     </div>
					 <c:if test="${!empty top8Groups[3]}">
					  <a href="<c:url value='/group/${top8Groups[3].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[3].groupId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[3]}">
					  <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[3].groupId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[4]}">
				      <a href="<c:url value='/group/${top8Groups[4].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[4].groupId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[4]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[4].groupId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[5]}">
				      <a href="<c:url value='/group/${top8Groups[5].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[5].groupId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[5]}">
				      <a href="<c:url value='/groups' />"><img style="color:black;" src="<c:url value='/getGroupImage/${top8Groups[5].groupId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
<!-- =====================開團者 -->
						 <div style="margin-top:10px;">
						  <c:if test="${!empty top8Groups[3]}">
						   <p class="eventInviter" style="left:90px;">創立者 : <span class="white">${top8GroupLeaderNames[3]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[4]}">
						   <p class="eventInviter" style="left:435px;">創立者 : <span class="white">${top8GroupLeaderNames[4]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[5]}">
						   <p class="eventInviter" style="left:780px;">創立者 : <span class="white">${top8GroupLeaderNames[5]}</span></p>
					      </c:if>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
<!-- 						 1 -->
						 <c:if test="${top8Groups[3].groupType == 'sport' and !empty top8Groups[3]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[3].groupType == 'entertainment' and !empty top8Groups[3]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[3].groupType == 'food' and !empty top8Groups[3]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[3].groupType == 'other' and !empty top8Groups[3]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[4].groupType == 'sport' and !empty top8Groups[4]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'entertainment' and !empty top8Groups[4]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'food' and !empty top8Groups[4]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[4].groupType == 'other' and !empty top8Groups[4]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[5].groupType == 'sport' and !empty top8Groups[5]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[5].groupType == 'entertainment' and !empty top8Groups[5]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[5].groupType == 'food' and !empty top8Groups[5]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[5].groupType == 'other' and !empty top8Groups[5]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">其他類</span></p>
					   	  </c:if>   
					   
					    </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						  <c:if test="${!empty top8Groups[3]}">
						   <p class="groupType" style="left:90px;"> 目前團員  :  <span class="white">${top8Groups[3].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						  </c:if>
<!-- 					     第一頁第二張======= -->
						  <c:if test="${!empty top8Groups[4]}">						  
						   <p class="groupType" style="left:435px;"> 目前團員  :  <span class="white">${top8Groups[4].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  </c:if>
<!-- 					     第一頁第3張======= -->	
						  <c:if test="${!empty top8Groups[5]}">
						   <p class="groupType" style="left:780px;"> 目前團員  :  <span class="white">${top8Groups[5].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  </c:if>
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h1 class="TopEvent">TOP 9 人氣社團</h1>
				   	   </div>
				</div>
					     <!-- 	第三頁			======	       -->
	<div class="carousel-item insideCarousel">
<!-- 					   名稱 -->
					 	 <div style="margin-bottom:50px;">
					 	  <c:if test="${!empty top8Groups[6]}">
						   <p class="eventFname nameF">7. ${top8Groups[6].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[7]}">
						   <p class="eventFname nameS">8. ${top8Groups[7].groupName}</p>
						  </c:if>
						  <c:if test="${!empty top8Groups[8]}"> 
						   <p class="eventFname nameT">9. ${top8Groups[8].groupName}</p>
					      </c:if>
					     </div>
					     
					     <div style="margin-bottom:50px;">
					      <c:if test="${empty top8Groups[6]}">
						   <p class="noEventFNow nameF">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[7]}">
						   <p class="noEventFNow nameS">尚無創立社團</p>
						  </c:if>
						  <c:if test="${empty top8Groups[8]}"> 
						   <p class="noEventFNow nameT">尚無創立社團</p>
					      </c:if>
					     </div>
					 <c:if test="${!empty top8Groups[6]}">
					  <a href="<c:url value='/group/${top8Groups[6].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[6].groupId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[6]}">
					  <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[6].groupId}.jpg' />" class="hover imgFirst imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[7]}">
				      <a href="<c:url value='/group/${top8Groups[7].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[7].groupId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[7]}">
				      <a href="<c:url value='/groups' />"><img src="<c:url value='/getGroupImage/${top8Groups[7].groupId}.jpg' />" class="hover imgSecond imgg"></a>
					 </c:if>
					 <c:if test="${!empty top8Groups[8]}">
				      <a href="<c:url value='/group/${top8Groups[8].groupId}' />"><img src="<c:url value='/getGroupImage/${top8Groups[8].groupId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
					 <c:if test="${empty top8Groups[8]}">
				      <a href="<c:url value='/groups' />"><img style="color:black;" src="<c:url value='/getGroupImage/${top8Groups[8].groupId}.jpg' />" class="hover imgThird imgg"></a>
					 </c:if>
<!-- =====================開團者 -->
						 <div style="margin-top:10px;">
						  <c:if test="${!empty top8Groups[6]}">
						   <p class="eventInviter" style="left:90px;">創立者 : <span class="white">${top8GroupLeaderNames[6]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[7]}">
						   <p class="eventInviter" style="left:435px;">創立者 : <span class="white">${top8GroupLeaderNames[7]}</span></p>
						  </c:if>
						  <c:if test="${!empty top8Groups[8]}">
						   <p class="eventInviter" style="left:780px;">創立者 : <span class="white">${top8GroupLeaderNames[8]}</span></p>
					      </c:if>
					     </div>
<!-- 						社團種類  -->
						 <div style="margin-top:40px;">
<!-- 						 1 -->
						 <c:if test="${top8Groups[6].groupType == 'sport' and !empty top8Groups[6]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">運動類</span></p>
						 </c:if>
						 <c:if test="${top8Groups[6].groupType == 'entertainment' and !empty top8Groups[6]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">娛樂類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[6].groupType == 'food' and !empty top8Groups[6]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">美食類</span></p>
						 </c:if> 
						 <c:if test="${top8Groups[6].groupType == 'other' and !empty top8Groups[6]}">
						   <p class="groupType" style="left:90px;">社團類型 : <span class="white">其他類</span></p>
						 </c:if>
<!-- 						 2 -->
						 <c:if test="${top8Groups[7].groupType == 'sport' and !empty top8Groups[7]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">運動類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'entertainment' and !empty top8Groups[7]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">娛樂類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'food' and !empty top8Groups[7]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">美食類</span></p>
						 </c:if>  
						 <c:if test="${top8Groups[7].groupType == 'other' and !empty top8Groups[7]}">
						   <p class="groupType" style="left:435px;">社團類型 : <span class="white">其他類</span></p>
						 </c:if>    
<!-- 						 3 -->
						  <c:if test="${top8Groups[8].groupType == 'sport' and !empty top8Groups[8]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">運動類</span></p>
					   	  </c:if>
					   	   <c:if test="${top8Groups[8].groupType == 'entertainment' and !empty top8Groups[8]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">娛樂類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[8].groupType == 'food' and !empty top8Groups[8]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">美食類</span></p>
					   	  </c:if> 
					   	   <c:if test="${top8Groups[8].groupType == 'other' and !empty top8Groups[8]}">
						   <p class="groupType" style="left:780px;">社團類型 : <span class="white">其他類</span></p>
					   	  </c:if>   
					   
					    </div>
<!-- 					     社團目前人數 -->
					      <div style="margin-top:70px;">
<!-- 					     第一頁第一張 ======= --> 
						  <c:if test="${!empty top8Groups[6]}">
						   <p class="groupType" style="left:90px;"> 目前團員  :  <span class="white">${top8Groups[6].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>  
						  </c:if>
<!-- 					     第一頁第二張======= -->
						  <c:if test="${!empty top8Groups[7]}">						  
						   <p class="groupType" style="left:435px;"> 目前團員  :  <span class="white">${top8Groups[7].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  </c:if>
<!-- 					     第一頁第3張======= -->	
						  <c:if test="${!empty top8Groups[8]}">
						   <p class="groupType" style="left:780px;"> 目前團員  :  <span class="white">${top8Groups[8].groupCurrentMembers}</span> <i class="fas fa-users" style="color:black;"></i></p>
						  </c:if>
					     </div>

					   <div class="carousel-caption d-none d-block" style="bottom:370px;">
						   	<h1 class="TopEvent">TOP 9 人氣社團</h1>
				   	   </div>
				</div>
<!-- 			====================NEXT PREV 		    -->
					 <a class="carousel-control-prev leftAndRight" href="#groups" role="button" data-slide="prev" style="width:40px;">
				      	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				        <span class="sr-only">Previous</span>
				   	 </a>
				     <a class="carousel-control-next leftAndRight" href="#groups" role="button" data-slide="next"  style="width:40px;">
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