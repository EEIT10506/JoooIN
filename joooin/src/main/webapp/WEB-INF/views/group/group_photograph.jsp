<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://code.jquery.com/jquery-1.12.4.min.css">	
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
	
<!-- photograph -->
<!-- <link rel="stylesheet" href="http://jquery.hoverZoom.css"> -->
<!-- <script src="http://jquery.hoverZoom.min.js"></script> -->
<!-- photograph -->

<style>

	*{
	font-family:微軟正黑體;
	}
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 120px;
	}
	table{
   	
   	width: 770px; 	
/*    	自動斷行 */
   	word-wrap: break-word;
   	table-layout: fixed;
   }
/* 讓照片大小一致    */
   .mask {
   	position: relative;
    float: left;
    width:  100px;
    height: 100px;
    background-position: 50% 50%;
    background-repeat:   no-repeat;
    background-size:     cover;
  	overflow: hidden;
	}
	.maskimg {
	max-width: 100%;
	}
/* 讓照片大小一致    */

/* center */
	.centered {
	  margin: auto;
	  width: 50%;
	  padding: 10px;
	}  
/* center */

</style>

<title>Insert title here</title>
</head>
<body>

	<jsp:include page="${request.contextPath}/navbar" />
	
	
<!-- 請把所有內容寫在此div內 -->

<div id="main">
	
<jsp:include page="${request.contextPath}/group/group_navbar" />	
	
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">


<script>
$(document).ready(function(){	
	
	
	$('img.zoomable').css({cursor: 'pointer'}).on('click', function () {
	  var img = $(this);
	  
	  var member = $(this).next().val() + " 張貼";
	  var postdate = $(this).next().next().val();
	  var txt_member = $("<p></p>").text(member).css("color", "white");
	  var txt_date = $("<p></p>").text(postdate).css("color", "white");
	  
	  var bigImg = $('<img />').css({
	    'max-width': '100%',
	    'max-height': '100%',
	    'display': 'inline',
	    'margin-top': '5%'
	  });
	  bigImg.attr({
	    src: img.attr('src'),
	    alt: img.attr('alt'),
	    title: img.attr('title')
	  });
	  var over = $('<div />').text(' ').css({
	    'height': '100%',
	    'width': '100%',
	    'background': 'rgba(0,0,0,.82)',
	    'position': 'fixed',
	    'top': 0,
	    'left': 0,
	    'opacity': 0.0,
	    'cursor': 'pointer',
	    'z-index': 9999,
	    'text-align': 'center'
	  }).append(bigImg).append(txt_member).append(txt_date).bind('click', function () {
	    $(this).fadeOut(300, function () {
	      $(this).remove();
	    });
	  }).insertAfter(this).animate({
	    'opacity': 1
	  }, 300);
	});
	
	
});
</script>	


<div class="container">
  <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0"> <strong>社團相簿</strong></h1>
  <hr class="mt-2 mb-5">
  <div class="row text-center text-lg-left">

<!--  	for each -->
	<c:forEach items="${groupPhotoes}" var="photo">
	<c:if test="${photo.groupPostImage != null }">
	 <div class="col-lg-3 col-md-4 col-6">
		 <div class="d-block mb-4 h-100 " style='padding: 5px;'>
		    <img class="zoomable centered rounded mx-auto d-block img-thumbnail" style='width:80%;' src="${pageContext.request.contextPath}/getPostImage/${photo.groupPostId}" />
			<input type=hidden value="${photo.memberName}">		    
			<input type=hidden value="${photo.groupPostDate}">		    
		  </div>
	  </div>
	  </c:if>
	 </c:forEach>
<!--  	for each -->
  </div>
  </div>
</div>	
</div>
<!-- 請把所有內容寫在此div內 -->

</body>
</html>