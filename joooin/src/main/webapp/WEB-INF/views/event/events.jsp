<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- dataTables样式表 -->
<link
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	rel="stylesheet" />

<!-- bootstrap样式表 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 50px;
}

#address {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
        height: 35px;
}

#address:focus {
        border-color: #4d90fe;
      }
      
#showevents {
width: 1200px; 
}      

.map{
width:800px !important;
height:600px !important;
position:relative;
right:50px;
} 
 .div{
/* width:1200px !important; */
/* float:right;  */
/* position:absolute; */
/* top:80px; */
/* left:455px;   */
display:inline !important;
} 
</style>
<title></title>


</head>
<body>
	<jsp:include page="${request.contextPath}/navbar" />
	
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9cpXz2HFE2Dw_vITbm-T6Z-6v-TJujBQ&libraries=places" defer></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/events/datetimepicker/zh-tw.js'/> " charset="UTF-8"></script>	


	<!-- 請把所有內容寫在此div內 -->
	<div id="main" class="container">
		<button id="new">開新活動</button>
		<button id="get">尋找活動</button>
		<div style="margin-bottom: 50px"></div>

		<div id="newdiv" style="display: none">


			<form:form modelAttribute="NewEvent" method='POST'
				onsubmit="return check();" enctype="multipart/form-data">
				<p>

					活動名稱:
					<form:input path='eventName' required="required" maxlength="10" />
				<p></p>
					開始時間:<span class="input-group date" id="datetimepicker1" data-target-input="nearest" style="width:300px">
					<form:input id="sd" path='eventDateStart' class="form-control datetimepicker-input" data-target="#datetimepicker1" required="required" type="datetime-local"/>
					  <span class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker" >
                        <span class="input-group-text"><i class="fa fa-calendar" ></i></span>
                    </span> 
                </span>
				<p></p>
					結束時間: <span class="input-group date" id="datetimepicker2" data-target-input="nearest" style="width:300px">
					<form:input id="ed" path='eventDateEnd' class="form-control datetimepicker-input" data-target="#datetimepicker2" required="required" type="datetime-local" />
					<span class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                        <span class="input-group-text" ><i class="fa fa-calendar"></i></span>
                    </span>
                </span>				
				<p></p>
           
                              請進行關鍵字搜尋後選取活動地點:<input type="text" size="20" class="controls" placeholder="Search Box"
					id="address" value="" required="required" style="width:300px, height:50px"/>




				<div id="map" style="width: 800px; height: 450px; display: none"></div>
				<%--設定顯示 Google Maps 的大小--%>

				<p></p><div>
					活動地區:
					<form:input path='eventLocation' id="local" required="required" style="width: 400px" readonly="true"/>
					<p></p>
					活動地址:
					<form:input path='eventAddress' id="add" required="required" style="width: 400px" readonly="true"/>
					<p></p>
					活動座標經度:
					<form:input path='eventLatitude' id="lat" required="required" readonly="true"/>
					<p></p>
					活動座標緯度:
					<form:input path='eventLongitude' id="lng" required="required" readonly="true"/>
					<p></p>
				</div>
				<p></p>
			活動內容(可省略):<p></p>
				<form:textarea path='eventContent' style="width:300px;height:100px;" />
				<p>

					活動類型:
					<form:select path='eventTypeId' required="required">
						<form:option value="1">美食</form:option>
						<form:option value="2">運動</form:option>
						<form:option value="3">娛樂</form:option>
						<form:option value="4">其他</form:option>
					</form:select>
				<p>
					活動圖片(不上傳依類型提供預設圖片):
					<form:input path='multipartFile' type="file" accept="image/*" />
				<p>
					人員上限:
					<form:input path='eventMemberLimit' type="number" required="required" onkeydown="if(event.keyCode==13)event.keyCode=9" onKeyPRess="if 
　　 ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>
				<p>
					參加人數(單獨參加免輸入):<input name="quantity" type="number" onkeydown="if(event.keyCode==13)event.keyCode=9" onKeyPRess="if 
　　 ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>
				<p>
					參加費(不輸入設為免費):
					<form:input path='eventFee' type="number" onkeydown="if(event.keyCode==13)event.keyCode=9" onKeyPRess="if 
　　 ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>
				<p>

					<br> <br> <input id="submit" type='submit' value='提交'
						class="btn btn-primary btn-lg active"> <input type='reset'
						value='還原' class="btn btn-secondary btn-lg active"> <br>
					<br> <a href='${pageContext.request.contextPath}'>回到首頁</a>
			</form:form>


		</div>


		<div id="getdiv">

			<table id="showevents" class="display" >
						
							<select id="ewill">
								<option value="allevent">所有活動</option>
								<option value="all">所有未結束</option>
								<option value="alcome">即將開始</option>
								<option value="alfull">即將滿團</option>
								<option value="lost">已結束的團</option>
							</select> 類別:<select id="etype">
								<option value="">全部</option>
								<option value="美食">美食</option>
								<option value="運動">運動</option>
								<option value="娛樂">娛樂</option>
								<option value="其他">其他</option>
							</select> 
							地區:<input type="text" id="loc" style="width: 150px" /> 
							
					<div class="div"><span class="input-group date" id="datetimepicker3" data-target-input="nearest" style="width:300px;display:inline !important">   
					時間:<input id="dcheck" class="form-control datetimepicker-input" data-target="#datetimepicker3" type="datetime-local" style="width:250px;display:inline !important"/>
					  <span class="input-group-append" data-target="#datetimepicker3" data-toggle="datetimepicker" style="display:inline !important">
                        <span class="input-group-text" style="display:inline !important"><i class="fa fa-calendar" style="display:inline !important"></i></span>
                    </span>
                </span></div>
							
						

						<button id="search" onclick="search()">篩選</button>
						
				<thead>
					<tr>
						<th>活動種類</th>
						<th>活動名稱</th>
						<th>活動地點</th>
						<th>活動地址</th>
						<th>開始時間</th>
						<th>結束時間</th>
						<th>上限人數</th>
						<th>目前人數</th>
						<th>人數已滿</th>
						<th>活動地圖</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var='event' items='${AllEvents}'>
						<tr>
							<td><c:if test="${event.eventTypeId=='1'}">
      美食
  </c:if> <c:if test="${event.eventTypeId=='2'}">
    運動
  </c:if> <c:if test="${event.eventTypeId=='3'}">
    娛樂
  </c:if> <c:if test="${event.eventTypeId=='4'}">
    其他
  </c:if></td>
							<td><a href="${pageContext.request.contextPath}/event/${event.eventId}">${event.eventName}</a>
								<p style="margin:0px; padding:0px"></p><button id="e${event.eventId}" value="${event.eventId}" class="likeBtn btn btn-primary btn-sm">讚:${event.eventLike}</button>
							</td>
							<td>${event.eventLocation}</td>
							<td>${event.eventAddress}</td>
							<td>${event.eventDateStart}</td>
							<td>${event.eventDateEnd}</td>
							<td>${event.eventMemberLimit}</td>
							<td>${event.eventCurrentMembers}</td>
							<td><c:if test="${event.isFull==true}">
                滿員
      </c:if> <c:if test="${event.isFull==false}">
              未滿
     </c:if></td>
							<td><button type="button" id="m${event.eventId}" class="btn btn-success eventJoin" data-toggle="modal" data-target="#map${event.eventId}">地圖</button></td>
						</tr>
							
							
							<!-- 以下地圖Modal -->
