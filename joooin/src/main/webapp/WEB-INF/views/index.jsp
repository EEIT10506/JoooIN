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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
</style>
<title>Insert title here</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
		<div class="title"></div>
			<div class="bd-example" style="width:1200px;height:300px;margin:auto;background-color:#48D1CC;">
				  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" >
				    <ol class="carousel-indicators">
				      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
				      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
				      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				      
				    </ol>
				    <div class="carousel-inner">
				      <div class="carousel-item active" style="width:1200px;height:230px;margin-top:20px;">
				        <a href="#"><img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;display:inline;"></a>

				        <a href="#"><img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;display:inline;"></a>
				        <a href="#"><img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;display:inline;"></a>

				        <div class="carousel-caption d-none d-block" style="margin-left:10px;background-color:red;height:50px;position:relative;top:300px;">
				         		
				        </div>
				        
				      </div>
				      
				      
				      <div class="carousel-item" style="width:1200px;height:230px;margin-top:20px;">
				         <img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;display:inline;">
				        <img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;display:inline;">
				        <img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;display:inline;">
				        <div class="carousel-caption d-none d-md-block">
				          <h5>Second slide label</h5>
				          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				        </div>
				      </div>
				      <div class="carousel-item" style="width:1200px;height:230px;margin-top:20px;">
				         <img src="<c:url value='/resources/img/cover_other.jpg'/>" alt="其他"  style="margin-left:90px;width:320px;height:230px;display:inline;">
				        <img src="<c:url value='/resources/img/cover_sport.jpg'/>"  alt="運動"  style="margin-left:20px;width:320px;height:230px;display:inline;">
				        <img src="<c:url value='/resources/img/cover_food.jpg'/>" alt="食物"  style="margin-left:20px;width:320px;height:230px;display:inline;">
				        <div class="carousel-caption d-none d-md-block">
				          <h5>Third slide label</h5>
				          <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
				        </div>
				      </div>
				    </div>
				    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev" style="background-color:#696969;width:40px;height:150px;">
				      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next"  style="background-color:#696969;color:black;width:40px;height:150px;">
				      <span class="carousel-control-next-icon" aria-hidden="true" ></span>
				      <span class="sr-only">Next</span>
				    </a>
				  </div>
			</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
	</div>
</body>
</html>