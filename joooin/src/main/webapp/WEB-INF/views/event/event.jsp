<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 自己加的字體-->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- 自己加的 -->
<link rel='stylesheet' href='<c:url value="/resources/css/event.css"/>'  type="text/css" />
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script> -->

<style>
/* 自己家的 */

/* 自己家的 */
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
	
	.a{
   		 text-decoration:none !important;
   		 color:black:
	}
	.font{
	    font-family:微軟正黑體;
	    font-weight:bold;
	}
	.body{
		font-family:微軟正黑體;
 		background-color:#F5F5F5; 
/* 		background-color:#F5F5F5; */
		font-weight:bold;
	}
	.outer{
/*  		background-color:	#A2B5CD;  */
 		background-color:#FFEDCB;  
/* 		background-color:#CFCFCF; */
		width:75%;
		margin: auto;
/* 		border:1px solid #DCDCDC; */
		border:1px solid #DCDCDC;
	}
	.row{
		padding:10px;
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
	.hidAllMessage{
 		width:900px; 
		overflow:hidden;
	}
	#allMessage{
 		width:1200px; 
  		height:300px;    
		overflow-y: scroll;
		overflow-x: hidden;
 		margin-right:200px; 
	}
	.leavemessage{
		width:1000px;
		word-break:break-all;
		margin-top:30px;
		margin-bottom:30px;
		
	}
	.eventbuilder{
		height:50px;
		font-size:35px;
		color:black;
	}
	.eventbuilderName:hover{
		font-size:40px;
	}
	.eventtime{
		font-size:15px;
		color:RED;
	}
	.eventaddress{
		cursor: pointer;
	}
	.eventmodify{
 	 
 		padding-right:50px; 
		font-size:20px;
		float:right;	
	}
	.manager{
		 positive:relative; 
		right:30px;
	}
	.eventAdminButton{
		
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
	margin-left:10px;
		margin-top:5px;
		margin-right:5px;
/* 		float:right; */
	  font-size:16px;
	 color:	#B22222;
	}
	.eventtypeimg{
		width:20px;
		
	}
	.eventimg{
		border-radius:20px;
		width:420px;
		height:300px;
		padding-left:10px;
	}
	.leaveMessageName{
		font-size:25px;
		color:black;
		font-family:微軟正黑體;
		font-weight:bold;
	}
	#liked{
		background-color:#EEEEE0;
	}
 	.eventNotLike{ 
 		background-color:#CDCDC1 !important;  
 		font-weight:bold !important;
 		width:80px;
 	} 
 	.eventNotLikeStart{
 		background-color:#CDCDC1 !important;  
 		font-weight:bold !important;
 		width:80px;
 	}
 	.eventLike{ 
  		background-color:#4876FF !important;  
		font-weight:bold !important;
		width:80px;
 	} 
	.eventJoin{
		position:relative;
		background-color:#8B4500;
		color:white;
		padding:8px 30px !important;
		font-family:微軟正黑體 !important;
		font-size:18px !important;
		font-weight:bold !important;
 		left:100px; 
		
	}
	.eventCancels{
		position:relative;
 		left:100px; 
		top:3px;
		font-weight:bold !important;
	}
	.textArea{
		width:70%;
		height:80px;
 		margin-left:100px; 
		border-radius:10px;
		border:solid 2px #FF8C00;
		overflow:hidden;
	}
	.messageContent{
		word-break:break-all;
  		width:60%;  
	
		margin:auto;
 		margin-left:100px; 
	}
	.eventpostDate{
		
		color:#8B8989;
		font-size:12px;
	}
	.writeMessage{
		width:70% !important;
/* 		margin:auto; */
		
		position:relative;
		left:100px;
/* 		margin-right:300px; */
	}
	.hr{
 		width:70%; 
 		margin:auto; 
 		background-color:black;
	}
	.hrr{
		background-color:black;
	}
	.contentHr{
		position:relative;
		right:140px;
		width:700px;
		background-color:#696969;
	}
	.joinDetail{
		margin-left:30px;
	}
	.hid{
	 
	  display:none;
	}
	.overFlow{
		overflow:scroll !important;
		overflow-x:hidden;
		overflow-y:auto;
	}
	.closeA{
		float:right:
	}
	.memberTitle{
		font-family:微軟正黑體;
		font-weight:bold;
	}
	#memberClose{
		border:solid 1px grey;
		background-color:#0000CD;
		color:white;
	}
	#memberClose:hover{
		opacity:0.8;
	}
	.backButton{
  		margin-left:170px;  
  		margin-top:45px;  
	}
	.deleteMessage{
 		float:left; 
/*  		margin-left:700px;  */
	}
	.addressShow{
		font-family:微軟正黑體;
		font-weight:bold;
	}
	.joinIsAgreedName{
		font-size:30px;
 		color:black; 
		text-decoration:none !important;
		
		height:50px;
	}
 	.joinIsAgreedName:hover{ 
 		text-decoration:none !important; 
 		background-color:#DCDCDC;
 	} 
	#quantity{
		width:100px;
	}
	.waitInviterCheck{
		color:red;
		font-size:30px;
		position:relative;
		left:40px;
		top:10px;
	}
	.joinWaitCheck{
		opacity:0.7;
		background-color:black;
	}
	#ConfirmCancel{
		margin-left:60px;
		
	}
	.cancelTitle{
		font-size:25px;
	}
	.ModalTitle{
		font-size:50px;
		font-family:微軟正黑體;
		font-weight:900px;
	}
	.message{
		margin-top:30px;	
	}
  	.PostTitle{  
 		font-size:40px;  
 		font-family: 'Noto Sans TC', sans-serif;  
 		font-weight:700px;  
		text-align:center;  
 	}  
 	.delete{
		width:50px;
		height:25px; 
		font-size:12px !important;
		 position:relative;
		 left:530px; 
 	}  
 	.report{
	 	font-size:12px !important;
	 	width:50px;
		height:25px; 
		 position:relative;
		 left:520px;   
/*  		margin-left:500px; */
/*  		margin-left:100px; */ 
 	}
 	.shareIcon{
 	    background-color:red;
 	    border-radius:10px;
 	    cursor: pointer;
 	    width:200px;
 	    height:200px;
 	}
