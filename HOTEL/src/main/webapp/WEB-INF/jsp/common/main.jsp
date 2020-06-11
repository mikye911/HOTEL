<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTEL</title>
<style type="text/css">
.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: white;
background-repeat:no-repeat;
background-size:100%;
}
.div-reservation{
weith:100%;
height:850px;
border:1px solid black ;
}

.div-fac{
weith:100%;
height:650px;
/*border:1px solid black ;*/
}

.div-notice{
weith:100%;
height:500px;
/*border:1px solid black ;*/
 background-image:url(/hotel/image/main-notice.jpg);
 background-repeat:no-repeat;
 background-position:center;
background-size:cover;
 color: white;
}
.div-notice-son{
width: 850px;
  height:300px;
 background-color:  white;
position: absolute;
/*bottom:70%;*/
left:22%;
top:268%;

}

    #notice{margin-left: calc(50% - 425px);width: 700px;text-align: center} 
	h2{width: 100px;  display: block; text-align: center;}
	#PAGE_NAVI{text-align: center;margin-top:10%}
	.notice_list{border-bottom:1px solid black ;border-collapse: collapse;}
	.notice_list th{border-bottom:1px solid  white;}
	.notice_list tr{height: 48px}
	.notice_list tr td{border-bottom:1px solid white;}
	.h1 {
     color: white;
}
.a1{
color: white;
}


<!-- 이미지슬라이드-->
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 700px;
 
position: absolute;
/*bottom:70%;*/
left:10%;
top:180%;
}

.fac-name{
font-size: 22px;
 height: 50px;
  width: 200px;
position: absolute;
/*bottom:70%;*/
left:60%;
top:180%;
/*border:1px solid black ;*/
}
.fac-content{
 height: 220px;
  width: 500px;
position: absolute;
/*bottom:70%;*/
left:60%;
top:188%;
/*border:1px solid black ;*/
font-size: 16px;
}

.fac-all{
 height: 190px;
  width: 500px;
position: absolute;
/*bottom:70%;*/
left:60%;
top:218%;
/*border:1px solid black ;*/
}
/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: white;
background-repeat:no-repeat;
background-size:100%;
}
</style>

</head>
  <%@ include file="/WEB-INF/include/include-header.jspf" %>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center" >
메인화면 입니다.<br/>
<c:set var="ID" value="${USERID }" />
<c:choose>
<c:when test="${ID != NULL}">
${ID }님, 환영합니다. <a href="/hotel/logout">로그아웃</a> | <a href="/hotel/modifyMemForm">회원정보 수정</a>
</c:when>
<c:otherwise>
<a href="/hotel/signUpForm">회원가입</a> | <a href="/hotel/loginForm">로그인</a>
</c:otherwise>
</c:choose>
<br>
<c:set var="isAdmin" value="${ADMIN }" />
<c:if test="${isAdmin == 'Y' }">
<a href="/hotel/admin">호텔 관리</a>
</c:if>
</div>
<div class="div-reservation">
</div>
<div class="div-fac">
<br>
<center><h1 >시설소개</h1></center>
<c:forEach items="${list2}" var="fac">
<div class="fac-name">
<b>${fac.FAC_HOTEL_NAME}</b>
</div>
<br>

<c:forTokens items="${fac.HOTEL_IMGS_FILE }" delims="," var="item">
   <div class="slideshow-container">

<div class="mySlides fade">

  <img src="<c:url value='/image/${item}'/>" style="width:700px; height:480px;">

</div>


</div>
</c:forTokens>

<br>
<div class="fac-content">
${fn:replace(fac.FAC_HOTEL_CONTENT, cn, br)}
</div>
<br>
<div class="fac-all">
위치: ${fac.FAC_HOTEL_LOCATION}<br><br>
이용시간: ${fac.FAC_HOTEL_TIME}<br><br>
시설: ${fac.FAC_HOTEL_FAC}<br><br>
대표전화: ${fac.FAC_HOTEL_PHONE}<br><br>
<c:choose>
	<c:when test="${fac.FAC_HOTEL_DETAIL != null}">
* ${fac.FAC_HOTEL_DETAIL}
	</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
</div>
</c:forEach>
</div>
<div class="div-notice">
<br>

<center><h1 class="h1" >NOTICE</h1></center>
<!--  <div class="div-notice-son">-->
<form id="notice">
	
		<table name="noticeList" class="notice_list" align="center" width="850">
			<colgroup>
				<col width="15%"/>
				<col width="55%"/>
				<col width="30%"/>
				
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제  목</th>
					<th scope="col">작성일</th>
					
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="board">
			<tr>
			<td>${board.RNUM}</td>
			<td class='title'>
						<a class="a1" href='#this' name='title'>${board.NOTICE_TITLE }</a>
						<input type='hidden' name='id' value="${board.NOTICE_ID }"> 
						</td><td>${board.NOTICE_DATE }</td>
						</tr>
						</c:forEach>
			</tbody>
		</table>
		</form>

</div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">

$(document).ready(function(){ 
	  $("a[name='title']").on("click", function(e){ //제목
		   e.preventDefault(); fn_noticeDetail($(this));
		    });
	     });


function fn_noticeDetail(obj){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/board/boardDetail' />");
    comSubmit.addParam("NOTICE_ID", obj.parent().find("input[name='id']").val());
    comSubmit.submit();
}


var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    
    setTimeout(showSlides, 7000); // Change image every 2 seconds
}
</script>
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>