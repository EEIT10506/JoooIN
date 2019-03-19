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
<!-- BEGIN Pre-requisites -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js">
  </script>
  <script src="https://apis.google.com/js/client:platform.js?onload=start" async defer>
  </script>
  <!-- END Pre-requisites -->
<style>
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
</style>
<!-- Continuing the <head> section -->
  <script>
    function start() {
      gapi.load('auth2', function() {
        auth2 = gapi.auth2.init({
          client_id: '486218648179-mlo3cr1e8u32mg2tpj27ib91qk9lggjp.apps.googleusercontent.com',
          // Scopes to request in addition to 'profile' and 'email'
          //scope: 'additional_scope'
        });
      });
    }
  </script>
<title>登入頁面</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	
	<div class="container" style="margin-left:50px">
	
	<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">登入頁面</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item active">登入頁面</li>
		</ol>

		<!-- Contact Form -->
	<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<div style="text-align: center;color: red;">
	<h4 >${name}</h4>
	<h4>${welcome}</h4>
	<h4>${error}</h4>
	</div>
	<form:form method="POST" modelAttribute="memberMainBean">
  <div class="form-group">
    <label for="email">帳號</label>
    <form:input type="email" class="form-control" id="email" placeholder="Email" path="email"/>
  </div>
  <div class="form-group">
    <label for="password">密碼</label>
    <form:input type="password" class="form-control" id="password" placeholder="Password" path="password"/>
  </div>
<!--   <div class="checkbox"> -->
<!--     <label> -->
<!--       <input type="checkbox"> 記住我 -->
<!--     </label> -->
<!--   </div> -->
<button id="signinButton">Sign in with Google</button><br>
  <button type="submit" class="btn btn-primary">登入</button>
  <button type="button" class="btn btn-primary" onclick="location.href='/joooin/register'">註冊</button>
  <button type="button" class="btn btn-primary" onclick="location.href='/joooin/forgotPassword'">忘記密碼</button>
</form:form>
<button type="button" id="oneSetuser" class="btn btn-success">一鍵填入(user)</button><br>
<button type="button" id="oneSetadmin" class="btn btn-success">一鍵填入(admin)</button>
 <!-- /.row -->
 
 </div>
 <!-- /.container -->
 	<script>
$('#oneSetuser').click(function(){ 
		
		$('#email').val('eeit105joooin@gmail.com'); 
		$('#password').val('passw0rd');
		
 	});
 	
$('#oneSetadmin').click(function(){ 
	
	$('#email').val('admin@admin'); 
	$('#password').val('admin');
	
	});
	</script>
	<script>
  $('#signinButton').click(function() {
    // signInCallback defined in step 6.
    auth2.grantOfflineAccess().then(signInCallback);
  });
</script>

<!-- Last part of BODY element in file index.html -->
<script>
function signInCallback(authResult) {
  if (authResult['code']) {

    // Hide the sign-in button now that the user is authorized, for example:
    $('#signinButton').attr('style', 'display: none');

    // Send the code to the server
    $.ajax({
      type: 'POST',
      url: 'http://example.com/storeauthcode',
      // Always include an `X-Requested-With` header in every AJAX request,
      // to protect against CSRF attacks.
      headers: {
        'X-Requested-With': 'XMLHttpRequest'
      },
      contentType: 'application/octet-stream; charset=utf-8',
      success: function(result) {
        // Handle or verify the server response.
      },
      processData: false,
      data: authResult['code']
    });
  } else {
    // There was an error.
  }
}
</script>
	<!-- Footer -->
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>