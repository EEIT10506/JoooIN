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
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 50px;
}
</style>
<script>
	$('.collapse').collapse()
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />

	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
		<jsp:include page="${request.contextPath}/group/group_navbar" />
		<!-- 	測試資料正確性 -->
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> 

		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
<!-- 		類型 -->
					<h2 class="panel-title">
						<button class="btn btn-primary btn-lg btn-block" data-toggle="collapse" 
							data-parent="#accordion" href="#collapseOne">類型</button>
						
					</h2>
					
						<div id="collapseOne" class="panel-collapse collapse in" >
							<div class="panel-body">
							<p class="text-center">
								<span class="label label-defaulabel label-primary">${groupMain.groupType}</span>	
								</p>
								<p class="text-right">
								<button class="btn btn-default btn-lg btn-danger">修改</button>
								</p>	
							</div>
						</div>
<!-- 			社團名稱			 -->
						<h2 class="panel-title">
						<button class="btn btn-primary btn-lg btn-block" data-toggle="collapse" 
							data-parent="#accordion" href="#collapseTwo">社團名稱</button>	
						</h2>
					
						<div id="collapseTwo" class="panel-collapse collapse in" >
							<div class="panel-body">
							<p class="text-center">
								<span class="label label-defaulabel label-primary">${groupMain.groupName}</span>	
								</p>
								<p class="text-right">
								<button class="btn btn-default btn-lg btn-danger">修改</button>
								</p>	
							</div>
						</div>
<!-- 			社團人數			 -->
						<h2 class="panel-title">
						<button class="btn btn-primary btn-lg btn-block" data-toggle="collapse" 
							data-parent="#accordion" href="#collapseThree">社團人數</button>	
						</h2>
					
						<div id="collapseThree" class="panel-collapse collapse in" >
							<div class="panel-body">
							<p class="text-center">
								<span class="label label-defaulabel label-primary">${groupMain.groupCurrentMembers}</span>	
								</p>
								<p class="text-right">
								<button class="btn btn-default btn-lg btn-danger">修改</button>
								</p>	
							</div>
						</div>					
<!-- 			社團創建日期			 -->
						<h2 class="panel-title">
						<button class="btn btn-primary btn-lg btn-block" data-toggle="collapse" 
							data-parent="#accordion" href="#collapseFour">社團創建日期</button>	
						</h2>
					
						<div id="collapseFour" class="panel-collapse collapse in" >
							<div class="panel-body">
							<p class="text-center">
								<span class="label label-defaulabel label-primary">${groupMain.groupCreateDate}</span>	
								</p>
								<p class="text-right">
								<button class="btn btn-default btn-lg btn-danger">修改</button>
								</p>	
							</div>
						</div>
<!-- 			社團介紹			 -->
						<h2 class="panel-title">
						<button class="btn btn-primary btn-lg btn-block" data-toggle="collapse" 
							data-parent="#accordion" href="#collapseFive">社團介紹</button>	
						</h2>
					
						<div id="collapseFive" class="panel-collapse collapse in" >
							<div class="panel-body">
							<p class="text-center">
								<span class="label label-defaulabel label-primary">${groupMain.groupIntro}</span>	
								</p>
								<p class="text-right">
								<button class="btn btn-default btn-lg btn-danger">修改</button>
								</p>	
							</div>
						</div>
<!-- 			社團介紹			 -->
						<h2 class="panel-title">
						<button class="btn btn-primary btn-lg btn-block" data-toggle="collapse" 
							data-parent="#accordion" href="#collapseSix">社團管理者</button>	
						</h2>
					
						<div id="collapseSix" class="panel-collapse collapse in" >
							<div class="panel-body">
							<p class="text-center">
								<span class="label label-defaulabel label-primary">${leader}</span>	
								</p>
								<p class="text-right">
								<button class="btn btn-default btn-lg btn-danger">修改</button>
								</p>	
							</div>
						</div>

				</div>
			</div>
		</div>

		</main>
		
	</div>
	<!-- 請把所有內容寫在此div內 -->
</body>
</html>