<div class="modal fade" id="map${event.eventId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content map">
      <div class="modal-header">
        <h5 class="modal-title ModalTitle" id="exampleModalCenterTitle">${event.eventName}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      												<iframe width='600' height='400' frameborder='0'
									scrolling='no' marginheight='0' marginwidth='0'
									src='https://www.google.com/maps?&q=${event.eventAddress}&z=16&output=embed&hl=zh-TW&t=m'
									allowfullscreen></iframe>	
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">離開</button>
      </div>
    </div>
  </div>
</div>
<!-- 以上地圖MODAL -->
						
					</c:forEach>
				</tbody>
			</table>
		
<script type="text/javascript">
$(function () {
	var today=new Date();
    
    $('#datetimepicker1').datetimepicker({
    locale: moment.locale('zh-tw'),
    format:"YYYY-MM-DDTHH:mm",
    minDate:today		           
    });   

            
    $('#datetimepicker2').datetimepicker({
    locale: moment.locale('zh-tw'),	
    useCurrent: false,
    format:"YYYY-MM-DDTHH:mm",
    minDate:today
    });
    
    $('#datetimepicker3').datetimepicker({
    	locale: moment.locale('zh-tw'),
        format:"YYYY-MM-DDTHH:mm"        		           
        });  
    
    $("#datetimepicker1").on("change.datetimepicker", function (e) {
    	//alert($("#sd").val());
        $('#datetimepicker2').datetimepicker('minDate', e.date);
    });
    $("#datetimepicker2").on("change.datetimepicker", function (e) {
    	//alert($("#ed").val());
        $('#datetimepicker1').datetimepicker('maxDate', e.date);
    });

});
</script>





