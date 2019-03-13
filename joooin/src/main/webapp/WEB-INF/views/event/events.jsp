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
<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />


<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9cpXz2HFE2Dw_vITbm-T6Z-6v-TJujBQ"></script>


<style>
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 50px;
	}
</style>
<title>Insert title here</title>
<script type="text/javascript">
function good(){
	$("#good").toggleClass('btn btn-primary btn-sm btn btn-secondary btn-sm');
	
}

$(document).ready(function () {
	
	// 切換顯示 新增活動與尋找活動
    $("#new").click(function () {
    	$("#newdiv").show();
    	$("#getdiv").hide();  	
    });
    
    $("#get").click(function () {
    	$("#newdiv").hide();
    	$("#getdiv").show();
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

    //alert(nows);
    //alert(nowe);
    $('#sd').attr("min",nows);
    $('#ed').attr("min",nowe);
    
    $('#sd').blur( function(){
    //alert($('#sd').val());
    $('#ed').attr("min",$('#sd').val());
    });
    
});

//送出確認用函式
function check(){
	var Ans = confirm("確定送交?");   	
	if (Ans==true)
	{
	alert("資料送出中");
	return true;
	}
	else
	{
	alert("false");
	return false ;
	}
}

</script>

  <script> 
  //googlemap 分析使用者輸入地點名 產生真實地址 經緯度
    $(document).ready(function () {

      $("input:button").click(function () {
        var geocoder = new google.maps.Geocoder();
        var add = $("#address").val();

        geocoder.geocode({ 'address': add },
          function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
              var point = results;

              var realadd = results[0].formatted_address;

              var location = results[0].geometry.location;
              // location.lat 經度
              // location.lng 緯度
              
              $("#lat").val(location.lat);
              $("#lng").val(location.lng);
              $("#add").val(realadd);
              $("#local").val(add);

              
              var map = new google.maps.Map(document.getElementById('map'), {
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

              $("#map").show();

            } else {
              alert('解析失敗!查無此地');
            }

          });
      });
    });
  </script>


</head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
<!-- 請把所有內容寫在此div內 -->
	<div id="main">
	<button id="new">開新活動</button>
	<button id="get">尋找活動</button>
	<div style="margin-bottom:50px"></div>
	
	<div id="newdiv" style="display: none">

		
		<form:form modelAttribute="NewEvent" 
			method='POST' onsubmit="return check();">
			<p>
			
			活動名稱:<form:input path='eventName' required="required"/><p>
			開始時間:<form:input id="sd" path='eventDateStart' type="datetime-local" required="required"/><p>
			結束時間:<form:input id="ed" path='eventDateEnd' type="datetime-local" required="required" /><p>  
           <p>
           
                              請輸入活動地點:<input type="text" size="20" id="address" value="" required="required"/>
           <p/>
           <input type="button" value="開始搜尋!" />

    </p>
    <div id="map" style="width: 600px; height: 450px; display:none"></div>
    <%--設定顯示 Google Maps 的大小--%>

			<div style="display:none">
			活動地區:<form:input path='eventLocation' id="local" required="required" /><p>			
			活動地址:<form:input path='eventAddress' id="add" required="required"/><p>
			活動座標經度:<form:input path='eventLatitude' id="lat" required="required"/><p>
			活動座標緯度:<form:input path='eventLongitude' id="lng" required="required"/><p>
			</div>
			活動內容(可省略):<form:input path='eventContent' /><p>
			
			活動類型:<form:select path='eventTypeId' required="required">
			<form:option value="1">運動</form:option>
			<form:option value="2">美食</form:option>
			<form:option value="3">娛樂</form:option>
			<form:option value="4">其他</form:option>
			</form:select>
			<p>
		
			人員上限:<form:input path='eventMemberLimit' required="required"/><p>
			攜帶人數(單獨參加免輸入):<input name="quantity"/><p>
			參加費(不輸入為免費):<form:input path='eventFee' /><p>

			<br> 
			<br> 
			<input id="submit" type='submit' value='提交' class="btn btn-primary btn-lg active"> 
			<input type='reset' value='還原' class="btn btn-secondary btn-lg active"> 
			<br> 
			<br> 
			<a href='${pageContext.request.contextPath}'>回到首頁</a>
		</form:form>

	
	</div>
	
	
	<div id="getdiv" style="display: none">

  <table id="showevents" >
  


    <thead>
    
    
    <tr>
    <form>
    <select id="ewill">
    <option value="all">所有未過期</option>
    <option value="alcome">即將到期</option>
    <option value="alfull">即將滿團</option>
    <option vale="lost">已過期的團</option>
    </select>
    
	類別:<select id="etype">
	    <option value="">全部</option>
		<option value="美食">美食</option>
		<option value="運動">運動</option>
		<option value="娛樂">娛樂</option>
		<option value="其他">其他</option>	
	</select>
	地區:<input type="text" id="loc" style="width:150px"/> 
	時間:<input id="dcheck" type="datetime-local"/>
   </form> 
	
	<button id="search" onclick="search()">篩選</button>
  
        <th>活動種類</th>
        <th>活動名稱</th>
        <th>活動地點</th>
        <th>活動地址</th>
        <th>開始時間</th>
        <th>結束時間</th>
        <th>上限人數</th>
        <th>目前人數</th>
        <th>活動地圖</th>
        
    </tr>
    </thead>
    <tbody>
	<c:forEach var='event' items='${AllEvents}'>
	<tr>
	<td>
  <c:if test="${event.eventTypeId=='1'}">
      美食
  </c:if>
  <c:if test="${event.eventTypeId=='2'}">
    運動
  </c:if>
  <c:if test="${event.eventTypeId=='3'}">
    娛樂
  </c:if>
  <c:if test="${event.eventTypeId=='4'}">
    其他
  </c:if>
</td>
	<td><a href="${pageContext.request.contextPath}/event/${event.eventId}">${event.eventName}</a> <span style="margin-left:10px"><button id="good" value="${event.eventId}" class="btn btn-primary btn-sm" onclick="good()">讚:${event.eventLike}</button></span> </td>
	<td>${event.eventLocation}</td>
	<td>${event.eventAddress}</td>
	<td>${event.eventDateStart}</td>
	<td>${event.eventDateEnd}</td> 
	<td>${event.eventMemberLimit}</td>
	<td>${event.eventCurrentMembers}</td>
	<td><iframe width='350' height='200' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='https://www.google.com/maps?&q=${event.eventLatitude},${event.eventLongitude}&z=16&output=embed&hl=zh-TW&t=m' 
       allowfullscreen></iframe></td>
       </tr>
<%-- 	  <c:forEach var='eventmem' items='${event.eventMemberSet}'> --%>
<%-- 	    <div>活動成員id:${eventmem.memberId}</div> --%>
<%-- 	  </c:forEach> --%>

	</c:forEach>
	</tbody>
    </table>

 <!-- DataTables v1.10.16 -->
  
  <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    
    
<script type="text/javascript">
var table;
var ewill;
$.fn.dataTable.ext.search.push(
	    function( settings, data, dataIndex ) {
	    	var usertime = $('#dcheck').val();
	    	//alert(usertime);
	        var time = new Date(usertime);
	        
	        
	        ewill = $('#ewill').val();	        
	        var peopleminus = null;//最大人數與實際人數差
	        var todaynow = new Date();//現在時間
	              	        
	        var tablemin = new Date( data[4]); //活動開始時間
	        var tablemax = new Date( data[5]); //活動結束時間
	        
	        var dateminus = null;  //現在時間與活動開始時間差
      
	        if(ewill=="all"){}
	        if(ewill=="alcome"){dateminus = tablemin-todaynow; }
	        if(ewill=="alfull"){peopleminus = data[6]-data[7]; }
	        
// 	        if(ewill=="lost"){dateminus = todaynow-tablemin; }
	        
	        if (      
	                 (tablemin <= time   
	               && time <= tablemax
	               || (usertime==""))   //使用者輸入的時間是否在開始與結束內
	               
	               && peopleminus<=1    //上限人數與實際人數差一(有篩選)
	               && data[6]-data[7]>0 //上限人數大於實際人數(人數未滿)
	               
	               
 	               && (tablemin-todaynow>0) //活動開始時間大於現在時間(活動未開始)
                   && (dateminus>0 || dateminus==null) // (無篩選快過期) 
	               && (dateminus/(1000*60*24*60))<1   //現在時間與活動開始差不到一天(有篩選)
	           )  
	        {
	            return true;
	        }
	        return false;
	    }
	);



$(document).ready(function(){
    table = $('#showevents').DataTable();


});
    
//给搜索按钮绑定点击事件

function search(){
    //自己定义的搜索框，可以是时间控件，或者checkbox 等等
    //alert(table);
    var args1 = $("#etype").val();
    var args2 = $("#loc").val();
    
    //用空格隔开，达到多条件搜索的效果，相当于两个关键字

     table.column(0).search(args1).column(3).search(args2).draw();
    //table.search(args1+" "+args2).draw(false);//保留分页，排序状态

}
</script>    
	</div>
	</div>
<!-- 請把所有內容寫在此div內 -->
</body>
</html>