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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>	
<!-- DataTable -->

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

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

#menu {
	position: fixed;
	left: 15;
	top: 25%;
	width: 8em;
	margin-top: -2.5em;
}

</style>

<script>
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
	//顯示視窗前呼叫
	$("#ooo").on("show.bs.modal",function(e){
	  console.log('顯示視窗前呼叫');
	});

	//轉場特效結束，已完全呈現時呼叫
	$("#ooo").on("shown.bs.modal",function(e){
	  console.log('轉場特效結束，已完全呈現時呼叫');
	});

	//關閉視窗前呼叫
	$("#ooo").on("hide.bs.modal",function(e){
	  console.log('關閉視窗前呼叫');
	});

	//轉場特效結束，已完全隱藏時呼叫
	$("#ooo").on("hidden.bs.modal",function(e){
	  console.log('轉場特效結束，已完全隱藏時呼叫');
	});

	//隱藏視窗
	$("#ooo").modal('hide');

	//開啟視窗
	$("#ooo").modal('show');

	//切換視窗顯示、不顯示
	$("#ooo").modal('toggle');

	//判斷視窗是否開啟中
	if($("#ooo").hasClass('in')){
	  console.log('視窗目前是開啟的狀態..');
	}
</script>


<title>各社團主頁</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	<!-- 	解決include jQuery衝突 -->
	<script type="text/javascript">
		var xxx = jQuery.noConflict(true);
	</script>
	<!-- 	解決include jQuery衝突 -->
	<div id="main">
		<!-- 請把所有內容寫在此div內 -->


<jsp:include page="${request.contextPath}/group/group_navbar" />
	<!-- 	解決include jQuery衝突 -->
	<script type="text/javascript">
		var xxx = jQuery.noConflict(true);
	</script>
	<!-- 	解決include jQuery衝突 -->

				<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<div class="display-4">社團名稱: ${groupMain.groupName}</div>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group mr-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">分享</button>

							<!-- 					按鈕顯示判斷		 -->
							<c:if test="${sessionScope.memberId == groupMain.groupLeaderId}">
								<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal"
								data-target="#ooo">社團申請管理</button>
							</c:if>
							<!-- 					按鈕顯示判斷		 -->

						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<span data-feather="calendar"></span> This week
						</button>
					</div>
				</div>

<!-- Modal管理者管理成員 -->
<div id="ooo" class="modal inmodal fade"  tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
        <div class="modal-title ">
          標題列
        </div>
      </div>
      <div class="modal-body" >
        內容
      </div>
      <div class="modal-footer" >
        <button class="btn">OK</button>
        <button class="btn">Cancel</button>
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
								<th>編號</th>
								<th>標題</th>
								<th>發文人</th>
								<th>發文日期</th>
								<th>最後回覆日期</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1,001</td>
								<td>Lorem</td>
								<td>ipsum</td>
								<td>dolor</td>
								<td>sit</td>
							</tr>
							<tr>
								<td>1,002</td>
								<td>amet</td>
								<td>consectetur</td>
								<td>adipiscing</td>
								<td>elit</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>Integer</td>
								<td>nec</td>
								<td>odio</td>
								<td>Praesent</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>libero</td>
								<td>Sed</td>
								<td>cursus</td>
								<td>ante</td>
							</tr>
							<tr>
								<td>1,004</td>
								<td>dapibus</td>
								<td>diam</td>
								<td>Sed</td>
								<td>nisi</td>
							</tr>
							<tr>
								<td>1,005</td>
								<td>Nulla</td>
								<td>quis</td>
								<td>sem</td>
								<td>at</td>
							</tr>
							<tr>
								<td>1,006</td>
								<td>nibh</td>
								<td>elementum</td>
								<td>imperdiet</td>
								<td>Duis</td>
							</tr>
							<tr>
								<td>1,007</td>
								<td>sagittis</td>
								<td>ipsum</td>
								<td>Praesent</td>
								<td>mauris</td>
							</tr>
							<tr>
								<td>1,008</td>
								<td>Fusce</td>
								<td>nec</td>
								<td>tellus</td>
								<td>sed</td>
							</tr>
							<tr>
								<td>1,009</td>
								<td>augue</td>
								<td>semper</td>
								<td>porta</td>
								<td>Mauris</td>
							</tr>
							<tr>
								<td>1,010</td>
								<td>massa</td>
								<td>Vestibulum</td>
								<td>lacinia</td>
								<td>arcu</td>
							</tr>
							<tr>
								<td>1,011</td>
								<td>eget</td>
								<td>nulla</td>
								<td>Class</td>
								<td>aptent</td>
							</tr>
							<tr>
								<td>1,012</td>
								<td>taciti</td>
								<td>sociosqu</td>
								<td>ad</td>
								<td>litora</td>
							</tr>
							<tr>
								<td>1,013</td>
								<td>torquent</td>
								<td>per</td>
								<td>conubia</td>
								<td>nostra</td>
							</tr>
							<tr>
								<td>1,014</td>
								<td>per</td>
								<td>inceptos</td>
								<td>himenaeos</td>
								<td>Curabitur</td>
							</tr>
							<tr>
								<td>1,015</td>
								<td>sodales</td>
								<td>ligula</td>
								<td>in</td>
								<td>libero</td>
							</tr>
						</tbody>
					</table>
				</div>
				</main>
			</div>
		
	
	<!-- DataTable -->

	<!-- <script type="text/javascript" charset="utf8" -->
	<!-- 	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script> -->

	<!-- DataTable -->
</body>
</html>