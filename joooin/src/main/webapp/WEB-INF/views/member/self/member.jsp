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
	#about {
		display: inline;
	}
	#modify-intro, #modify-finish{
		float: right;
		position: relative;
		top: -60px;
	}
	#input-intro, #modify-finish{
		display: none;
	}
	#input-intro {
		width: 100%;
	}
</style>
<script>
	$(document).ready(function(){
		
		$("#modify-intro").click(function(){
			var intro = $("#intro").html().trim();
			while(intro.indexOf("<br>") != -1){
				intro = intro.replace("<br>", "\n");
				intro = intro.replace("\n\n", "\n");
			}

			$("#intro").hide();
			$("#modify-intro").hide();
			$("#modify-finish").show();
			$("#input-intro").show();
			$("#input-intro").val(intro);
			return false;
		});
		
	});
</script>
<title>我的首頁</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/self/sidebar"/>
			</div>
			<div id="x" class="col-9">
				<div class="jumbotron">
				  <h1 id="about" class="display-4">關於我</h1>
				  <form action="${pageContext.request.contextPath}/member/modifyIntro" method="POST">
					  <button id="modify-intro" class="btn btn-primary btn-md">修改</button>
					  <button id="modify-finish" class="btn btn-danger btn-md" type="submit">完成</button>
	
					  <p id="intro" class="lead" style="word-wrap: break-word;">
					  	<c:choose>
					  		<c:when test="${memberMainBean.memberIntro == null}">您尚未新增自我介紹，請點「修改」按鈕來新增。</c:when>
					  		<c:otherwise>${memberMainBean.memberIntro}</c:otherwise>
					  	</c:choose>
					  </p>
					  <textarea id="input-intro" rows="5" cols="70" wrap="hard" name="memberIntro"></textarea>
				  </form>
				</div>
			</div>
		</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>