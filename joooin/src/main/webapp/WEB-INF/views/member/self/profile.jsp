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
		top: 50px;
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
	input[type="radio"] {
		vertical-align: middle;
	}
	.profile-button {
	 	margin-top: 50px;
	}
	.pwdAlert {
		color: red;
	}
</style>
<script>
	$(document).ready(function(){
		//show profile
		$(".profile-view").hide();
		$("#show-data-link").click();
		$("#show-data").show();
		
		//navbar switch
		$(".profile-link").click(function(){
			var viewId = this.id.replace("-link", "");
			
			$(".profile-link").attr("class", "profile-link nav-item nav-link");
			$(this).attr("class", "profile-link nav-item nav-link active");
			
			$(".profile-view").hide();
			$("#" + viewId).show();
			
			removePwdAlert();
		});		
		
		$("#checkPwdBtn").click(function(event){
			removePwdAlert();
			var pwd1 = $("#password1").val();
			var pwd2 = $("#password2").val();
			
			if (pwd1 == "" && pwd2 == ""){
				event.stopPropagation();
				$("#pwdAlert1").text("請輸入密碼");
				$("#pwdAlert2").text("請輸入密碼");
			} else if (pwd1 == "") {
				event.stopPropagation();
				$("#pwdAlert1").text("請輸入密碼");
			} else if (pwd2 == "") {
				event.stopPropagation();
				$("#pwdAlert2").text("請輸入密碼");
			} else if (pwd1 != pwd2) {
				event.stopPropagation();
				$("#pwdAlert1").text("兩次輸入之密碼必須相同");
			} else {
				removePwdAlert();
			}
			
		});
	});
	
	function removePwdAlert(){
		$("#pwdAlert1").text("");
		$("#pwdAlert2").text("");
	}
	
	function checkImage(image){
		var validExts = new Array(".jpg", ".png", ".gif");
		var fileExt = image.value;
		
		fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
		if (validExts.indexOf(fileExt) == -1) {
			alert("檔案類型錯誤，僅接受以下檔案類型： jpg、png、gif");
			image.value = null;
			return false;
		}
		
		var fileSize = 0;
		var fileMaxSize = 1024;
	    var filePath = image.value;
	    if(filePath){
	        fileSize = image.files[0].size;
	        var size = fileSize / 1024;
	        if (size > fileMaxSize) {
	            alert("圖片容量不可超過 1 MB");
	            image.value = null;
	            return false;
	        } 
	    }
	    return true;
	}
