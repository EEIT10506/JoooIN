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



<!-- 	comment style -->

<style>	
	*{
	font-family:微軟正黑體;
	}
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
table{
   	
   	width: 770px; 	
/*    	自動斷行 */
   	word-wrap: break-word;
   	table-layout: fixed;
   }	
</style>
<script type="text/javascript">
$( document ).ready(function() {
	var groupId = ${poster.groupId};
	var groupPostId = ${poster.groupPostId};
	$.ajax({
		type: "GET",                           
		url: "${pageContext.request.contextPath}/group/return/reply/"+groupPostId+"/group/"+groupId,
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
	                    	        "<p>"+"<a href='https://maniruzzaman-akash.blogspot.com/p/contact.html'>"+"<strong>"+result[i].memberName+"</strong>"+"</a>"+
	                    	        "<span class='float-right'>"+(i+1)+"樓"+"</i>"+"</span>"+"</p>"+
	                    	        "<p>"+result[i].groupPostReplyContent+"</p>"+
	                    	        "<p>"+
	                    	            "<a class='float-right btn btn-outline-primary ml-2'>"+"<i class='fa fa-reply'>"+"</i>"+"檢舉"+"</a>"+
	                    	       "</p>"+
	                    	    "</div>"+
	            	        "</div>"+
	            	    "</div>"+
	                "</div>");
						//結束擴增
			}
		}, 
	});
});

</script>
<script>
	// 送出回文
	$(function() {
		$("#usermsg").keypress(function(e) {
			 if(e.which == 13 && !e.shiftKey) { //按下enter不包含shift+enter
				 
				var reply_content = ($(this).val() + "<br/>"); 
				//submit form via ajax, this is not JS but server side scripting so not showing here
				
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
				                    	        "<p>"+"<a href='https://maniruzzaman-akash.blogspot.com/p/contact.html'>"+"<strong>"+result[i].memberName+"</strong>"+"</a>"+
				                    	        "<span class='float-right'>"+(i+1)+"樓"+"</i>"+"</span>"+"</p>"+
				                    	        "<p>"+result[i].groupPostReplyContent+"</p>"+
				                    	        "<p>"+
				                    	            "<a class='float-right btn btn-outline-primary ml-2'>"+"<i class='fa fa-reply'>"+"</i>"+"檢舉"+"</a>"+
				                    	       "</p>"+
				                    	    "</div>"+
				            	        "</div>"+
				            	    "</div>"+
				                "</div>");
								//結束擴增
						}
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
        	            <a class="float-left" href="https://Xxxxx.jo"><strong>${poster.memberName }</strong></a>
        	            

        	       </p>
        	       <div class="clearfix"></div>
        	        <p> ${poster.groupPostText }</p>
        	        <p>
        	            <a class="float-right btn btn-outline-primary ml-2"> <i class="fa fa-reply"></i> 檢舉</a>
        	            <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> Like</a>
                   </p>
                   <img class="img-thumbnail" src="">
        	    </div>
	        </div>
	        <div id="chatbox">
	        
	        </div>
	    </div>
	</div>
</div>
		<!-- 		主文及回文 -->
		<!-- 		id="chatbox" 回文 -->
		
		<textarea name="usermsg" autocomplete="off" type="text"
						id="usermsg" rows="4" cols="30" 
						onFocus="if(this.value==this.defaultValue) this.value=''" onBlur="if(this.value=='') this.value=this.defaultValue"
						style="width: 450px; margin-left: 25px;">按下Enter送出</textarea>
					<br />
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


		</section>
		<!-- 	test --> 
		</main>
	</div>
	<!-- 請把所有內容寫在此div內 -->

</body>
</html>