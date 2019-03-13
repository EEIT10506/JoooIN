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
		friendShow();
		
		$(".friendBtn").click(function(){
			friendProcess(this.id);
		});
	});
	
	function friendShow(){
		var otherMemberId = parseInt(location.href.substr(location.href.lastIndexOf("/") + 1));
		$.ajax({
		    type: "GET",
		    url: "${pageContext.request.contextPath}/member/friendShow",
		    data: {"otherMemberId":otherMemberId},
		    success: function (status) {
// 		    	alert(status);
		    	if (status == "NOT_FRIEND") {
		    		$(".friendBtn").css("display", "none");
		    		$("#request").css("display", "inline");
		    		$("#friendText").text("無好友關係");
		    	}
		    	if (status == "REQUEST") {
		    		$(".friendBtn").css("display", "none");
		    		$("#cancel").css("display", "inline");
		    		$("#friendText").text("好友申請中");
		    	}
		    }
		});
	}
	
	function friendProcess(process){
		var otherMemberId = parseInt(location.href.substr(location.href.lastIndexOf("/") + 1));
		
		$.ajax({
		    type: "POST",                           
		    url: "${pageContext.request.contextPath}/member/friendProcess",
		    data: {"otherMemberId": otherMemberId, "process": process},
		    success: function (notLogin) {
		    	if (notLogin)
		    		location.href = "${pageContext.request.contextPath}/notLogin";
		    	else 
		    		friendShow();
		    }
		});
	}
	
</script>
<title>會員</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/other/sidebar"/>
			</div>
			<div id="x" class="col-9">
				<button id="request" type="button" class="friendBtn btn btn-primary">申請好友</button>
				<button id="cancel" type="button" class="friendBtn btn btn-secondary">取消申請</button>
				<button id="agree" type="button" class="friendBtn btn btn-success">同意</button>
				<button id="reject" type="button" class="friendBtn btn btn-danger">拒絕</button>
				<button id="delete" type="button" class="friendBtn btn btn-danger">解除好友</button>
				<label>　好友關係：</label><label id="friendText"></label>
			</div>
		</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>