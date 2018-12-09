<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
  <!-- 데이트 피커 -->
  <link href="/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
        <script src="/resources/dist/js/datepicker.min.js"></script>
     <!-- Include English language -->
        <script src="/resources/dist/js/i18n/datepicker.en.js"></script>

<style type="text/css">

<<<<<<< HEAD
#wrapper
{
	padding-top:40px;
}

body {
	margin: 0;

	

}
=======
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
ul li {
	list-style: none;
	float: left;
}

.fl-left {
	float: left;
}

.fl-right {
	float: right;
}

.fix-left {
	position: fixed;
	left: 0;
	top: 75px;
}

#header {
/* 	position: relative; */
	z-index: 100;
	left: 0;
	top: 0;
	margin: 0 auto;
	width: 100%;
	height: 55px;
	min-width: 978px;
	max-width: 1200px;
	transition: 0.6s;
	display: block;
	position: -webkit-sticky;
  	position: sticky;
  	will-change: transform;
}

#header:hover {
	
}

#header.fix {
	position: fixed;
	background: #fffc;
	transition: 0.6s;
}

#header .inner {
	position: relative;
	z-index: 1;
	margin: 0 auto;
/* 	padding: 0px 37px 0; */
	min-width:;
	max-width:;
	*zoom: 1;
}

#header .inner:after {
	content: "";
	display: block;
	clear: both;
}

#header h3 {
	position: relative;
	float: left;
	margin: 0;
	width: 20%;
	height: 60px;
	z-index: 2;
	padding-top: 17px;
}

#header h1 img {
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	margin: auto;
	max-height: 100%;
}

#header .fl-right {
	margin: 0;
}

#header ul.hovermenu.category {
	padding-inline-start: 25%;
	text-align: center;
	position: absolute;
	margin: 17px auto 0;
	top: 0;
	bottom: 0;
	left: 3%;
	right: 0;
	z-index: 1;
}

#header .logbar {
	float: right;
	text-align: right;
	z-index: 1;
	padding-top : 33px;
}

#header .logbar>li {
	margin: 0 0 0 26px;
}

#header .logbar>li.mSearch>a img {
	margin-left: 1px;
	vertical-align: -2px;
}

#header .logbar>li.mCart>a img {
	vertical-align: -6px;
	margin-right: 6px;
}

#header .logbar>li.mCart>a .count {
	
}

#header .logbar>li>a {
	display: inline-block;
	padding: 3px 0;
	font-size: 14px;
	letter-spacing: 0.18em;
	line-height: 1.2em;
}

ul.hovermenu {
	
}

ul.hovermenu>li {
	display: inline-block;
	position: relative;
	z-index: 10;
	margin: 0 13px;
	vertical-align: middle;
}

ul.hovermenu>li:hover {
	position: relative;
	z-index: 10;
}

ul.hovermenu>li>a {
	display: inline-block;
	padding: 3px 0;
	font-size: 16px;
	letter-spacing: 0.18em;
	line-height: 1.2em;
	color: #000;
	text-decoration: none;
	font-family: '나눔고딕';
}

#header .inner label {
	
	display: inline-block;
	padding: 3px 0;
	font-size: 14px;
	letter-spacing: 0.18em;
	line-height: 1.2em;
	color: #d4ab00;
	width : 100px;
}

ul.hovermenu>li>a:hover {
	padding: 3px 0 2px;
	border-bottom: 1px solid #000;
	transition: 0.2s;
	text-decoration: none;
}

ul.hovermenu>li>.sub {
	visibility: hidden;
	opacity: 0;
	transition: 0.1s;
	position: absolute;
	z-index: 111;
	top: 100%;
	left: 50%;
	margin-left: -97px;
	width: 190px;
}

ul.hovermenu>li:hover>.sub {
	visibility: visible;
	display: block;
	opacity: 1;
	transition: 0.2s;
}

ul.hovermenu>li>.sub ul {
	margin: 10px 0 0;
	padding: 10px 0px;
	background: #fff;
	text-align: left;
}

ul.hovermenu>li>.sub li {
	display: block;
	padding: 0;
	margin: 1px 0;
	padding: 10px 0px 10px 30px;
}

ul.hovermenu>li>.sub li:hover {
	background: #e5e5e5;
}

ul.hovermenu>li>.sub a {
	display: inline-block;
	font-size: 16px;
	letter-spacing: 0.18em;
	color: #000;
	border-bottom: 0px solid #fff;
	line-height: 1.2em;
	text-decoration: none;
}

ul.hovermenu>li>.sub a.last {
	padding: 20px 0px 20px 30px;
}

ul.hovermenu>li>.sub a:hover, ul.hovermenu>li>.sub li.selected a {
	color:;
	transition: 0.2s;
}

.hovermenu li:hover ul.subCate.sub3 {
	display: none;
}

.hovermenu li ul.subCate.sub3::after {
	border: 5px solid transparent;
	border-left-color: gray;
	content: '';
	height: 0;
	position: absolute;
	left: 0px;
	top: 35.5%;
	width: 0;
	z-index: 999;
}

.hovermenu li ul.subCate.sub3 {
	position: absolute;
	left: 190px;
	top: 0px;
	width: 180px;
	height: 89.5%;
}

ul.hovermenu>li>.sub li:hover ul.subCate.sub3 {
	display: block;
}

.hovermenu li ul.subCate.sub4::after {
	border: 5px solid transparent;
	border-left-color: gray;
	content: '';
	height: 0;
	position: absolute;
	left: 0px;
	top: 48.5%;
	width: 0;
	z-index: 999;
}

