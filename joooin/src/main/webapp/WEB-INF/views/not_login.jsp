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
	#btn, #str{visibility: hidden;}
</style>
<script>
	$(document).ready(function(){
		$("#btn").click();
		
		$("#login").click(function(){
			location.href = $("#str").text() + "/login";
		});
		$("#register").click(function(){
			location.href = $("#str").text() + "/register";
		});
	});
</script>
<title></title>
</head>
<body>
<p id="str">${pageContext.request.contextPath}</p>
<button id="btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"></button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">尚未登入</h5>
      </div>
      <div class="modal-body">
       	您尚未登入，請先登入來使用此功能
      </div>
      <div class="modal-footer">
      	<button id="login" type="button" class="btn btn-primary">登入</button>
        <button id="register" type="button" class="btn btn-primary">註冊</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>