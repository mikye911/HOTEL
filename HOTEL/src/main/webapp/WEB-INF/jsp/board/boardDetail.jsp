<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/include/include-header.jspf" %>
<style>
  #frm{margin-left: calc(50% - 400px);width: 800px;text-align: center} 
	#backbutton{text-align: center;margin-top:10%}
	.notice_detail{border-bottom:1px solid black ;border-collapse: collapse;}
	.notice_detail th{border-bottom:1px solid black;}
	.notice_detail tr{height: 50px}
	.notice_detail tr td{border-bottom:1px solid black;}
	
	#backbutton>button{width: 100px; height: 30px;border: 0;background-color:#d8d1d1; }
	#backbutton>button:hover {
	color:white;border:1px solid gray;
}

	.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: white;
background-repeat:no-repeat;
background-size:100%;
}
</style>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>N O T I C E</h1></div>
   <br>
	<form id="frm">
	<table class="notice_detail" align="center" width="800" >
		<colgroup>
			<col width="7%" />
			<col width="70%" />
			<col width="23%" />
		</colgroup>
		<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제  목</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
		<tbody>
			<tr>
				<td align="center">${map.NOTICE_ID}</td>
				<td align="center">${map.NOTICE_TITLE}</td>
				<td align="center">${map.NOTICE_DATE}</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
			<c:choose>
		<c:when test="${map.NOTICE_IMG != null}">
				<p>
				<td colspan="4" height="200">
				<img src="<c:url value='/image/${map.NOTICE_IMG}'/>" />
				<br>${fn:replace(map.NOTICE_CONTENT, cn, br)}
				</td>
				</p>
				</c:when>
		<c:otherwise>
		<p>
				<td colspan="4" height="200">
				<br>${fn:replace(map.NOTICE_CONTENT, cn, br)}
				</td>
				</p>
				</c:otherwise>
				</c:choose>
			</tr>
		</tbody>
	</table>
	
	<br/>
	<div id="backbutton">
	<button href="#this" class="btn" id="list">목록으로</button>
</div>

	  	</form>
	  <%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_noticeList();
			});
			
	});
		
		function fn_noticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/list' />");
			comSubmit.submit();
		}

		
	</script>
		
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>