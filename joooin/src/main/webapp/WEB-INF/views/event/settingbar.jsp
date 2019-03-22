<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
	.barBorder{
		margin:auto;
		width:200px;
		height:60px;
		font-size:25px;
		font-weight:900px;
		font-family:微軟正黑體;
		background-color:	#828282;
		color:white;
		border-radius:100px;
		text-align:center;
		position:relative;
		top:0px;
	}
	.barBorder:hover{
		background-color:	#696969;
		color:white;
	}
	.active{
		background-color:#8B4513 !important;
	}
	#back{
		width:100px;
		font-size:30px;	
	}
	.disabled {
    pointer-events: none;
    cursor: default;
    opacity: 0.8;
    color:black !important;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(document).ready(function(){
		if (location.href.search("setting") != -1)
			$("#setting").attr("class", "nav-link barBorder active");
		else if (location.href.search("signUp") != -1)
			$("#signUp").attr("class", "nav-link barBorder active");
		else if (location.href.search("participated") != -1)
			$("#participated").attr("class", "nav-link barBorder active");
		else if (location.href.search("attended") != -1)
			$("#attended").attr("class", "nav-link barBorder active");
		else 
			$("#back").attr("class", "nav-link  barBorder active");
	});
});
</script>
<body>
	<ul class="nav nav-pills nav-fill">
  <li class="nav-item">
    <a id="setting" class="nav-link barBorder" href="${pageContext.request.contextPath}/event/setting/${event.eventId}">活動內容修改</a>
  </li>
  <li class="nav-item">
    <a id="signUp" class="nav-link barBorder" href="${pageContext.request.contextPath}/event/signUp/${event.eventId}">報名申請名單</a>
  </li>
  <li class="nav-item">
    <a id="participated" class="nav-link barBorder" href="${pageContext.request.contextPath}/event/participated/${event.eventId}">已參加成員</a>
  </li>
 <c:if test="${eventFinished == false and event.eventStatus == 'yes'}">
   <li class="nav-item">
    <a id="attended" class="nav-link barBorder" href="${pageContext.request.contextPath}/event/attended/${event.eventId}">成員出席狀況</a>
  </li>
 </c:if>
 <c:if test="${eventFinished == false and event.eventStatus != 'yes'}">
   <li class="nav-item">
    <a id="attended" class="nav-link barBorder disabled" href="${pageContext.request.contextPath}/event/attended/${event.eventId}">成員出席狀況</a>
  </li>
 </c:if>
  <c:if test="${eventFinished == true}">
   <li class="nav-item">
    <a id="attended" class="nav-link barBorder disabled" href="${pageContext.request.contextPath}/event/attended/${event.eventId}">成員出席狀況</a>
  </li>
 </c:if>
  <li class="nav-item">
    <a id="back" class="nav-link barBorder" href="${pageContext.request.contextPath}/event/${event.eventId}">返回</a>
  </li>
</ul>
		 
</body>
</html>