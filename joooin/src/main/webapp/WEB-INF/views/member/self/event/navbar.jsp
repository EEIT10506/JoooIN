<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<style>
	.event-navbar {
		font-size: 24px;
		margin: auto;
	}
</style>
<script>
	$(document).ready(function(){
		var url = location.href;
		
		if (url.search("my_event") != -1)
			$("#my-event-link").addClass("active");
		if (url.search("joined_event") != -1)
			$("#joined-event-link").addClass("active");
		if (url.search("request_event") != -1)
			$("#request-event-link").addClass("active");
		if (url.search("like_event") != -1)
			$("#like-event-link").addClass("active");
	});
	
	
</script>
<nav class="navbar navbar-expand-sm navbar-light bg-light">
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav event-navbar">
      <a href="${pageContext.request.contextPath}/member/self/event/my_event" id="my-event-link" class="event-link nav-item nav-link" href="#">我所創立</a>　　　
      <a href="${pageContext.request.contextPath}/member/self/event/joined_event" id="joined-event-link" class="event-link nav-item nav-link" href="#">報名成功</a>　　　
      <a href="${pageContext.request.contextPath}/member/self/event/request_event" id="request-event-link" class="event-link nav-item nav-link" href="#">待接受報名</a>　　
      <a href="${pageContext.request.contextPath}/member/self/event/like_event" id="like-event-link" class="event-link nav-item nav-link" href="#">喜歡</a>　　
    </div>
  </div>
</nav>