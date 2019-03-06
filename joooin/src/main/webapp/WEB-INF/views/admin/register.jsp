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
	<form action="registerpage" method="post">
  <div class="form-group">
    <label for="membername">會員姓名</label>
    <input type="text" class="form-control" id="membername" name="membername" placeholder="Name">
  </div>
  
    <div class="form-group">
    <label for="email">會員信箱</label>
    <input type="email" class="form-control" id="email" name="email" placeholder="Email"><br>
    <label flor="emailDisplay">是否顯信箱</label><br>
    <label>
      <input type="radio" name="emailDisplay" value="true"> 是
    </label>
    <label>
      <input type="radio" name="emailDisplay" value="false"> 否
    </label>
  </div>
  
  <div class="form-group">
    <label for="phone">會員電話</label>
    <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone"><br>
    <label flor="phoneDisplay">是否顯電話</label><br>
    <label>
      <input type="radio" name="phoneDisplay" value="true"> 是
    </label>
    <label>
      <input type="radio" name="phoneDisplay" value="false"> 否
    </label>
  </div>

  <div class="form-group">
    <label for="password">會員密碼</label>
    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
  </div>
  
    <div class="form-group">
    <label for="gender">會員性別</label><br>
    <label>
      <input type="radio" name="gender" value="male"> 男
    </label>
    <label>
      <input type="radio" name="gender" value="female"> 女
    </label><br>
    <label flor="genderDisplay">是否顯示性別</label><br>
    <label>
      <input type="radio" name="genderDisplay" value="true"> 是
    </label>
    <label>
      <input type="radio" name="genderDisplay" value="false"> 否
    </label>
  </div>
  
  <div class="form-group">
  	<label for="birthday">會員生日</label>
  	<input type="date" id="birthday" name="birthday"><br>
  	<label flor="genderDisplay">是否顯示生日</label><br>
    <label>
      <input type="radio" name="birthdayDisplay" value="true"> 是
    </label>
    <label>
      <input type="radio" name="birthdayDisplay" value="false"> 否
    </label>
  </div>
  
  <div class="form-group">
  <label for="city">城市</label>
  	<select name="city" id="city">
		<option value="臺北市">臺北市</option>  	
		<option value="新北市">新北市</option>  	
		<option value="桃園市">桃園市</option>  	
		<option value="臺中市">臺中市</option>  	
		<option value="臺南市">臺南市</option>  	
		<option value="高雄市">高雄市</option>  	
		<option value="基隆市">基隆市</option>  	
		<option value="新竹市">新竹市</option> 
		<option value="新竹縣">新竹縣</option>  	
		<option value="嘉義市">嘉義市</option>  	
		<option value="苗栗縣">苗栗縣</option>  	
		<option value="彰化縣">彰化縣</option>  	
		<option value="南投縣">南投縣</option>  	
		<option value="雲林縣">雲林縣</option>  	
		<option value="嘉義縣">嘉義縣</option>  	
		<option value="屏東縣">屏東縣</option>  	
		<option value="宜蘭縣">宜蘭縣</option>  	
		<option value="花蓮縣">花蓮縣</option>  	
		<option value="臺東縣">臺東縣</option>  	
		<option value="澎湖縣">澎湖縣</option>  	
		<option value="金門縣">金門縣</option>  	
		<option value="連江縣">連江縣</option>  	
		<option value="國外">國外</option>  	
  	</select><br>
  	<label flor="cityDisplay">是否顯居住地</label><br>
    <label>
      <input type="radio" name="cityDisplay" value="true"> 是
    </label>
    <label>
      <input type="radio" name="cityDisplay" value="false"> 否
    </label>
  </div>
  
<!--   照片上傳先不要 -->
<!--   <div class="form-group"> -->
<!--     <label for="exampleInputFile">照片上傳</label> -->
<!--     <input type="file" id="exampleInputFile"> -->
<!--   </div> -->

  <button type="submit">Submit</button>
</form>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>