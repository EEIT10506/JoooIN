<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	
<!-- DataTable -->

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

<!-- <script type="text/javascript" charset="utf8" -->
<!-- 	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script> -->

<!-- DataTable -->

<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 50px;
}

#menu {
	position: fixed;
	left: 15;
	top: 25%;
	width: 8em;
	margin-top: -2.5em;
}

div {
	margin: 0;
	border: 0;
	padding: 0;
}

.div-a {
	float: left;
	width: 50px; solid #999;
	height: 60px;
}
</style>

<script>


	$(document).ready(function() {
		//DataTable
		var language = {
		        "zeroRecords": "沒有結果",
		        "info": "<span class='seperator'>  </span>" + "總共 _TOTAL_ 篇文章",
		        "infoFiltered": " (從所有 _MAX_ 篇文章中篩選出)",
		        "infoEmpty": "共 0 篇",
		        "search":"搜尋文章：",
		        "paginate": {
		            "previous": "上一頁",
		            "next": "下一頁",
		            "first": "第一頁  ",
		            "last": "  最後一頁"
		        }
		    };
		
		var column=[
            {"data": "like", name:"讚數" , "orderable":true },
            {"data": "title", name:"標題" , "orderable":false },
            {"data": "poster", name:"發文人" , "orderable":false },
            {"data": "postdate", name:"發文日期" , "orderable":true },
            {"data": "replydate", name:"最後回覆日期" , "orderable":true }
           ];
		
		//讚數降冪排列
		$('#table_id').DataTable({"columns":column, "language":language, "lengthChange": false, "aLengthMenu" : 10,
			 "bScrollCollapse": true, "order" : [ 1, 'desc' ]});
		
	});
	
// 	隱藏申請人按鈕功能
	function accept(butObj){
		var target = butObj.id;
		var target_div1 = "#" + target + "_div1";
		$(target_div1).hide();
		var target_div2 = "#" + target + "_div2";
		$(target_div2).hide();
		var target_div3 = "#" + target + "_div3";

		$(target_div3).hide();

		
		var groupId = ${groupMain.groupId};
		var memberId = target;
		var decide = "approve";
		$.ajax({
			type: "POST",                           
    	    url: "${pageContext.request.contextPath}/group/applygroup/"+groupId+"/member/"+memberId+"/result/"+decide,
    	    data: {"groupId": groupId},
            success: function (result) {
//                 alert("return");
            }, failure: function (result) {
                alert('系統異常');
            }
		
		});
	}
	
	function reject(butObj){
		var target = butObj.id;
		var target_div1 = "#" + target + "_div1";
		$(target_div1).hide();
		var target_div2 = "#" + target + "_div2";
		$(target_div2).hide();
		var target_div3 = "#" + target + "_div3";
		$(target_div3).hide();
		
		var groupId = ${groupMain.groupId};
		var memberId = target;
		var decide = "reject";
		$.ajax({
			type: "POST",                           
    	    url: "${pageContext.request.contextPath}/group/applygroup/"+groupId+"/member/"+memberId+"/result/"+decide,
    	    data: {"groupId": groupId},
            success: function (result) {
            }, failure: function (result) {
                alert('系統異常');
            }
		
		});
	}
// 	隱藏申請人按鈕功能
</script>

<title>各社團主頁</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar"/>
	<!-- 	解決include jQuery衝突 -->
	<script type="text/javascript">
		var xxx = jQuery.noConflict(true);
	</script>
	<!-- 	解決include jQuery衝突 -->
	<div id="main">
		<!-- 請把所有內容寫在此div內 -->


		<jsp:include page="${request.contextPath}/group/group_navbar" />
		
		
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<div class="display-4">${groupMain.groupName}</div>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group mr-2">
<!-- 				fb 分享 -->
					
					<iframe src="https://www.facebook.com/plugins/share_button.php?href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&layout=button&size=large&width=65&height=28&appId" width="65" height="28" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>
					
