<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-ion" href="/resources/images/url.ico" />
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
.content>.h3 {
	font-weight: 800 !important;
    margin-bottom: 0px !important;
    font-size: 24px !important;
    line-height: 30px !important;
    letter-spacing: normal !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    padding: 20px 0px 0px !important;
}
.LodgeList {
	padding: 0 10px 0 10px;
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
			
			
<!-- 			<div class="top-menu"> -->
<!-- 				<a href="/main/lodge"> -->
<!-- 					<div class="top-menu1"> -->
<!-- 						<div class="top-menu-image"> -->
<!-- 							<img src="/resources/images/main/mainLodge.jpg" width="100%" height="100%"> -->
<!-- 						</div> -->
<!-- 						<div class="top-menu-info"> -->
<!-- 							<div style="white-space: normal !important;padding: 14px 16px 10px !important;"> -->
<!-- 								<span>숙소</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</a> -->
				
<!-- 				<a href="/main/festival"> -->
<!-- 					<div class="top-menu1"> -->
<!-- 						<div class="top-menu-image"> -->
<!-- 							<img src="/resources/images/main/festival.png" width="100%" height="100%"> -->
<!-- 						</div> -->
<!-- 						<div class="top-menu-info"> -->
<!-- 							<div style="white-space: normal !important;padding: 14px 16px 10px !important;"> -->
<!-- 								<span>행사</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!--  			</div> top-menu end -->
 			
 			
				<div class="h3">
 					<h3>LIT의 추천 숙소들</h3>
 				</div>
				
				<c:forEach var="list" end="5" items="${lodgeList }">
					<a href="/lodge/view?lodge_no=${list.lodge_no }" style="text-decoration: none;">
						<div class="LodgeList" style="width: 15%; display: inline-block;">
							<div class="LodgeList-image">
								<img src="/resources/images/lodge_image/${list.stored_name[0] }" style="border-radius: 5px;" width="100%" height="100%">
							</div>
							<div>
								<span style="font-weight: 800 !important;
    font-size: 17px !important;
    line-height: 21px !important;
    max-height: 42px !important;
    text-overflow: ellipsis !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 2 !important;
    -webkit-box-orient: vertical !important;
    margin-bottom: 4px !important;
    overflow: hidden !important;color: rgb(72, 72, 72) !important;">${list.lodge_name }</span>
							</div>
							<div>
								<span style="color: rgb(72, 72, 72) !important;"><fmt:formatNumber type="number" pattern="###,###" value="${list.stay_cost }" />원</span>
							</div> 
						</div>
					</a>
				</c:forEach>
				
				<div class="h3">
 					<h3>이 달의 행사</h3>
 				</div>
				
				<c:forEach var="list" items="${festivalList }">
					<a href="/festival/view?festival_no=${list.festival_no }" style="text-decoration: none;">
						<div class="festivalList" style="width: 24%; display: inline-block;">
							<div class="festivalList-image">
								<img src="/resources/images/${list.stored_name }" style="border-radius: 5px;" width="100%" height="100%">
							</div>
							<div>
								<span style="font-weight: 800 !important;
    font-size: 17px !important;
    line-height: 21px !important;
    max-height: 42px !important;
    text-overflow: ellipsis !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 2 !important;
    -webkit-box-orient: vertical !important;
    margin-bottom: 4px !important;
    overflow: hidden !important;color: rgb(72, 72, 72) !important;">${list.festival_name }</span>
							</div>
							<div>
								<span style="color: rgb(72, 72, 72) !important;"><fmt:formatDate type="date" value="${list.start_date }" /> ~
								<fmt:formatDate type="date" value="${list.end_date }" /> </span>
							</div> 
						</div>
					</a>
				</c:forEach>
				
				<div class="h3">
 					<h3>믿고 보는 숙소 리스트 </h3>
 				</div>
				
				<c:forEach var="list" begin="6" items="${lodgeList }">
					<a href="/lodge/view?lodge_no=${list.lodge_no }" style="text-decoration: none;">
						<div class="LodgeList" style="width: 31%; display: inline-block;">
							<div class="LodgeList-image">
								<img src="/resources/images/lodge_image/${list.stored_name[0] }" style="border-radius: 5px;" width="100%" height="100%">
							</div>
							<div>
								<span style="font-weight: 800 !important;
    font-size: 17px !important;
    line-height: 21px !important;
    max-height: 42px !important;
    text-overflow: ellipsis !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 2 !important;
    -webkit-box-orient: vertical !important;
    margin-bottom: 4px !important;
    overflow: hidden !important;color: rgb(72, 72, 72) !important;">${list.lodge_name }</span>
							</div>
							<div>
								<span style="color: rgb(72, 72, 72) !important;"><fmt:formatNumber type="number" pattern="###,###" value="${list.stay_cost }" />원</span>
							</div> 
						</div>
					</a>
				</c:forEach>
				
			
 			<div id="enters"></div>
		</div> <!-- content end -->
		
		
</div>
	
</body>

<script type="text/javascript">
		var page = 1;

		$(window).scroll(
				function() {
					if ($(window).scrollTop() == $(document).height()
							- $(window).height()) {
						console.log(++page);

						// AJAX 처리하기
						$.ajax({
							type : "post",
							url : "/main/mainAjax",
							data : {
								"page" : page
								
							},
							dataType : "html",
							success : function(d) {
								console.log("성공");
								console.log(d);

								$("#enters").append(d);
							},
							error : function() {
								console.log("실패");
							}
						});

					}
				});
	</script>
