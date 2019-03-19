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
<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9cpXz2HFE2Dw_vITbm-T6Z-6v-TJujBQ"></script>
<style>
	#main {
		width: 1050px;
		margin: auto;
		position: relative;
		top: 50px;
	}
	.outSide{
	    height:850px;
		width:1000px;
		margin: auto;
 		position: relative; 
		top: 40px;
	 }
	 .hide{
	 	display:none;
	 }
	 .settingBody{
	 	font-family:微軟正黑體;
		background-color:#F5F5F5;
		font-weight:bold;
		
	 }
	 .labelClass{
	 	font-size:25px;
	 	font-weight:1200px;
	 	font-family:微軟正黑體;
	 }
	 .likeColor{
		 color:red;
	 }
	 .hideFile{
/* 	 	display:none; */
		position:absolute;
		top:500px;
		left:131px;
		z-index:-100;
		border-style:none;
	 }
	 .fileClass{
	 	width:100px;
	 	height:35px;
	 	background-color:#BCD2EE;
	 	cursor: pointer;
	 	border-radius:10px;
	 	font-size:20px;
	 	position: relative;
		top: 0px;
		text-align:center;
		z-index:999;
	 }
	 .fileClass:hover{
	 	background-color:#869CB6;
	 }
	 #googleMap{
	 	width: 600px;
	    height: 450px;
	    display:none;
	    margin-top:10px;
	 }
	 #closeMap{
	 	display:none;
	 	margin-left:15px;
	 	margin-top:20px;
	 }
	 .topMaigin{
		margin-top:35px;	 
	 }
	 .settingImage{
	 	width:400px;
	 	height:240px;
	 	margin-top:20px;
	 }
	 .settingCheck{
	 	margin-top:80px;
	 }
	 .modifyButton{
		font-weight:800px !important;
		font-size:30px;
		position:relative;
		top:130px;
		width:100px;
		height:50px;

	 }
	 .noEvent{
	 	float:right;
	 	background-color:red;
	 	color:white;
	 	font-size:30px;
	 	font-weight:1200px;
	 	text-align:center;
	 	font-family:微軟正黑體 !important;
		border-radius:20px;
	 }
	 .uncheckEvent{
	 	
	 	color:white;
		font-size:30px;
	 	font-weight:1200px;
	 	text-align:center;
	 	font-family:微軟正黑體 !important;
		border-radius:20px;	
		background-color:#009ACD; 
	 }
	 #spanLimit{
	 	margin-top:50px;
	 	color:red;
	 	font-size:25px;
	 }
</style>
<script type="text/javascript">
	$(document).ready(function () {
		$("#findAddress").blur(function () {
		  var geocoder = new google.maps.Geocoder();
		  var add = $("#findAddress").val();
		
		  geocoder.geocode({ 'address': add },
		    function (results, status) {
		      if (status == google.maps.GeocoderStatus.OK) {
		        var point = results;
		
		        var realadd = results[0].formatted_address;
		
		        var location = results[0].geometry.location;
		        // location.lat 經度
		        // location.lng 緯度
		        
		        $("#eventLatitude").val(location.lat);
		        $("#eventLongitude").val(location.lng);
		        $("#eventAddress").val(realadd);
		        $("#eventLocation").val(add);
		
		        
		        var map = new google.maps.Map(document.getElementById('googleMap'), {
		          zoom: 14, //放大的倍率
		          center: location //初始化的地圖中心位置
		        });
		        var marker = new google.maps.Marker({
		          position: location,
		          map: map,
		          title: realadd,
		          animation: google.maps.Animation.BOUNCE
		        });
		
		        var info = new google.maps.InfoWindow();
		        info.setContent(realadd +'<p></p><a href =' + 'https://www.google.com/maps/search/' +realadd +'>在地圖上查看</a>');
		        info.open(map, marker);
		
		        $("#googleMap").show();
		        $("#closeMap").show();
		      } else {
		        alert('解析失敗!查無此地');
		      }
		
		    });
		});
		
		$("#closeMap").click(function(){
			$("#googleMap").toggle();
			
		});
		
			<c:if test="${event.eventStatus == 'no'}">
				$("#eventName ,#eventTypeId, #eventDateStart, #eventDateEnd, #eventFee, #eventContent, #eventMemberLimit, #multipartFile, #findAddress,#labelFile, #eventStatus").attr("readonly", true);
			</c:if>
		$("#eventMemberLimit").blur(function(){
			var eventId = ${event.eventId};
			var memberLimit = $("#eventMemberLimit").val();
			var limitNow = ${event.eventMemberLimit};
			$.ajax({
				type: "POST",                           
	    	    url: "${pageContext.request.contextPath}/event/currentMember/"+eventId,
	    	    data: {"eventId": eventId, "memberLimit": memberLimit},
	    	    success: function (limit){
	    	    	if(limit=="yes"){
	    	    		$("#spanLimit").html("OK");
	    	    		
	    	    	}else{
	    	    		$("#spanLimit").html("人數不可小於目前人數");
	    	    		$("#eventMemberLimit").val(limitNow);
	    	    	}
	    	    } 
			});
			
		});
	
	});