.hovermenu li:hover ul.subCate.sub4 {
	display: none;
}

.hovermenu li ul.subCate.sub4 {
	position: absolute;
	left: 190px;
	top: 0px;
	width: 180px;
	height: 89.5%;
}

ul.hovermenu>li>.sub li:hover ul.subCate.sub4 {
	display: block;
}

.hovermenu li ul.subCate.sub5::after {
	border: 5px solid transparent;
	border-left-color: gray;
	content: '';
	height: 0;
	position: absolute;
	left: 0px;
	top: 61.5%;
	width: 0;
	z-index: 999;
}

.hovermenu li:hover ul.subCate.sub5 {
	display: none;
}

.hovermenu li ul.subCate.sub5 {
	position: absolute;
	left: 190px;
	top: 0px;
	width: 180px;
	height: 89.5%;
}

ul.hovermenu>li>.sub li:hover ul.subCate.sub5 {
	display: block;
}

.hovermenu li ul.subCate.sub6::after {
	border: 5px solid transparent;
	border-left-color: gray;
	content: '';
	height: 0;
	position: absolute;
	left: 0px;
	top: 75.5%;
	width: 0;
	z-index: 999;
}

.hovermenu li:hover ul.subCate.sub6 {
	display: none;
}

.hovermenu li ul.subCate.sub6 {
	position: absolute;
	left: 190px;
	top: 0px;
	width: 180px;
	height: 89.5%;
}

 ul.hovermenu>li>.sub li:hover ul.subCate.sub6 {
	display: block;
}


.Search {
  position: relative;
  display: flex;
  color: #555;
  padding-top : 16px;
  
}
.Search-box {
  flex: 1 0 auto;
   padding: 0; 
  height: 48px;
  border: 0;
  box-shadow: 0 3px 12px -1px rgba(0, 0, 0, .3);
  transition: all .15s ease-in-out;
  width: 460px;
  vertical-align: middle;
	border : 1px solid #ebebeb;
	border-radius: 4px;
	
}


.Search-label {
  position: absolute;
  top: 14px;
  right: 30px;
  font-size: 40px;
  transition: all .15s ease-in-out;
}

 .Search-box:focus + .Search-label {
  transform: translateX(12px);
}

.search_modal{
 	display: block; 
    position: absolute; 
     top: 65px;
     background: #FFFFFF; 
     box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15), 0     15px 20px 0 rgba(0, 0, 0, 0.15); 
     transform-origin:top right; 
     opacity:0; 
     transform:scale(0.95); 
     transition: all .15s ease; 
     border-radius: 4px;
     width: 460px;
}
.search_modal:hover{
  	 opacity:1; 
     transform:scale(1); 
    transition: all .15s ease; 
}

.inner{
	background-color: #fff;
	border-bottom: 1px solid #e4e4e4;
}

.btn{
	width: 76px;
    height: 50px;
    margin-left: 30px;
	font-size: large;
	font-weight : initial;
	background-color: white;
}
 </style>

<header id="header">
	<div class="inner">
		<div class="fl-left">
			<h3 module="Layout_LogoTop">
				<a href="#"><img style="height: 50px;"
					src="https://mblogthumb-phinf.pstatic.net/20120807_173/wldnjs980227_1344341038774YQ23Y_JPEG/%B9%D0%C2%A4%B8%F0%C0%DA_%C7%D8%C0%FB%B4%DC.jpg?type=w2" alt="로고" /></a>
			</h3>
			  <form action="#" class="Search">
   				 <input class="Search-box" type="search" id="Search-box" autocomplete="off">
   					
   				 <label class="Search-label" for="Search-box"><i class="fa fa-search"></i></label>
  			</form>
					<div class= "search_modal "style="left: 101;">
   					<ul style ="padding : 0;">
   					<li>&nbsp;&nbsp;&nbsp;&nbsp;프로젝트 둘러보기</li><br><br>
   					<li><button class= "btn">모두</button></li>
   					<li><button class= "btn">숙소</button></li>
   					<li><button class= "btn">행사</button></li>
   					</ul>
   					</div>
		
		</div>
		<ul class="fl-right logbar hovermenu">
			
				<!-- 로그인 상태가 아니면 -->
				<c:if test="${not login }">
				
					<li><a href="/cs/cs">고객센터</a></li>
					<li><a href="/login">로그인</a></li>
					<li><a href="/join">회원가입</a></li>
					
				</c:if>
		
				<!-- 일반 로그인 -->
				<c:if test="${login }">
					<li><a href="#">호스트가 되어보세요</a></li>
					<li><a href="/cs/cs">고객센터</a></li>
					<li><a href="/mypage/view_profile">마이페이지</a></li>
					<li><a href="/logout">로그아웃</a></li>
				
				</c:if>
		
				<!-- 호스트 로그인 -->
				<c:if test="${hostlogin }">
				
					<li><a href="#">호스트 페이지</a></li>
					<li><a href="/cs/cs">고객센터</a></li>
					<li><a href="/mypage/view_profile">마이페이지</a></li>
					<li><a href="/logout">로그아웃</a></li>
					
				
				</c:if>
		
				<!--  관리자 로그인 -->
				<c:if test="${adminlogin }">
				
					<li><a href="#">관리자 페이지</a></li>
					<li><a href="/logout">로그아웃</a></li>
				
				</c:if>
		
		</ul>
	
	</div>
</header>

