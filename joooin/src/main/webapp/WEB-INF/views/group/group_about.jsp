<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/grouptype.css'/>">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://code.jquery.com/jquery-1.12.4.min.css">	
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

	//修改按鈕
	$(document).ready(function(){
	  	$('#updateType').click(function(){  
		  	$('#updateType').hide();	
		  	$('#inputType').show(); 			
		   	$('#confirmType').show();
			$('#cancelType').show();
  		});
  	});
  	//取消
  	$(document).ready(function(){
  	  	$('#cancelType').click(function(){
  	   	$('#cancelType').hide();
  	  	$('#inputType').hide();
  	    $('#confirmType').hide();
  	  	$('#updateType').show(); 
  	  	});
	});
  	//確認修改
  	$(document).ready(function(){
  	  	$('#confirmType').click(function(){
  	   	$('#cancelType').hide();
  	  	$('#inputType').hide();
  	    $('#confirmType').hide();
  	  	$('#updateType').show(); 
  	  	});
	});
  	
	//修改按鈕
	$(document).ready(function(){
  	$('#updateName').click(function(){  
  	$('#updateName').hide();	
  	$('#inputName').show(); 			
   	$('#confirmName').show();
	$('#cancelName').show();
  	});
  	});
  	//取消
  	$(document).ready(function(){
  	  	$('#cancelName').click(function(){
  	   	$('#cancelName').hide();
  	  	$('#inputName').hide();
  	    $('#confirmName').hide();
  	  	$('#updateName').show(); 
  	  	});
	});
  	//確認修改
  	$(document).ready(function(){
  	  	$('#confirmName').click(function(){
  	   	$('#cancelName').hide();
  	  	$('#inputName').hide();
  	    $('#confirmName').hide();
  	  	$('#updateName').show(); 
  	  	});
	});
  //修改按鈕
	$(document).ready(function(){
  	$('#updateIntro').click(function(){  
  	$('#updateIntro').hide();	
  	$('#inputIntro').show(); 			
   	$('#confirmIntro').show();
	$('#cancelIntro').show();
  	});
  	});
  	//取消
  	$(document).ready(function(){
  	  	$('#cancelIntro').click(function(){
  	   	$('#cancelIntro').hide();
  	  	$('#inputIntro').hide();
  	    $('#confirmIntro').hide();
  	  	$('#updateIntro').show(); 
  	  	});
	});
  	//確認修改
  	$(document).ready(function(){
  	  	$('#confirmIntro').click(function(){
  	   	$('#cancelIntro').hide();
  	  	$('#inputIntro').hide();
  	    $('#confirmIntro').hide();
  	  	$('#updateIntro').show(); 
  	  	});
	});
  	$(document).ready(function(){
  	$("#checknull").click(function(event){
		removeCheckUpdate();

		var checkname=$("#inputName").val();
		var checkintro=$("#inputIntro").val();
		if(checkname==""){
			$("#nameAlert").text("不得為空值，請確認");
			event.stopPropagation();
		}
		if(checkintro=""){
			$("#IntroAlert").text("不得為空值，請確認");
			event.stopPropagation();
		}
		removeCheckUpdate();
  	};
  	});
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
								
								<c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
								
								<form 
								action="${pageContext.request.contextPath}/group/abouts/updateGroupType/${groupMain.groupId}" method="POST">
								<p class="text-center">
								<label for="groupType">社團型態</label>
								<select id="inputType" name="type">
　								<option value="sport">運動</option>
　								<option value="food">美食</option>
　								<option value="entertainment">娛樂</option>
　								<option value="other">其他</option>
								</select>

								<button id="confirmType" class="btn btn-default btn-lg btn-danger" style="display:none;" type="submit" >確認修改</button>
								</p>
						
								</form>
								<p class="text-right">
								<button id="cancelType" class="btn btn-default btn-lg btn-danger" style="display:none;">取消</button>
								<button id="updateType" class="btn btn-default btn-lg btn-danger">修改</button>
								</p>
								</c:if>
									
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
								
								<c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
								<form 
								action="${pageContext.request.contextPath}/group/abouts/updateGroupName/${groupMain.groupId}" method="POST">
								<p class="text-center">
								<input id="inputName" class="btn btn-default btn-lg btn-danger" type="text" style="display:none;" placeholder="修改內容" name="groupname" />
								<button id="confirmName" class="btn btn-default btn-lg btn-danger" style="display:none;" type="submit" >確認修改</button>
								</p>
								</form>
								<p class="text-right">
								<button id="cancelName" class="btn btn-default btn-lg btn-danger" style="display:none;">取消</button>
								<button id="updateName" class="btn btn-default btn-lg btn-danger">修改</button>
								</p>
								</c:if>
									
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
								<c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
								</c:if>
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
								<c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
								</c:if>
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
								
								
								<c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
								<form 
								action="${pageContext.request.contextPath}/group/abouts/updateGroupIntro/${groupMain.groupId}" method="POST">
								<p class="text-center">
								<input id="inputIntro" class="btn btn-default btn-lg btn-danger" type="text" style="display:none;" placeholder="修改內容" name="groupintro" />
								<button id="confirmIntro" class="btn btn-default btn-lg btn-danger" style="display:none;" type="submit" >確認修改</button>
								</p>
								</form>
								<p class="text-right">
								<button id="cancelIntro" class="btn btn-default btn-lg btn-danger" style="display:none;">取消</button>
								<button id="updateIntro" class="btn btn-default btn-lg btn-danger">修改</button>
								</p>
								</c:if>
								
									
							</div>
						</div>
<!-- 			社團管理人			 -->
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
								<c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
								
								</c:if>
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