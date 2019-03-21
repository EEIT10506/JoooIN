<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<style>
#menu {
  position: fixed;
  left: 15;
  top: 25%;
  width: 8em;
  margin-top: -2.5em;

}


#menu {
	position: fixed;
	left: 15;
	top: 25%;
	width: 8em;
	margin-top: -2.5em;
}
</style>

<script>

</script>
<body>

		<div class="container-fluid">
			<div class="row">
				<nav class="col-md-2 d-none d-md-block bg-light sidebar navbar-light bg-info">
				<div class="sidebar-sticky">
<!-- 					<ul class="nav flex-column navbar-dark"> -->
					<div class=.pull-right>
						<ul id="menu" class="list-group list-group-flush">
							<li class="list-group-item "><a class="nav-link active"
								href="${pageContext.request.contextPath}/group/${groupMain.groupId}">
									<span data-feather="home"></span> ${groupMain.groupName}<span
									class="sr-only"></span>
							</a></li>
							<li class="list-group-item "><a class="nav-link active"
								href="${pageContext.request.contextPath}/group/about/${groupMain.groupId}">
									<span data-feather="home"></span> 關於 ${groupMain.groupName} <span
									class="sr-only"></span>
							</a></li>
							<li class="list-group-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/group/members/${groupMain.groupId}">
									<span data-feather="file">社團成員</span>
							</a></li>
							<li class="list-group-item"><a class="nav-link" 
								href="${pageContext.request.contextPath}/group/addpost/${groupMain.groupId}"> <span
									data-feather="shopping-cart"></span> 發文
							</a></li>
							<li class="list-group-item"><a class="nav-link" href="#"> <span
									data-feather="users"></span> 聊天
							</a></li>
							<li class="list-group-item"><a class="nav-link" href="#"> <span
									data-feather="bar-chart-2"></span> 相簿
							</a></li>
							<li class="list-group-item"><a class="nav-link" href="#"> <span
									data-feather="layers"></span> 投票
							</a></li>
						</ul>
						</div>
<!-- 						</ul> -->
						</div>
						</nav>
						</div>
						
				</div>

</body>
</html>