</script>
<title>Insert title here</title></head>
<body class="settingBody">
<jsp:include page="${request.contextPath}/navbar"/>

<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<jsp:include page="${request.contextPath}/event/settingbar"/>
		<div class="outSide" >
	        <form:form class="pure-form pure-g" modelAttribute="event" action="${pageContext.request.contextPath}/event/setting/${eventId}" method="POST" enctype="multipart/form-data">
				<div class="pure-u-1-2">
				<label class="labelClass" for="eventName" path="eventName">活動名稱 : </label>　
				<form:input class="pure-input-2-3" path="eventName" maxlength="10" id="eventName" required="required"></form:input></div>
				
				<div class="pure-u-1-4"><label class="labelClass"> &nbsp;按讚人數 : <span class="likeColor"> ${event.eventLike} </span> <i class="far fa-thumbs-up"></i></label></div>
				
				<c:if test="${event.eventStatus == 'no'}">
				<div class="pure-u-1-5 noEvent">活動已流團</div>
				</c:if>
				<c:if test="${event.eventStatus == 'yes'}">
				<div class="pure-u-1-5 noEvent">活動已成團</div>
				</c:if>
				<c:if test="${event.eventStatus == 'unchecked'}">
				<span class="pure-u-1-5 uncheckEvent">活動尚未成團</span>
				</c:if>
				<div class="pure-u-1-2">
				<label class="labelClass" for="eventTypeId">活動類型：</label>
				<form:select class="pure-input-1-2" path='eventTypeId' id="eventTypeId" required="required">
				<form:option class="pure-input-1-4" value="1">美食</form:option>
				<form:option class="pure-input-1-4" value="2">運動</form:option>
				<form:option class="pure-input-1-4" value="3">娛樂</form:option>
				<form:option class="pure-input-1-4" value="4">其他</form:option>
				</form:select></div>
				
				<div class="pure-u-1-2">
					<label class="labelClass">設定活動狀態 : </label>
					
					<form:select class="pure-input-1-2" path='eventStatus' id="eventStatus" required="required">
				<form:option class="pure-input-1-4" value="unchecked">尚未成團</form:option>
				<form:option class="pure-input-1-4" value="yes">成團</form:option>
				<form:option class="pure-input-1-4" value="no">流團 (將無法再更改內容)</form:option>
				</form:select></div>
				
				<div class="pure-u-1-2">
				<form:label class="labelClass" for="eventDateStart" path="eventDateStart" required="required">開始時間：</form:label> <form:input class="pure-u-1-2" id="eventDateStart" path="eventDateStart"></form:input></div>
				<div class="pure-u-1-2"><form:label class="labelClass" for="eventDateEnd" path="eventDateEnd" required="required">結束時間：</form:label><form:input class="pure-u-1-2" id="eventDateEnd" path="eventDateEnd" required="required"></form:input></div>		
				
<!-- 	HIDE			-------------- -->

				<div class="hide">