<!-- 				fb 分享 -->

					<!-- 					團長按鈕顯示判斷		 -->
					<c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
						<button type="button" class="btn btn-sm btn-outline-secondary"
							data-toggle="modal" data-target="#ooo">社團申請管理</button>
					</c:if>
					<!-- 					團長按鈕顯示判斷		 -->

				</div>
<!-- 				網路掛掉 -->
<!-- 				<ING> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="isInGroup"> --%>
<%-- 							<form action="${pageContext.request.contextPath}/group/addgroup/${groupsType.groupId}" method="post"> --%>
<!-- 								<button type="submit" class="btn btn-sm btn-outline-secondary">進入社團</button> -->
<%-- 							</form> --%>
<%-- 						</c:when> --%>
											
<%-- 						<c:when test="isInGroup"> --%>
<%-- 							<form action="${pageContext.request.contextPath}/group/addgroup/${groupsType.groupId}" method="post"> --%>
<!-- 								<button type="submit" class="btn btn-sm btn-outline-secondary">申請中</button> -->
<%-- 							</form> --%>
<%-- 						</c:when> --%>
											
<%-- 						<c:otherwise> --%>
<%-- 							<form action="${pageContext.request.contextPath}/group/addgroup/${groupsType.groupId}" method="post"> --%>
<!-- 								<button type="submit" class="btn btn-sm btn-outline-secondary">加入社團</button> -->
<%-- 							</form> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 				<ING> -->
<!-- 				<button type="button" -->
<!-- 					class="btn btn-sm btn-outline-secondary dropdown-toggle"> -->
<!-- 					<span data-feather="calendar"></span> This week -->
<!-- 				</button> -->
			</div>
		</div>

		<!-- Modal管理者管理成員 -->
		<div id="ooo" class="modal inmodal fade" tabindex="-1" role="dialog"
			aria-hidden="true" data-backdrop="static" data-keyboard="true">
			<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">成員申請表</h4>
						<button type="button" class="close" data-dismiss="modal"
							onClick="window.location.reload()">&times;</button>
					</div>
					<div class="modal-body">
						<div class="container">

							<div class="row justify-content-end">


								<!--  EL加入地點  -->

								<c:forEach var="memberApply" items="${applyMemberMain}"
									varStatus="loop">
									
									<div class="col-8 div-a apply" id="${memberApply.memberId}_div1">
										<span >${memberApply.memberName}</span>
										<span style="display:none; background-color:Blue">${memberApply.memberId}</span>
									</div>
									<div class="col div-a apply" id="${memberApply.memberId}_div2">
										<button id="${memberApply.memberId}"
											class="btn btn pull-right btn-primary" onclick="accept(this)">允許加入</button>
									</div>
									<div class="col div-a apply" id="${memberApply.memberId}_div3">
										<button id="${memberApply.memberId}"
											class="btn btn pull-right btn-danger" onclick="reject(this)">拒絕</button>
									</div>
									
								</c:forEach>

								<!--  EL加入地點  -->


							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn" class="close" data-dismiss="modal"
							onClick="window.location.reload()">Cancel</button>
					</div>
				</div>
			</div>
		</div>

		<img class="container"
			src="<c:url value='/getGroupImage/${groupMain.groupId}'/>"
			height="350" />
		<p></p>
		<h4>文章列表</h4>

		<div class="table-responsive">
			<!-- 					<table class="table table-striped table-sm"> -->
			<table id="table_id" class="display table table-striped table-sm">
				<thead>
					<tr>
						<th>讚數</th>
						<th>標題</th>
						<th>發文人</th>
						<th>發文日期</th>
						<th>最後回覆日期</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="poster" items="${groupPoster}" varStatus="loop">
					<tr>
<!-- 					文章及連結 -->
						<td>${poster.groupPostLike}</td>
						<td><a href="${pageContext.request.contextPath}/group/post/${poster.groupPostId}">${poster.groupPostTitle}</a></td>
						<td>${poster.memberName }</td>
						<td>${poster.groupPostDate}</td>
						<td>${poster.lastReplyDate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		</main>
	</div>


	<!-- DataTable -->

	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

	<!-- DataTable -->
</body>
</html>