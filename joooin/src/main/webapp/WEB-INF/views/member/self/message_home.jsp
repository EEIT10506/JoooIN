<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html class=''>
<head>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://use.typekit.net/hoy3lrg.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<link rel="stylesheet" href='<c:url value="/resources/css/message.css" />'>
<style>
	.name {
		position: relative;
		top: 6px;
	}
	.contact {
		height: 60px;
	}
	#my-name {
		position: relative;
		top: -5px;
	}
	#tip {
		font-size: 30px;
		text-align: center;
		vertical-align: middle;
		position: absolute;
		left: 30%;
		top: 50%;
		height: 500px;
	}
</style>
<script>
	$(document).ready(function(){
		
		$(".contact").click(function(){
			var hash = $(this).children();
			location.href = "${pageContext.request.contextPath}/member/message/" + hash[0].value;
		});
		
	});
</script>
</head>
<body>

<div id="frame">
	<div id="sidepanel">
		<div id="profile">
			<div class="wrap">
				<img id="profile-img" src="<c:url value='/getMemberImage/${myself.memberId}' />" class="online" alt="" />
				<p id="my-name">${myself.memberName}</p>
			</div>
		</div>
		<div id="search">
			<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
			<input type="text" placeholder="搜尋好友..." />
		</div>
		<div id="contacts">
			<ul>
<!-- 				<li class="contact"> -->
<!-- 					<div class="wrap"> -->
<!-- 						<span class="contact-status online"></span> -->
<!-- 						<img src="http://emilcarlsson.se/assets/louislitt.png" alt="" /> -->
<!-- 						<div class="meta"> -->
<!-- 							<p class="name">Louis Litt</p> -->
<!-- 							<p class="preview">You just got LITT up, Mike.</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li> -->
				<c:forEach var="friend" items="${friendList}">
					<li class="contact active">
						<input type="hidden" value="${friend.messageHash }">
						<div class="wrap">
							<span class="contact-status busy"></span>
							<img src="<c:url value='/getMemberImage/${friend.memberId}.jpg' />">
							<div class="meta">
								<p class="name">${friend.memberName}</p>
<!-- 								<p class="preview">Wrong. You take the gun, or you pull out a bigger one. Or, you call their bluff. Or, you do any one of a hundred and forty six other things.</p> -->
							</div>
						</div>
					</li>
				</c:forEach>
				
			</ul>
		</div>
	</div>
<!-- 	右訊息區 -->
	<div class="content">
		<div id="tip">請點選好友進行聊天</div>
	</div>
</div>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script >

	$(".messages").animate({ scrollTop: $(document).height() }, "fast");
	
	$("#profile-img").click(function() {
		$("#status-options").toggleClass("active");
	});
	
	$(".expand-button").click(function() {
	  $("#profile").toggleClass("expanded");
		$("#contacts").toggleClass("expanded");
	});
	
	$("#status-options ul li").click(function() {
		$("#profile-img").removeClass();
		$("#status-online").removeClass("active");
		$("#status-away").removeClass("active");
		$("#status-busy").removeClass("active");
		$("#status-offline").removeClass("active");
		$(this).addClass("active");
		
		if($("#status-online").hasClass("active")) {
			$("#profile-img").addClass("online");
		} else if ($("#status-away").hasClass("active")) {
			$("#profile-img").addClass("away");
		} else if ($("#status-busy").hasClass("active")) {
			$("#profile-img").addClass("busy");
		} else if ($("#status-offline").hasClass("active")) {
			$("#profile-img").addClass("offline");
		} else {
			$("#profile-img").removeClass();
		};
		
		$("#status-options").removeClass("active");
	});
	
	
	$('.submit').click(function() {
		var message = $("#text").val();
		if($.trim(message) == '') return false;
		send(message);
	});
	
	$('.submit').on('keypress', function(e) {
		if (e.which == 13) {
			newMessage();
			return false;
		}
	});
//# sourceURL=pen.js
</script>
</body></html>