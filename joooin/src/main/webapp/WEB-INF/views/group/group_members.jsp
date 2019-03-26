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
<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 120px;
}
.social-card-header{
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    height: 96px;
}
.social-card-header i {
    font-size: 32px;
    color:#FFF;
}
.bg-facebook {
    background-color:#3b5998;
}
.text-facebook {
    color:#3b5998;
}
.bg-google-plus{
    background-color:#dd4b39;
}
.text-google-plus {
    color:#dd4b39;
}
.bg-twitter {
    background-color:#1da1f2;
}
.text-twitter {
    color:#1da1f2;
}
.bg-pinterest {
    background-color:#bd081c;
}
.text-pinterest {
    color:#bd081c;
}
.share:hover {
        text-decoration: none;
    opacity: 0.8;
}	
</style>
<!-- 限制字數 -->
<script>
$( document ).ready(function() {
var $len = 15; // 超過15個字以"..."取代
$(".textacc").each(function(){
	console.log($(this).text());
    if($(this).text().length > $len){
        var $text=$(this).text().substring(0,$len-1)+"...";
        $(this).text($text);
    }
});
});
</script>
<!-- 限制字數 -->
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	
	
	
	
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	
<jsp:include page="${request.contextPath}/group/group_navbar" />	
		<!-- 	test -->
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
		<div class="content">
			<div class="container mt-3">
				<div class="row">
<!-- 				<div class="card-columns"> -->

<c:forEach var="member" items="${memberInfos}">
      <div class="col-md-6">
         <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
               <strong class="d-inline-block mb-2 text-primary"><a href="${pageContext.request.contextPath}/member/other/${member.memberId}">${member.memberName}</a></strong>
               <h6 class="mb-0">
               	<a>會員介紹 : </a>
                  <a class="text-dark textacc">${member.memberIntro }</a>
               </h6>
               
               <p class="card-text mb-auto">發文 :  ${member.postCount } 次</p>
                <p class="card-text mb-auto">回文 :  ${member.replyCount } 次</p>
                 <p class="card-text mb-auto">登入 :  ${member.logins } 次</p>
                 <c:if test="${leaderId == sessionScope.memberId }">
					<form action="${pageContext.request.contextPath}/group/${groupMain.groupId}/members/delete/${member.memberId}" method="post">
					<button type="submit" class="float-right btn btn-outline-danger" id="${member.memberId}"><strong>刪除成員</strong></button>
					</form>
				</c:if>
           
            </div>
            <img
								src="<c:url value='/getMemberImage/${member.memberId}.jpg' />"
								 class="card-img-right flex-auto d-none d-lg-block" alt="Thumbnail [200x250]"  style="width: 200px; height: 250px;"
								src="logo.jpg" alt="Responsive image">
         </div>
      </div>

</c:forEach>



<!-- 					</div> -->
				</div>
			</div>
		</div>
		<!-- 	test -->
	</div>
	
	<!-- 請把所有內容寫在此div內 -->
</body>
</html>