</style>
<script>
function ValidateNumber(e, pnumber) 
{
    if (!/^\d+$/.test(pnumber))
    {
        e.value = /^\d+/.exec(e.value);
    }
    return false;
}
 	$(document).ready(function(){
 		 

 		<c:if test="${!empty success}"> 
 		   $("#clickMessageReport").click();
 		
 		</c:if>
 	
 		var message = $("#allMessage").val();
 		if(message != null){
 			$("#allMessage").attr("height", "400px");
 		}else{
 			$("#allMessage").attr("height", "0px");
 		}
 		
 		//報名完成顯示
 		<c:if test="${!empty signUpSuccess}"> 
 		   $("#ccccc").click();
 		
 		</c:if>

// 		先隱藏 點地址顯示
		$("#eventAddressImage").hide();
		$(".eventaddress").click(function(){
			$("#eventAddressImage").toggle(500);
		});
		
		$("#backbutton").click(function(){
			history.go(-1);
		});
// 		按讚 
 	   	
 	   	var eventId = ${event.eventId};
			$.ajax({
				type: "POST",                           
	    	    url: "${pageContext.request.contextPath}/event/checkLike/"+eventId,
	    	    data: {"eventId": eventId},
	    	    success: function (check){
	    	    	if(check=="liked"){
	    	    		$("#e${event.eventId }").attr("class", "btn btn-default eventLike");
	    	    	}else{
	    	    		$("#e${event.eventId }").attr("class", "btn btn-default eventNotLike");
	    	    	}
	    	    } 
			});
		
		
	    $("#e${event.eventId}").click(function(){
	    	$("#e${event.eventId}").toggleClass("eventNotLike eventLike");
	      var eventId = ${event.eventId};
	    	 $.ajax({
	    	    type: "POST",                           
	    	    url: "${pageContext.request.contextPath}/event/goods/"+eventId,
	    	    data: {"eventId": eventId},
	    	    success: function (result) {
	    	    	if (result != -4) {
	    					 var a = result;
	                    	 $(".eventLikeNum").html(a);
		    	    }else{ 
	                    	location.href = "${pageContext.request.contextPath}/not_Login";
	    	    	     }
	   	    	   } 
	    	});
	    });
	});
