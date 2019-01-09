<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is trip 인생은 여행이다</title>

<style>
.content {
	padding-left: 80px;
	padding-right: 80px;
}
.top-menu {
	position: relative !important;
    z-index: 0 !important;
    display: inline-flex;
}
.top-menu1 {
	display: table;
	width: 275px;
	border-width: 1px !important;
    border-style: solid !important;
    border-color: rgba(0, 0, 0, 0.1) !important;
    border-image: initial !important;
    border-radius: 3px !important;
    margin-left: 8px !important;
    margin-right: 8px !important;
}
.top-menu-image {
	display: table-cell;
	width: 96px;
	height: 72px;
}
.tp-menu-info {
	display: table-cell !important;
    width: 100% !important;
    vertical-align: middle !important;
}
</style>

</head>
<body>

<div id="wrapper"> 

		<div>
			<!-- header 시작 -->
			<c:import url="../layout/header.jsp" />
		</div>
		
		<!-- 본문 시작 -->
		
		<div class="content">
			<h1 align="left">Lit 둘러보기</h1>
			
			<div class="top-menu">
				<a href="/main/lodge">
					<div class="top-menu1">
						<div class="top-menu-image">
							<img src="/resources/images/main/mainLodge.jpg" width="100%" height="100%">
						</div>
						<div class="top-menu-info">
							<div style="white-space: normal !important;padding: 14px 16px 10px !important;">
								<span>숙소</span>
							</div>
						</div>
					</div>
				</a>
				
				<a href="/main/festival">
					<div class="top-menu1">
						<div class="top-menu-image">
							<img src="/resources/images/main/festival.png" width="100%" height="100%">
						</div>
						<div class="top-menu-info">
							<div style="white-space: normal !important;padding: 14px 16px 10px !important;">
								<span>행사</span>
							</div>
						</div>
					</div>
				</a>
 			</div> <!-- top-menu end -->
		</div>
		
		
</div>
	
</body>


<script>

