<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/grouptype.css'/>">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://code.jquery.com/jquery-1.12.4.min.css">
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
</style>
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
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
		<jsp:include page="${request.contextPath}/group/group_navbar" />
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <!-- 	test -->

		<section>
			<div class="side">
				<div class="user">
					<div class="user_name">${poster.memberName }</div>
					<div class="user_img">
						<img
							src="<c:url value='/getMemberImage/${poster.memberId}.jpg' />"
							class="" src="logo.jpg" alt="Responsive image">
					</div>
				</div>
			</div>
			<div class="post">
				<div class="post_title">
					<h3>${poster.groupPostTitle }</h3>
				</div>
				<div class="post_date">${poster.groupPostDate }</div>
				<div class="post_content">
					<p>${poster.groupPostContent }</p>
				</div>
			</div>
		</section>
<!-- 		作為分隔線 -->
<hr>
<!-- 		作為分隔線 -->
		<div>
			<div>
				<h5>回文區</h5>
			</div>
			<div>
				<div id="chatbox"></div>
				
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

	<!-- 請把所有內容寫在此div內 -->

</body>
</html>