$(document).ready(function () {

    $('.list-group-item').click(selectCategory);
    		
    		
    	function selectCategory() {

        $('.list-group-item').removeClass('bg-primary').removeClass('text-white').addClass('text-primary');
        $(this).removeClass('text-primary').addClass('bg-primary').addClass('text-white');
        $('#content').empty();

        var title = $(this).text();
        $('#content').prepend($('<h2></h2>').text(title));
        $('#content> p').remove();
        
        // 以上為切換後台按鈕功能
//    	----------------------------------------------------------------------------------------------------
        if (title == '會員管理'){
        	$.ajax({
        		type: "GET",
                url: "/joooin/admin/getAllMember",
                dataType: "json",
                timeout: 600000,
                
                success: function (data){
                	var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">會員編號</th><th>會員姓名</th><th>會員信箱</th><th>會員密碼</th><th>會員性別</th><th>會員電話</th><th>會員登入次數</th><th>會員加入日期</th><th>會員認證狀態</th></tr></thead><tbody></tbody>');
                	$('#content>h2').after(tab);
                		var docFrag = $(document.createDocumentFragment());
                		console.log(data);
                		$.each(data, function (index, Member){
                			var cell1 = $('<td></td>').text(Member.memberId).addClass('pointer text-primary text-center memberId');
                			var cell2 = $('<td></td>').text(Member.memberName)
                			var cell3 = $('<td></td>').text(Member.email)
                			var cell4 = $('<td></td>').text(Member.password)
                			var cell5 = $('<td></td>').text(Member.gender)
                			var cell6 = $('<td></td>').text(Member.phone)
                			var cell7 = $('<td></td>').text(Member.logins)
                			var cell8 = $('<td></td>').text(Member.memberCreateDate)
                			var cell9 = $('<td></td>').text(Member.certificationStatus)
                			
                			var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9]);
                			
                			docFrag.append(row);
                		})
                		$('#content tbody').html(docFrag);
                		$('#content tbody').after('<a href="admin/memberPDF"><img src="resources/img/icon_pdf.png" alt="pdf" style="width:45px;"/></a>')
                }
        	})	//撈出會員end
//        	----------------------------------------------------------------------------------------------------
        	var mi;
        	$(document).on("click",'.memberId',function(){  //點選memberid動作
        		mi = $(this).text();
        		
        		$('#content').empty();
        		
        		$.ajax({
        			
        			type:"GET",
        			url:"/joooin/admin/getMemberBean/" + mi,
        			
        			success:function(data){
        				var name = data.memberName;
        				var docFrag = $(document.createDocumentFragment());
        				var format = $('<container></container>').html(
        						'<row>'
        						+'<div class="col-lg-8">'
        						+'<h2>會員修改</h2>'
        						+'<h4>' + name + '</h4>'
        						+'<form:form method="POST" modelAttribute="memberBean" class="form-horizontal">'
        						+'<button type="submit" class="btn btn-primary" id="memberButton">修改</button>'
        						+'<button type="submit" class="btn btn-danger" id="memberDelete">刪除</button>'
        						+'</form>'
        						+'</div>'
        						+'</row>'
        						)
        						docFrag.append(format);
        						$('#content').html(docFrag);
        			},
        		error: function (xhr, ajaxOptions, thrownError){
        			
        		},
        		})
        	})//點選id end
//        	----------------------------------------------------------------------------------------------------
        	$(document).on("click",'#memberDelete',function(){ // 刪除按鈕動作
        		$.ajax({
        			type:"POST",
        			url:"/joooin/admin/deleteMember",
        			data:{memberId:mi},
        			success:function(){
        				alert('刪除完成!');
        				$('.bg-primary').trigger("click");
        				
        			},
        			error:function(e){
        				
        			}
        		})
        	})		// 刪除end
//        	----------------------------------------------------------------------------------------------------
        	
        }		//會員資料end;
//    	----------------------------------------------------------------------------------------------------
        if(title == '社團管理'){
        	$.ajax({
        		type: "GET",
                url: "/joooin/admin/getAllGroup",
                dataType: "json",
                timeout: 600000,
                
                success: function (data){
                	var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">社團編號</th><th>社團類型</th><th>社團名稱</th><th>團長ID</th><th>創建日期</th><th>社團人數</th></tr></thead><tbody></tbody>');
                	$('#content>h2').after(tab);
                		var docFrag = $(document.createDocumentFragment());
                		console.log(data);
                		$.each(data, function (index, Group){
                			var cell1 = $('<td></td>').text(Group.groupId).addClass('pointer text-primary text-center groupId');
                			var cell2 = $('<td></td>').text(Group.groupType)
                			var cell3 = $('<td></td>').text(Group.groupName)
                			var cell4 = $('<td></td>').text(Group.groupLeaderId)
                			var cell5 = $('<td></td>').text(Group.groupCreateDate)
                			var cell6 = $('<td></td>').text(Group.groupMemberList.length)
                			
                			var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);
                			
                			docFrag.append(row);
                		})
                		$('#content tbody').html(docFrag);
                		$('#content tbody').after('<a href="admin/groupPDF"><img src="resources/img/icon_pdf.png" alt="pdf" style="width:45px;"/></a>')
                }
        	})//撈出社團end
//        	----------------------------------------------------------------------------------------------------
        	var gi;
        	$(document).on("click",'.groupId',function(){  //點選groupId動作
        		gi = $(this).text();
        		
        		$('#content').empty();
        		
        		$.ajax({
        			
        			type:"GET",
        			url:"/joooin/admin/getGroupBean/" + gi,
        			
        			success:function(data){
        				var name = data.groupName;
        				var docFrag = $(document.createDocumentFragment());
        				var format = $('<container></container>').html(
        						'<row>'
        						+'<div class="col-lg-8">'
        						+'<h2>社團修改</h2>'
        						+'<h4>' + name + '</h4>'
        						+'<form:form method="POST" class="form-horizontal">'
        						+'<button type="submit" class="btn btn-primary" id="groupButton">修改</button>'
        						+'<button type="submit" class="btn btn-danger" id="groupDelete">刪除</button>'
        						+'</form>'
        						+'</div>'
        						+'</row>'
        						)
        						docFrag.append(format);
        						$('#content').html(docFrag);
        			},
        		error: function (xhr, ajaxOptions, thrownError){
        			
        		},
        		})
        	})//點選id end
//        	----------------------------------------------------------------------------------------------------
        	$(document).on("click",'#groupDelete',function(){ // 刪除按鈕動作
        		$.ajax({
        			type:"POST",
        			url:"/joooin/admin/deleteGroup",
        			data:{groupId:gi},
        			success:function(){
        				alert('刪除完成!');
        				$('.bg-primary').trigger("click");
        				console.log(data)
        			},
        			error:function(e){
        				
        			}
        		})
        	})		// 刪除end
//        	----------------------------------------------------------------------------------------------------
        	
        }//社團管理end
