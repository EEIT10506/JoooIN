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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
</style>
<script>
	$(document).ready(function(){
		$("#inputMsg").on("keypress", function(e){
			if (e.which == 13) $("#sendMsg").click();});
		$("#sendMsg").click(function(){doSendUsers();});
		
	});
	
		
	var websocket = null;
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/joooin/websocket/socketServer");
	}
	else if ('MozWebSocket' in window) {
		websocket = new MozWebSocket("ws://localhost:8080/joooin/websocket/socketServer");
	}
	
	websocket.onopen = onOpen;
	websocket.onmessage = onMessage;
	websocket.onerror = onError;
	websocket.onclose = onClose;
	
	function onOpen(openEvt) {
		alert(openEvt.Data);
	}
	
	function onMessage(evt) {
		$("#text").append("<p>" + evt.data + "</p>");
		$("#inputMsg").val("");
	}
	function onOpen() {};
	function onError() {alert("连接失败!");}
	function onClose() {};
	
	function doSendUser() {
		if (websocket.readyState == websocket.OPEN) {
			var msg = document.getElementById("inputMsg").value;
			websocket.send("#anyone#"+msg);//调用后台handleTextMessage方法
		} else {
			alert("连接失败!");
		}
	}
	
	
	function doSendUsers() {
		if (websocket.readyState == websocket.OPEN) {
			var msg = document.getElementById("inputMsg").value;
			websocket.send("#everyone#"+msg);//调用后台handleTextMessage方法
		} else {
			alert("连接失败!");
		}    
	}
	
	
	window.close = function() {websocket.onclose();}
	function websocketClose() {websocket.close();}
</script>
<title>會員</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/self/sidebar"/>
			</div>
			<div id="x" class="col-9">
				請輸入訊息：<input id="inputMsg" name="inputMsg"></input>
<!-- 				<button onclick="doSendUser();">发送</button> -->
				<button id="sendMsg">傳送</button>
				<br /><br />
				<p id="text"></p>
			</div>
		</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>