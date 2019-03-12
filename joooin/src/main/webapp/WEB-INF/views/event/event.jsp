<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 自己加的 -->
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
	}
	
	.body{
		font-family:微軟正黑體;
		background-color:#F5F5F5;
		font-weight:bold;
	}
	.outer{
		background-color:#FFDEAD;
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
		color:RED;
	}
	.eventaddress{
	
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
		word-break:break-all;
		width:70%;
		margin:auto;
	}
	#allMessage{
		
	}
	.eventpostDate{
		
		color:#8B8989;
		font-size:12px;
	}
	.writeMessage{
		width:70% !important;
		margin:auto;
	}
	.hr{
		width:70%;
		margin:auto;
	}
	.hrr{
		background-color:black;
	}
	.joinDetail{
		margin-left:30px;
	}
	.hid{
	 
	  display:none;
	}
	.show{
 	   position:fixed; /*固定位置定位*/ 
 	  top:40px;
 	  left:34%;
 	  right:30%;
  	  z-index:1; /*重疊時會在其他元素之上*/ 
 	  display:block;
 	  margin:auto;
	}
	.content{
/* 		opacity:0.9; */
		box-shadow:3px 3px 3px  #838B8B;
		color:black;
		background-color:#F8F8FF;
		border-radius:10px;
		border:solid 1px #F5F5F5;
		width:400px;
		height:500px;
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
		margin-left:800px;
	}
	.deleteMessage{
 		float:left; 
 		margin-left:40px;
/*  		margin-left:700px;  */
	}
</style>
<script>
 	$(document).ready(function(){
// 		按讚收回
		$("#e${event.eventId}").click(function(){
			//var liked = $("#e${event.eventId }");
			if($("#e${event.eventId }").attr("class") == "btn btn-default eventNotLike"){
				$(this).removeClass("eventNotLike");
			    $(this).addClass("eventLike");
			    $(this).html("<i class='far fa-thumbs-up'></i> 讚");
			   
			}else {
				$(this).removeClass("eventLike");
				$(this).addClass("eventNotLike");
			    $(this).html("<i class='far fa-thumbs-up'></i> 讚");
			}
		});
		$("#backbutton").click(function(){
			history.go(-1);
		});
	});
	
</script>
<title>Insert title here</title></head>
<body class="body">
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
<div id="main">
	<div class="outer">
		<div class="eventname">
			<span >${event.eventName}</span>
			<span class="eventtype"><img class="eventtypeimg" src="<c:url value='/resources/img/icon_${eventtype.eventType}_01.png' />" />${eventtype.eventType}</span>
			
			<c:choose >
			<c:when test="${event.eventStatus == 'yes' }">
			<span class="eventtype" id="eventfull">已成團</span>
			</c:when>
			<c:otherwise>
			<span class="eventtype" id="eventnofull">報名開放 尚未成團</span>
			</c:otherwise>
			 </c:choose>
			
			   <c:if test="${memberId == inviterid}">
			 <span class="eventmodify">
			
			 <form class="manager" action="${pageContext.request.contextPath}/event/setting" method="POST">
			
			 <input type="text" class="hid" name="eventAdminId" value="${event.eventId}">
			 
			 <input type="submit" value="活動管理" class="btn btn-dark manager">
			 </form>
			 </span>
				</c:if>
			
			 
		 </div>
<!-- 		---------------------------------- -->
			<div class="row">
    			  <div class="col-md-6 left">
    			  	<c:choose>
    			  	<c:when test="${event.eventImage == null }">
    				<img class="eventimg" src="<c:url value='/resources/img/cover_${eventtype.eventType}.jpg'/>" />
    				</c:when>
    				<c:otherwise>
    					<img class="eventimg" src="${event.eventImage}"/>
    				</c:otherwise>
    				</c:choose>
    				<p class="eventliketotal"><i class="far fa-thumbs-up"></i> ${event.eventLike} 個人覺得讚</p><hr class="hrr">
 <p>
    		<span id="likedspan">
    				 <button type="button" id="e${event.eventId }" class="btn btn-default eventNotLike"><i class="far fa-thumbs-up"></i> 讚</button>
    				 </span>
  <span id="joinOrNot">
<%-- 					<form class="deleteMessage" action="${pageContext.request.contextPath}/DeleteEventPost" method="Post"> --%>
<%--   	   				<input type="text" class="hid" name="eventPostId" value="${eventPost.eventPostId}"/>   --%>
<%--   	   				<input type="text" class="hid" name="eventId" value="${event.eventId}">   --%>
<!--     舊的		<button type="submit" id="signUp" class="btn btn-success eventJoin">報名</button> -->
		   <c:if test="${memberId != inviterid}">			
			<button type="button" id="signUp" class="btn btn-success eventJoin" data-toggle="modal" data-target="#exampleModalCenter">報名</button>
			</c:if>
		
 </span> 	
    		<span>
    		 <c:if test="${memberId != inviterid}">
    			<button type="button" id="dropOut" class="btn btn-danger eventCancels" data-toggle="modal" data-target="#CancelJoinEvent">退出</button>    				
    		 </c:if>
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
      			<span>${event.eventCurrentMembers} 人</span>
      			<span class="joinDetail">