//    	----------------------------------------------------------------------------------------------------
        
        if(title == '活動管理'){
        	$.ajax({
        		type: "GET",
                url: "/joooin/admin/getAllEvent",
                dataType: "json",
                timeout: 600000,
                
                success: function (data){
                	var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">活動編號</th><th>活動名稱</th><th>活動地點</th><th>活動類型</th><th>參加人數</th></tr></thead><tbody></tbody>');
                	$('#content>h2').after(tab);
                		var docFrag = $(document.createDocumentFragment());
                		console.log(data);
                		$.each(data, function (index, Event){
                			var cell1 = $('<td></td>').text(Event.eventId).addClass('pointer text-primary text-center eventId');
                			var cell2 = $('<td></td>').text(Event.eventName)
                			var cell3 = $('<td></td>').text(Event.eventAddress)
                			var cell4 = $('<td></td>').text(Event.eventTypeId)
                			var cell5 = $('<td></td>').text(Event.eventCurrentMembers)
                			
                			var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5]);
                			
                			docFrag.append(row);
                		})
                		$('#content tbody').html(docFrag);
                		$('#content tbody').after('<a href="admin/eventPDF"><img src="resources/img/icon_pdf.png" alt="pdf" style="width:45px;"/></a>')
                }
        	})
//        	----------------------------------------------------------------------------------------------------
        	var ei;
        	$(document).on("click",'.eventId',function(){  //點選eventId動作
        		ei = $(this).text();
        		
        		$('#content').empty();
        		
        		$.ajax({
        			
        			type:"GET",
        			url:"/joooin/admin/getEventBean/" + ei,
        			
        			success:function(data){
        				var name = data.eventName;
        				var docFrag = $(document.createDocumentFragment());
        				var format = $('<container></container>').html(
        						'<row>'
        						+'<div class="col-lg-8">'
        						+'<h2>活動修改</h2>'
        						+'<h4>' + name + '</h4>'
        						+'<form:form method="POST" class="form-horizontal">'
        						+'<button type="submit" class="btn btn-primary" id="eventButton">修改</button>'
        						+'<button type="submit" class="btn btn-danger" id="eventDelete">刪除</button>'
        						+'</form>'
        						+'</div>'
        						+'</row>'
        						)
        						docFrag.append(format);
        						$('#content').html(docFrag);
        			},
        		error: function (xhr, ajaxOptions, thrownError){
        			
        		},
        		})
        	})//點選id end
//        	----------------------------------------------------------------------------------------------------
        		$(document).on("click",'#eventDelete',function(){ // 刪除按鈕動作
        		$.ajax({
        			type:"POST",
        			url:"/joooin/admin/deleteEvent",
        			data:{eventId:ei},
        			success:function(){
        				alert('刪除完成!');
        				$('.bg-primary').trigger("click");
        				console.log(data)
        			},
        			error:function(e){
        				
        			}
        		})
        	})		// 刪除end
//        	----------------------------------------------------------------------------------------------------
        	
        }//活動管理
        
//    	----------------------------------------------------------------------------------------------------
        
    	}		//selectCategory end;
    	
    	
})
    	