<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<style>
	.group-navbar {
		font-size: 24px;
		margin: auto;
	}
</style>
<script>
	$(document).ready(function(){
		var url = location.href;
		
		if (url.search("my_group") != -1)
			$("#my-group-link").addClass("active");
		if (url.search("joined_group") != -1)
			$("#joined-group-link").addClass("active");
		if (url.search("request_group") != -1)
			$("#request-group-link").addClass("active");
	});
	
	
</script>
<nav class="navbar navbar-expand-sm navbar-light bg-light">
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav group-navbar">
      <a href="${pageContext.request.contextPath}/member/self/group/my_group" id="my-group-link" class="nav-item nav-link" href="#">我所創立</a>　　　
       <a href="${pageContext.request.contextPath}/member/self/group/joined_group" id="joined-group-link" class="nav-item nav-link" href="#">申請成功</a>　　　
      <a href="${pageContext.request.contextPath}/member/self/group/request_group" id="request-group-link" class="nav-item nav-link" href="#">待接受申請</a>　
    </div>
  </div>
</nav>