</script>
<title>會員1</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/self/sidebar"/>
			</div>
			<div class="col-9">
				<nav class="navbar navbar-expand-sm navbar-light bg-light">
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
						<div class="param-label">名稱：</div>　${memberMainBean.memberName } <br />
						<div class="param-label">性別：</div><c:if test="${memberMainBean.gender == 'male'}">　男</c:if><c:if test="${memberMainBean.gender == 'female'}">　女</c:if><br />
						<div class="param-label">生日：</div>　${memberMainBean.birthday }<br />
						<div class="param-label">城市：</div>　${memberMainBean.city }<br />
						<div class="param-label">電話：</div>　${memberMainBean.phone }<br />
						<div class="param-label">Email：</div>　${memberMainBean.email }<br />
					</div>
					<div id="edit-data" class="profile-view">
						<form:form modelAttribute="memberMainBean" action="${pageContext.request.contextPath}/member/updateProfile" method="POST" enctype="multipart/form-data">
							<div class="param-label"><form:label class="edit-data-text" for="memberName" path="memberName">名稱：</form:label></div>　
							<form:input path="memberName"></form:input><br />
							
							<div class="param-label"><form:label class="edit-data-text" for="gender" path="gender">性別：</form:label></div>　
							<form:radiobutton path="gender" value="male"></form:radiobutton>　男　　　　
							<form:radiobutton path="gender" value="female"></form:radiobutton>　女<br />
							
							<div class="param-label"><form:label class="edit-data-text" for="birthday" path="birthday">生日：</form:label></div>　
							<form:input type="date" id="birthday" path="birthday"></form:input><br />
							
							<div class="param-label"><form:label class="edit-data-text" for="city" path="city">城市：</form:label></div>　
							<form:select path="city"><form:option value="臺北市">臺北市</form:option>	<form:option value="新北市">新北市</form:option><form:option value="桃園市">桃園市</form:option><form:option value="臺中市">臺中市</form:option><form:option value="臺南市">臺南市</form:option><form:option value="高雄市">高雄市</form:option><form:option value="基隆市">基隆市</form:option><form:option value="新竹市">新竹市</form:option><form:option value="新竹縣">新竹縣</form:option><form:option value="嘉義市">嘉義市</form:option><form:option value="苗栗縣">苗栗縣</form:option><form:option value="彰化縣">彰化縣</form:option><form:option value="南投縣">南投縣</form:option><form:option value="雲林縣">雲林縣</form:option><form:option value="嘉義縣">嘉義縣</form:option><form:option value="屏東縣">屏東縣</form:option><form:option value="宜蘭縣">宜蘭縣</form:option><form:option value="花蓮縣">花蓮縣</form:option><form:option value="臺東縣">臺東縣</form:option><form:option value="澎湖縣">澎湖縣</form:option><form:option value="金門縣">金門縣</form:option><form:option value="連江縣">連江縣</form:option><form:option value="國外">國外</form:option></form:select><br />
						
							<div class="param-label"><form:label class="edit-data-text" for="phone" path="phone">電話：</form:label></div>　
							<form:input path="phone"></form:input><br />
							
							<div class="param-label"><label class="edit-data-text" for="multipartFile">大頭照：</label></div>　
							<form:input type="file" accept="image/*" path="multipartFile" onchange="checkImage(this)"></form:input><br />
						
							<div class="profile-button" align="center">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#checkProfile">修改</button>
								<div class="modal fade" id="checkProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLongTitle">確認修改</h5>
								      </div>
								      <div class="modal-body">是否確認修改資料？</div>
								      <div class="modal-footer">
								      	<button type="submit" class="btn btn-primary">確認修改</button>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消修改</button>
								      </div>
								    </div>
								  </div>
								</div>　　　　　　
							</div>
						</form:form>
					</div>
					<div id="edit-password" class="profile-view">
						<form action="${pageContext.request.contextPath}/member/updatePassword" method="POST">
							<div class="param-label"><label class="edit-data-text" for="password1">請輸入密碼：</label></div>　
							<input id="password1" type="password" name="password1"></input>　<label class="pwdAlert" id="pwdAlert1"></label><br />
							<div class="param-label"><label class="edit-data-text" for="password2">再次輸入密碼：</label></div>　
							<input id="password2" type="password" name="password2"></input>　<label class="pwdAlert" id="pwdAlert2"></label><br />
						
							<div class="profile-button" align="center">
								<button id="checkPwdBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#checkPassword">修改</button>
								<div class="modal fade" id="checkPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLongTitle">確認修改</h5>
								      </div>
								      <div class="modal-body">是否確認修改密碼？</div>
								      <div class="modal-footer">
								      	<button type="submit" class="btn btn-primary">確認修改</button>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消修改</button>
								      </div>
								    </div>
								  </div>
								</div>　　　　　　
							</div>
						</form>
					</div>
					<div id="edit-privacy" class="profile-view">
						<form:form modelAttribute="memberMainBean" action="${pageContext.request.contextPath}/member/updatePrivacy" method="POST">
							<div class="param-label"><form:label class="edit-data-text" for="genderDisplay" path="genderDisplay">性別：</form:label></div>　
							<form:radiobutton path="genderDisplay" value="true"></form:radiobutton>　公開　　　　
							<form:radiobutton path="genderDisplay" value="false"></form:radiobutton>　不公開<br />
							
							<div class="param-label"><form:label class="edit-data-text" for="birthdayDisplay" path="birthdayDisplay">生日：</form:label></div>　
							<form:radiobutton path="birthdayDisplay" value="true"></form:radiobutton>　公開　　　　
							<form:radiobutton path="birthdayDisplay" value="false"></form:radiobutton>　不公開<br />
							
							<div class="param-label"><form:label class="edit-data-text" for="cityDisplay" path="cityDisplay">城市：</form:label></div>　
							<form:radiobutton path="cityDisplay" value="true"></form:radiobutton>　公開　　　　
							<form:radiobutton path="cityDisplay" value="false"></form:radiobutton>　不公開<br />
							
							<div class="param-label"><form:label class="edit-data-text" for="emailDisplay" path="emailDisplay">信箱：</form:label></div>　
							<form:radiobutton path="emailDisplay" value="true"></form:radiobutton>　公開　　　　
							<form:radiobutton path="emailDisplay" value="false"></form:radiobutton>　不公開<br />
							
							<div class="param-label"><form:label class="edit-data-text" for="phoneDisplay" path="phoneDisplay">電話：</form:label></div>　
							<form:radiobutton path="phoneDisplay" value="true"></form:radiobutton>　公開　　　　
							<form:radiobutton path="phoneDisplay" value="false"></form:radiobutton>　不公開<br />
							
							<div class="profile-button" align="center">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#checkDisplay">修改</button>
								<div class="modal fade" id="checkDisplay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLongTitle">確認修改</h5>
								      </div>
								      <div class="modal-body">是否確認修改資料？</div>
								      <div class="modal-footer">
								      	<button type="submit" class="btn btn-primary">確認修改</button>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消修改</button>
								      </div>
								    </div>
								  </div>
								</div>　　　　　　
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>