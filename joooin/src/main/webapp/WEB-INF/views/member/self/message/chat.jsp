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
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src='<c:url value="/resources/js/md5.js" />' ></script>
<style>
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
			$('<li class="replies"><p style="word-wrap: break-word;">' + message.data.substr(32) + '</p></li>').appendTo($('.messages ul'));
			$('<div class="repliesText" style="text-align:right;position:relative;right:10px;margin-bottom: 15px;">' + date + '</div>').appendTo($('.messages ul'));
		} else {
			$('<li class="sent"><p style="word-wrap: break-word;">' + message.data.substr(32) + '</p></li>').appendTo($('.messages ul'));
			$('<div class="sentText" style="text-align:left;position:relative;left:15px;margin-bottom: 15px;">' + date + '</div>').appendTo($('.messages ul'));
			
			$.ajax({
			    type: "POST",                           
			    url: "${pageContext.request.contextPath}/member/message/setOneMessageRead",
			    data: {"messageHash": "${hash}"},
			});
			
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
			    url: "${pageContext.request.contextPath}/member/message/saveText",
			    data: {"text": text, "receiveMemberId": receiveMemberId, "messageHash": "${hash}"},
			});
			
			send(myMD5 + text);
		});
		
		$('#text').on('keypress', function(e) {
			if (e.which == 13 && !e.shiftKey) {
				$("#send").click();
				return false;
			}
		});
		
		
	});
</script>
<title>與會員 ${friend.memberName } 的聊天訊息</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/member/message"/>
<!-- 	右訊息區 -->
	<div class="content">
		<div alt="關閉對話" style="float:right;padding-right:18px;padding-top:18px;cursor: pointer">
			<a href="${pageContext.request.contextPath}/member/message">
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
								<p style="word-wrap: break-word;">${message.messageText}</p>
							</li>
							<div class="sentText" style="text-align:left;position:relative;left:15px;">${message.messageDate}</div>
						</c:when>
						<c:otherwise>
							<li class="replies">
								<p style="word-wrap: break-word;">${message.messageText}</p>						
							</li>
							<div class="repliesText" style="text-align:right;position:relative;right:10px;">${message.messageDate}</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="message-input">
			<div class="wrap">
			<textarea rows="2" cols="70" id="text" type="text" placeholder="輸入訊息..." wrap="hard"/></textarea>
			<button id="send"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
			</div>
		</div>
	</div>
</div>
</body></html>
