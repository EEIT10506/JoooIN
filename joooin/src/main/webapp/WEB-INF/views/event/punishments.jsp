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
	#btns {visibility: hidden;}
	
</style>
<script>
	$(document).ready(function(){
		var eventId = ${eventId}
		$("#btns").click();
		
		$("#backToIndex").click(function(){
			location.href = "${pageContext.request.contextPath}/";
		}); 
		setTimeout(function() { 
			$("#backToIndex").click();
	    }, 3000);
		 
	});
</script>
<title></title>
</head>
<body>
<button id="btns" type="button" class="btn btn-primary" data-toggle="modal" data-target="#punish"></button>

<!-- Modal -->
<div class="modal fade" id="punish" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle" style="font-family:微軟正黑體;font-weight:bold;font-size:30px;color:red;">警告</h5>
      </div>
      <div class="modal-body" style="font-family:微軟正黑體;font-weight:bold;font-size:20px;">
       	使用者被檢舉懲罰中  將在三秒後返回首頁
      </div>
      <div class="modal-footer">
      	<button id="backToIndex" type="button" class="btn btn-primary">回到首頁</button>
       
      </div>
    </div>
  </div>
</div>
</body>
</html>