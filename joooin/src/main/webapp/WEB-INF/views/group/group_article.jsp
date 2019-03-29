<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://code.jquery.com/jquery-1.12.4.min.css">	
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>	
	
<!-- 	comment style -->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">
<!-- 	comment style -->

<style>	
	*{
	font-family:微軟正黑體;
	}
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 120px;
	}
	table{
   	
   	width: 770px; 	
/*    	自動斷行 */
   	word-wrap: break-word;
   	table-layout: fixed;
   }
   
   .textarea:focus {
    outline: none !important;
    border:1px solid #6495ED;
    box-shadow: 0 0 10px #719ECE;
	}
    
/* 	讓照片大小一致 */
	.mask {
  	display: inline-block;
  	width: 100px;
  	height: 100px;
  	border-radius: 50%;
  	overflow: hidden;
	}
	
	.maskimg {max-width: 100%;}
/* 	讓照片大小一致 */  	
</style>
<!-- reply like ready -->
<script type="text/javascript">
$( document ).ready(function() {
	var currentId="${sessionScope.memberId}";
	var groupId = ${poster.groupId};
	var groupPostId = ${poster.groupPostId};
	$.ajax({
		type: "GET",                           
		url: "${pageContext.request.contextPath}/group/return/reply/"+groupPostId+"/group/"+groupId,
		success: function (result) {
			//完成後的callback
			console.log("有沒有ready回傳",result);
			//顯示留言
			$("#chatbox").html("");
			for (var i = 0; i < result.length; i++) {
				$("#chatbox").append(
						//開始擴增
						"<div class='card card-inner'>"+
	            	    "<div class='card-body'>"+
	            	        "<div class='row'>"+
	                    	    "<div class='col-md-2'>"+
	                    	        "<img src='${pageContext.request.contextPath}/getMemberImage/"+ result[i].memberId +"' class='img img-rounded img-fluid'/>"+
	                    	        "<p class='text-secondary text-center'>"+result[i].groupPostReplyDate+"</p>"+
	                    	    "</div>"+
	                    	    "<div class='col-md-10'>"+
	                    	        "<p>"+"<a href='${pageContext.request.contextPath}/member/other/"+result[i].memberId +"'>"+"<strong>"+result[i].memberName+"</strong>"+"</a>"+
	                    	        "<span class='float-right'>"+(i+1)+"樓"+"</i>"+"</span>"+"</p>"+
	                    	        "<p>"+result[i].groupPostReplyContent+"</p>"+
	                    	       
	                    	        "<p class= "+ result[i].memberId +" style='display:none;'>"+
                    	            "<a href='${pageContext.request.contextPath}/DeleteGroupReplyPost/"+result[i].groupPostReplyId +"/"+result[i].memberId +"/"+result[i].groupId+"/"+result[i].groupPostId+"' class='float-right btn btn btn-dark delete ml-2' style=''>"+"<i class='fa fa-reply'>"+"</i>"+"刪除"+"</a>"+
                    	       		"</p>"+ 
                    	       		
	                    	        "<p>"+
	                    	            "<a href='${pageContext.request.contextPath}/report/"+result[i].memberId +"/"+result[i].memberName +"' class='float-right btn btn-outline-primary ml-2'>"+"<i class='fa fa-reply'>"+"</i>"+"檢舉"+"</a>"+
	                    	       "</p>"+
	                    	    "</div>"+
	            	        "</div>"+
	            	    "</div>"+
	                "</div>");
						//結束擴增
			}
			$("."+currentId).show();
		}, 
	});
	
	$.ajax({
		type: "GET", 
		url: "${pageContext.request.contextPath}/group/return/like/"+groupPostId,
		success: function (likeResult){
			console.log(likeResult);
			//回傳like
			var selfId = "${sessionScope.memberId}";
			for (var i = 0; i < likeResult.length; i++){
				if(likeResult[i].memberId == selfId){
					$("#like").attr("class", "float-right btn text-white btn-danger");
				}
				else{
					$("#like").attr("class", "float-right btn text-danger btn-light");
				}
			}
			$("#like").html("<i class='fa fa-heart'>"+"</i>"+" Like "+likeResult.length);
		},
	});
});
</script>
<!-- reply ready按鈕判定 -->
<script>
$( document ).ready(function() {
	var currentId = ${sessionScope.memberId};
	
	
		var replymember=$("p reply.memberId");	
	if(replymember==currentId){
		$('#result[i].memberId').show(); 
	
	}
});
</script>
<!-- reply update -->
<script>
	// 送出回文
	$(function() {
		$("#usermsg").keypress(function(e) {
			 if(e.which == 13 && !e.shiftKey) { //按下enter不包含shift+enter
				// 回文不可是空
				if($(this).val().trim() == ""){
					e.preventDefault();
					return;
				}
				
				var con = confirm(" 確定送出? ");
				
				if(con == false){
					return;
				}
				
				var reply_content = ($(this).val() + "<br/>");
				//submit form via ajax, this is not JS but server side scripting so not showing here
				var currentId = "${sessionScope.memberId}"
				var groupId = ${poster.groupId};
				var groupPostId = ${poster.groupPostId};
				$.ajax({
					type: "POST",                           
    	    		url: "${pageContext.request.contextPath}/group/recive/reply/"+groupPostId+"/group/"+groupId,
    	   			data: {"reply": reply_content},
            		success: function (result) {
						//完成後的callback
						//顯示留言
						$("#chatbox").html("");
						for (var i = 0; i < result.length; i++) {
							$("#chatbox").append(
								//開始擴增
								"<div class='card card-inner'>"+
				            	    "<div class='card-body'>"+
				            	        "<div class='row'>"+
				                    	    "<div class='col-md-2'>"+
				                    	        "<img src='${pageContext.request.contextPath}/getMemberImage/"+ result[i].memberId +"' class='img img-rounded img-fluid'/>"+
				                    	        "<p class='text-secondary text-center'>"+result[i].groupPostReplyDate+"</p>"+
				                    	    "</div>"+
				                    	    "<div class='col-md-10'>"+
				                    	        "<p>"+"<a href='${pageContext.request.contextPath}/member/other/"+result[i].memberId +"'>"+"<strong>"+result[i].memberName+"</strong>"+"</a>"+
				                    	        "<span class='float-right'>"+(i+1)+"樓"+"</i>"+"</span>"+"</p>"+
				                    	        "<p>"+result[i].groupPostReplyContent+"</p>"+
				                    	        
				                    	        "<p class= "+ result[i].memberId +" style='display:none;'>"+
			                    	            "<a href='${pageContext.request.contextPath}/DeleteGroupReplyPost/"+result[i].groupPostReplyId +"/"+result[i].memberId +"/"+result[i].groupId +"/"+result[i].groupPostId+"' class='float-right btn btn btn-dark delete ml-2'>"+"<i class='fa fa-reply'>"+"</i>"+"刪除"+"</a>"+
			                    	       		"</p>"+ 
			                    	       	
				                    	        "<p>"+
				                    	            "<a href='${pageContext.request.contextPath}/report/"+result[i].memberId +"/"+result[i].memberName +"' class='float-right btn btn-outline-primary ml-2'>"+"<i class='fa fa-reply'>"+"</i>"+"檢舉"+"</a>"+
				                    	       "</p>"+
				                    	    "</div>"+
				            	        "</div>"+
				            	    "</div>"+
				                "</div>");
								//結束擴增
						}
						$("."+currentId).show();
            		}, 
				});
				
								
				$(this).val("");
				e.preventDefault();
			
			 
			 
			 }
		});
	});
	
	function accept(butObj){
		
		$("postename").hide();
		$("reportbutton").hide();
	}
