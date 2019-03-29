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
.link:hover{
text-decoration: none;
color:blue;
font-size: 15px;
}

.link{
color: black;
}

#main {
	width: 1200px;
	margin: auto;
	position: relative;
	top: 120px;
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
display:inline !important;
} 

.container{
background-color:#FFEDCB;
width:75%; 
border: 1px solid black;
}

iframe{
margin: 0; padding: 0;
}

.buttonLeft{
	position:relative;
	right:100px;
	width:200px; 
	height:100px;
	bottom:30px;
	font-family:微軟正黑體;
	font-weight:bold;
	font-size:35px !important; 
}
.buttonright{
	position:relative;
	left:100px;
	width:200px;
	height:100px;
	bottom:30px;
	font-family:微軟正黑體;
	font-weight:bold;
	font-size:35px !important;
}

.bgcolor{
		font-family:微軟正黑體;
 		background-color:#F5F5F5; 
		font-weight:bold;
}

.setleft{
margin-left: 80px;
margin-bottom: 15px;
}

.onlyleft{
margin-left: 150px;
margin-bottom: 20px;
}

th{
white-space: nowrap;
}
</style>
<title>JoooIN</title>


</head>
<body class="bgcolor">
	<jsp:include page="${request.contextPath}/navbar" />
	
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9cpXz2HFE2Dw_vITbm-T6Z-6v-TJujBQ&libraries=places" defer></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/events/datetimepicker/zh-tw.js'/> " charset="UTF-8"></script>	


	<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<div  class="container">
		<div style="height:50px;margin-bottom: 20px"></div>
	<div style="text-align:center;"> 
		<button id="new" class="btn btn-secondary btn-lg buttonLeft" >開新活動</button>
		<button id="get" class="btn btn-primary btn-lg buttonright" >尋找活動</button>
	</div>
        <hr style="background-color: black">
		<div style="margin-bottom: 20px"></div>

		<div id="newdiv" style="display: none">
        <div class="setleft">
	    <button id="oneclick" class="btn btn-primary btn-sm">一鍵帶入</button>
	    <button id="nowclick" class="btn btn-primary btn-sm">一鍵帶入(即將到期)</button>
	    </div>
