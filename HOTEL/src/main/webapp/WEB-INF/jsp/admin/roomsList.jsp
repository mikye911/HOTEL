<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>
<title>객실목록 리스트</title>
<style>
.pop_type {
	border: none;
	font-family: nanum -webkit-pictograph;
}
.pop_div_name {
	margin-top: 20px;
	border-bottom: 1px #ebebeb;
	font-size: 18px;
	background-color: #ebebeb;
	text-align: center;
}
.pop_div {
	border-bottom: 1px #ebebeb;
	margin: 5px 5px 5px 0;
	font-family: nanum -webkit-pictograph;
	font-size: 18px;
	font-weight: 700;
}
.pop_person {
	width: 30px;
	border: none;
	font-family: nanum -webkit-pictograph;
	font-size: 18px;
	text-align: center;
}
.pop_ee {
	border: none;
	background-color: #ebebeb;
	font-family: nanum -webkit-pictograph;
	font-size: 18px;
	text-align: center;
	width: auto;
}
.pop_tt {
	width: 50px;
	border: none;
	font-family: nanum -webkit-pictograph;
	font-size: 18px;
	text-align: center;
}
.pop_fac {
	border: none;
	font-family: nanum -webkit-pictograph;
	font-size: 18px;
	text-align: left;
	width: 490px;
}

</style>


<body class="hold-transition sidebar-mini layout-fixed"><!-- Site wrapper -->
<div class="wrapper">
<!-- Navbar -->
<%@include file="/WEB-INF/include/navbar.jsp" %>
  
<!-- Main Sidebar Container -->
<%@include file="/WEB-INF/include/sidebar.jsp" %>
  
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
    <div class="container-fluid">
   	<div class="row">
    <div class="col-12">
   	<div class="card">
    <div class="card-header">
    	<h3 class="card-title">객실 목록</h3>
        <div class="card-tools">
        <div class="input-group input-group-sm" style="width: 400px;">
         	<select id="searchOption" size="1">
		    	<option id="ROOM_NAME" value="ROOM_NAME" selected="selected">객실명</option>
		    	<option id="ROOM_ID" value="ROOM_ID">객실 호수</option>
		    </select>
            <input type="text" name="keyword" class="form-control float-right" value="${keyword}" placeholder="검색어 입력"  onkeyup="enterkey();">
            <div class="input-group-append">
            	<button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
            </div>
       </div>
       </div>
   </div>
   
<div class="card-body table-responsive p-0">
	<table class="table table-hover" name="roomsList">
		<thead>
			<tr>
				<th>번호</th>
				<!-- <th>객실유형</th> -->
				<th>타입</th>
				<th>객실호수</th>
				<th>예약금액</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<!-- /.card -->

<div class="card-footer clearfix" >
	<ul class="pagination pagination-sm m-0 float-right" id="PAGE_NAVI">
		<li class="page-item">
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</li>
	</ul>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>    
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!--content //-->
			<div>
				<p class="ctxt mb20">
				<div style="width: 100%; text-align: center;">
					<img id="pop_img" alt="main" width="450" height="300" src="">
				</div>
				<div class="pop_div_name">
					객실명 : <input type="text" id="pop_name" class="pop_ee" readonly>
				</div>
				<div class="pop_div">
					기준인원<br>
					성인: <input type="text" id="pop_adult" class="pop_person" readonly>명, 
					어린이: <input type="text" id="pop_child" class="pop_person" readonly>명
				</div>
				<div class="pop_div">
					객실 편의 시설: <br>
					<textarea id="pop_fac" class="pop_fac" cols="20" rows="11" readonly></textarea>
				</div>
				<div class="pop_div">
					체크인: <input type="text" id="pop_checkIn" class="pop_tt" readonly>,
					체크아웃: <input type="text" id="pop_checkOut" class="pop_tt" readonly>
				</div>
				</div>
				<!--// content-->
				<div class="modal-footer">
					<input type="hidden" id="room_id">
					<table>
					<tr>
						<td><button type="button" class="btn btn-success" id="Modify">상세보기</button></td>
						<td><button type="button" class="btn btn-primary" id="Modify">수정하기</button></td>
						<td><button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