<!-- DataTables v1.10.16 -->
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<script>
var ewill;

$(document).ready(function () {  
	
//datatable搜尋設定
$.fn.dataTable.ext.search.push(
	    function( settings, data, dataIndex ) {
	    	var usertime = $('#dcheck').val();  //使用者輸入的時間
	    	//alert(usertime);
	        var time = new Date(usertime);   //使用者輸入的時間
	        //alert(time);
	        
	        ewill = $('#ewill').val();	 //活動條件篩選器       
	        var peopleminus = null;//最大人數與實際人數差
	        var todaynow = new Date();//現在時間
	              	        
	        var tablemin = new Date( data[4]); //活動開始時間
	        var tablemax = new Date( data[5]); //活動結束時間
	        
	        var dateminus = null;  //現在時間與活動開始時間差
            
	        if(ewill=="allevent"){
	        	if(tablemin <= time 
	        		&& time <= tablemax  
		            || (usertime==""))  return true;
	        	else	return false;
	        }
	        
	        if(ewill=="all"){}
	        if(ewill=="alcome"){dateminus = tablemin-todaynow; }
	        if(ewill=="alfull"){peopleminus = data[6]-data[7]; }
	        
 	        if(ewill=="lost"){ 
 	          if(tablemax<todaynow){
 	           if(tablemin <= time 
 	        	   && time <= tablemax  
	               || (usertime=="")
	                ) {return true;}}
 	           else{return false;}
 	        }
	        
	        if (      
	                 (tablemin <= time   
	               && time <= tablemax
	               || (usertime==""))   //使用者輸入的時間是否在開始與結束內 或是 使用者並無輸入時間
	               
	                                    //滿團限制
	               && (peopleminus<=1 && peopleminus>0 || peopleminus==null)   //上限人數與實際人數差一(有篩選)  或者未篩選快滿人
	               && data[6]-data[7]>=0 //上限人數大於實際人數(人數未滿)
	               
	               
 	               && (tablemax-todaynow>0) //活動結束時間大於現在時間(活動未結束)
                   && (dateminus>0 || dateminus==null) // (無篩選快過期) 
	               && (dateminus<(1000*60*24*60))   //現在時間與活動開始差不到一天(有篩選)
	           )   
	        {
	            return true;
	        }
	        return false;
	    }
	
	
	);

});


    
//给搜索按钮绑定点击事件

function search(){
    //自己定义的搜索框，可以是时间控件，或者checkbox 等等
    //alert(table);
    var args1 = $("#etype").val();
    var args2 = $("#loc").val();
    
    //用空格隔开，达到多条件搜索的效果，相当于两个关键字

     table.column(0).search(args1).column(3).search(args2).
     draw();
    
     showLikeNum();

}
</script>


			<script type="text/javascript">

//判斷 使用者是否登入可新增活動
function newEventProcess(){
	
	$.ajax({
	    type: "POST",                           
	    url: "${pageContext.request.contextPath}/event/newEventProcess",
	    data: {},
	    success: function (notLogin) {
	    	if (notLogin=="notLogin")
	    		location.href = "${pageContext.request.contextPath}/notLogin";
	    	else 
	        	$("#newdiv").show();
	    	    $("#getdiv").hide();  	
	    }
	});
}

var table;