</script>
<title>Event </title></head>
<body class="body">
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
<div id="main">
	<div class="outer">
		<div class="eventname">
			<span class="eventTitle">${event.eventName}</span>
			<c:choose>
				<c:when test="${eventtype.eventType == '美食'}">
			<span class="eventtype"><img class="eventtypeimg" src="<c:url value='/resources/img/icon_food_01.png' />" />聚餐</span>
				</c:when>
					<c:when test="${eventtype.eventType == '運動'}">
			<span class="eventtype"><img class="eventtypeimg" src="<c:url value='/resources/img/icon_sport_01.png' />" />運動</span>
				</c:when>	<c:when test="${eventtype.eventType == '娛樂'}">
			<span class="eventtype"><img class="eventtypeimg" src="<c:url value='/resources/img/icon_entertainment_01.png' />" />休閒娛樂</span>
				</c:when>	<c:when test="${eventtype.eventType == '其他'}">
			<span class="eventtype"><img class="eventtypeimg" src="<c:url value='/resources/img/icon_other_01.png' />" />其他</span>
				</c:when>
			</c:choose>
			<c:choose >
			<c:when test="${event.eventStatus == 'yes' }">
			<span class="eventtype" id="eventfull">已成團</span>
			</c:when>
			<c:when test="${event.eventStatus == 'no' }">
			<span class="eventtype" id="eventNoSuccess">已流團 勿前往</span>
			</c:when>
			<c:when test="${event.eventStatus == 'unchecked' and finish != false }">
			<span class="eventtype" id="eventnofull">報名開放 尚未成團</span>
			</c:when>
			 </c:choose>
			<c:if test="${event.isFull != false }">
			<span class="eventtype" id="eventfull" style="background-color:red;color:white;">人數已滿</span>
			</c:if>
			  
<!-- 			  活動設定 -->
<!-- 			   ========================= -->
			
			   <c:if test="${memberId == inviterid}">
			 <span class="eventmodify">
			
			<a href="${pageContext.request.contextPath}/event/setting/${event.eventId}">
			 <button type="button" class="btn btn-dark manager">活動管理</button>
			 </a>
			 </span>
				</c:if>
			
<!-- 	   ============================================		  -->
		 </div>
<!-- 		---------------------------------- -->
			<div class="row">
    			  <div class="col-md-6 left">
    			  	<c:choose>
    			  	<c:when test="${event.eventImage == null and eventtype.eventType == '美食'}">
    					<img class="eventimg" src="<c:url value='/resources/img/cover_food.jpg'/>" />
    				</c:when>
    				<c:when test="${event.eventImage == null and eventtype.eventType == '運動'}">
    					<img class="eventimg" src="<c:url value='/resources/img/cover_sport.jpg'/>" />
    				</c:when><c:when test="${event.eventImage == null and eventtype.eventType == '娛樂'}">
    					<img class="eventimg" src="<c:url value='/resources/img/cover_entertainment.jpg'/>" />
    				</c:when><c:when test="${event.eventImage == null and eventtype.eventType == '其他'}">
    					<img class="eventimg" src="<c:url value='/resources/img/cover_other.jpg'/>" />
    				</c:when>
    				<c:otherwise>
    					<img class="eventimg" src="<c:url value='/getEventImage/${event.eventId}.jpg' />"/>
    				</c:otherwise>
    				</c:choose>
    				
    				<p class="eventliketotal"><i class="far fa-thumbs-up">&nbsp;</i><span class="eventLikeNum">${event.eventLike}</span> 個人覺得讚 
    						<span style="position: relative;top:5px;left:20px;">
    						 <iframe src="https://www.facebook.com/plugins/share_button.php?href=https://zh.wikipedia.org/zh-tw/%E8%B3%87%E8%A8%8A%E5%B7%A5%E6%A5%AD%E7%AD%96%E9%80%B2%E6%9C%83&layout=button_count&size=small&width=92&height=20&margin=0&padding=0&appId" width="20%"  height="20" style="border:none;overflow:hidden;margin: 0;padding: 0" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>
							 <iframe allowtransparency="true" frameborder="0" scrolling="no" src="http://platform.twitter.com/widgets/tweet_button.html" style="width:80px ; height:20px;margin: 0;padding: 0"></iframe>
							 <a title="Share to Plurk" href="javascript:void(window.open('http://www.plurk.com/?qualifier=shares&status='.concat(encodeURIComponent(window.location.href)).concat(' ').concat('(').concat(encodeURIComponent(document.title)).concat(')')));" style="margin:  0;padding: 0"><img title="share" src="http://statics.plurk.com/bda225d234426cccca300c551f60438e.png" width="92" height="20" border="0" align="top" style="vertical-align: top;margin-left: 0;padding-left: 0"/></a>
						    </span>	
    				</p><hr class="hrr">
 
 <p>
    		<span id="likedspan">
    		 <button type="button" id="e${event.eventId }" class="btn btn-default eventNotLike"><i class="far fa-thumbs-up"></i> 讚</button>
    		</span>	
