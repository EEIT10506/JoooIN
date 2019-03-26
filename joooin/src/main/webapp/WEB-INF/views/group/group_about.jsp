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

<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 120px;
}
</style>
<script>


	//修改按鈕
	$(document).ready(function(){
	  	$('#updateType').click(function(){
 	  		$('.option1').show();	
		  	$('#updateType').hide();	
		  	$('#inputType').show(); 			
		   	$('#confirmType').show();
			$('#cancelType').show();
  		});
  	});
  	//取消
  	$(document).ready(function(){
  	  	$('#cancelType').click(function(){
   	  	$('.option1').hide();
  	   	$('#cancelType').hide();
  	  	$('#inputType').hide();
  	    $('#confirmType').hide();
  	  	$('#updateType').show(); 
  	  	});
	});
  	//確認修改
  	$(document).ready(function(){
  	  	$('#confirmType').click(function(){
//   	  	$('.option1').hide();	
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
  		
  		$("#confirmIntro").click(function(){
  			var checkintro=$("#inputIntro").val().trim();
	  		
	  		if (checkintro == ""){
	  			$("#introAlert").show();
	  			$("#updateIntro").click();
	  			return false;
	  		} else {
	  			return true;
	  		}
  		})
  		
		$("#confirmName").click(function(){
  			var checkintro=$("#inputName").val().trim();
	  		
	  		if (checkintro == ""){
	  			$("#nameAlert").show();
	  			$("#updateName").click();
	  			return false;
	  		} else {
	  			return true;
	  		}
  		})

  	});
</script>
<title>關於社團</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<!-- 	解決include jQuery衝突 -->
	<script type="text/javascript">
		var xxx = jQuery.noConflict(true);
	</script>
	<!-- 	解決include jQuery衝突 -->
	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
		<jsp:include page="${request.contextPath}/group/group_navbar" />
		
	
	
		<!-- 	測試資料正確性 -->
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> 

		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
<!-- 		類型 -->
					<table class="table table-striped"  style="width:100%" >
  
  
  <tr style="font-size:25px;">
    <th >社團屬性</th>
    <th>現在狀態</th> 
    <th></th>

  </tr>
  <tr style="font-size:20px;">
    <td>社團類型</td>
    <td>${groupMain.groupType}</td>
    <c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
    <td><form action="${pageContext.request.contextPath}/group/abouts/updateGroupType/${groupMain.groupId}" method="POST">
		<p class="text-center">
		<span id="inputType" >
		<select class="option1" name="type" style="display:none;">
　								<option class="option1"  value="sport" style="display:none;">運動</option>
　								<option class="option1"  value="food" style="display:none;">美食</option>
　								<option class="option1"  value="entertainment" style="display:none;">娛樂</option>
　								<option class="option1"  value="other" style="display:none;">其他</option>
		</select>
		</span>
		<p>
		<button id="confirmType" class="btn btn-default btn-lg btn-danger" style="display:none;" type="submit" >確認修改</button>
		<p>
		</p>
		<p class="text-right">
		<button id="cancelType" class="btn btn-default btn-lg btn-danger" style="display:none;">取消</button>
		<button id="updateType" class="btn btn-default btn-lg btn-danger">修改</button>
		</p>
		</form>
	</td>
    </c:if>
  </tr>
  <tr style="font-size:20px; ">
    <td>社團名稱</td>
    <td>${groupMain.groupName}</td>
    <c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
    <td>
    <form 
								action="${pageContext.request.contextPath}/group/abouts/updateGroupName/${groupMain.groupId}" method="POST">
								<p class="text-center">
								<input id="inputName" class="btn btn-default btn-lg btn-info" type="text" style="display:none;" placeholder="修改內容" name="groupname" />
								<button id="confirmName" class="btn btn-default btn-lg btn-info" style="display:none;" type="submit" >確認修改</button><label class="btn-danger" id="nameAlert" style="display:none;" >不可為空白</label>
								</p>
								</form>
								<p class="text-right">
								<button id="cancelName" class="btn btn-default btn-lg btn-danger" style="display:none;">取消</button>
								<button id="updateName" class="btn btn-default btn-lg btn-danger">修改</button>
								</p>
    </td>
    </c:if>
  </tr>
  <tr style="font-size:20px;">
    <td>社團人數</td>
    <td>${groupMain.groupCurrentMembers}</td>
    <td></td>
  </tr>
   <tr style="font-size:20px;">
    <td>社團創建日期</td>
    <td>${groupMain.groupCreateDate}</td>
    <td></td>
  </tr style="font-size:20px;">
   <tr>
    <td>社團介紹</td>
    <td>${groupMain.groupIntro}</td>
    <c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
    <td>
    <form 
								action="${pageContext.request.contextPath}/group/abouts/updateGroupIntro/${groupMain.groupId}" method="POST">
								<p class="text-center">
								<input id="inputIntro" class="btn btn-default btn-lg btn-info" type="text" style="display:none;" placeholder="修改內容" name="groupintro" />
								<button id="confirmIntro" class="btn btn-default btn-lg  btn-info" style="display:none;" type="submit" >確認修改</button><label class="btn-danger" id="introAlert" style="display:none;" >不可為空白</label>
								</p>
								</form>
								<p class="text-right">
								<button id="cancelIntro" class="btn btn-default btn-lg btn-danger" style="display:none;">取消</button>
								<button id="updateIntro" class="btn btn-default btn-lg btn-danger">修改</button>
								</p>
    </td>
    </c:if>
  </tr>
  <tr style="font-size:20px;">
    <td>社團管理者</td>
    <td>${leader}</td>
    <td></td>
  </tr>
</table>

				</div>
			</div>
		</div>

		</main>
		
	</div>
	<!-- 請把所有內容寫在此div內 -->
</body>
</html>