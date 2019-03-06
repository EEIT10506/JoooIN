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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
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
	<form:form action="registerProcess" method="POST" modelAttribute="memberMainBean">
  <div class="form-group">
    <label for="memberName">會員姓名</label>
    <form:input type="text" class="form-control" id="memberName" name="memberName" placeholder="Name" path="memberName"/>
  </div>
  
    <div class="form-group">
    <label for="email">會員信箱</label><span style="font-size: 12px; color:#888888"> : 是否顯示於個人頁面</span><span style="font-size:12px"> <label>
      <form:radiobutton name="emailDisplay" value="true" path="emailDisplay"/> 是
    </label>
    <label>
      <form:radiobutton name="emailDisplay" value="false" path="emailDisplay"/> 否
    </label></span>
    <form:input type="email" class="form-control" id="email" name="email" placeholder="Email" path="email"/>
  </div>
  
  <div class="form-group">
    <label for="phone">會員電話</label><span style="font-size: 12px; color:#888888"> : 是否顯示於個人頁面</span><span style="font-size:12px"> <label>
      <form:radiobutton name="phoneDisplay" value="true" path="phoneDisplay"/> 是
    </label>
    <label>
      <form:radiobutton name="phoneDisplay" value="false" path="phoneDisplay"/> 否
    </label></span>
    <form:input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" path="phone"/>
  </div>

  <div class="form-group">
    <label for="password">會員密碼</label>
    <form:input type="password" class="form-control" id="password" name="password" placeholder="Password" path="password"/>
  </div>
  
    <div class="form-group">
    <label for="gender">會員性別</label><span style="font-size: 12px; color:#888888"> : 是否顯示於個人頁面</span><span style="font-size:12px"> <label>
      <form:radiobutton name="genderDisplay" value="true" path="genderDisplay"/> 是
    </label>
    <label>
      <form:radiobutton name="genderDisplay" value="false" path="genderDisplay"/> 否
    </label></span>
    <br>
    <label>
      <form:radiobutton name="gender" value="male" path="gender"/> 男
    </label>
    <label>
      <form:radiobutton name="gender" value="female" path="gender"/> 女
    </label>
  </div>
  
  <div class="form-group">
  	<label for="birthday">會員生日</label><span style="font-size: 12px; color:#888888"> : 是否顯示於個人頁面</span><span style="font-size:12px"> <label>
      <form:radiobutton name="birthdayDisplay" value="true" path="birthdayDisplay"/> 是
    </label>
    <label>
      <form:radiobutton name="birthdayDisplay" value="false" path="birthdayDisplay"/> 否
    </label></span><br>
  	<form:input type="date" id="birthday" name="birthday" path="birthday"/>
  </div>
  
  <div class="form-group">
  <label for="city">城市</label><span style="font-size: 12px; color:#888888"> : 是否顯示於個人頁面</span><span style="font-size:12px"> <label>
      <form:radiobutton name="cityDisplay" value="true" path="cityDisplay"/> 是
    </label>
    <label>
      <form:radiobutton name="cityDisplay" value="false" path="cityDisplay"/> 否
    </label></span><br>
  	<form:select name="city" id="city" path="city">
		<form:option value="臺北市">臺北市</form:option>  	
		<form:option value="新北市">新北市</form:option>  	
		<form:option value="桃園市">桃園市</form:option>  	
		<form:option value="臺中市">臺中市</form:option>  	
		<form:option value="臺南市">臺南市</form:option>  	
		<form:option value="高雄市">高雄市</form:option>  	
		<form:option value="基隆市">基隆市</form:option>  	
		<form:option value="新竹市">新竹市</form:option> 
		<form:option value="新竹縣">新竹縣</form:option>  	
		<form:option value="嘉義市">嘉義市</form:option>  	
		<form:option value="苗栗縣">苗栗縣</form:option>  	
		<form:option value="彰化縣">彰化縣</form:option>  	
		<form:option value="南投縣">南投縣</form:option>  	
		<form:option value="雲林縣">雲林縣</form:option>  	
		<form:option value="嘉義縣">嘉義縣</form:option>  	
		<form:option value="屏東縣">屏東縣</form:option>  	
		<form:option value="宜蘭縣">宜蘭縣</form:option>  	
		<form:option value="花蓮縣">花蓮縣</form:option>  	
		<form:option value="臺東縣">臺東縣</form:option>  	
		<form:option value="澎湖縣">澎湖縣</form:option>  	
		<form:option value="金門縣">金門縣</form:option>  	
		<form:option value="連江縣">連江縣</form:option>  	
		<form:option value="國外">國外</form:option>  	
  	</form:select>
  </div>
  
<!--   照片上傳先不要 -->
<!--   <div class="form-group"> -->
<!--     <label for="exampleInputFile">照片上傳</label> -->
<!--     <input type="file" id="exampleInputFile"> -->
<!--   </div> -->

	<form:input type="hidden" value="0" nama="logins" id="logins" path="logins"/>
	<form:input type="hidden" value="true" nama="certificationStatus" id="certificationStatus" path="certificationStatus"/>
	<form:input type="hidden" value="test" nama="certificationHash" id="certificationHash" path="certificationHash"/>
  <button type="submit" class="btn btn-primary">Submit</button>
</form:form>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>