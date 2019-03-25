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
		        "zeroRecords": "沒有結果",
		        "info": "<span class='seperator'>  </span>" + "總共 _TOTAL_ 位好友",
		        "infoFiltered": " (從所有 _MAX_ 位好友中篩選出)",
		        "infoEmpty": "共 0 位",
		        "search":"搜尋好友：",
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
            {"data": "chat", name:"聊天" , "orderable":false },
            {"data": "delete", name:"解除好友" , "orderable":false }
           ];

		$('#datatable').DataTable({"columns":column, "language":language, "lengthChange": false, "aLengthMenu" : 10, "bScrollCollapse": true});
	});
	
</script>
<title>我的好友</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/self/sidebar"/>
			</div>
			<div id="x" class="col-9">
				<jsp:include page="${request.contextPath}/member/self/friend/navbar"/>
				<div id="main-view"><br /><br />
						<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
		    				<thead>
								<tr>
									<th>會員名稱</th>
		                            <th>個人頁面</th>
		                            <th>聊天</th>
		                            <th>解除好友</th>
								</tr>
							</thead>		
							<tbody>
								<c:forEach var="friend" items="${friendList}">
									<c:if test="${friend.isFriend == true}">
										<tr>
											<td><img id="friendImage" src='<c:url value='/getMemberImage/${friend.memberId}.jpg' />' />　${friend.memberName} </td>
				                            <td class="friendBtn"><p data-placement="top" data-toggle="tooltip" title="個人頁面"><button value="${friend.memberId}" class="friendPageBtn btn btn-primary btn-xs" data-title="個人頁面" data-toggle="modal"><img class="linkBtn" src="<c:url value='/resources/img/icon_link.png' />"/></button></p></td>
				                            <td class="friendBtn"><p data-placement="top" data-toggle="tooltip" title="聊天"><button value="${friend.messageHash}" class="friendChatBtn btn btn-primary btn-xs" data-title="聊天" data-toggle="modal"><img class="linkBtn" src="<c:url value='/resources/img/icon_chat.png' />"/></button></p></td>
				    						<td class="friendBtn"><p data-placement="top" data-toggle="tooltip" title="解除好友"><button value="${friend.memberId}" class="friendDeleteBtn btn btn-danger btn-xs" data-title="解除好友" data-toggle="modal"><img class="linkBtn" src="<c:url value='/resources/img/icon_delete.png' />"/></button></p></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					
				</div>
			</div>
		</div>
	</div><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<!-- 請把所有內容寫在此div內 -->
</body>
</html>