<!-- 				<button type="button" class="btn btn-light font" style="background-color:#696969;color:white;">分享<i class="fas fa-share-alt"></i></button> -->
			 
			 
  <span id="joinOrNot">
		<c:if test="${memberId != inviterid and memberCheck == false and event.eventStatus == 'unchecked' and event.isFull == false and finish != false}">
				<button type="button" id="signUp" class="btn btn-success eventJoin" data-toggle="modal" data-target="#exampleModalCenter">報名活動</button>
		</c:if>
		<c:if test="${memberId != inviterid and memberCheck != false and event.eventStatus == 'unchecked' and finish != false and myAgreed == false}">
				<button type="button" readonly id="joinWaitCheck" class="btn btn-success eventJoin joinWaitCheck">報名申請中</button>
 		</c:if>	
 		<c:if test="${memberId != inviterid and memberCheck != false and event.eventStatus == 'unchecked' and finish != false and myAgreed == true}">
				<button type="button" readonly id="joinWaitCheck" class="btn btn-success eventJoin joinWaitCheck">報名已成功</button>
 		</c:if>
 </span> 	
    		<span>
    		 <c:if test="${memberId != inviterid and memberCheck != false and event.eventStatus == 'unchecked' and finish != false}">
    			<button type="button" id="dropOut" class="btn btn-danger eventCancels" data-toggle="modal" data-target="#CancelJoinEvent">取消報名</button>    				
    		 </c:if>
    		</span> 
 </p>
     			 </div>
    		 	 <div class="col-md-6 right">
      		<p class="eventbuilder">																															
      				<a class=" a" href="<c:url value='/member/other/${inviterid}' />"><span><img class="eventbuilderName" src="<c:url value='/getMemberImage/${inviterid}.jpg' />" width="50px" height="50px" style="border-radius:25px;"/></span>
      				<span  class="eventbuilder eventbuilderName"> ${eventbuildname.memberName}</span></a>
      		</p>
      		<p>
      			<i class="fas fa-clock"></i>
      			<c:if test="${finish != false}">
      			<span class="eventtime">活動時間 :${event.eventDateStart} - ${event.eventDateEnd}</span>
      			</c:if>
      			<c:if test="${finish == false}">
      				<span class="eventtime">活動時間 :${event.eventDateStart} - ${event.eventDateEnd}<p><span style="background-color:red;color:white;font-size:20px;margin-left:20px;">活動已結束</span></p></span>		
      			</c:if>
      		</p>
      		<p class="eventaddress">
      				<i class="fas fa-map-marker-alt">
      					<span class="addressShow">地點 : ${event.eventLocation}</span>
      				</i>
      		</p>
      			<iframe id="eventAddressImage" width='400' height='250' frameborder='0' scrolling='no' marginheight='0' marginwidth='0'  
      			src='https://www.google.com/maps/embed/v1/place?key=AIzaSyC9cpXz2HFE2Dw_vITbm-T6Z-6v-TJujBQ&q=place_id:${event.eventPlaceId}' allowfullscreen>
