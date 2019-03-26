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
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 120px;
	}
	#main-view{
		position: relative;
	}
	.profile-navbar {
		font-size: 24px;
		margin: auto;
	}
	.profile-view {
		font-size: 20px;
	}
	.param-label {
		width: 150px;
		display: inline-block;
		text-align: right;
		margin-bottom: 20px;
	}
</style>
<script>
	$(document).ready(function(){
		
		
	});
	
	
</script>
<title>${memberMainBean.memberName} 的會員資訊</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/other/sidebar"/>
			</div>
			<div class="col-9">
				<nav class="navbar navbar-expand-sm navbar-light bg-light">
				  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				    <div class="navbar-nav profile-navbar">
				      <a id="show-data-link" class="profile-link nav-item nav-link active" href="#">${memberMainBean.memberName } 的會員資訊</a>
				    </div>
				  </div>
				</nav>
				<div id="main-view">
					<br /><br />
					<div id="show-data" class="profile-view">
						<div class="param-label">名稱：</div>　${memberMainBean.memberName } <br />
						<div class="param-label">性別：</div>
							<c:choose>
								<c:when test="${memberMainBean.genderDisplay == true}">
									<c:if test="${memberMainBean.gender == 'male'}">　男</c:if>
									<c:if test="${memberMainBean.gender == 'female'}">　女</c:if>
								</c:when>
								<c:otherwise>　不透漏</c:otherwise>
							</c:choose><br />
						<div class="param-label">生日：</div>
							<c:choose>
								<c:when test="${memberMainBean.birthdayDisplay == true}">
								　${memberMainBean.birthday }
								</c:when>
								<c:otherwise>　不透漏</c:otherwise>
							</c:choose><br />
						<div class="param-label">城市：</div>
							<c:choose>
								<c:when test="${memberMainBean.cityDisplay == true}">
								　${memberMainBean.city }
								</c:when>
								<c:otherwise>　不透漏</c:otherwise>
							</c:choose><br />
						<div class="param-label">信箱：</div>
							<c:choose>
								<c:when test="${memberMainBean.emailDisplay == true}">
								　${memberMainBean.email }
								</c:when>
								<c:otherwise>　不透漏</c:otherwise>
							</c:choose><br />
						<div class="param-label">電話：</div>
							<c:choose>
								<c:when test="${memberMainBean.phoneDisplay == true}">
								　${memberMainBean.phone }
								</c:when>
								<c:otherwise>　不透漏</c:otherwise>
							</c:choose><br />
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>