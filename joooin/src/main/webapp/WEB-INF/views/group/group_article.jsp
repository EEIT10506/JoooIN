<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/grouptype.css'/>">
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
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>	
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
//				console.log("List<reply>", result);
//				console.log("reply1", result[0].groupPostReplyContent);
			//顯示留言
			$("#chatbox").html("");
			for (var i = 0; i < result.length; i++) {
				$("#chatbox").append(
			        "<tr>" +
			            "<td>" + result[i].groupPostReplyContent + "</td>" +
			            "<td>" + result[i].groupPostReplyDate + "</td>" +
			        "</tr>");
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
// 						console.log("List<reply>", result);
// 						console.log("reply1", result[0].groupPostReplyContent);
						//顯示留言
						$("#chatbox").html("");
						for (var i = 0; i < result.length; i++) {
							$("#chatbox").append(
						        "<tr>" +
						            "<td>" + result[i].groupPostReplyContent + "</td>" +
						            "<td>" + result[i].groupPostReplyDate + "</td>" +
						        "</tr>");
						}
            		}, 
				});
				
				//submit form via ajax, this is not JS but server side scripting so not showing here
								
				$(this).val("");
				e.preventDefault();
			}
		});
	});
	
	function accept(butObj){
		
		$("postename").hide();
		$("reportbutton").hide();

		
// 		var groupId = ${groupMain.groupId};
// 		var memberId = target;
// 		var decide = "approve";
// 		$.ajax({
// 			type: "POST",                           
//     	    url: ,
//     	    data: {"groupId": groupId},
//             success: function (result) {
//             }, failure: function (result) {
//                 alert('系統異常');
//             }
		
// 		});
	}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">

		<jsp:include page="${request.contextPath}/group/group_navbar" />
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <!-- 	test -->

		<section>
		<table class="border border-secondary text-center" border='1'>
		 
		 <thead style="border:3px green solid;">
			
				<tr >
					
				
				<th rowspan="2"  >
					<span class="user_img" >
						<img
							src="<c:url value='/getMemberImage/${poster.memberId}.jpg' />"
							class="" src="logo.jpg" alt="Responsive image">
					</span>
				</th>
				<th width="50%">
					<span class="user_name" >發文人:${poster.memberName }</span>
				</th>
				<th>
					<span class="post_date">發文日期:${poster.groupPostDate }</span>
				</th>
				
				<tr >
						
					<th colspan="2">
						<span class="post_title">
						標題:${poster.groupPostTitle }
						</span>
<%-- 						<c:if test="${sessionScope.memberName == }"> --%>
						<button type="button" class="btn btn-sm btn-outline-secondary"
							data-toggle="modal" data-target="#reportModal">檢舉</button>
<%-- 						</c:if> --%>
					</th>
					
				
				</tr>	
				
			</thead>
			
			<tbody style="border:3px red solid;">
			
				
				<tr >
					<td colspan="3">
					<span class="post_content" >
					內容:${poster.groupPostContent }
					</span>
					</td>
				
				</tr>
				
			
			 </tbody>
			 
			</table>
					<!-- Modal管理者管理成員 -->
		<div id="reportModal" class="modal inmodal fade" tabindex="-1" role="dialog"
			aria-hidden="true" data-backdrop="static" data-keyboard="true">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">檢舉申請表</h4>
						<label class="col-5">檢舉人:</label>
						<span >${sessionScope.memberName}</span>
						<button type="button" class="close" data-dismiss="modal"
							onClick="window.location.reload()">&times;</button>
					</div>
					<div class="modal-body">
						<div class="container">

							<div class="row justify-content-end">


								
									
									<div class="col-8 div-a apply" id="postename">
										<span >${poster.memberName }</span>
										<span style="display:none; background-color:Blue">${poster.memberId}</span>
										<span style="display:none; background-color:Blue"></span>
									</div>
									<div class="col div-a apply" id="reportbutton">
										<button id="reportConfirm"  data-toggle="modal" data-target="#reportModal2"
											class="btn btn pull-right btn-primary" onclick="accept(this)">檢舉</button>
									</div>
									
									
								


							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn" class="close" data-dismiss="modal"
							onClick="window.location.reload()">Cancel</button>
					</div>
				</div>
			</div>
		</div>
<!-- 	點選reportConfirm的button後出現的modal確認檢舉表	 -->
		<div id="reportModal2" class="modal inmodal fade" tabindex="-1" role="dialog"
			aria-hidden="true" data-backdrop="static" data-keyboard="true">
			<from action="${pageContext.request.contextPath}/report/${groupId}" method="POST">
			<div class="modal-dialog modal-lg modal-dialog-centered" >
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" class="col-8 div-a apply">確認單</h4>
						
						<label class="col-4 div-a apply">檢舉人:</label>
						<span >${sessionScope.memberName}</span>
						<button type="button" class="close" data-dismiss="modal"
							onClick="window.location.reload()">&times;</button>
					</div>
					<div class="modal-body">
						<div class="container">

							<div class="row justify-content-end">

							<span class="col-8 div-a apply">確定要檢舉${poster.memberName}?</span>
	<button id="reportConfirm2"  type="submit"
		class="btn btn pull-right btn-primary" >是</button>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn" class="close" data-dismiss="modal"
							onClick="window.location.reload()">Cancel</button>
					</div>
				</div>
			</div>
			</from>
		</div>
		</section>
<!-- 		作為分隔線 -->
<hr>
<!-- 		作為分隔線 -->
		<div>
			<div>
				<h5>回文區</h5>
			</div>
			<br>
			<hr>
			<br>
			<div>
				<div id="chatbox"></div>
				<br>
				<hr>
				<br>
				<form name="message" action="">
					<textarea name="usermsg" autocomplete="off" type="text"
						id="usermsg" rows="4" cols="30" 
						onFocus="if(this.value==this.defaultValue) this.value=''" onBlur="if(this.value=='') this.value=this.defaultValue"
						style="width: 450px; margin-left: 25px;">按下Enter送出</textarea>
					<br />
					<p style="margin-left: 420px;">
<!-- 						<input name="submitmsg" type="submit" id="submitmsg" value="Send" /> -->
					</p>
				</form>
			</div>
		</div>
		<!-- 	test --> </main>
	</div>
<<<<<<< HEAD

<!-- 請把所有內容寫在此div內 -->

=======
	<br>
	<br>
	<br>
	<!-- 請把所有內容寫在此div內 -->
>>>>>>> refs/remotes/origin/陳昭樺

</body>
</html>