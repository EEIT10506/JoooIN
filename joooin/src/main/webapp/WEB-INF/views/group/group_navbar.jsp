<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#menu {
  position: fixed;
  left: 15;
  top: 25%;
  width: 8em;
  margin-top: -2.5em;

}

body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 7.5%;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 15px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 20px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>
<script>
function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}

	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
</script>
<body>

		<div class="container-fluid">
			<div class="row">
			
			<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="${pageContext.request.contextPath}/group/${groupMain.groupId}">${groupMain.groupName}</a>
  <a href="${pageContext.request.contextPath}/group/about/${groupMain.groupId}">關於 ${groupMain.groupName}</a>
  <a href="${pageContext.request.contextPath}/group/members/${groupMain.groupId}">社團成員</a>
  <a href="${pageContext.request.contextPath}/group/addpost/${groupMain.groupId}">發文</a>
  <a href="#">聊天</a>
  <a href="#">相簿</a>
  <a href="#">投票</a>
</div>


<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; 選單</span>
			

			
						</div>
						
				</div>

</body>
</html>