<!--       				位置icon圖 -->
				</iframe>	
      		<p class="eventjoinmember">目前人數 : 
      			<span>${event.eventCurrentMembers} 人</span>
      			<span class="joinDetail">
      				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable">已參加會員</button>
      			</span> 
      		</p>
      		<p>人數限制 : 
      			<span>${event.eventMemberLimit} 人</span>
      		</p>
      		<p>活動內容 : 
      			<span> ${event.eventContent}</span>
      		</p>
      		<span class="backButton">
   				<a href="${pageContext.request.contextPath}/events" id="backbutton"class="btn btn-secondary btn-lg backButton active" role="button" aria-pressed="true">返回</a>
   			</span>
     			 </div>
   			</div>
<!--    		<div> -->
   			
<!--    		</div> -->
   		<hr class="hrr"/>
   		<p class="PostTitle" >留言板</p>
  	  
  	  
  	   <div class="leavemessage">
  	   	<div class="hidAllMessage">
  	   	<div id="allMessage">
<!--   	   	各留言 -->
			<c:forEach var="getPostContentlist" items="${getPostContentlist}">
<!-- 			留言區 -->
  	   		<p class="messageContent">
  	   	<c:if test="${getPostContentlist.isDeleted == false }">
  	   			<a class="a leaveMessageName" href="<c:url value='/member/other/${getPostContentlist.memberId}' />"><span><img class="eventbuilderName" src="<c:url value='/getMemberImage/${getPostContentlist.memberId}.jpg' />" width="30px" height=30px" style="border-radius:25px;"/></span>
  	   			<span class="leaveMessageName"> ${getPostContentlist.memberName} </span></a>
  	   			<span>
  	   		 <c:if test="${memberId == getPostContentlist.memberId and adminId == null}">
  	   			<button type="button" id="" class="btn btn-dark delete" data-toggle="modal" data-target="#messageDelete${getPostContentlist.eventPostId}">
				      刪除
				</button>
  	   		 </c:if>
  	   		 <c:if test="${adminId != null}">
  	   		    <button type="button" id="" class="btn btn-dark delete" data-toggle="modal" data-target="#messageDelete${getPostContentlist.eventPostId}">
				      刪除
				</button>
  	   		 </c:if>
			  <div class="modal fade" id="messageDelete${getPostContentlist.eventPostId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel"></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       		 確認刪除 ?
				      </div>
				      <div class="modal-footer">
				      
				      
				         <form class="deleteMessage" action="${pageContext.request.contextPath}/DeleteEventPost" method="Post">
		  	   				<input type="text" class="hid" name="eventPostId" value="${getPostContentlist.eventPostId}"/>  
		  	   				<input type="text" class="hid" name="eventId" value="${event.eventId}">  
		  	   				<button type="submit" class="btn btn-primary">確認</button>
  	   					</form>
				       	
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        </div>
				    </div>
				  </div>
				</div>
				  	   		
				  	   		
  	   		
  	   		
  	   		</span>
  	   		
  	   			
  	   		</p>
  	   		<p class="messageContent">${getPostContentlist.eventPostContent}</p>
  	   		<p class="messageContent"><span class="eventpostDate">${getPostContentlist.eventPostDate}</span>
  	   		<span>
  	   		<c:if test="${memberId != getPostContentlist.memberId and memberId != null}"> 
  	   		 <a style="display:inline;" href="${pageContext.request.contextPath}/event/postReport/${event.eventId}/${getPostContentlist.eventPostId}/${getPostContentlist.memberId}"><button type="button" class="btn btn-dark report">檢舉</button></a>
  	   		</c:if>
  	   		</span>	
  	   		<hr class="contentHr"/></p>
  	   	</c:if>
  	  </c:forEach>
  	  
   </div>
  </div>
  	   <div class="message">
  	   	 <form action="${pageContext.request.contextPath}/event/eventPost" method="Post">
  	   		<textarea class="textArea" name="eventPostContent" id="textAreaId" required wrap="hard"></textarea>
  	   			<input type="text" class="hid" name="eventId" value="${event.eventId}"/>  
      		<c:if test="${memberId != null}">
      			<!-- Button trigger modal -->
