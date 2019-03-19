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
/* 	 ======= */
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
		.iconAgree:hover{
			color:#32CD32;
			cursor: pointer;
			
		}
		.iconReject{
			color:red;
			cursor: pointer;
		}
		.iconReject:hover{
			color:#8B1A1A;
		}
		.tdName{
			text-decoration:none !important;
   		    color:black;
		}
		.aName{
			text-decoration:none !important;
   		    color:black;
		}
		.eventLimitShow{
			font-size:25px;
			font-weight:bold;
			position:absolute;
			top:30px;
			left:20px;
		}
		.eventCurrentShow{
			font-size:25px;
			font-weight:bold;
			position:absolute;
			top:30px;
			left:250px;
			color:red;
		}
		.content{
 			clear:both; 
		}
		.agreedColor{
			color:black;
		}
		.notAgreedColor{
			color:red;
		}
		.modalBodySize{
			font-size:20px;
		}
/* 	 ======= */
</style>
<script type="text/javascript">
$(document).ready(function() {
    var language = {
	        "zeroRecords": "沒有結果",
	        "info": "<span class='seperator'>  </span>" + "總共 _TOTAL_ 位申請",
	        "infoFiltered": " (從所有 _MAX_ 位申請中篩選出)",
	        "infoEmpty": "共 0 位",
	        "search":"搜尋名稱：",
	        "paginate": {
	            "previous": "上一頁",
	            "next": "下一頁",
	            "first": "第一頁  ",
	            "last": "  最後一頁"
	        }
	    };
	var column=[
        {"data": "name", name:"會員名稱" , "orderable":true },
        {"data": "page", name:"個人頁面" , "orderable":false },
        {"data": "delete", name:"解除好友" , "orderable":false },
       ];

	$('#example').DataTable({"language":language, "lengthChange": false, "aLengthMenu" : 10, "bScrollCollapse": true});
    
//     同意
		$(".iconAgreed").click(function(){
			var eventId = ${event.eventId};
			var agreedId = this.id;
			var eventMemberId = agreedId.substr(2);
				$.ajax({
				type: "POST",                           
		   		 url: "${pageContext.request.contextPath}/event/eventAgreed/"+eventId,
		  	     data: {"eventId": eventId, "eventMemberId": eventMemberId},
		         success: function (agreed){
		    	if(agreed=="attended"){
// 		   			var trEventMemberId = "tr" + agreedId;
// 		   			$("#trEventMemberId").attr("display","none");
		    		location.href = "${pageContext.request.contextPath}/event/signUp/"+eventId;
		    	}else{
		    		
		    		location.href = "${pageContext.request.contextPath}/not_Login";
		    	}
		      } 
			});
		});
		$(".iconAgree").click(function(){
			var limit = ${event.eventMemberLimit - event.eventCurrentMembers};
			var quantity = $(this).parent().prev().html();
			var id = this.id.substr(2);
			if(limit >= quantity){
				$("#modalAgreedBody"+id).html("確定同意此會員申請?");
				$("#modalAgreedBody"+id).removeClass("notAgreedColor");
				$("#modalAgreedBody"+id).addClass("agreedColor");
			}
			 if(limit < quantity){
				$("#modalAgreedBody"+id).html("超出人數上限 ")
				$("#modalAgreedBody"+id).removeClass("agreedColor");
				$("#modalAgreedBody"+id).addClass("notAgreedColor");
			}
		});
		//拒絕
		$(".iconRejected").click(function(){
			var eventId = ${event.eventId};
			var rejectId = this.id;
			var eventMemberId = rejectId.substr(3);
				$.ajax({
				type: "POST",                           
		   		 url: "${pageContext.request.contextPath}/event/eventReject/"+eventId,
		  	     data: {"eventId": eventId, "eventMemberId": eventMemberId},
		         success: function (reject){
		    	if(reject=="rejected"){
		   
		    		location.href = "${pageContext.request.contextPath}/event/signUp/"+eventId;
		    	}else{
		    		location.href = "${pageContext.request.contextPath}/not_Login";
		    	}
		      } 
			});
		});
// 		======
 });
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

			<div class="container content">
				<div class="row">
					  
					<table id="example" class="table table-striped table-bordered" style="width:100%">
				        <span class="eventLimitShow">人數限制 : ${event.eventMemberLimit } 人</span> <span class="eventCurrentShow">尚可加入 : ${event.eventMemberLimit - event.eventCurrentMembers } 人</span>
				        <thead>
				            <tr>
				                <th style="display:none"><input type="checkbox" onclick="checkAll(this)"></th>
				                <th class="tdCenter tdAll">頭像</th>
				                <th class="tdCenter tdAll">名稱</th>
				                <th class="tdCenter tdAll">報名人數</th>				                
				                <th class="tdCenter tdAll">同意</th>
				                <th class="tdCenter tdAll">拒絕</th>
				            </tr>
				        </thead>
					        <tbody>
					        	<c:forEach var="memberList" items="${memberList}" varStatus="loop">
					            <tr id="tr${eventMemberId[loop.count-1].eventMemberId}">
					                <td class="tdCenter tdAll" style="display:none"><input type="checkbox" name=""></td>
					                <td class="tdCenter tdAll"><a class="aName" href="<c:url value='/member/other/${memberList.memberId}' />"><span><img src="<c:url value='/getMemberImage/${memberList.memberId}.jpg' />" width="50px" height="50px" style="border-radius:25px;"/></span></a></td>
					                <td class="tdCenter tdAll tdName"><a class="aName" href="<c:url value='/member/other/${memberList.memberId}' />">${memberList.memberName}</a></td>
					                <td class="tdCenter tdAll">${eventMemberId[loop.count-1].quantity }</td>
					              
					                <td class="tdCenter tdAll"><i data-toggle="modal" id="qu${eventMemberId[loop.count-1].eventMemberId}" data-target="#Modal${eventMemberId[loop.count-1].eventMemberId}" class="fas fa-check-double iconAgree" ></i></td>
					               
					                <td class="tdCenter tdAll"><i data-toggle="modal" data-target="#RejModal${eventMemberId[loop.count-1].eventMemberId}" class="fas fa-times-circle iconReject"></i></td>
					                
<!-- 		同意確認MODAL			                ========= -->

<div class="modal fade" id="Modal${eventMemberId[loop.count-1].eventMemberId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-size:35px;font-weight:bold;">確認同意</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body modalBodySize" id="modalAgreedBody${eventMemberId[loop.count-1].eventMemberId}">
                     
      </div>
      <div class="modal-footer">
         <button type="button" id="ag${eventMemberId[loop.count-1].eventMemberId}" class="btn btn-primary iconAgreed">確認</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
      </div>
    </div>
  </div>
</div>
            
<!-- 			拒絕確認MODAL		                ========= -->
<div class="modal fade" id="RejModal${eventMemberId[loop.count-1].eventMemberId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">確認拒絕</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
                     確定拒絕此會員加入?
      </div>
      <div class="modal-footer">
         <button type="button" id="rej${eventMemberId[loop.count-1].eventMemberId}" class="btn btn-primary iconRejected">確認</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> 
      </div>
    </div>
  </div>
</div>
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