$(document).ready(function () {

	//顯示讚
	 <c:forEach var='event' items='${AllEvents}'>
	$.ajax({
	    type: "POST",                           
	    url: "${pageContext.request.contextPath}/event/good/dis/"+${event.eventId},
	    data: {"eventId": ${event.eventId}}, 
	    success: function (result) {

	    	var array = document.getElementsByClassName("likeBtn");
	    	 
	    	for (var i = 0; i < array.length; i++){
	    		if (array[i].value == ${event.eventId} && result.substr(0,1)=="n"){
	    			array[i].innerHTML ="讚:"+result.substr(1);
	    		    array[i].className = "likeBtn btn btn-secondary btn-sm";}
	    		    
	    	  else if (array[i].value == ${event.eventId} && result.substr(0,1)=="y"){
	        		array[i].innerHTML ="讚:"+result.substr(1);
	    	    	array[i].className = "likeBtn btn btn-primary btn-sm";}	    
	    	}
 	 
	    }
	});
	</c:forEach>
	
	//table = $('#showevents').DataTable();
	 
	// 切換顯示 新增活動與尋找活動
    $("#new").click(function () {
    	newEventProcess();  	
    });
    
    $("#get").click(function () {
    	$("#newdiv").hide();
    	$("#getdiv").show();
    });
  
    //按讚功能   
    $(".likeBtn").click(function(){
    	$(this).toggleClass('btn-primary btn-secondary');
    	var eventId = $(this).val();
    	//alert(eventId);
    	$.ajax({
    	    type: "POST",                           
    	    url: "${pageContext.request.contextPath}/event/good/"+eventId,
    	    data: {"eventId": eventId},
    	    success: function (result) {
    	    	if (result==-5)
    	    		{location.href = "${pageContext.request.contextPath}/notLogin";}
    	    	else {
    	    		
	    	    }
    	    	
    	    	var array = document.getElementsByClassName("likeBtn");
    	    	
    	    	for (var i = 0; i < array.length; i++){
    	    		if (array[i].value == eventId)
    	    			array[i].innerHTML ="讚:"+result;
    	    	}
   	    	}
    	});
    });

	//活動時間驗證處理 
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth()+1;
    if(month<10){month="0"+month;}
    var date = now.getDate();
    if(date<10){date="0"+date;}
    var hour = now.getHours(); 
    if(hour<10){hour="0"+hour;}
    var minute = now.getMinutes();

    var sec = now.getSeconds();

    var nows = year + "-" + month + "-" + date + "T" + hour + ":" + minute;

    var nowe = year + "-" + month + "-" + date + "T" + 23 + ":" + 59;


    $('#sd').attr("min",nows);
    $('#ed').attr("min",nowe);
    
    $('#sd').blur( function(){
    //alert($('#sd').val());
    $('#ed').attr("min",$('#sd').val());
    });
    
});

//送出新活動確認用函式
function check(){
	var Ans = confirm("確定送交?");   	
	if (Ans==true)
	{
	alert("資料送出中");
	return true;
	}
	else
	{
	alert("送出已取消");
	return false ;
	}
}

var language = {
        "zeroRecords": "沒有結果",
        "info": "<span class='seperator'>  </span>" + "總共 _TOTAL_ 筆活動",
        "infoFiltered": " (從所有 _MAX_ 筆活動中篩選出)",
        "infoEmpty": "共 0 筆",
        "search":"以關鍵字搜尋活動：",
        "paginate": {
            "previous": "上一頁",
            "next": "下一頁",
            "first": "第一頁  ",
            "last": "  最後一頁"
        }
    };
table = $('#showevents').DataTable({
	"aaSorting" : [[4, "asc"]],
	"lengthChange": false, 
	"aLengthMenu" : 10,
	"language":language,
	"columnDefs": [{"targets": [ 3 ],"visible": false},
		{"className": "dt-center","targets": "_all"}]
});
</script>

<script> 
  //googlemap 分析使用者輸入地點名後 找出符合地點(可能複數)  獲得 地圖上地名 真實地址 經緯度
$(document).ready(function () {    
        
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 25.047814, lng: 121.516949},
          zoom: 13,
          mapTypeId: 'roadmap'
        });

        // Create the search box and link it to the UI element.
        var input = document.getElementById('address');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
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
           
            //alert(place.name);
            //alert(place.formatted_address);
            //alert(place.geometry.location.lng());
            //alert(place.geometry.location.lat());
       
//document.getElementById("local").value = place.name;
//document.getElementById("add").value = place.formatted_address;
//document.getElementById("lng").value = place.geometry.location.lng();
//document.getElementById("lat").value = place.geometry.location.lat();

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
        
        $("#map").show();

});             

             

    
  </script>

		</div>
	</div>
	<!-- 請把所有內容寫在此div內 -->
</body>
</html>