</script>
<!-- reply update -->
<!-- like update -->
<script>
	$(function(){
		$("#like").click(function(){
			var selfId = "${sessionScope.memberId}";
			if(selfId == ""){
				location.href = "${pageContext.request.contextPath}/notLogin";
			}
			var groupPostId = ${poster.groupPostId};
			var likeCount = this.text;
			var likeStatus = this.className;
			console.log("likeClass", likeStatus);
			console.log("likeText", likeCount);
			//"float-right btn text-danger btn-light" 白
			//"float-right btn text-white btn-danger" 紅
			if(likeStatus == "float-right btn text-danger btn-light"){
				console.log("白");
				$.ajax({
					type: "POST",                           
    	    		url: "${pageContext.request.contextPath}/groupPost/like/"+groupPostId,
    	    		success: function (likeResult){
    	    			$("#like").attr("class", "float-right btn text-white btn-danger");
    	    			console.log(likeResult);
    	    			console.log("size",likeResult.length);
    	    			$("#like").html("<i class='fa fa-heart'>"+"</i>"+" Like "+likeResult.length);
    	    		},
				});
			}
			
			else if(likeStatus == "float-right btn text-white btn-danger"){
				console.log("紅");
				$.ajax({
					type: "POST",                           
    	    		url: "${pageContext.request.contextPath}/groupPost/dislike/"+groupPostId,
    	    		success: function (likeResult){
    	    			$("#like").attr("class", "float-right btn text-danger btn-light");
    	    			console.log(likeResult);
    	    			console.log("size",likeResult.length);
    	    			$("#like").html("<i class='fa fa-heart'>"+"</i>"+" Like "+likeResult.length);
    	    		},
				});
			}
			
		});
	});
