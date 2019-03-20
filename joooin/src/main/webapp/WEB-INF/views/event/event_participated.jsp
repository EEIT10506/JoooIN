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
		}
		.tdName{
			text-decoration:none !important;
   		    color:black;
		}
		.aName{
			text-decoration:none !important;
   		    color:black;
		}
		.getOut{
			color:red;
			cursor: pointer;
		}
		.getOut:hover{
			color:#B22222;
			cursor: pointer;
			position:relative;
			bottom:3px;
		}
		.report{
			cursor: pointer;
			color:	#FFA500;	
		}
		.report:hover{
			cursor: pointer;
			position:relative;
			bottom:3px;
			color:#CD853F;
		}
		.eventCurrentShow{
			font-size:25px;
			font-weight:bold;
			position:absolute;
			top:30px;
			left:20px;
		}
		.eventMyself{
			font-size:25px;
			font-weight:bold;
			position:absolute;
			top:30px;
			left:250px;
			color:blue;
		}		
</style>
<script type="text/javascript">
$(document).ready(function() {
	//踢出
	$(".iconGetOut").click(function(){
		var eventId = ${event.eventId};
		var getOutId = this.id;
		var eventMemberId = getOutId.substr(3);
			$.ajax({
			type: "POST",                           
	   		 url: "${pageContext.request.contextPath}/event/eventGetOut/"+eventId,
	  	     data: {"eventId": eventId, "eventMemberId": eventMemberId},
	         success: function (out){
	    	if(out=="outed"){
	   
	    		location.href = "${pageContext.request.contextPath}/event/participated/"+eventId;
	    	}else{
	    		location.href = "${pageContext.request.contextPath}/not_Login";
	    	}
	      } 
		});
	});
	
	//檢舉
		$(".arrive").click(function(){
			$(this).parent().prev().html();
		var eventId = ${event.eventId};
		var arriveId = this.id;
		var eventMemberId = arriveId.substr(6);
			$.ajax({
			type: "POST",                           
	   		 url: "${pageContext.request.contextPath}/event/eventArrive/"+eventId,
	  	     data: {"eventId": eventId, "eventMemberId": eventMemberId},
	         success: function (arrive){
	    	if(arrive=="arrived"){
	   
	    		location.href = "${pageContext.request.contextPath}/event/participated/"+eventId;
	    	}else{
	    		location.href = "${pageContext.request.contextPath}/not_Login";
	    	}
	      } 
		});
	});
	
	
	
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
				       <span class="eventCurrentShow">目前人數 : ${event.eventCurrentMembers } 人</span>  <span class="eventMyself">自己報名 : ${eventMemberMyself.quantity } 人</span>
				        <thead>
				            <tr>
				                <th style="display:none"><input type="checkbox" onclick="checkAll(this)"></th>
				                <th class="tdCenter tdAll">頭像</th>
				                <th class="tdCenter tdAll">名稱</th>
<!-- 				                <th class="tdCenter tdAll">出席</th> -->
<!-- 				                <th class="tdCenter tdAll">未出席</th> -->
				                <th class="tdCenter tdAll">報名人數</th>
				                <th class="tdCenter tdAll">踢除</th>
				                <th class="tdCenter tdAll">檢舉</th>
				               
				            </tr>
				        </thead>
					        <tbody>
					        	<c:forEach var="attendList" items="${attendList}" varStatus="loop">
					            <tr>
					                <td class="tdCenter tdAll" style="display:none"><input type="checkbox" name=""></td>
					                <td class="tdCenter tdAll"><a class="aName" href="<c:url value='/member/other/${attendList.memberId}' />"><span><img src="<c:url value='/getMemberImage/${attendList.memberId}.jpg' />" width="50px" height="50px" style="border-radius:25px;"/></span></a></td>
					                <td class="tdCenter tdAll tdName"><a class="aName" href="<c:url value='/member/other/${attendList.memberId}' />">${attendList.memberName}</a></td>
					                <td class="tdCenter tdAll">${eventMemberId[loop.count-1].quantity }</td>
					                
<%-- 					                <td class="tdCenter tdAll"><i class="fas fa-check-circle arrive" id="arrive${eventMemberId[loop.count-1].eventMemberId}"></i></td> --%>
					       					            
<%-- 					                <td class="tdCenter tdAll"><i class="fas fa-times absent" id="absent${eventMemberId[loop.count-1].eventMemberId}"></i></i></td>					               --%>
					       			    
					                <td class="tdCenter tdAll"><i data-toggle="modal" data-target="#Out${eventMemberId[loop.count-1].eventMemberId}" class="far fa-times-circle getOut"></i></td>
					               
					                <td class="tdCenter tdAll"><i class="fas fa-exclamation-triangle report"></i></td>
					                
<!-- 					                ========= -->
<!-- 		踢出確認MODAL			                ========= -->

<div class="modal fade" id="Out${eventMemberId[loop.count-1].eventMemberId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">確認踢出</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                     確定踢出此會員?
      </div>
      <div class="modal-footer">
         <button type="button" id="out${eventMemberId[loop.count-1].eventMemberId}" class="btn btn-primary iconGetOut">確認</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
      </div>
    </div>
  </div>
</div>
            
<!-- 			檢舉確認MODAL		                ========= -->
<div class="modal fade" id="RejModal${eventMemberId[loop.count-1].eventMemberId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">確認檢舉資訊</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                     確定檢舉此會員?
      </div>
      <div class="modal-footer">
         <button type="button" id="rej${eventMemberId[loop.count-1].eventMemberId}" class="btn btn-primary iconRejected">確認</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
      </div>
    </div>
  </div>
</div>
            
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