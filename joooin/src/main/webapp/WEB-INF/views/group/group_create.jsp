<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script type="text/javascript">
	function checkImage(image) {
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
		if (filePath) {
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
	
// 	var i=0;
// 	$(document).ready(function(){
//      $('#add_more').on('click', function(){
//       var colorR = Math.floor((Math.random() * 256));
//       var colorG = Math.floor((Math.random() * 256));
//       var colorB = Math.floor((Math.random() * 256));
//       i++;
//       var html ='<div id="append_no_'+i+'" class="animated bounceInLeft">'+
//           '<div class="input-group mt-3">'+
// 		  '<div class="input-group-prepend">'+
// 		  '<span class="input-group-text br-15" style="color:rgb('+colorR+','+colorG+','+colorB+'">'+
// 		  '<i class="fas fa-user-graduate"></i></span>'+
// 		  '</div>'+
// 		  '<input type="text" placeholder="Student Name"  class="form-control"/>'+
// 		  '</div>'+
// 		  '<div class="input-group mt-3">'+
// 		  '<div class="input-group-prepend">'+
// 		  '<span class="input-group-text br-15" style="color:rgb('+colorR+','+colorG+','+colorB+'">'+
// 		  '<i class="fas fa-phone-square"></i></span>'+
// 		  '</div>'+
// 		  '<input type="text" placeholder="Student Phone" class="form-control"/>'+
// 		  '</div>'+
// 		  '<div class="input-group mt-3">'+
// 		  '<div class="input-group-prepend">'+
// 		  '<span class="input-group-text br-15" style="color:rgb('+colorR+','+colorG+','+colorB+'">'+
// 		  '<i class="fas fa-at"></i></span>'+
// 		  '</div>'+
// 		  '<input type="email" placeholder="Student Email" class="form-control"/>'+
// 		  '</div></div>';

// 	  $('#dynamic_container').append(html);
// 	  $('#remove_more').fadeIn(function(){
// 	  	 $(this).show();
// 	  });
//      });

//      $('#remove_more').on('click', function(){
         
//          $('#append_no_'+i).removeClass('bounceInLeft').addClass('bounceOutRight')
//             .fadeOut(function(){
//             	$(this).remove();
//             });
//             i--;
//             if(i==0){
//             	$('#remove_more').fadeOut(function(){
//             		$(this).hide()
//             	});;
//             }
   
//      });
// 	});
</script>
<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 120px;
}

	html,body{
			height: 100%;
			margin: 0;
			background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(149,199,20,1) 0%, rgba(0,212,255,1) 96%);
		
		}
   
   .myForm{
   	background-color: rgba(0,0,0,0.5) !important;
   	padding: 15px !important;
   border-radius: 15px !important;
   color: white;
   
   }

   input{
   	border-radius:0 15px 15px 0 !important;

   }
   input:focus{
       outline: none;
box-shadow:none !important;
border:1px solid #ccc !important;

   }

   .br-15{
   	border-radius: 15px 0 0 15px !important;
   }

   #add_more{
   	color: white !important;
   	background-color: #fa8231 !important;
   	border-radius: 15px !important;
   	border: 0 !important;

   }
   #remove_more{
   	color: white !important;
   	background-color: #fc5c65 !important;
   	border-radius: 15px !important;
   	border: 0 !important;
   	display: none;

   }
   	
   .submit_btn{
   	border-radius: 15px !important;
    background-color: #95c714 !important;
    border: 0 !important;
   }
</style>
<title>創建社團</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<div id="main">
		<h1>創建社團初版</h1>
		<hr>
		<!-- 		使用表格物件 -->
			<dvi class="container h-100">
	<div class="d-flex justify-content-center">
		<div class="card animated bounceInDown myForm">
			<div class="card-header">
				<h4>創建社團</h4>
			</div>
			<div class="card-body">
				<form:form method="POST" modelAttribute="groupMainBean"
			enctype="multipart/form-data">
					<div id="dynamic_container">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text br-15"><i class="far fa-address-book"></i></i></span>
							</div>
							<div for="groupType">社團型態:</div>
				<form:select path='groupType' required="required" id="groupType">
					<form:option value="sport">運動</form:option>
					<form:option value="food">美食</form:option>
					<form:option value="entertainment">娛樂</form:option>
					<form:option value="other">其他</form:option>
				</form:select>
						</div>
						<div class="input-group mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text br-15"><i class="fas fa-child"></i></span>
							</div>
							<form:input path="groupName"  placeholder="輸入社團名稱"  type='text' id="groupName" />
						</div>
						<div class="input-group mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text br-15"><i class="fas fa-at"></i></span>
							</div>
							<form:input path="groupIntro" type='text' placeholder="輸入社團介紹"  id="groupIntro" />
						</div>
						<div class="input-group mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text br-15"><i class="fas fa-chalkboard-teacher">   上傳社團照片(無圖使用預設)</i></span>
							</div>
							<form:input type="file" accept="image/*" path="multipartFile"
							id="multipartFile" onchange="checkImage(this)"></form:input>
							
						</div>
						
					</div>
					<div class="card-footer">
				<a class="btn btn-secondary btn-sm" onclick="history.back()"id="add_more"><i class="fas fa-plus-circle"></i> 返回上一頁</a>
<!-- 				<a class="btn btn-secondary btn-sm" id="remove_more"><i class="fas fa-trash-alt"></i> Remove</a> -->
				<input class="btn btn-success btn-sm float-right submit_btn " type="submit" value="送出">
			</div>
				</form:form>
			</div>
			
			
		</div>
	</div>
	</dvi>

	</div>
</body>
</html>