</script>
<!-- like update -->
<script>
$(document).ready(function () {

});
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">

		<jsp:include page="${request.contextPath}/group/group_navbar" />
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
		 <!-- 	test -->

		<section>
<!-- 		主文及回文 -->
<div class="container">
<!-- 		標題 -->
	<h2 class="text-center">${poster.groupPostTitle }</h2>
	<br>
<!-- 		標題 -->
	<div class="card">
	    <div class="card-body">
	        <div class="row">
        	    <div class="col-md-2">
        	    
        	        <img src="<c:url value='/getMemberImage/${poster.memberId}.jpg' />" class="img img-rounded img-fluid"/>
        	        <p class="text-secondary text-center">${poster.groupPostDate }</p>
        	    </div>
        	    <div class="col-md-10">
        	        <p>
        	            <a class="float-left" href="${pageContext.request.contextPath}/member/other/${poster.memberId}"><strong>${poster.memberName }</strong></a>
        	           <c:if test="${sessionScope.memberId == poster.memberId}"> 
        	           <form id="DeleteGroupMessage" action="${pageContext.request.contextPath}/DeleteGroupPost" method="post">
        	           <input type="hidden"  name="groupPostId" value="${poster.groupPostId}">
        	           <input type="hidden"  name="memberId" value="${poster.memberId}">
        	           <input type="hidden"  name="groupId" value="${poster.groupId}">    
						<a class="float-right">
						<button  type="submit" class="btn btn-dark delete">刪除文章</button>
						</a>
						</form>
						</c:if>
        	       </p>
        	       <div class="clearfix"></div>
        	        <p> ${poster.groupPostText }</p>
        	        <p> 
        	        	
        	            <a   class="float-right btn btn-outline-primary ml-2" href="${pageContext.request.contextPath}/report/${poster.memberId}/${poster.memberName}" > <i class="fa fa-reply"  ></i> 檢舉</a>
        	            
        	            <a class="float-right btn text-danger btn-light" id="like"> <i class="fa fa-heart"></i> Like</a>
<!--         	        <a class="float-right btn text-danger btn-light" id="like"> 變換按鈕-->
<!--         	        <a class="float-right btn text-white btn-danger" id="like"> 變換按鈕-->
                   </p>
                   
                   <c:if test="${poster.groupPostImage != null}">
                   <img class="img-thumbnail" alt="" width="50%" src="<c:url value='/getPostImage/${poster.groupPostId}.jpg' />">
        	       </c:if>	
        	    </div>
	        </div>
	       
	        <div id="chatbox">
	        
	        </div>
	    </div>
	</div>
	<br>
	<br>
	<c:choose>
	<c:when test="${Permission}">
		<div class="row align-items-center">
		
	  		<div class="mask" style="margin-left: 10%;">
				<img class="maskimg" src="${pageContext.request.contextPath}/getMemberImage/${sessionScope.memberId}" />
			</div>​
	  		
	  		<label style="margin-left: 2%;" for="usermsg"><i class="fa fa-pencil"></i></label>
	  		
	  		<textarea name="usermsg" autocomplete="off" type="text"
						id="usermsg" rows="5" cols="20" class="textarea"
						onFocus="if(this.value==this.defaultValue) this.value=''" onBlur="if(this.value=='') this.value=this.defaultValue"
						style="width: 65%; margin-left: 2%;">留言...... </textarea>
		</div>
	</c:when>
			<c:otherwise>
				<span class="d-block p-2 bg-dark text-white">
					社團成員才可以回文
				</span>
            </c:otherwise>
	 </c:choose>

