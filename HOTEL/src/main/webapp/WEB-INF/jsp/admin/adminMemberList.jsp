<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>

<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>
<style>
#PAGE_NAVI{text-align: center;}
a { text-decoration:none !important }
a:hover { text-decoration:none !important }
</style>
<title>회원 목록</title>
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
      
   <br><br><br>  
   <h1 class="m-0 text-dark" align="center">회원 목록</h1>
   <br>
   <div class="row">
          <div class="col-12">
          	
<div class="card-body table-responsive p-0">
	   <form id="memberList">
	   <div style="float: right">
			    <select id="searchOption" size="1" style="height: 35px;">
		                <option id="MEM_USERID" value="MEM_USERID" 
										selected="selected">회원ID</option>
		        </select>
                 <input type="text" size="16" name="keyword" class="form-control mr-sm-1" style="width: 200px; display: inline-block;"
							value="${keyword}" placeholder="검색어 입력" onkeyup="enterkey();">
                 <!--검색어를 쓰고 엔터키를 누르면 먹지를 않기때문에 onkeyup="enterkey();를 주는 고 밑이 function으로 연결-->
                 <input type="text" style="display: none;" />
                 <!-- type="text"가 하나일때는 밑의 설명처럼 서브밋처럼 액션 주소를 따라감, 그래서 꼼수로 보이지않는 텍스트를 하나 더 넣어줌 -->
                 <input type="button" class="btn btn-secondary my-2 my-sm-0 " value="검 색" onClick="fn_memList(1)">

	   </div>
	   <br><br>
	   
	   
	    <table class="table table-head-fixed text-nowrap" name="memberList">
	       <thead>
			<tr>
				<th scope="col">회원번호</th>
                <th scope="col">회원ID</th>
                <th scope="col">회원명</th>
                <th scope="col">웹사이트 가입일</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	    </table>
	    
	    <div id="PAGE_NAVI">
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</div>
		<br>
	    </form>
	   </div>
	</div>
   <!--  row  div  end-->
    
</div>
</div>
</div>
</div>    
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>

</body>
	<script>
		$(document).ready(function() {
			fn_memList(1);
		
		});
		function enterkey() { //검색창에서 엔터 누르면 실행
			if (window.event.keyCode == 13) {
				fn_noticeList(1);
			}
		}

		function fn_noticeDetail(obj) { //부대시설명 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeDetail' />");
			comSubmit.addParam("NOTICE_ID", obj.parent().find(
					"input[name='title']").val());
			comSubmit.submit();
		}
		function fn_memList(pageNo) { //페이징 함수
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectMemList' />");
			comAjax.setCallback("fn_memberListCallback"); //ajax요청 후 호출될 함수의 이름 지정
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("searchOption", $(
					"#searchOption > option:selected").val());
			comAjax.addParam("keyword", $("input[name='keyword']").val());
			comAjax.ajax(); //실질적인 ajax기능 수행
		}
		function fn_memberListCallback(data) { //콜백함수
			var total = data.TOTAL;
			alert(total);//총 게시글 개수
			var body = $("table[name='memberList'] > tbody");
			//alert(body);
			body.empty();
			if (total == 0) {
				var str = "<tr><td colspan='4' align='center'>조회된 결과가 없습니다.</td></tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_memList",
					recordCount : 10
				};
				gfn_renderPaging(params);
				var str = "";
				$
						.each(
								data.list,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.RNUM
											+ "</td>"
											+ "<td>"
											+ "<a href='#this' name='USERID'>"
											+ value.MEM_USERID
											+ "</a>"
											+ "<input type='hidden' name='USERID' value=" + value.MEM_ID + ">"
											+ "</td>" + "<td>"
											+ value.MEM_NAME + "</td>"
											+ "<td>" + value.MEM_JOINDATE
											+ "</td>" + "</tr>";
								});
				//이거 넣어야 데이터 들어감
				body.append(str);
				$("a[name='USERID']").on("click", function(e) {
					e.preventDefault();
					fn_noticeDetail($(this));
				});
			}
		}
	</script>
</html>