var room_id; //수정클릭 시 방 호수 가져오기위해 전역변수 선언
	
	$(document).ready(function() {
		fn_roomsList(1);
	});

	function enterkey() { //검색창에서 엔터 누르면 실행
		if (window.event.keyCode == 13) {
			fn_roomsList(1);
		}
	}

	function fn_roomsDetail(obj){ //부대시설명 클릭시
		room_id = obj.parent().find("#ROOM_ID").val();
	    var index = obj.parent().find("#ROOM_IMGS_FILE").val();
	    var index_0 = index.split(',');
	    var name = obj.parent().find("#ROOM_TYPE_NAME").val();
	    var fac_detail = obj.parent().find("#ROOM_FAC_NAME").val().replace(/br/g,'\r\n');
	    var adult = obj.parent().find("#ROOM_ADULT").val();
	    var child = obj.parent().find("#ROOM_CHILD").val();
	    	var checkIn = obj.parent().find("#ROOM_CHK_INTIME").val();
	    	var checkOut = obj.parent().find("#ROOM_CHK_OUTTIME").val();
	    	/*$('#pop_type').attr('value',name);*/
	    	$('#pop_img').attr('src',"/hotel/image/rooms/"+index_0[0]);
	    	$('#pop_name').attr('value',name);
	    	$('#pop_fac').val(fac_detail);
	    	$('#pop_adult').attr('value',adult);
	    	$('#pop_child').attr('value',child);
	    	$('#pop_checkIn').attr('value',checkIn);
	    	$('#pop_checkOut').attr('value',checkOut);
	    	$('#room_id').attr('value',room_id);
	}
	
	function fn_roomsList(pageNo) { //페이징 함수
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectRoomsList' />");
		comAjax.setCallback("fn_roomsListCallback"); //ajax요청 후 호출될 함수의 이름 지정
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 10);
		comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
		comAjax.addParam("keyword", $("input[name='keyword']").val());
		comAjax.ajax(); //실질적인 ajax기능 수행
	}
	
	function fn_roomsListCallback(data) { //콜백함수
		var total = data.TOTAL;
		var body = $("table[name='roomsList'] > tbody");
		body.empty();
		if (total == 0) {
			var str = "<tr><td colspan='5'>조회된 결과가 없습니다.</td></tr>";
			body.append(str);
		} else {
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_roomsList",
				recordCount : 10
		};
			gfn_renderPaging(params);
			var str = "";
			$.each(
				data.list,
				function(key, value) {
				str += "<tr>"
					+ "<td>"
					+ value.RNUM
					+ "</td>"
					//+ "<td>"
					//+ value.ROOM_TYPE_NAME
					//+ "</td>"
					+ "<td>"
					+ "<a href='#this' name='title' data-toggle='modal' data-target='#myModal'>"
					+ "<input type='hidden' id='ROOM_ID' name='title' value=\"" + value.ROOM_ID + "\">"
					+ "<input type='hidden' id='ROOM_TYPE' name='type' value=\"" + value.ROOM_TYPE + "\">"
					+ "<input type='hidden' id='ROOM_TYPE_NAME' name='type' value=\"" + value.ROOM_TYPE_NAME + "\">"
					+ "<input type='hidden' id='ROOM_FAC_NAME' name='type' value=\"" + value.ROOM_FAC_NAME + "\">"
					+ "<input type='hidden' id='ROOM_ADULT' name='type' value=\"" + value.ROOM_ADULT + "\">"
					+ "<input type='hidden' id='ROOM_CHILD' name='type' value=\"" + value.ROOM_CHILD + "\">"
					+ "<input type='hidden' id='ROOM_CHK_INTIME' name='type' value=\"" + value.ROOM_CHK_INTIME + "\">"
					+ "<input type='hidden' id='ROOM_CHK_OUTTIME' name='type' value=\"" + value.ROOM_CHK_OUTTIME + "\">"
					+ "<input type='hidden' id='ROOM_IMGS_FILE' name='type' value=\"" + value.ROOM_IMGS_FILE + "\">"
					+ value.ROOM_NAME + "</a></td>"
					+ "<td id='id'>" + value.ROOM_ID + "</td>"
					+ "<td>" + value.ROOM_PRICE
					+ "</td>" + "</tr>";
				});
				
			//이거 넣어야 데이터 들어감
			body.append(str);
				
			$("a[name='title']").on("click", function(e){
				e.preventDefault();
				fn_roomsDetail($(this));
			});
			}
		}
    	$("#Modify").on("click", function(e){
			e.preventDefault();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/modifyRoomForm' />");
			comSubmit.addParam("ROOM_ID", room_id);
			comSubmit.submit();
		});
	  
</script>
</html>