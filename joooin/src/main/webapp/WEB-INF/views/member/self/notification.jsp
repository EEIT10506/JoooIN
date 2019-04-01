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
	.btnTd {
		width: 90px;
		text-align: center;
	}
	.linkBtnImg {
		-webkit-filter:invert(1);
	}
	thead {
		text-align: center;
	}
	.type, .time, .link {
		text-align: center;
	}
	.linkP {
		position:relative;
		top:3px;
	}
	
</style>
<script>
	$(document).ready(function(){	
		
		$(document).on("click", ".linkBtn", function(){
			var content = $(this).parent().prev().prev().text();
			var type = $(this).parent().prev().prev().prev().text();
			var id = $(this).val();
			
			if (type == "好友"){
				window.open("${pageContext.request.contextPath}/member/other/" + id);
			}
			if (type == "活動"){
				if (content.indexOf("申請報名") != -1){
					window.open("${pageContext.request.contextPath}/event/signUp/" + id);
				} else {
					window.open("${pageContext.request.contextPath}/event/" + id);
				}
			}
			if (type == "社團"){
				window.open("${pageContext.request.contextPath}/group/" + id);
			}
		});
		
		
		$(document).on("click", ".readBtn", function(){
			var parent = $(this).parent();
			var notificationId = $(this).val();
			
			$.ajax({
			    type: "POST",                           
			    url: "${pageContext.request.contextPath}/member/setOneNotificationRead",
			    data: {"notificationId": notificationId},
			    success: function () {
			    	parent.html('<img src="<c:url value='/resources/img/icon_ok.png' />"/>');
			    	var str = $("#notiNotRead").text();
			    	var notRead = parseInt(str.substr(3, str.length)) - 1;
			    	$("#notiNotRead").text("通知（" + notRead + "）");
			    	
			    	if (notRead == 0) {
			    		$("#notiNotRead").css("color", "");
			    	}
			    }
			});
		});
		
    	$(document).on("click", "#allRead", function(event){
    		
			$.ajax({
			    type: "POST",                                 
			    url: "${pageContext.request.contextPath}/member/setAllNotificationsRead",
			    data: {"memberId": ${memberId}},
			    success: function () {
			    	location.href = "${pageContext.request.contextPath}/member/notification";
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
			{"data": "read", name:"設為已讀" , "orderable":true },
            {"data": "type", name:"類型" , "orderable":false },
            {"data": "content", name:"內容" , "orderable":false },
            {"data": "time", name:"時間" , "orderable":true },
            {"data": "link", name:"查看" , "orderable":false }
           ];

		$('#datatable').DataTable({"order": [[ 3, "desc" ]], "columns":column, "language":language, "lengthChange": false, "aLengthMenu" : 10, "bScrollCollapse": true});
		
		
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
			<button id="checkPwdBtn" type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#setAllRead">全部已讀</button>
				<div class="modal fade" id="setAllRead" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">確認全部設為已讀</h5>
				      </div>
				      <div class="modal-body">是否確認將所有通知設為已讀？</div>
				      <div class="modal-footer">
				      	<button id="allRead" type="submit" class="btn btn-primary">確認</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				      </div>
				    </div>
				  </div>
				</div>
			<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
   				<thead>
					<tr>
						<th>設為已讀</th>
						<th>類型</th>
                        <th>內容</th>
                        <th>時間</th>
                        <th>查看</th>
					</tr>
				</thead>		
				<tbody>
					<c:forEach var="pojo" items="${list}">
						<c:if test="${pojo != null}">
							<tr style="height: 20px;">
								<td class="read" style="width:90px;vertical-align:middle;text-align:center;">
									<c:choose>
										<c:when test="${pojo.isRead == true}">
											<img data-title="已讀" data-toggle="modal" src="<c:url value='/resources/img/icon_ok.png' />"/>
										</c:when>
										<c:otherwise>
											<button value="${pojo.notificationId}" class="readBtn btn btn-warning btn-xs" data-title="已讀" data-toggle="modal">已讀</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="type" style="width:60px;vertical-align:middle">${pojo.type}</td>
	                            <td class="content" style="vertical-align:middle">${pojo.content }</td>
	                            <td class="time" style="width:150px;vertical-align:middle">${pojo.notificationDate }</td>
	                            <td class="link" style="padding: 0px;vertical-align:middle"><button style="position:relative;top:7px" value="${pojo.linkId}" class="linkBtn btn btn-primary btn-xs" data-title="查看" data-toggle="modal"><img class="linkBtnImg" src="<c:url value='/resources/img/icon_link.png' />"/></button></p></td>
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