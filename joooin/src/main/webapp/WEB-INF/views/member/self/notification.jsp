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
		top: 50px;
	}
	.friendBtn {
		width: 90px;
		text-align: center;
	}
	.linkBtn {
		-webkit-filter:invert(1);
	}
	thead {
		text-align: center;
	}
	#friendImage {
		width: 50px;
		border-radius: 100px;
	}
	button {
		position: relative;
		top: 7px;
	}
</style>
<script>
	$(document).ready(function(){	
		$(document).on("click", ".friendPageBtn", function(){
			window.open("${pageContext.request.contextPath}/member/other/" + $(this).val());
		});
		
		$(document).on("click", ".friendChatBtn", function(){
			window.open("${pageContext.request.contextPath}/member/self/message/" + $(this).val());
		});
		
		$(document).on("click", ".friendDeleteBtn", function(){
			var otherMemberId = $(this).val();
			
			$.ajax({
			    type: "POST",                           
			    url: "${pageContext.request.contextPath}/member/friendProcess",
			    data: {"otherMemberId": otherMemberId, "process": "delete"},
			    success: function (notLogin) {
			    	if (notLogin)
			    		location.href = "${pageContext.request.contextPath}/notLogin";
			    	else 
			    		location.href = "${pageContext.request.contextPath}/member/self/friend/my_friend";
			    }
			});
		});
		
		
		
		//DataTable
		var language = {
		        "zeroRecords": "沒有通知",
		        "info": "<span class='seperator'>  </span>" + "總共 _TOTAL_ 則通知",
		        "infoFiltered": " (從所有 _MAX_ 則通知中篩選出)",
		        "infoEmpty": "共 0 則",
		        "search":"搜尋通知：",
		        "paginate": {
		            "previous": "上一頁",
		            "next": "下一頁",
		            "first": "第一頁  ",
		            "last": "  最後一頁"
		        }
		    };
		var column=[
            {"data": "type", name:"類型" , "orderable":true },
            {"data": "content", name:"內容" , "orderable":true },
            {"data": "time", name:"時間" , "orderable":true },
            {"data": "link", name:"查看" , "orderable":false }
           ];

		$('#datatable').DataTable({"columns":column, "language":language, "lengthChange": false, "aLengthMenu" : 10, "bScrollCollapse": true});
	});
	
</script>
<title>我的通知</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div id="main-view"><br /><br />
			<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
   				<thead>
					<tr>
						<th>類型</th>
                           <th>內容</th>
                           <th>時間</th>
                           <th>查看</th>
					</tr>
				</thead>		
				<tbody>
					<c:forEach var="friend" items="${friendList}">
						<c:if test="${friend.isFriend == true}">
							<tr>
								<td>　${friend.memberName} </td>
	                            <td><p data-placement="top" data-toggle="tooltip" title="內容"></p></td>
	                            <td><p data-placement="top" data-toggle="tooltip" title="時間"></p></td>
	                            <td class="friendBtn"><p data-placement="top" data-toggle="tooltip" title="查看"><button value="${friend.messageHash}" class="friendChatBtn btn btn-primary btn-xs" data-title="查看" data-toggle="modal"><img class="linkBtn" src="<c:url value='/resources/img/icon_link.png' />"/></button></p></td>
	    					</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<!-- 請把所有內容寫在此div內 -->
</body>
</html>