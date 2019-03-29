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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/grouptype.css'/>">
<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 120px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
/* .groupimg{ */
/* -webkit-clip-path: circle(42.9% at 50% 50%); */
/* clip-path: circle(42.9% at 50% 50%); */
/* } */
.groupbg{
clip-path: polygon(3% 0, 100% 0%, 97% 100%, 0% 100%);
}
</style>
<script>
// $( document ).ready(function() {
// 	var $len = 10; // 超過15個字以"..."取代
// 	$(".textacc").each(function(){
// 		console.log($(this).text());
// 	    if($(this).text().length > $len){
// 	        var $text=$(this).text().substring(0,$len-1)+"...";
// 	        $(this).text($text);
// 	    }
// 	});
// 	});
</script>
<title>社團分類結果</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">

		<div class="album py-5 bg-light ">
			<div class="container">
				<div class="row">

					<c:forEach var='groupsType' items='${groupsType}'>


						<div class="col-md-4">

							<div class="card mb-4 shadow-sm" style="border-radius:10px;">

								<a href="${pageContext.request.contextPath}/group/${groupsType.groupId}"><img

									 src="<c:url value='/getGroupImage/${groupsType.groupId} '/>" width="100%"  height="225" /></a>

								<div class="card-body text-left">
									<p class="card-text" style="color:#000000; text-align:left;font-weight:bold;font-size:20px;">團名:                ${groupsType.groupName}</p>
									<p class="card-text" style="color:#0000FF; text-align:left;font-weight:bold;" >類型:                ${groupsType.groupType}</p>
									<p class="card-text " style="color:#A9A9A9;font-size:13px;margin:5px;text-align:left;" >會員數量:                ${groupsType.groupCurrentMembers}</p>
									<p class="card-text textacc " style="color:#A9A9A9;font-size:13px;margin:5px;text-align:left;" >社團介紹:                ${groupsType.groupIntro}</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
										
										
<!-- 										入團按鈕 -->
<%-- 											<c:choose> --%>
<%-- 											<c:when test="isInGroup"> --%>
<%-- 												<form action="${pageContext.request.contextPath}/group/addgroup/${groupsType.groupId}" method="post"> --%>
<!-- 													<button type="submit" -->
<!-- 														class="btn btn-sm btn-outline-secondary">進入社團</button> -->
<%-- 												</form> --%>
<%-- 											</c:when> --%>
											
<%-- 											<c:when test="isInGroup"> --%>
<%-- 												<form action="${pageContext.request.contextPath}/group/addgroup/${groupsType.groupId}" method="post"> --%>
<!-- 													<button type="submit" -->
<!-- 														class="btn btn-sm btn-outline-secondary">申請中</button> -->
<%-- 												</form> --%>
<%-- 											</c:when> --%>
											

<%-- 											<c:otherwise> --%>
<%-- 												<form action="${pageContext.request.contextPath}/group/addgroup/${groupsType.groupId}" method="post"> --%>
<!-- 												<button type="submit" -->
<!-- 													class="btn btn-sm btn-outline-secondary">加入社團</button> -->
<%-- 												</form> --%>
<%-- 											</c:otherwise> --%>
<%-- 											</c:choose> --%>
<!-- 										入團按鈕 -->



										</div>
										<small class="text-muted"></small>
									</div>
								</div>
							</div>
						</div>


					</c:forEach>
					
					
					
				</div>
			</div>
		</div>

	</div>




	<!-- 請把所有內容寫在此div內 -->
</body>
</html>