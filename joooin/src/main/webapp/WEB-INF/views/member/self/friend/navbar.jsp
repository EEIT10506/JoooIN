<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<style>
	.friend-navbar {
		font-size: 24px;
		margin: auto;
	}
</style>
<script>
	$(document).ready(function(){
		var url = location.href;
		$(".friend-link").removeClass("active");
		
		if (url.search("my_friend") != -1)
			$("#my-friend-link").addClass("active");
		if (url.search("request_friend") != -1)
			$("#request-friend-link").addClass("active");
		if (url.search("receive_friend") != -1)
			$("#receive-friend-link").addClass("active");
	});
</script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav friend-navbar">
      <a href="${pageContext.request.contextPath}/member/self/friend/my_friend" id="my-friend-link" class="friend-link nav-item nav-link" href="#">我的好友</a>　　　
      <a href="${pageContext.request.contextPath}/member/self/friend/request_friend" id="request-friend-link" class="friend-link nav-item nav-link" href="#">好友申請中</a>　　　
      <a href="${pageContext.request.contextPath}/member/self/friend/receive_friend" id="receive-friend-link" class="friend-link nav-item nav-link" href="#">好友受邀中</a>
    </div>
  </div>
</nav>