</div>
		<!-- 		主文及回文 -->
		<!-- 		id="chatbox" 回文 -->
		
<!-- 		id="chatbox" 回文 -->

<!-- For fu -->

<%-- 						<c:if test="${sessionScope.memberName == }"> --%>
<!-- 						<button type="button" class="btn btn-sm btn-outline-secondary" -->
<!-- 							data-toggle="modal" data-target="#reportModal">檢舉</button> -->
<%-- 						</c:if> --%>
<!-- 					Modal管理者管理成員 -->
<!-- 		<div id="reportModal" class="modal inmodal fade" tabindex="-1" role="dialog" -->
<!-- 			aria-hidden="true" data-backdrop="static" data-keyboard="true"> -->
<!-- 			<div class="modal-dialog modal-lg modal-dialog-centered"> -->
<!-- 				<div class="modal-content"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h4 class="modal-title">檢舉申請表</h4> -->
<!-- 						<label class="col-5">檢舉人:</label> -->
<%-- 						<span >${sessionScope.memberName}</span> --%>
<!-- 						<button type="button" class="close" data-dismiss="modal" -->
<!-- 							onClick="window.location.reload()">&times;</button> -->
<!-- 					</div> -->
<!-- 					<div class="modal-body"> -->
<!-- 						<div class="container"> -->

<!-- 							<div class="row justify-content-end"> -->


								
									
<!-- 									<div class="col-8 div-a apply" id="postename"> -->
<%-- 										<span >${poster.memberName }</span> --%>
<%-- 										<span style="display:none; background-color:Blue">${poster.memberId}</span> --%>
<!-- 										<span style="display:none; background-color:Blue"></span> -->
<!-- 									</div> -->
<!-- 									<div class="col div-a apply" id="reportbutton"> -->
<!-- 										<button id="reportConfirm"  data-toggle="modal" data-target="#reportModal2" -->
<!-- 											class="btn btn pull-right btn-primary" onclick="accept(this)">檢舉</button> -->
<!-- 									</div> -->
									

<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<button class="btn" class="close" data-dismiss="modal" -->
<!-- 							onClick="window.location.reload()">Cancel</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- <!-- 	點選reportConfirm的button後出現的modal確認檢舉表	 --> 
<!-- 		<div id="reportModal2" class="modal inmodal fade" tabindex="-1" role="dialog" -->
<!-- 			aria-hidden="true" data-backdrop="static" data-keyboard="true"> -->
<%-- 			<from action="${pageContext.request.contextPath}/report/${groupId}" method="POST"> --%>
<!-- 			<div class="modal-dialog modal-lg modal-dialog-centered" > -->
<!-- 				<div class="modal-content"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h4 class="modal-title" class="col-8 div-a apply">確認單</h4> -->
						
<!-- 						<label class="col-4 div-a apply">檢舉人:</label> -->
<%-- 						<span >${sessionScope.memberName}</span> --%>
<!-- 						<button type="button" class="close" data-dismiss="modal" -->
<!-- 							onClick="window.location.reload()">&times;</button> -->
<!-- 					</div> -->
<!-- 					<div class="modal-body"> -->
<!-- 						<div class="container"> -->

<!-- 							<div class="row justify-content-end"> -->

<%-- 							<span class="col-8 div-a apply">確定要檢舉${poster.memberName}?</span> --%>
<!-- 	<button id="reportConfirm2"  type="submit" -->
<!-- 		class="btn btn pull-right btn-primary" >是</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<button class="btn" class="close" data-dismiss="modal" -->
<!-- 							onClick="window.location.reload()">Cancel</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			</from> -->
<!-- 		</div> -->
<!-- For fu -->
			<footer style="height:50px"></footer>

		</section>
		<!-- 	test --> 
		</main>
	</div>
	<!-- 請把所有內容寫在此div內 -->

</body>
</html>