<!--       	舊版			<button type="button" id="membersButton" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#myModal">參加名單</button> -->
      				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable">已參加會員</button>
      			</span> 
      		</p>
      		<p>人數限制 : 
      			<span>${event.eventMemberLimit} 人</span>
      		</p>
      		<p>活動內容 : 
      			<span> ${event.eventContent}</span>
      		</p>
     			 </div>
   			</div>
   		<div>
   			<span class="backButton">
   				<a href="#" id="backbutton"class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">返回</a>
   			</span>
   		</div>
  	   <div class="leavemessage"><hr/>
  	   	<div id="allMessage">
<!--   	   	各留言 -->
			<c:forEach var="eventPost" items="${eventPost}">
<!-- 			留言區 -->
<%--   	   		<c:forEach var="eventPostMemberList" items="${eventPostMemberList}"> --%>
  	   		<p class="messageContent">
  	   			<span id="leaveMessageName">${eventPost.memberId} </span>
  	   			<c:if test="${admin == null}">
  	   			<span class="deleteMessage">
  	   			<form class="deleteMessage" action="${pageContext.request.contextPath}/DeleteEventPost" method="Post">
  	   				<input type="text" class="hid" name="eventPostId" value="${eventPost.eventPostId}"/>  
  	   				<input type="text" class="hid" name="eventId" value="${event.eventId}">  
  	   				<button id="" type="submit" class="btn btn-danger">Delete</button>
  	   			</form>
  	   			</span>
  	   			</c:if>
  	   		</p>
<%--   	   		</c:forEach> --%>
  	   		<p class="messageContent">${eventPost.eventPostContent}</p>
  	   		<p class="messageContent"><span class="eventpostDate">${eventPost.eventPostDate}</span>	</p>
  	   		  
  	   		<hr class="hr"/>
  	   		 	</c:forEach>	
  	   	<!--   	   	各留言 -->
  	  </div>
  	   	<form action="${pageContext.request.contextPath}/event/eventPost" method="Post">
  	   		<textarea class="textArea" name="eventPostContent" id="textAreaId" required></textarea>
  	   			<input type="text" class="hid" name="eventId" value="${event.eventId}"/>  
  	   			<input type="text" class="hid" name="memberId" value="${memberId}">  
      		<c:if test="${memberId != null}">
      			<input type="submit" value="留言" id="checkTextArea" class="btn btn-primary btn-md btn-block writeMessage" />
      		</c:if>
      		<c:if test="${memberId == null}">
      			<input type="button" value="請先登入" readonly id="checkTextArea" class="btn btn-primary btn-md btn-block writeMessage" />
      		</c:if>
      	</form>
      </div>
 </div>
		 <hr/>
		  <a href="${pageContext.request.contextPath}/event/${eventId}">活動詳細資訊有ID=2</a>
<!--以下 套新的Bootstrap           =================================== --> 
<!-- 參加成員Modal -->
<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">參加成員</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                 <c:forEach var="eventmembers" items="${eventmembers}">
          <p>
          	<span></span>
          	<span>${eventmembers.memberName}</span>
          </p>
          <hr/>
          </c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!--以上 套新的Bootstrap           ====================== --> 
<!-- 以下報名Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">${event.eventName}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     
      <div class="modal-body">
      <form action="${pageContext.request.contextPath}/event/eventCheckQuantity" method="POST"> 
      	<label for="quantity">請輸入報名人數 : </label>
      	<input id="quantity" type="number" name="quantity" value="1" min="1" max="100" required/>

      	<input type="text" class="hid" name="eventId" value="${event.eventId}"/>  
  	   	<input type="text" class="hid" name="memberId" value="${memberId}"/>  
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
<!--退出 modal ------------------ -->
<div class="modal fade" id="CancelJoinEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">${event.eventName}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     
      <div class="modal-body">
      			確定要退出本團 !?
<%--        <form atcion="${pageContext.request.contextPath}/event/eventCheckQuantity" method="POST">  --%>
<!--       			<label for="quantity">請輸入報名人數 : </label> -->
<%--       				<input type="text" class="hid" name="eventId" value="${event.eventId}"/>   --%>
<%--   	  			 	<input type="text" class="hid" name="memberId" value="${memberId}"/>   --%>
      				<button type="submit" id="ConfirmJoin" class="btn btn-primary">確認</button>  
<%--       </form> --%>
     		
     		 <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
      <div class="modal-footer">
       
        
        
      </div>
      
    </div>
  </div>
</div>


<!-- ------------------ -->
</div>
<!-- 請把所有內容寫在此div內 -->
 
<!-- Button trigger modal -->

</body>
</html>
<!-- 	以下 舊版自己寫的Modal	--------- -->


<!--   <div class="hid" id="myModal" role="dialog"> -->
<!--     <div > -->
    
<!--       Modal content -->
<!--       <div class="content overFlow"> -->
<!--         <div class="modal-header"> -->
<!--         	 <h4 class="modal-title memberTitle" >活動成員</h4> -->
<!--           <button type="button" class="close closeA" data-dismiss="modal">&times;</button> -->
<!--         </div> -->
<!--         <div class="modal-body"> -->
<%--          <c:forEach var="eventmembers" items="${eventmembers}"> --%>
<!--           <p> -->
<!--           	<span></span> -->
<%--           	<span>${eventmembers.memberName}</span> --%>
<!--           </p> -->
<!--           <hr/> -->
<!-- <!--           =================================== --> 
			
			
<!-- <!--           ====================== --> 
<%--           </c:forEach> --%>
<!--         </div> -->
<!--         <div class="modal-footer"> -->
<!--           <button type="button" id="memberClose" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--         </div> -->
<!--       </div> -->
      
<!--     </div> -->
<!--   </div> -->
  
<!-- 以上自己寫的Model		--------- -->