<!-- 				<div class="pure-u-1-2"> -->
<%-- 				<form:label class="labelClass" for="eventLocation" path="eventLocation">地區：</form:label></div>　 --%>
<%-- 				<form:input id="eventLocation" path="eventLocation" required="required"></form:input> --%>
							
				<div class="pure-u-1-2">
				<form:label class="labelClass" for="eventAddress" path="eventAddress">地址：</form:label></div>　
				<form:input path='eventAddress' id="eventAddress" required="required"/>		
				
				<div class="pure-u-1-2">
				<form:label class="labelClass" for="eventLatitude" path="eventLatitude">經度：</form:label></div>　
				<form:input path='eventLatitude' id="eventLatitude" required="required"/>
							
				<div class="pure-u-1-2">
				<label class="labelClass" for="eventLongitude">緯度：</label></div>　
				<form:input path='eventLongitude' id="eventLongitude" required="required"/>
				</div>
<!-- 			HIDE------------------------------------	 -->
				<div class="pure-u-2-3">	
				<label class="labelClass" for="findAddress">活動地點 : </label>&nbsp;&nbsp;&nbsp; 
				<form:input class="pure-input-1-2" path="eventLocation" type="text" size="20" value="${event.eventLocation}" id="findAddress" required="required"/></div>
				<span>
				<button id="closeMap" type="button" class="btn btn-dark">Google Map</button>
				
				</span>
				
				
				
<!-- 				地圖 -->
				<div id="googleMap" class="pure-u-1 "></div>
												
				<div class="pure-u-3-4">
				<label class="labelClass" for="eventContent">活動內容：</label><form:textarea path='eventContent' id="eventContent" class="pure-u-1-2" style="width:500px;height:100px;position:relative;top:30px;"/></div>
				
				<div class="pure-u-1-3 topMaigin">
				<label class="labelClass">目前人數：${event.eventCurrentMembers} 人</label></div>
				
				<div class="pure-u-1-3 topMaigin">
				<label class="labelClass" for="eventMemberLimit">人數上限：</label><form:input class="pure-input-1-2" path='eventMemberLimit' id="eventMemberLimit" onkeyup="value=value.replace(/[^\d]/g,'')" required="required"/></div>
				<span class="pure-u-1-3" id="spanLimit"></span>
				
				<div class="pure-u-1 ">
<%-- 				<label class="labelClass" for="eventFee">活動費用：</label><form:input class="pure-input-1-4" id="eventFee" readonly="true" onkeyup="value=value.replace(/[^\d]/g,'')" path='eventFee' /></div> --%>
				<label class="labelClass" for="eventFee">活動費用：${event.eventFee } $</label>
				
				<div class="pure-u-1 upload-btn-wrapper">
				<label class="labelClass">活動圖片 : </label>
				<c:if test="${event.eventStatus != 'no'}">
				 <label class="labelClass fileClass" id="labelFile" for="multipartFile"><i class="far fa-file-image"></i>選擇檔案</label>
				<form:input class="pure-input-1-4 hideFile" id="multipartFile" path='multipartFile' type="file" accept="image/*"/></div>
				</c:if>
				<div class="pure-u-1-2">
				<img class="settingImage" src="<c:url value='/getEventImage/${event.eventId}.jpg' />"/></div>
				<c:if test="${event.eventStatus != 'no'}">
				<div class="pure-u-1-3 settingCheck">
				<button type="button" class="btn btn-primary modifyButton" data-toggle="modal" data-target="#checkEvent">確認修改</button>
				</div>
				</c:if>
				
				
				<div class="profile-button" align="center">
								<div class="modal fade" id="checkEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="pure-u-1-5 modal-title" id="exampleModalLongTitle">確認</h5>
								      </div>
								      <div class="pure-u-1-2 modal-body">確認修改活動資料？</div>
								      <div class="modal-footer">
								      	<button type="submit" class="btn btn-primary">確認修改</button>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消修改</button>
								      </div>
								    </div>
								  </div>
								</div>　　　　　　
							</div>	
					
					
					</form:form>	
		</div>
	
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>