<p></p>
			<form:form modelAttribute="NewEvent" method='POST'
				onsubmit="return check();" enctype="multipart/form-data">
				<p>
                    <div class="setleft">
					活動名稱：
					<form:input id="ename" path='eventName' required="required" maxlength="10" />
				    </div>
				    <div class="setleft">
					開始時間：<span class="input-group date" id="datetimepicker1" data-target-input="nearest" style="width:300px;display:inline !important">
					<form:input id="sd" path='eventDateStart' class="form-control datetimepicker-input" data-target="#datetimepicker1" required="required" onkeyup="return Validate(this,value)" style="width:250px;display:inline !important"/>
					  <span class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker"  style="display:inline !important">
                        <span class="input-group-text" style="display:inline !important"><i class="fa fa-calendar" style="display:inline !important"></i></span>
                    </span> 
                </span>
                  </div>
				    <div class="setleft">
					結束時間： <span class="input-group date" id="datetimepicker2" data-target-input="nearest" style="width:300px;display:inline !important">
					<form:input id="ed" path='eventDateEnd' class="form-control datetimepicker-input" data-target="#datetimepicker2" required="required" onkeyup="return Validate(this,value)" style="width:250px;display:inline !important"/>
					<span class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker" style="display:inline !important">
                        <span class="input-group-text" style="display:inline !important"><i class="fa fa-calendar" style="display:inline !important"></i></span>
                    </span>
                </span>				
				</div>
            <div class="setleft">
                              進行關鍵字搜尋後請<h3 style="color: red">務必選取地圖上的座標並確認地點是否正確!!</h3><input type="text" size="20" class="controls" placeholder="Search Box"
					id="address" value="" required="required" style="width:300px; height:50px"/>
           </div>


                 <div class="setleft">
				<div id="map" style="width: 800px; height: 450px; display: none"></div>
				<%--設定顯示 Google Maps 的大小--%>
                </div>
				<p></p> 
				    <div class="setleft">
					活動地點：
					<form:input path='eventLocation' id="local" required="required" style="width: 400px" readonly="true"/>
					</div>
					 <div class="setleft">
					活動地址：
					<form:input path='eventAddress' id="add" required="required" style="width: 400px" readonly="true"/>
                    </div>
					<form:input path='eventLatitude' id="lat" required="required" readonly="true" style="display:none"/>

					<form:input path='eventLongitude' id="lng" required="required" readonly="true" style="display:none"/>

					
					<form:input id="pid" path='eventPlaceId' required="required"  readonly="true" style="display:none"/>

				<p></p>
				 <div class="setleft">
			活動內容（可省略）：<p></p>
				<form:textarea id="evcontent" path='eventContent' style="width:300px;height:100px;" />
				</div>
                     <div class="setleft"> 
					活動類型：
					<form:select path='eventTypeId' required="required">
						<form:option value="1">美食</form:option>
						<form:option value="2">運動</form:option>
						<form:option value="3">娛樂</form:option>
						<form:option value="4">其他</form:option>
					</form:select>
				</div>
				 <div class="setleft">
					活動圖片(不上傳則依類型提供預設圖片)：
					<form:input path='multipartFile' type="file" accept="image/*" />
				</div>
				 <div class="setleft">
					人員上限： <form:input style="width:150px" id="plimit" type="number" min="1" path='eventMemberLimit' required="required" onkeyup="return ValidateNumber(this,value)"/>
				</div>
				 <div class="setleft">
					攜帶人數： <input id="quan" style="width:150px" type="number" min="1" name="quantity" placeholder="單獨參加免輸入" onkeyup="return ValidateNumber(this,value)"/>
				</div>
				<div style="display: none">
					參加費(不輸入設為免費)：
					<form:input path='eventFee' onkeyup="return ValidateNumber(this,value)"/>
				<p></div>
                     <div class="setleft">
					<br> <input id="submit" type='submit' value='提交'
						class="btn btn-primary btn-lg active"> <input type='reset'
						value='還原' class="btn btn-secondary btn-lg active"> <br>
					<br>
					</div>
			</form:form>


		</div>


		<div id="getdiv">

			
						<div class="onlyleft">
							<select id="ewill">
								<option value="allevent">所有活動</option>
								<option value="all">所有未結束</option>
								<option value="alcome">即將開始</option>
								<option value="alfull">即將滿團</option>
								<option value="lost">已結束的團</option>
							</select>
							
							 類別： <select id="etype">
								<option value="">全部</option>
								<option value="美食">美食</option>
								<option value="運動">運動</option>
								<option value="娛樂">娛樂</option>
								<option value="其他">其他</option>
							</select> 
							地區： <input type="text" id="loc" style="width: 150px" /> 
							
					<div class="input-group date" id="datetimepicker3" data-target-input="nearest" style="width:300px;display:inline !important">   
					時間： <input id="dcheck" class="form-control datetimepicker-input" data-target="#datetimepicker3"  style="width:250px;display:inline !important" onkeyup="return Validate(this,value)"/>
					  <span class="input-group-append" data-target="#datetimepicker3" data-toggle="datetimepicker" style="display:inline !important">
                        <span class="input-group-text" style="display:inline !important"><i class="fa fa-calendar" style="display:inline !important"></i></span>
                    </span>
                  </div>
                  <button id="search" onclick="search()">篩選</button>
                  </div>
                                 
					<table id="showevents" class="display" >	
				<thead>
					<tr>
						<th>種類</th>
						<th>名稱</th>
						<th>地點</th>
						<th>地址</th>
						<th>開始時間</th>
						<th>結束時間</th>
						<th>上限</th>
						<th>目前</th>
						<th>已滿</th>
						<th>給讚</th>
						<th>地圖</th>

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
							<td><a href="${pageContext.request.contextPath}/event/${event.eventId}" class="link"><c:out value="${event.eventName}"></c:out></a>
							</td>
							<td>${event.eventLocation}</td>
							<td>${event.eventAddress}</td>
							<td>${event.eventDateStart}</td>
							<td>${event.eventDateEnd}</td>
							<td>${event.eventMemberLimit}人</td>
							<td>${event.eventCurrentMembers}人</td>
							<td><c:if test="${event.isFull==true}">
                滿員
      </c:if> <c:if test="${event.isFull==false}">
              未滿
     </c:if></td>
                            <td><button id="e${event.eventId}" value="${event.eventId}" class="likeBtn btn btn-primary btn-sm">讚:${event.eventLike}</button></td>
							<td><button type="button" id="m${event.eventId}" class="btn btn-success eventJoin" data-toggle="modal" data-target="#map${event.eventId}" style="display:block;white-space:nowrap" >地圖</button>
							<input style="display: none;" value="https://www.google.com/maps/embed/v1/place?key=AIzaSyC9cpXz2HFE2Dw_vITbm-T6Z-6v-TJujBQ&q=place_id:${event.eventPlaceId}" /></td>
						</tr>
							
							
							<!-- 以下地圖Modal -->
<div class="modal fade" id="map${event.eventId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content map">
      <div class="modal-header">
        <h5 class="modal-title ModalTitle" id="exampleModalCenterTitle"><c:out value="${event.eventName}"></c:out></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<iframe id="if${event.eventId}"
  width="600"
  height="450"
  frameborder="0" style="border:0"
  allowfullscreen>
</iframe>
      
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
    minDate:today		           
    });   

            
    $('#datetimepicker2').datetimepicker({
    locale: moment.locale('zh-tw'),	
    useCurrent: false,
    minDate:today
    });
    
    $('#datetimepicker3').datetimepicker({
    	locale: moment.locale('zh-tw')              		           
        });  
    
    $("#datetimepicker1").on("change.datetimepicker", function (e) {
        $('#datetimepicker2').datetimepicker('minDate', e.date);
    });
    $("#datetimepicker2").on("change.datetimepicker", function (e) {
        $('#datetimepicker1').datetimepicker('maxDate', e.date);
    });
     
    

});
</script>

