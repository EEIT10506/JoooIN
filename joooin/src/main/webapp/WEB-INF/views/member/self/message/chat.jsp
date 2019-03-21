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
<script src="<c:url value='/resources/js/md5.js'/>"></script>
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
	textarea {
		font-family: "proxima-nova",  "Source Sans Pro", sans-serif;
	    float: left;
	    border: none;
	    width: calc(100% - 90px);
	    padding: 11px 32px 10px 8px;
	    font-size: 0.8em;
	    color: #32465a;
		
	}
	@media screen and (max-width: 735px) {
    textarea {
    	padding: 15px 32px 16px 8px;
    }

</style>
<script>
	var myMD5 = hex_md5("${memberId}");

	var websocket = null;
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/joooin/member/message/${hash}");
	}
	else if ('MozWebSocket' in window) {
		websocket = new MozWebSocket("ws://localhost:8080/joooin/member/message/${hash}");
	}
	
	function onMessage(message) {
		var messageMD5 = message.data.substring(0, 32);
		var d = new Date();
		var month = d.getMonth() + 1;  if (month < 10) month = "0" + month;
		var minute = d.getMinutes();   if (minute < 10) minute = "0" + minute;
		var date = d.getFullYear() + "-" + month + "-" + d.getDate() + " " + d.getHours() + ":" + minute;
		
		if (myMD5 == messageMD5){
			$('<li class="replies"><p>' + message.data.substr(32) + '</p></li>').appendTo($('.messages ul'));
			$('<div class="repliesText" style="text-align:right;position:relative;right:10px;margin-bottom: 15px;">' + date + '</div>').appendTo($('.messages ul'));
		} else {
			$('<li class="sent"><p>' + message.data.substr(32) + '</p></li>').appendTo($('.messages ul'));
			$('<div class="sentText" style="text-align:left;position:relative;left:15px;margin-bottom: 15px;">' + date + '</div>').appendTo($('.messages ul'));
			
// 			console.log($(":focus"));
			
		}
		$('.message-input #text').val(null);
// 		$('.contact.active .preview').html('<span>You: </span>' + message.data);
 		$("#messageView").animate({ scrollTop: 999999 }, "fast");
	}
	
	function send(text) {
		if (websocket.readyState == websocket.OPEN) {
			websocket.send(text);
		} else {
			alert("連線失敗，請重新整理");
		}    
	}
	
	function onError() {alert("連線失敗，請重新整理");}
	websocket.onmessage = onMessage;
	window.close = function() {websocket.onclose();}
	function websocketClose() {websocket.close();}
	
	
	$(document).ready(function(){
		$("#messageView").animate({ scrollTop: 999999 }, "fast");
		
		$('#send').click(function() {
			var text = $("#text").val();
			if($.trim(text) == '') return false;
	        var receiveMemberId = "${friend.memberId}";
			
			$.ajax({
			    type: "POST",                           
			    url: "${pageContext.request.contextPath}/member/self/message/saveText",
			    data: {"text": text, "receiveMemberId": receiveMemberId, "messageHash": "${hash}"},
			});
			
			send(myMD5 + text);
		});
		
		$('#text').on('keypress', function(e) {
			if (e.which == 13) {
				$("#send").click();
				return false;
			}
		});
		
		
	});
</script>
</head>
<body>
	<jsp:include page="${request.contextPath}/member/self/message"/>
<!-- 	右訊息區 -->
	<div class="content">
		<div alt="關閉對話" style="float:right;padding-right:18px;padding-top:18px;cursor: pointer">
			<a href="${pageContext.request.contextPath}/member/self/message">
				<img src="<c:url value='/resources/img/icon_close.png' /> ">
			</a>
		</div>
<!-- 		訊息區上方的對方頭像 -->
		<div class="contact-profile">
			<img src="<c:url value='/getMemberImage/${friend.memberId}.jpg' />" alt="" />
			<p>${friend.memberName }</p>
		</div>
<!-- 		訊息區內容 -->
		<div class="messages" id="messageView">
			<ul style="padding-bottom: 50px;">
				<c:forEach var="message" items="${message}">
					<c:choose>
						<c:when test="${message.sendMemberId != memberId}">
							<li class="sent">				
								<p>${message.messageText}</p>
							</li>
							<div class="sentText" style="text-align:left;position:relative;left:15px;">${message.messageDate}</div>
						</c:when>
						<c:otherwise>
							<li class="replies">
								<p>${message.messageText}</p>						
							</li>
							<div class="repliesText" style="text-align:right;position:relative;right:10px;">${message.messageDate}</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="message-input">
			<div class="wrap">
			<textarea rows="2" cols="57" id="text" type="text" placeholder="輸入訊息..." wrap="hard"/></textarea>
			<i class="fa fa-paperclip attachment" aria-hidden="true"></i>
			<button id="send"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
			</div>
		</div>
	</div>
</div>
</body></html>