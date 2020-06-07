<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

<title>객실목록 리스트</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>

<h3>객실목록 리스트</h3>
	
	<table name="roomsList" class="table table-striped" align="center" width="800">
		<thead>
			<tr>
				<th>번호</th>
				<th>객실유형</th>
				<th>객실이름</th>
				<th>객실호수</th>
				<th>예약금액</th>
			</tr>
		</thead>
		<tbody>
		 
		</tbody>
	</table>
	<center>
		<a href="#this" class="btn" id="write" >등록</a>
	</center>
	
	<center>
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</center>
	
	<form  id="search"  method="post" >
            <select id="searchOption" size="1">
                <option id="ROOM_NAME" value="ROOM_NAME" selected="selected">객실이름</option>
                <option id="ROOM_ID" value="ROOM_ID">객실호수</option>
            </select>
            
                 <input type="text" size="16" name="keyword" value="${keyword}" placeholder="검색어 입력" onkeyup="enterkey();">
                 <!--검색어를 쓰고 엔터키를 누르면 먹지를 않기때문에 onkeyup="enterkey();를 주는 고 밑이 function으로 연결-->
                 <input type="text" style="display: none;" />
                 <!-- type="text"가 하나일때는 밑의 설명처럼 서브밋처럼 액션 주소를 따라감, 그래서 꼼수로 보이지않는 텍스트를 하나 더 넣어줌 -->
                 <input type="button" value="검 색" onClick="fn_roomsList(1)">
   	</form> 
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>		
	
	<script>
	$(document).ready(function(){
		fn_roomsList(1);
		
  		$("#write").on("click", function(e){ //'등록'을 클릭하면
         	e.preventDefault();
            fn_roomsWrite(); //fn_roomsWrite()함수 호출
        });
	});   

	function enterkey() { //검색창에서 엔터 누르면 실행
        if (window.event.keyCode == 13) {
        	fn_roomsList(1);
        }
	}
	
  	function fn_roomsWrite(){ //등록 클릭시
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/newRoomForm'/>");
            comSubmit.submit();
    }

	function fn_roomsDetail(obj){ //부대시설명 클릭시
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/roomsDetail' />");
        comSubmit.addParam("ROOM_ID", obj.parent().find("input[name='title']").val());
        comSubmit.submit();
    }
    
	function fn_roomsList(pageNo){ //페이징 함수
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectRoomsList' />");
		comAjax.setCallback("fn_roomsListCallback"); //ajax요청 후 호출될 함수의 이름 지정
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 10);
		comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
		comAjax.addParam("keyword", $("input[name='keyword']").val());
		comAjax.ajax(); //실질적인 ajax기능 수행
	}  
	
	  function fn_roomsListCallback(data){ //콜백함수
		var total = data.TOTAL; 
		var body = $("table[name='roomsList'] > tbody");
		body.empty();
		if(total == 0){
			var str = "<tr><td colspan='5'>조회된 결과가 없습니다.</td></tr>"; 
			body.append(str);
		}else{
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX", 
				totalCount : total,
				eventName : "fn_roomsList", 
				recordCount : 10 
			};
			gfn_renderPaging(params);
			
			var str = "";
			$.each(data.list, function(key, value){
				str += "<tr>"
							+ "<td>" + value.RNUM + "</td>" 
							+ "<td>" + value.ROOM_TYPE 
							+ "<input type='hidden' name='title' value=" + value.ROOM_ID + ">"  + "</td>"
							+ "<td>" + "<a href='#this' name='title'>" + value.ROOM_NAME + "</a></td>" 
							+ "<td>" + value.ROOM_ID + "</td>"
							+ "<td>" + value.ROOM_PRICE + "</td>" 
						+ "</tr>";
			}); 
			//이거 넣어야 데이터 들어감
			body.append(str);
			
			$("a[name='title']").on("click", function(e){
				e.preventDefault();
				fn_roomsDetail($(this));
			});
			
		}
	} 
	  
	</script>

</body>
</html>