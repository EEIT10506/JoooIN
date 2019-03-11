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
		height: 2000px;
		margin: auto;
		position: relative;
		top: 50px;
	}
	#main-view{
		position: relative;
		left: 50px;
	}
	.profile-navbar {
		font-size: 24px;
		margin: auto;
	}
	#show-data {
		font-size: 20px;
	}
	.edit-data-text {
		font-size: 20px;
	}
</style>
<script>
	$(document).ready(function(){
		$(".profile-view").each(function(){$(this).css("display", "none");});
		$("#show-data-link").click();
		$("#show-data").css("display", "block");
		
		$(".profile-link").click(function(){
			var viewId = this.id.replace("-link", "");
			$(".profile-link").attr("class", "profile-link nav-item nav-link");
			$(this).attr("class", "profile-link nav-item nav-link active");
			$(".profile-view").each(function(){$(this).css("display", "none");});
			$("#" + viewId).css("display", "block");
		});
	});
</script>
<title>會員</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/sidebar"/>
			</div>
			<div id="x" class="col-8">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
				  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				    <div class="navbar-nav profile-navbar">
				      <a id="show-data-link" class="profile-link nav-item nav-link active" href="#">個人資料</a>　　　
				      <a id="edit-data-link" class="profile-link nav-item nav-link" href="#">修改資料</a>　　　
				      <a id="edit-password-link" class="profile-link nav-item nav-link" href="#">修改密碼</a>　　　
				      <a id="edit-privacy-link" class="profile-link nav-item nav-link" href="#">資料隱私</a>
				    </div>
				  </div>
				</nav>
				<div id="main-view">
					<br /><br />
					<div id="show-data" class="profile-view">
						<p><lable>名稱：　${memberMainBean.memberName }</p>
						<p>性別：　<c:if test="${memberMainBean.gender == 'male'}">男</c:if><c:if test="${memberMainBean.gender == 'female'}">女</c:if></p>
						<p>生日：　${memberMainBean.birthday }</p>
						<p>城市：　${memberMainBean.city }</p>
						<p>電話：　${memberMainBean.phone }</p>
						<p>Email：${memberMainBean.email }</p>
					</div>
					<div id="edit-data" class="profile-view">
						<table>
							<form:form modelAttribute="memberMainBean" action="/editMemberMain" method="POST">
								<tr>
									<td><form:label class="edit-data-text" for="memberName" path="memberName">名稱：</form:label></td>
									<td><form:input id="memberName" path="memberName"></form:input></td>
								</tr>
								<tr>
									<td><form:label for="gender" path="gender">性別：</form:label></td>
									<td><form:radiobutton id="gender" path="gender" value="male" />男</td>
									<td><form:radiobutton id="gender" path="gender" value="female" />女</td>
								</tr>
								<tr>
									<td><form:label class="edit-data-text" for="birthday" path="birthday">生日：</form:label></td>
									<td><form:input type="date" id="birthday" path="birthday"></form:input></td>
								</tr>
								<tr>
									<td><form:label class="edit-data-text" for="city" path="city">城市：</form:label></td>
									<td><form:select id="city" path="city"><form:option value="臺北市">臺北市</form:option>	<form:option value="新北市">新北市</form:option><form:option value="桃園市">桃園市</form:option><form:option value="臺中市">臺中市</form:option><form:option value="臺南市">臺南市</form:option><form:option value="高雄市">高雄市</form:option><form:option value="基隆市">基隆市</form:option><form:option value="新竹市">新竹市</form:option><form:option value="新竹縣">新竹縣</form:option><form:option value="嘉義市">嘉義市</form:option><form:option value="苗栗縣">苗栗縣</form:option><form:option value="彰化縣">彰化縣</form:option><form:option value="南投縣">南投縣</form:option><form:option value="雲林縣">雲林縣</form:option><form:option value="嘉義縣">嘉義縣</form:option><form:option value="屏東縣">屏東縣</form:option><form:option value="宜蘭縣">宜蘭縣</form:option><form:option value="花蓮縣">花蓮縣</form:option><form:option value="臺東縣">臺東縣</form:option><form:option value="澎湖縣">澎湖縣</form:option><form:option value="金門縣">金門縣</form:option><form:option value="連江縣">連江縣</form:option><form:option value="國外">國外</form:option></form:select></td>
								</tr>
								<tr>
									<td><form:label class="edit-data-text" for="phone" path="phone">電話：</form:label></td>
									<td><form:input id="phone" path="phone"></form:input></td>
								</tr>
								<tr>
									<td><form:label class="edit-data-text" for="email" path="email">Email：</form:label></td>
									<td><form:input type="email" id="email" path="email"></form:input></td>
								</tr>
							</form:form>
						</table>
					</div>
					<div id="edit-password" class="profile-view">
						修改密碼
					</div>
					<div id="edit-privacy" class="profile-view">
						修改隱私
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>