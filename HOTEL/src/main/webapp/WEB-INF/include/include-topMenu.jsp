<%@ page language="java" 
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
a{
text-decoration: none;
}
a:hover {
text-decoration: none;
}
.header {
	width: 100%;
    margin: 0 auto;
    height: 90px;
    position: relative;
    text-align: right;
}
.logo {
	width: 200px;
	height: 50px;
	margin: 0 auto;
	text-align: center;
	border: 1px solid red;	
}

.loginArea {
    position: absolute;
    top: 19px;
    right: 80px;
}

#topMenu { /* navigation bar 전체(글자 부분 박스 제외) */
	width: 100%; /* [변경] 하위 메뉴와 동일하게 맞춤 */
	height: 60px;
	position: relative;
	margin: 0 auto;
	display: block;
	background-color: #81725f; /* [추가] 늘어난만큼 배경색도 보이도록 수정 */
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style: none;
	margin: 0px;
	padding: 0px;
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white;
	background-color: #81725f;
	float: left;
	line-height: 60px;
	vertical-align: middle;
	text-align: center;
	-position: relative;
	/*margin-left:80px;*/s
	/* margin-top:5px;*/
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
/*글자 부분 박스(위의 글자)*/
	text-decoration: none;
	display: block;
	width: 165px;
	height: 50px;
	font-size: 15px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum;
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: white;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: white;
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 150px;
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #0f1927;
	background-color: #DDD; /* [변경] 배경색 변경 */
	-border: solid 1px black; /* [삭제] 테두리 삭제 */
	-margin-right: -1px; /* [삭제] 공백 보정 삭제 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute;
	height: 0px;
	overflow: hidden;
	transition: height .2s;
	-webkit-transition: height .2s;
	-moz-transition: height .2s;
	-o-transition: height .2s;
	width: 100%;
	left: 0;
	top: 60px; 
	background-color: #dddddd; /* 하위 메뉴 전체 배경색 설정 */
}

.submenu li {
	display: inline-block;
}

.topMenuLi:hover .submenu {
	height: 60px; /*하위메뉴의 높이*/
}

.submenuLink:hover { /*글자에 마우스 올렸을 때*/
	color: ivory;
	background-color: #dddddd;
}

#login_form {font-size: 15px; text-decoration: none; padding: 5px; margin: 10px; font-weight: bold; color: black;}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header">
		<div class="logo">
			<a href="/hotel/main">EZEN_PRJ_MODIFIED VER.</a>
		</div>
	
		<div class="loginArea">
		<c:set var="ID" value="${USERID }" />
		<c:choose>
			<c:when test="${ID != NULL}">
${ID}님 <a id="login_form" href="#">예약확인</a> | <a id="login_form" href="/hotel/logout">로그아웃</a>  | <a id="login_form" href="/hotel/myPage">마이페이지</a> 
			</c:when>
			<c:otherwise>
				<a id="login_form" href="#">예약확인</a> | <a id="login_form" href="/hotel/loginForm">로그인</a> | <a id="login_form" href="/hotel/signUpTerms">회원가입</a>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
	
	<c:set var="isAdmin" value="${ADMIN }" />
<nav id="topMenu"> 
<ul class="topMenuUl">

 <li class="topMenuLi"  style="margin-left:500px;"> 
    <a class="menuLink" href="/hotel/about">호텔 소개</a> 
    	<ul class="submenu"> 
    		<li style="margin-left: 824px;"><a href="/hotel/about" class="submenuLink">About Hotel</a></li> 
   		</ul> 
  </li> 

 <li class="topMenuLi">
 <a class="menuLink" href="/hotel/rooms?ROOM_TYPE=1">객실</a>
  <ul class="submenu">
   <li style="margin-left: 150px;">
   <a href="/hotel/rooms?ROOM_TYPE=1" class="submenuLink longLink">Business Double</a>
   </li> 
   <li>
   <a href="/hotel/rooms?ROOM_TYPE=2" class="submenuLink longLink">Business Twin</a>
   </li> 
   <li>
   <a href="/hotel/rooms?ROOM_TYPE=3" class="submenuLink longLink">Superior Double</a>
   </li> 
   <li>
   <a href="/hotel/rooms?ROOM_TYPE=4" class="submenuLink longLink">Superior Twin</a>
   </li> 
   <li>
   <a href="/hotel/rooms?ROOM_TYPE=5" class="submenuLink longLink">Drama Suite</a>
   </li> 
   <li>
   <a href="/hotel/rooms?ROOM_TYPE=6" class="submenuLink longLink">Deluxe Suite</a>
   </li> 
   <li>
   <a href="/hotel/rooms?ROOM_TYPE=7" class="submenuLink lon gLink">Premium Suite</a>
   </li> 
   <li>
   <a href="/hotel/rooms?ROOM_TYPE=8" class="submenuLink longLink">Sienna Suite</a>
   </li> 
    </ul> 
    </li> 
             
    <li class="topMenuLi"> 
    <a class="menuLink" href="/hotel/facilities?FAC_HOTEL_ID=146">다이닝(부대시설)</a> 
    <ul class="submenu"> 
    <li style="margin-left: 455px;"><a href="/hotel/facilities?FAC_HOTEL_ID=146" class="submenuLink">Buffet Lennon</a></li>
     <li><a href="/hotel/facilities?FAC_HOTEL_ID=145" class="submenuLink">Cafe Lennon</a></li> 
     <li><a href="/hotel/facilities?FAC_HOTEL_ID=147" class="submenuLink">Business Corner</a></li>
      <li><a href="/hotel/facilities?FAC_HOTEL_ID=149" class="submenuLink">Conference room</a></li>
      </ul> 
    </li> 
          
    <li class="topMenuLi"> 
    <a class="menuLink" href="/hotel/reservation/main">RESERVATION</a> 
    <ul class="submenu"> 
    <li style="margin-left: 638px;"><a href="/hotel/reservation/main" class="submenuLink">Reservation</a></li>
		<c:if test="${ID != null}">
    		<li><a href="/hotel/reservation/resList" name="list" class="submenuLink">Booking List</a></li>
    	<script type="text/javascript">
    	$(document).ready(function(){
    		$("a[name='list']").on("click", function(e){
    			e.preventDefault();
    			fn_list();
    		});
    	});
    	function fn_list(){
    		var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/reservation/resList' />");
    		comSubmit.addParam("MEM_USERID", $("#ID").val());
    		comSubmit.submit();
    	}
    	</script>
    	</c:if>
      </ul> 
      </li> 
                
   
           
    <li class="topMenuLi"> 
    <a class="menuLink" href="/hotel/board/list">NOTICE</a> 
    <ul class="submenu"> 
    <li style="margin-left: 1000px;"><a href="/hotel/board/list" class="submenuLink">Notice</a></li>
  
      </ul> 
      </li> 
    <c:set var="isAdmin" value="${ADMIN}" />
    	<c:if test="${isAdmin == 'Y'}">h
       <li class="topMenuLi"> 
   	   <a class="menuLink" href="/hotel/admin/roomsList">MANAGEMENT</a> 
	    <ul class="submenu"> 
		    <li style="margin-left: 350px;"><a href="/hotel/admin/roomsList" class="submenuLink">객실관리</a></li>
		    <li><a href="/hotel/admin/facilitiesList" class="submenuLink">부대시설관리</a></li>
		    <li><a href="/hotel/admin/noticeList" class="submenuLink">공지사항관리</a></li>
		    <li><a href="/hotel/admin/reservationList" class="submenuLink">예약자 조회</a></li>
	     </ul> 
      </li> 
      </c:if>
     </ul>
      </nav>
</body>
</html>