<!-- DataTables v1.10.16 -->
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<script>
function ValidateNumber(e, pnumber)
{
    if (!/^\d+$/.test(pnumber))
    {
        e.value = /^\d+/.exec(e.value);
    }
    return false;
}

function Validate(e, pnumber)
{
    return false;
}

$(document).ready(function () { 
$("#plimit").blur(function (){
	$("#quan").attr("max",parseInt($("#plimit").val())-1);
});
$("#quan").blur(function (){
	$("#plimit").attr("min",parseInt($("#quan").val())+1);	
});

});

var ewill;

$(document).ready(function () {  
	
	$(".eventJoin").click(function (){
		var id = this.id.substring(1);
		var mapsrc = $(this).next().val();
		var iframe = "#if"+id;
		$(iframe).attr("src",mapsrc);
	});	
	
	
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
	        if(ewill=="alfull"){peopleminus = (data[6].slice(0,-1))-(data[7].slice(0,-1)); }
	        
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
	               && data[6].slice(0,-1)-data[7].slice(0,-1)>=0 //上限人數大於實際人數(人數未滿)
	               
	               
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
var array = $(".likeBtn");


//顯示讚 
 <c:forEach var='event' items='${AllEvents}'>
$.ajax({
    type: "POST",                           
    url: "${pageContext.request.contextPath}/event/good/dis/"+${event.eventId},
    data: {"eventId": ${event.eventId}}, 
    success: function (result) {

    	 
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

    var good;
    //按讚功能   
    $(".likeBtn").click(function(){
    	$(this).toggleClass('btn-primary btn-secondary');
    	var eventId = $(this).val();
    	
    	good = $(this);

    	$.ajax({
    	    type: "POST",                           
    	    url: "${pageContext.request.contextPath}/event/good/"+eventId,
    	    data: {"eventId": eventId},
    	    success: function (result) {
    	    	if (result==-5)
    	    		{location.href = "${pageContext.request.contextPath}/notLogin";}
    	    	else {
    	    		good.html("讚:"+result);	
	    	    }

   	    	}
    	});
    });



$(document).ready(function () {

	//table = $('#showevents').DataTable();
	 
	// 切換顯示 新增活動與尋找活動
    $("#new").click(function () {
    	$("#new").removeClass('btn-secondary');
    	$("#get").removeClass('btn-primary');
    	$("#new").addClass('btn-primary');
    	$("#get").addClass('btn-secondary');
    	newEventProcess();  	
    });
    
    $("#get").click(function () {
    	$("#new").removeClass('btn-primary');
    	$("#get").removeClass('btn-secondary');
    	$("#new").addClass('btn-secondary');
    	$("#get").addClass('btn-primary');
    	$("#newdiv").hide();
    	$("#getdiv").show();
    });

    
});

//送出新活動確認用函式
function check(){
	if (  $("#local").val()!= "" &&  $("#add").val()!=null){
	var Ans = confirm("確定送交?");   	
	if (Ans==true)
	{alert("資料送出中");
	return true;}
	else{
	alert("送出已取消");
	return false ;}
	}
	else{
		alert("請先選取地圖上的座標確認地點與地址已填入!");
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

var dateTimeNow = new Date();
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
            	document.getElementById("pid").value = place.place_id;
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
        
        $("#map").show();

        
        
$("#oneclick").click(function (){
	$("#ename").val("超COOOL的聚餐");
	
	$("#sd").val("2019/04/01 14:49");
	$("#ed").val("2019/04/18 14:50");
	$("#evcontent").val("很COOL COOL到不行，最新潮的飲食！");
	
	$("#plimit").val("8");
	$("#quan").val("5");
	
});

$("#nowclick").click(function (){
	$("#ename").val("快過期的聚餐");
	var t = dateTimeNow.getTime();
	function formatDate(date) {
		  var month = (date.getMonth()+1); if(month<10){month="0"+month;}
		  var todaydate = date.getDate(); if(todaydate<10){todaydate="0"+todaydate;}
		  var hours = date.getHours();
		  var minutes = date.getMinutes();
		  //var ampm = hours >= 12 ? 'pm' : 'am';
// 		  hours = hours % 12;
// 		  hours = hours ? hours : 12; // the hour '0' should be '12'
		  minutes = minutes < 10 ? '0'+minutes : minutes;
		  var strTime = hours + ':' + minutes;
		  return   date.getFullYear() + "/" + month + "/" + todaydate + " " + strTime;
		}
	$("#sd").val(formatDate(new Date(t+60000)));
	$("#ed").val(formatDate(new Date(t+360000)));

	//$("#ed").val("2019/04/18 14:50");
	$("#evcontent").val("快過期了！快點報名!要流團了!");
	
	$("#plimit").val("8");
	$("#quan").val("5");
	
});

});             

    
  </script>
            </div>
		</div>
	</div>
	<!-- 請把所有內容寫在此div內 -->
</body>
</html>