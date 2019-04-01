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
	.eventBtn {
		width: 70px;
		text-align: center;
	}
	.textTd {
		width: 90px;
		text-align: center;
	}
	td p {
		position: relative;
		top: 5px;
	}
 	.linkBtn { 
 		-webkit-filter:invert(1); 
 	} 
	thead {
		text-align: center;
	}
	td {
		vertical-align:middle!important;
	}
	#eventImage {
		width: 60px;
		border-radius: 100px;
	}
	button {
		position: relative;
		top: 7px;
	}
</style>
<script>
	$(document).ready(function(){		
		$(document).on("click", ".eventPageBtn", function(){
			window.open("${pageContext.request.contextPath}/event/" + $(this).val());
		});
		
		$(document).on("click", ".eventNoLikeBtn", function(){
			var eventId = $(this).val();
			
			$.ajax({
			    type: "POST",                           
			    url: "${pageContext.request.contextPath}/member/noLikeEvent",
			    data: {"eventId": eventId},
			    success: function(not_login){
			    	if (not_login){
			    		location.href = "${pageContext.request.contextPath}/notLogin";
			    	} else {
			    		location.href = "${pageContext.request.contextPath}/member/self/event/like_event";
			    	}
			    }
			});
		});
		
		$(".eventDateEnd").each(function(){
			var eventDateEnd = new Date($(this).text());
			var id = "s" + this.id.substr(1);
			
			if (eventDateEnd < new Date()){
				document.getElementById(id).innerHTML = document.getElementById(id).innerHTML + "<br />（已結束）";
			}
		});

		//DataTable
		var language = {
		        "zeroRecords": "沒有結果",
		        "info": "<span class='seperator'>  </span>" + "總共 _TOTAL_ 個活動",
		        "infoFiltered": " (從所有 _MAX_ 活動中篩選出)",
		        "infoEmpty": "共 0 個活動",
		        "search":"搜尋活動：",
		        "paginate": {
		            "previous": "上一頁",
		            "next": "下一頁",
		            "first": "第一頁  ",
		            "last": "  最後一頁"
		        }
		    };
		var column=[
            {"data": "name", name:"活動名稱" , "orderable":true },
            {"data": "start", name:"開始時間" , "orderable":true },
            {"data": "end", name:"結束時間" , "orderable":true },
            {"data": "status", name:"活動狀態" , "orderable":true },
            {"data": "link", name:"活動連結" , "orderable":false },
            {"data": "delete", name:"取消讚" , "orderable":false }
           ];

		$('#datatable').DataTable({"columns":column, "language":language, "lengthChange": false, "aLengthMenu" : 10, "bScrollCollapse": true});
	});
	
</script>
<title>我的活動</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/self/sidebar"/>
			</div>
			<div id="x" class="col-9">
				<jsp:include page="${request.contextPath}/member/self/event/navbar"/>
				<div id="main-view"><br /><br />
					<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
	    				<thead>
							<tr>
								<th>活動名稱</th>
	                            <th>開始時間</th>
	                            <th>結束時間</th>
	                            <th>活動狀態</th>
	                            <th>活動連結</th>
	                            <th>取消讚</th>
							</tr>
						</thead>		
						<tbody>
							<c:forEach var="event" items="${eventList}">
								<tr>
									<td><img id="eventImage" src="<c:url value='/getEventImage/${event.eventId}.jpg' />" />　<c:out value="${event.eventName}"/></td>
		                            <td class="textTd"><p data-placement="top" data-toggle="tooltip" title="開始時間">${event.eventDateStart}</p></td>
		                            <td class="textTd"><p id="d${event.eventId}" class="eventDateEnd" data-placement="top" data-toggle="tooltip" title="結束時間">${event.eventDateEnd}</p></td>
		    						<td class="textTd"><p id="s${event.eventId}" class="eventStatus" data-placement="top" data-toggle="tooltip" title="活動狀態">
									<c:if test="${event.eventStatus == 'unchecked'}">未成團</c:if>
									<c:if test="${event.eventStatus == 'yes'}">成團</c:if>
									<c:if test="${event.eventStatus == 'no'}">流團</c:if>	</p></td>
		    						<td class="eventBtn"><p data-placement="top" data-toggle="tooltip" title="活動連結"><button value="${event.eventId}" class="eventPageBtn btn btn-primary btn-xs" data-title="活動連結" data-toggle="modal"><img class="linkBtn" src="<c:url value='/resources/img/icon_link.png' />"/></button></p></td>
		    						<td class="eventBtn"><p data-placement="top" data-toggle="tooltip" title="取消讚"><button value="${event.eventId}" class="eventNoLikeBtn btn btn-danger btn-xs" data-title="取消讚" data-toggle="modal"><img class="linkBtn" src="<c:url value='/resources/img/icon_delete.png' />"/></button></p></td>
								</tr>
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