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
<script src="js/bootstrap.min.js"></script>
<script>

</script>
<body>
<!-- <nav class="navbar navbar-default"> -->
 
<!--   <ul class="navbar-nav"> -->
<!--     <li class="nav-item"> -->
<%--       <a class="nav-link" href="${pageContext.request.contextPath}/">返回上一頁</a> --%>
<!--     </li> -->
<!--     <li class="nav-item"> -->
<%--       <a class="nav-link" href="${pageContext.request.contextPath}/">關於 ${groupMain.groupName}</a> --%>
<!--     </li> -->
<!--     <li class="nav-item"> -->
<%--       <a class="nav-link" href="${pageContext.request.contextPath}/">社團成員</a> --%>
<!--     </li> -->
<!--     <li id="loginNregister" class="nav-item"> -->
<%--       <a class="nav-link" href="${pageContext.request.contextPath}/">最新活動</a> --%>
<!--     </li> -->
<!--     <li id="hasLogin" class="nav-item"> -->
<%--       <a class="nav-link"" href="${pageContext.request.contextPath}/member/my">Reports</a> --%>
<!--     </li> -->
<!--     <li id="hasLogin" class="nav-item"> -->
<%--       <a class="nav-link"" href="${pageContext.request.contextPath}/admin">其他相關類型社團</a> --%>
<!--     </li> -->
<!--   </ul> -->
<!-- </nav> -->

<!-- <nav class="navbar navbar-default " role="navigation"> -->
<!--     <div class="nav nav-tabs "> -->
<!--         <button type="button" class="navbar-toggle " data-toggle="collapse" -->
<!--                 data-target="#left-navbar-collapse"> -->
<!--             <span class="sr-only">功能選單</span> -->
<!--             <span class="icon-bar"></span> -->
<!--             <span class="icon-bar"></span> -->
<!--             <span class="icon-bar"></span> -->
<!--         </button> -->
<!--         <ul class="nav nav-tabs " > -->
<!--         <li class="navbar-header"><a class="navbar-brand col-md-12" href="#">功能選單</a></li> -->
<!--         </ul> -->
<!--     </div> -->
<!--     <div class="collapse navbar-collapse " id="left-navbar-collapse"> -->
<!--         <ul class="nav nav-tabs nav-stacked " > -->
<!--                     <li>選單一</li> -->
<!--           <li>選單二</li> -->
<!--           <li>選單三</li> -->
<!--         </ul> -->
<!--     </div> -->

		<div class="container-fluid">
			<div class="row">
				<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
											<ul class="nav flex-column">
					<div class=.pull-right>
						<ul id="menu" class="nav flex-column">
							<li class="nav-item"><a class="nav-link active"
								href="${pageContext.request.contextPath}/group/about/${groupMain.groupId}">
									<span data-feather="home"></span> 返回上一頁 <span
									class="sr-only"></span>
							</a></li>
							<li class="nav-item"><a class="nav-link active"
								href="${pageContext.request.contextPath}/group/about/${groupMain.groupId}">
									<span data-feather="home"></span> 關於 ${groupMain.groupName} <span
									class="sr-only"></span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/group/members/${groupMain.groupId}">
									<span data-feather="file">社團成員</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="shopping-cart"></span> 發文
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="users"></span> 聊天
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="bar-chart-2"></span> Reports
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="layers"></span> Integrations
							</a></li>
						</ul>
						</div>
						</ul>
						</div>
						</nav>
						</div>
						
				</div>

</body>
</html>