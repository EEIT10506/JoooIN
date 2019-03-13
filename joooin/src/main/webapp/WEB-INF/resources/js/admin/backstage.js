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
                			var cell1 = $('<td></td>').text(Member.memberId)
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
                }//function (data)
        	})	//ajax end;
        }		//會員資料end;
        
        if(title == '社團管理'){
        	$.ajax({
        		type: "GET",
                url: "/joooin/admin/getAllGroup",
                dataType: "json",
                timeout: 600000,
                
                success: function (data){
                	var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">社團編號</th><th>社團類型</th><th>社團名稱</th><th>管理員</th><th>創建日期</th></tr></thead><tbody></tbody>');
                	$('#content>h2').after(tab);
                		var docFrag = $(document.createDocumentFragment());
                		console.log(data);
                	//start
                	
                }
        	})
        	
        }
        
        if(title == '活動管理'){
        	$.ajax({
        		type: "GET",
                url: "/joooin/admin/getAllEvent",
                dataType: "json",
                timeout: 600000,
                
                success: function (data){
                	var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">活動編號</th><th>活動名稱</th></tr></thead><tbody></tbody>');
                	$('#content>h2').after(tab);
                		var docFrag = $(document.createDocumentFragment());
                		console.log(data);
                	//start
                }
        	})
        }
        
    	}		//selectCategory end;
    	
    	
})
    	