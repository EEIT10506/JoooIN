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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">
<!-- =============================== -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9cpXz2HFE2Dw_vITbm-T6Z-6v-TJujBQ&libraries=places" defer></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
		top:1013px;
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
	 .startCalender{
 	 	position:absolute; 
 	 	top:100px; 
	 	left:380px; 
			
/* 		display:inline; */
	 }
	  .endCalender{
	 	position:absolute;
	 	top:135px;
	 	left:880px;
	 }
</style>
<script type="text/javascript">
	$(document).ready(function () {
 	    var check = "${check}";
	       if(check == '1'){
	   		$("#successful").click();
	        }
		var map = new google.maps.Map(document.getElementById('map'), {
	          center: {lat: 25.047814, lng: 121.516949},
	          zoom: 13,
	          mapTypeId: 'roadmap'
	        });

	        // Create the search box and link it to the UI element.
	        var input = document.getElementById('address');
	        var searchBox = new google.maps.places.SearchBox(input);
	        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);	
		
		 map.addListener('bounds_changed', function() {
	          searchBox.setBounds(map.getBounds());
	        });

	        var markers = [];
	        // Listen for the event fired when the user selects a prediction and retrieve
	        // more details for that place.
	        searchBox.addListener('places_changed', function() {
	          var places = searchBox.getPlaces();
	          
	          if (places.length == 0) {
	            return;
	          }

	          // Clear out the old markers.
	          markers.forEach(function(marker) {
	            marker.setMap(null);
	          });
	          markers = [];

	          // For each place, get the icon, name and location.
	          var bounds = new google.maps.LatLngBounds();
	          places.forEach(function(place) {
	            if (!place.geometry) {
	              console.log("Returned place contains no geometry");
	              return;
	            }
	            var icon = {
	              url: place.icon,
	              size: new google.maps.Size(71, 71),
	              origin: new google.maps.Point(0, 0),
	              anchor: new google.maps.Point(17, 34),
	              scaledSize: new google.maps.Size(25, 25)
	            };

	            // Create a marker for each place.
	           var point = new google.maps.Marker({
	              map: map,
	              icon: icon,
	              title: place.name,
	              position: place.geometry.location
	            });
	            point.addListener('click',function(){
	            	document.getElementById("local").value = place.name;
	            	document.getElementById("add").value = place.formatted_address;
	            	document.getElementById("lng").value = place.geometry.location.lng();
	            	document.getElementById("lat").value = place.geometry.location.lat();
	            });
	            markers.push(point);   
	            if (place.geometry.viewport) {
	              // Only geocodes have viewport.
	              bounds.union(place.geometry.viewport);
	            } else {
	              bounds.extend(place.geometry.location);
	            }
	          });
	          map.fitBounds(bounds);
	        });
	    
	});             

	$(document).ready(function () {         
			<c:if test="${event.eventStatus == 'no'}">
				$("#sd, #ed, #eventName ,#eventTypeId, #eventContent, #eventMemberLimit, #multipartFile, #address, #labelFile, #eventStatus").attr("readonly", true);
			</c:if>
			<c:if test="${eventFinished == false }">
			    $("#sd, #ed, #eventName ,#eventTypeId, #eventContent, #eventMemberLimit, #multipartFile, #address, #labelFile, #eventStatus").attr("readonly", true);
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
	
	
	
	
	$(function () {
		var today = new Date();

		
	    $('#datetimepicker1').datetimepicker({
	    locale: moment.locale('zh-tw'),
	    		           
	    });   

	            
	    $('#datetimepicker2').datetimepicker({
	    locale: moment.locale('zh-tw'),	
	    
	    });
	    $("#datetimepicker1").on("change.datetimepicker", function (e) {
	        $('#datetimepicker2').datetimepicker('minDate', e.date);
	    });
	    $("#datetimepicker2").on("change.datetimepicker", function (e) {
	        $('#datetimepicker1').datetimepicker('maxDate', e.date);
	    });
	    
	    $("#datetimepicker1").click(function () {
	        $('#datetimepicker1').datetimepicker('minDate', today);
	    });
	    $("#datetimepicker2").click(function () {
	        $('#datetimepicker2').datetimepicker('minDate', today);
	    });

	});
	
</script>
<title>Insert title here</title></head>
<body class="settingBody">
<jsp:include page="${request.contextPath}/navbar"/>

<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<jsp:include page="${request.contextPath}/event/settingbar"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/events/datetimepicker/zh-tw.js'/> " charset="UTF-8"></script>	
		<div class="outSide" >
	        <form:form class="pure-form pure-g" modelAttribute="event" action="${pageContext.request.contextPath}/event/setting/${eventId}" method="POST" enctype="multipart/form-data">
				<div class="pure-u-1-2">
				<label class="labelClass" for="eventName" path="eventName">活動名稱 : </label>　
				<form:input  class="pure-input-2-3" path="eventName" maxlength="10" id="eventName" required="required"></form:input></div>
				
				<div class="pure-u-1-4"><label class="labelClass"> &nbsp;按讚人數 : <span class="likeColor"> ${event.eventLike} </span> <i class="far fa-thumbs-up"></i></label></div>
				
				<c:if test="${event.eventStatus == 'no'}">
				<div class="pure-u-1-5 noEvent">活動已流團</div>
				</c:if>
				<c:if test="${event.eventStatus == 'yes' and eventFinished != false}">
				<div class="pure-u-1-5 noEvent">活動已成團</div>
				</c:if>
				<c:if test="${event.eventStatus == 'unchecked'}">
				<span class="pure-u-1-5 uncheckEvent">活動尚未成團</span>
				</c:if>
				<c:if test="${event.eventStatus == 'yes' and eventFinished == false}">
				<span class="pure-u-1-5 noEvent">活動已結束</span>
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
				
<!-- 				<div class="pure-u-1-2"> -->
<%-- 				<form:label class="labelClass" for="eventDateStart" path="eventDateStart" required="required">開始時間：</form:label> <form:input class="pure-u-1-2" id="eventDateStart" path="eventDateStart"></form:input></div> --%>
<%-- 				<div class="pure-u-1-2"><form:label class="labelClass" for="eventDateEnd" path="eventDateEnd" required="required">結束時間：</form:label><form:input class="pure-u-1-2" id="eventDateEnd" path="eventDateEnd" required="required"></form:input></div>		 --%>

				<div class="pure-u-1" style="margin-top:15px;">
							<span class="labelClass">開始時間：</span>
							<span class="input-group date" id="datetimepicker1" data-target-input="nearest" style="width:300px;display:inline !important;">
									
							<form:input  id="sd" path='eventDateStart' class="pure-input-1 form-control datetimepicker-input " data-target="#datetimepicker1" required="required" style="width:300px;display:inline !important;text-align:left;"/>
					 		
					 		<span class="input-group-append " data-target="#datetimepicker1" data-toggle="datetimepicker" style="display:inline !important;">
                    	    <span class="input-group-text" style="display:inline !important"><i class="fa fa-calendar" style="display:inline !important;"></i></span>
                    	    </span>
					</span>	
							<span class="labelClass">&nbsp;&nbsp;&nbsp;結束時間：</span>
							
							<span class="input-group date" id="datetimepicker2" data-target-input="nearest" style="width:300px;display:inline !important;">
							
							<span class="input-group-append " data-target="#datetimepicker2" data-toggle="datetimepicker" style="display:inline !important;"> 
		                     <form:input  id="ed" path='eventDateEnd' class="pure-input-1 form-control datetimepicker-input" data-target="#datetimepicker2" required="required" style="width:300px;display:inline !important;text-align:left;"/>
		                    <span class="input-group-text" style="display:inline !important;"><i class="fa fa-calendar" style="display:inline !important;"></i></span>
		                    </span> 
		                   </span>
				</div>

<!-- 				<label class="labelClass" for="address">活動地點 : </label>&nbsp;&nbsp;&nbsp;  -->
<!-- 				<input class=""  type="text" size="20" value="" id="address" required="required"/></div> -->
<%-- 				<form:input class="" path="eventLocation" type="text" size="20" value="${event.eventLocation}" id="location" required="required"/></div> --%>
				<span>
<!-- 				<button id="closeMap" type="button" class="btn btn-dark">Google Map</button> -->
				
				</span>
				
				
				
<!-- 				地圖 -->
				<div id="" class="pure-u-1 ">
				
				<label class="labelClass" style="margin-top:15px;">請進行關鍵字搜尋後<span style="color:red;">選取</span>活動地點 :</label>
				<input type="text" size="20" class="controls" placeholder="Search Box"
					id="address" value="" style="width:200px; height:50px"/>
				</div>


				
				<div id="map" class="pure-u-1" style="width:600px;height:400px;"></div>
				<%--設定顯示 Google Maps 的大小--%>
				
				<div class="pure-u-1-2">
					<label class="labelClass" path='eventLocation' for="local">活動地區:</label>
					<form:input path='eventLocation' class="pure-input-2-3" id="local" required="required" readonly="true"/></div>
					
					<div class="pure-u-3-4">
						<label class="labelClass" path='eventAddress' for="add">活動地址:</label>
					<form:input path='eventAddress' class="pure-input-2-3" id="add" required="required" readonly="true"/></div>
				<p style="display:none;">
					活動座標經度:
					<form:input path='eventLatitude' id="lat" required="required" readonly="true"/>
					
					活動座標緯度:
					<form:input path='eventLongitude' id="lng" required="required" readonly="true"/>
					</p>
				
				
				<div class="pure-u-3-4">
				<label class="labelClass" for="eventContent">活動內容：</label><form:textarea path='eventContent' id="eventContent" class="pure-u-1-2" style="width:500px;height:100px;position:relative;top:30px;"/></div>
				
				<div class="pure-u-1-3 topMaigin">
				<label class="labelClass">目前人數：${event.eventCurrentMembers} 人</label></div>
				
				<div class="pure-u-1-3 topMaigin">
				<label class="labelClass" for="eventMemberLimit">人數上限：</label><form:input class="pure-input-1-2" path='eventMemberLimit' id="eventMemberLimit" onkeyup="value=value.replace(/[^\d]/g,'')" required="required"/></div>
				<span class="pure-u-1-3" id="spanLimit"></span>
				
				<div class="pure-u-1 ">

				<label class="labelClass" for="eventFee">活動費用：${event.eventFee } $</label>
				
				<div class="pure-u-1 upload-btn-wrapper">
				<label class="labelClass">活動圖片 : </label>
				<c:if test="${event.eventStatus != 'no'}">
				 <label class="labelClass fileClass" id="labelFile" for="multipartFile"><i class="far fa-file-image"></i>選擇檔案</label>
				<form:input class="pure-input-1-4 hideFile" id="multipartFile" path='multipartFile' type="file" accept="image/*"/></div>
				</c:if>
				<div class="pure-u-1-2">
				<img class="settingImage" src="<c:url value='/getEventImage/${event.eventId}.jpg' />"/></div>
				<c:if test="${event.eventStatus != 'no' and eventFinished != false}">
				<div class="pure-u-1-3 settingCheck">
				<button type="button" class="btn btn-primary modifyButton" data-toggle="modal" data-target="#checkEvent">確認修改</button>
				</div>
				</c:if>
				
				
				<div class="profile-button" align="center">
								<div class="modal fade" id="checkEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="pure-u-1-5 modal-title" id="exampleModalLongTitle" style="font-size:30px;font-weight:bold;font-family:微軟正黑體;">確認</h5>
								      </div>
								      <div class="pure-u-1-2 modal-body" style="text-align:left;font-size:20px;font-weight:bold;font-family:微軟正黑體;">確認修改活動資料？</div>
								      <div class="modal-footer">
								      	<button type="submit" class="btn btn-primary">確認修改</button>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消修改</button>
								      </div>
								    </div>
								  </div>
								</div>　　　　　　
							</div>	
					
					
					</form:form>	
					<button type="button" id="successful" style="display:none;"class="btn btn-primary modifyButton" data-toggle="modal" data-target="#check"></button>
					<div class="profile-button" align="center">
								<div class="modal fade" id="check" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
<!-- 								      <div class="modal-header"> -->
<!-- 								        <h5 class="pure-u-1-5 modal-title" id="exampleModalLongTitle" style="font-size:30px;font-weight:bold;font-family:微軟正黑體;"></h5> -->
<!-- 								      </div> -->
								      <div class="pure-u-1-2 modal-body" style="text-align:left;font-size:30px;font-weight:bold;font-family:微軟正黑體;text-align:center;">修改成功<i class="fas fa-check" style="color:green;"></i></div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div>　　　　　　
							</div>	
		</div>
	
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>