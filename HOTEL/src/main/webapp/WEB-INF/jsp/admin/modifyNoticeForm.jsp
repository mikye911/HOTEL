<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<meta charset="UTF-8">
<style>
<<<<<<< HEAD
    #noticeModify{margin-left: calc(50% - 400px);width: 800px;} 
	
	h2{width: 800px;  display: block; text-align: center;}
	
	.div-about{ 
 	background-image:url(/hotel/image/hotel.jpg);
	height:250px;
=======
#notice {
	margin-left: calc(50% - 400px);
	width: 800px;
	text-align: center
}

h2 {
	width: 800px;
	display: block;
	text-align: center;
}

#PAGE_NAVI {
	text-align: center;
	margin-top: 10%
}

.div-about {
	background-image: url(/hotel/image/hotel.jpg);
	height: 250px;
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
	color: #e5a880;
<<<<<<< HEAD
	background-repeat:no-repeat;
	background-size:100%;
	}
	
	a{
	text-decoration: none;
	color: black;
	}
=======
	background-repeat: no-repeat;
	background-size: 100%;
}

a {
	text-decoration: none;
	color: black;
}
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
</style>
<title>공지사항 수정폼</title>
<<<<<<< HEAD

<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
=======
<!--  -->
부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
</head>

<body>
<<<<<<< HEAD
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>N O T I C E</h1></div>
   <br>
<h3 align="center">공지사항 수정</h3>
<br>
	<form id="noticeModify"  name="noticeModify" enctype="multipart/form-data">
	<table name="noticeModify" class="table table-striped" style="width: 800px;" >
=======
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<div class="div-about" align="center">
		<br> <br> <br>
		<h1>N O T I C E</h1>
	</div>
<%@ include file="/WEB-INF/include/include-admin.jspf"%>
<h3 align="center">공지사항 수정</h3> <br>


	<form id="frm" name="frm" enctype="multipart/form-data">

	<table name="noticeModify" class="table table-striped" align="center"
							style="width: 800px;">
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
		<tbody>
			<tr>
<<<<<<< HEAD
				<th width="30%">제목</th>
				<td width="70%">
					<input type="hidden" id="NOTICE_ID" name="NOTICE_ID" value="${map.NOTICE_ID}">
					<input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" size="60" value="${map.NOTICE_TITLE}">
=======
				<th scope="row">제목</th>
				<td align="center">
					<input type="hidden" id="NOTICE_ID" name="NOTICE_ID"
										value="${map.NOTICE_ID}">
					<input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" size="70"
										value="${map.NOTICE_TITLE}">
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
				</td>
			</tr>
			<tr>
				<th>내용</th>
<<<<<<< HEAD
				<td>
					<textarea rows="10" cols="80" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT">${map.NOTICE_CONTENT}</textarea>
=======
				<td align="center">
					<input type="text" id="NOTICE_CONTENT" name="NOTICE_CONTENT"
										size="70" value="${map.NOTICE_CONTENT}">
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
				</td>
			</tr>
			<tr>
				<th>이미지</th>
<<<<<<< HEAD
				<td>
					<input type="hidden" name="orgFile" value="${map.NOTICE_IMG}" id="orgFile">
					<img src= "/hotel/image/${map.NOTICE_IMG}" style = "width:600px; heigth:600px;">
					<br>
					업로드된 파일명 : ${map.NOTICE_IMG}
					<br>
					<input type="file" name="newFile" id="newFile">
=======
				<td align="center">
					<input type="file" name="newFile" id="newFile">
					<p>업로드된 파일 : ${map.NOTICE_IMG}</p>
					<input type="hidden" name="orgFile" value="${map.NOTICE_IMG}"
										id="orgFile">
					<img src="/hotel/image/${map.NOTICE_IMG}"
										style="width:200px; heigth:120px;">
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
				</td>
			</tr>
			<tr>
				<th>공개여부</th>
<<<<<<< HEAD
				<td>
					<input type="radio" id="NOTICE_ISVIEW" name="NOTICE_ISVIEW" value=Y>공개&nbsp;
					<input type="radio" id="NOTICE_ISVIEW" name="NOTICE_ISVIEW" value=N>비공개
=======
				<td align="center">
					<input type="radio" id="NOTICE_ISVIEW" name="NOTICE_ISVIEW"
										size="70" value=Y> 공개&nbsp;
					<input type="radio" id="NOTICE_ISVIEW" name="NOTICE_ISVIEW"
										size="70" value=N> 비공개
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	
	<center>
		<a href="#this" class="btn" id="modify">수정하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</center>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>		
	
	<script>
		$(document).ready(function() {
			$("#list").on("click", function(e) { //'목록으로' 누르면
				e.preventDefault();
				fn_noticeList();
			});

			$("#modify").on("click", function(e) { //'수정하기' 누르면
				e.preventDefault();
				fn_noticeModify();
			});
		});

<<<<<<< HEAD
		$("#modify").on("click", function(e){ //'수정하기' 누르면
			e.preventDefault();
			fn_noticeModify();
		});
	});   
    
	function fn_noticeList(pageNo){ //리스트로 이동하는 함수
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/noticeList' />");
		comSubmit.submit();
		
	}  
	
	function fn_noticeModify(obj){
		var comSubmit = new ComSubmit("noticeModify");
		comSubmit.setUrl("<c:url value='/admin/modifyNotice' />");
		comSubmit.submit();
	}
=======
		function fn_noticeList(pageNo) { //리스트로 이동하는 함수
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeList' />");
			comSubmit.submit();

		}

		function fn_noticeModify(obj) {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/modifyNotice' />");
			comSubmit.submit();
		}
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
	</script>
	


				</body>
</html>