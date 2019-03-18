<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->

<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
	#main {
		width: 1050px;
		margin: auto;
		position: relative;
		top: 50px;
	}
			table{
		    width:100%;
		}
		#example_filter{
		    float:right;
		  
		}
		#example_paginate{
		    float:right;
		    
		}
		label {
		    display: inline-flex;
		    margin-bottom: .5rem;
		    margin-top: .5rem;
		   
		}
	.outSide{
		width:1000px;
		margin: auto;
		position: relative;
		top: 50px;
	}
	.settingBody{
	 	font-family:微軟正黑體;
		background-color:#F5F5F5;
		font-weight:bold;
	 }
	 		.tdCenter{
			text-align:center;
		}
		.tdAll{
			font-size:30px;
			font-weight:bold;
		}
		.iconAgree{
			color:green;
			cursor: pointer;
		}
		.iconReject{
			color:red;
			cursor: pointer;
		}
		.tdName{
			text-decoration:none !important;
   		    color:black;
		}
		.aName{
			text-decoration:none !important;
   		    color:black;
		}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var language = {
	        "zeroRecords": "沒有結果",
	        "info": "<span class='seperator'>  </span>" + "總共 _TOTAL_ 位成員",
	        "infoFiltered": " (從所有 _MAX_ 位成員中篩選出)",
	        "infoEmpty": "共 0 位",
	        "search":"搜尋名稱：",
	        "paginate": {
	            "previous": "上一頁",
	            "next": "下一頁",
	            "first": "第一頁  ",
	            "last": "  最後一頁"
	        }
	    };


	$('#example').DataTable({"language":language, "lengthChange": false, "aLengthMenu" : 10, "bScrollCollapse": true});
} );

function checkAll(bx) {
  var cbs = document.getElementsByTagName('input');
  for(var i=0; i < cbs.length; i++) {
    if(cbs[i].type == 'checkbox') {
      cbs[i].checked = bx.checked;
    }
  }
}
</script>
<title>Insert title here</title></head>
<body class="settingBody">
<jsp:include page="${request.contextPath}/navbar"/>

<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<jsp:include page="${request.contextPath}/event/settingbar"/>
		<div class="outSide" >
			<div class="container">
				<div class="row">
					<table id="example" class="table table-striped table-bordered" style="width:100%">
				        <thead>
				            <tr>
				                <th style="display:none"><input type="checkbox" onclick="checkAll(this)"></th>
				                <th class="tdCenter tdAll">頭像</th>
				                <th class="tdCenter tdAll">名稱</th>
				                <th class="tdCenter tdAll">出席</th>
				                <th class="tdCenter tdAll">未出席</th>
				                <th class="tdCenter tdAll">踢除</th>
				                <th class="tdCenter tdAll">檢舉</th>
				               
				            </tr>
				        </thead>
					        <tbody>
					        	<c:forEach var="attendList" items="${attendList}">
					            <tr id="tr${attendList.memberId}">
					                <td class="tdCenter tdAll" style="display:none"><input type="checkbox" name=""></td>
					                <td class="tdCenter tdAll"><a class="aName" href="<c:url value='/member/other/${attendList.memberId}' />"><span><img src="<c:url value='/getMemberImage/${attendList.memberId}.jpg' />" width="50px" height="50px" style="border-radius:25px;"/></span></a></td>
					                <td class="tdCenter tdAll tdName"><a class="aName" href="<c:url value='/member/other/${attendList.memberId}' />">${attendList.memberName}</a></td>
					                <td class="tdCenter tdAll"></td>
					                <td class="tdCenter tdAll"></td>					              
					                <td class="tdCenter tdAll"><i class="far fa-times-circle"></i></td>
					               
					                <td class="tdCenter tdAll"><i class="fas fa-exclamation-triangle"></i></td>
					                
<!-- 					                ========= -->

            
<!-- 					                ========= -->
					            </tr>
					            </c:forEach>
					        </tbody>
					    </table>
					</div>
				</div>	
				
		<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
		</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>