<button type="button" id="checkTextArea" class="btn btn-primary btn-md btn-block writeMessage" data-toggle="modal" data-target="#messageCheck">
  留言
</button>

<!-- Modal -->
<div class="modal fade" id="messageCheck" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		 確認送出留言 ?
      </div>
      <div class="modal-footer">
       	<button type="submit" class="btn btn-primary">確認</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>
      				
      			
      		</c:if>
      		<c:if test="${memberId == null}">
      			<input type="button" value="請先登入" readonly id="checkTextArea" class="btn btn-primary btn-md btn-block writeMessage" />
      		</c:if>
         </form>
      	</div>
      </div>
 </div> 
 <div style="height:50px;"></div>
<!-- 參加成員Modal -->
<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title ModalTitle" id="exampleModalScrollableTitle">參加成員</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <c:forEach var="emfindagreed" items="${emfindagreed}">
            <a class="a" href="<c:url value='/member/other/${emfindagreed.memberId}' />">
            <p class="joinIsAgreedName">
            	<span><img src="<c:url value='/getMemberImage/${emfindagreed.memberId}.jpg' />" width="50px" height="50px" style="border-radius:25px;"/></span>
          	   
          	   <span style="color:black;">${emfindagreed.memberName}&nbsp;&nbsp;&nbsp;</span> 
<!--           	   ===== -->
          	 
<!--           	   <span style="color:black;"> -->
<%--           	      <c:if test="${memberId != emfindagreed.memberId}">  --%>
<%--           	        <a style="position:relative;right:10px;float:right;" href="${pageContext.request.contextPath}/event/report/${event.eventId}/${emfindagreed.memberId}/${emfindagreed.memberId}">   --%>
<!--   	   		          <button type="button" class="btn btn-dark delete">檢舉</button> -->
<!--   	   		        </a> -->
<%--   	   		     </c:if> --%>
<!--           	   </span> -->
          	
<!--           	   ==== -->
            </p>
           </a> 
<!--             <hr/> -->
        </c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- 以下報名Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title ModalTitle" id="exampleModalCenterTitle">${event.eventName}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="${pageContext.request.contextPath}/event/eventCheckQuantity" method="POST"> 
      	<label for="quantity">請輸入報名人數 : </label>
      	<input id="quantity" type="number" name="quantity" onkeyup="return ValidateNumber(this,value)" value="1" min="1" max="${(event.eventMemberLimit-event.eventCurrentMembers)}" required/>

      	<input type="text" class="hid" name="eventId" value="${event.eventId}"/>  
      	<button type="submit" id="ConfirmJoin" class="btn btn-primary">確認報名</button>  
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- 以上報名MODAL -->
<!-- 檢舉成功 -->
<!-- Button trigger modal -->
<button type="button" id="clickMessageReport" style="display:none;" class="btn btn-primary" data-toggle="modal" data-target="#messageReport">
  click
</button>

<!-- Modal -->
<div class="modal fade" id="messageReport" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">檢舉成功</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		 檢舉已送出 感謝您的意見 !
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
<!-- ===報名成功=== -->
<!-- Button trigger modal -->
<button type="button" id="ccccc" style="display:none;"class="btn btn-primary" data-toggle="modal" data-target="#cccccS">
  SUCCESS
</button>
<div class="modal fade" id="cccccS" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        		報名申請已成功
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    
      </div>
    </div>
  </div>
</div>

<!--退出 modal ------------------ -->
<div class="modal fade" id="CancelJoinEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title ModalTitle" id="exampleModalCenterTitle">${event.eventName}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     <form action="${pageContext.request.contextPath}/DeleteByEventMemberId" method="POST"> 
      <div class="modal-body">
      			<label class="cancelTitle">確定要退出本團 !? </label>
      				<input type="text" class="hid" name="eventId" value="${event.eventId}"/>  

      				<button type="submit" id="ConfirmCancel" class="btn btn-primary">Confirm</button>
      				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
      </form>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

</div>
<jsp:include page="${request.contextPath}/footerbar"/>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>
