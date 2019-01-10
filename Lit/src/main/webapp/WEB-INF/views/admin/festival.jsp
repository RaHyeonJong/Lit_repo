<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.google.com/specimen/Do+Hyeon?selection.family=Do+Hyeon" rel="stylesheet">


<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/resources/css/3-col-portfolio.css" rel="stylesheet">

</head>

<body>

<!-- 사이드 바, 헤더 import -->
<jsp:include page="layout/header.jsp" />

    <div id="wrapper">
	<jsp:include page="layout/sidebar.jsp" />

    <!-- Page Content -->
    <div class="container">

      <br><br>
	  <div class="card-header"> 
	    <i class="fas fa-table"></i>&nbsp;&nbsp;행사 관리 데이터 테이블 
	  </div>
      <br>

      <button type="button" class="btn btn-outline-dark" style="position:absolute; right:6%; width:200px;"
              onclick="location='/admin/festivalWrite'">글 작성하기</button>
      <br><br><br>
      
      <!-- 축제 리스트 뽑기 -->
      
      <div class="row">
        <c:forEach items="${festivalList }" var="festival">
        <div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:20px;">
          <div class="card h-100">
            <a href="/festival/view?festival_no=${festival.festival_no }">
            <img  src="/resources/images/${festival.stored_name }" class="card-img-top" style="width:350px; height:350px; border-radius:15%" ></a>
            <div class="card-body" style="text-align:center;">            
              <!-- 축제 제목 -->
              <p style="font-family:Charm;"><b>${festival.festival_name }</b></p>
              <p class="card-text" style="font-size:12px;">
                                   ${festival.start_date } ~ ${festival.end_date }<br>
                                   ${festival.address }</p>                                
            </div>
          </div>
        </div>
       </c:forEach>
      </div><!-- row 끝 --><br><br><br>

        
       <!-- 축제 리스트 페이징 처리 -->
              
        <div class="pagination" style="text-align:center;">
	    <nav>
		<ul class="pagination" style="padding-left: 300px;">

			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage < 11 }">
				<!-- 첫페이지일때 -->
				<li class="disabled"><a href="/admin/festival"
					aria-label="Previous" class="w3-button"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage > 10 }">
				<!-- 첫페이지가아닐때 -->
				<li><fmt:parseNumber var="p" integerOnly="true"
						value="${(paging.curPage/paging.pageCount)}" /> <fmt:parseNumber
						var="prevPage" integerOnly="true"
						value="${(p-1)*paging.pageCount+1 }" /> <a
					href="/admin/festival?curPage=${prevPage }" class="w3-button"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이징 번호 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="page">

				<c:if test="${paging.curPage eq page }">
					<li class="active"><a href="/admin/festival?curPage=${page }"
						class="w3-button">${page }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne page }">
					<li><a href="/admin/festival?curPage=${page }" class="w3-button">${page }</a>
					</li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지 -->
			<!-- 마지막 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
				<!-- 마지막 페이지일때 -->
				<li class="disabled"><a
					href="/admin/festival?curPage=${paging.totalPage }" class="w3-button"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<!-- 마지막 페이지가아닐때 -->

				<fmt:parseNumber var="n" integerOnly="true"
					value="${(paging.curPage/paging.pageCount)}" />
				<fmt:parseNumber var="nextPage" integerOnly="true"
					value="${(p+1)*paging.pageCount+1 }" />

				<li><a href="/admin/festival?curPage=${nextPage }"
					class="w3-button" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	    </nav>
        </div><!-- 축제 리스트 페이징 처리 끝 --><br><br><br><br>
     </div> <!-- Container 끝 -->
   </div> <!-- Wapper 끝 -->    

      <footer class="sticky-footer">
            <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © 2018 by Life Is Trip</span>
          </div>
        </div>
    </footer>



	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin.min.js"></script>



</body>
</html>