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
	.groupBtn {
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
	#groupImage {
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
		$(document).on("click", ".groupPageBtn", function(){
			window.open("${pageContext.request.contextPath}/group/" + $(this).val());
		});
		$(document).on("click", ".groupSettingBtn", function(){
// 			window.open("${pageContext.request.contextPath}/event/" + $(this).val());
		});
		



		//DataTable
		var language = {
		        "zeroRecords": "沒有結果",
		        "info": "<span class='seperator'>  </span>" + "總共 _TOTAL_ 個社團",
		        "infoFiltered": " (從所有 _MAX_ 社團中篩選出)",
		        "infoEmpty": "共 0 個社團",
		        "search":"搜尋社團：",
		        "paginate": {
		            "previous": "上一頁",
		            "next": "下一頁",
		            "first": "第一頁  ",
		            "last": "  最後一頁"
		        }
		    };
		var column=[
            {"data": "name", name:"社團名稱" , "orderable":true },
            {"data": "link", name:"社團連結" , "orderable":false }
           ];

		$('#datatable').DataTable({"columns":column, "language":language, "lengthChange": false, "aLengthMenu" : 10, "bScrollCollapse": true});
	});
	
</script>
<title>我所創立的社團</title></head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-3">
				<jsp:include page="${request.contextPath}/member/self/sidebar"/>
			</div>
			<div id="x" class="col-9">
				<jsp:include page="${request.contextPath}/member/self/group/navbar"/>
				<div id="main-view"><br /><br />
					<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
	    				<thead>
							<tr>
								<th>社團名稱</th>
	                            <th>社團連結</th>
							</tr>
						</thead>		
						<tbody>
							<c:forEach var="group" items="${groupList}">
								<tr>
									<td><img id="groupImage" src="<c:url value='/getGroupImage/${group.groupId}.jpg' />" />　${group.groupName}</td>
		                            <td class="groupBtn"><p data-placement="top" data-toggle="tooltip" title="社團連結"><button value="${group.groupId}" class="groupPageBtn btn btn-primary btn-xs" data-title="社團連結" data-toggle="modal"><img class="linkBtn" src="<c:url value='/resources/img/icon_link.png' />"/></button></p></td>
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