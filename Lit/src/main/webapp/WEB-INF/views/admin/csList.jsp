<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is trip 인생은 여행이다</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="shortcut icon" type="image/x-ion" href="/resources/images/url.ico" />
</head>

<body>


	<!-- 사이드 바, 헤더 import -->
	<jsp:include page="layout/header.jsp" />

	<div id="wrapper">
		<jsp:include page="layout/sidebar.jsp" />

		<!--고객센터 관리 데이터 테이블 -->

		<div class="card mb-3" style="padding-left: 40px; padding-top: 40px;">
			<div class="card-header">
				<i class="fas fa-table"></i>&nbsp;&nbsp;고객센터 관리 데이터 테이블
			</div>

			<br>
			<div class="w3-bar w3-black">

				<button class="w3-bar-item w3-button"
					onclick="location.href='/admin/csList?answer=0'">답변 대기</button>
				<button class="w3-bar-item w3-button"
					onclick="location.href='/admin/csList?answer=1'">답변 완료</button>

			</div>

			<!-- 답변 대기 중인 고객문의 탭  -->
			<c:if test="${paging.answer == 0 }">
				<div class="w3-container csList">
					<div class="card-body" style="padding-bottom: 70px;">
						<div class="table-responsive" style="text-align: center;">

							<table class="table table-bordered" id="dataTable"
								    style="width: 100%; cellspacing: 0; top: 20%">
								<thead>
									<tr>
										<th>게시글 번호</th>
										<th>제목</th>
										<th>고객 이름</th>
										<th>글쓴 시간</th>
										<th>상세보기</th>
										<th>답변 상태</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${csList }" var="cs">

										<tr>
											<td>${cs.board_no }</td>
											<td>${cs.title }</td>
											<td>${cs.mem_name }</td>
											<td>${cs.written_time }</td>
											<td><a href="/cs/view?board_no=${cs.board_no }">상세보기</a></td>
											<td><span style="color:red;">답변 대기</span></td>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<hr>

        <!-- 답변 대기 고객센터  숙소 페이징 처리 -->
               
        <div class="w3-bar">
	    <nav>
		<ul class="pagination" style="padding-left: 30%;">

			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage < 11 }">
				<!-- 첫페이지일때 -->
				<li class="disabled"><a href="/admin/csList"
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
					href="/admin/csList?curPage=${prevPage }" class="w3-button"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이징 번호 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="page">

				<c:if test="${paging.curPage eq page }">
					<li class="active"><a href="/admin/csList?curPage=${page }"
						class="w3-button">${page }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne page }">
					<li><a href="/admin/csList?curPage=${page }" class="w3-button">${page }</a>
					</li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지 -->
			<!-- 마지막 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
				<!-- 마지막 페이지일때 -->
				<li class="disabled"><a
					href="/admin/csList?curPage=${paging.totalPage }" class="w3-button"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<!-- 마지막 페이지가아닐때 -->

				<fmt:parseNumber var="n" integerOnly="true"
					value="${(paging.curPage/paging.pageCount)}" />
				<fmt:parseNumber var="nextPage" integerOnly="true"
					value="${(p+1)*paging.pageCount+1 }" />

				<li><a href="/admin/csList?curPage=${nextPage }"
					class="w3-button" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	    </nav>
        </div> <!-- 답변 대기 고객문의 페이징 처리 끝 -->      
		</div>
	   </div>
	  </c:if>


			<!-- 답변 대기 중인 고객문의 탭  -->
			<c:if test="${paging.answer == 1 }">
				<div class="w3-container csList">
					<div class="card-body" style="padding-bottom: 70px;">
						<div class="table-responsive" style="text-align: center;">

							<table class="table table-bordered" id="dataTable"
								    style="width: 100%; cellspacing: 0; top: 20%">
								<thead>
									<tr>
										<th>게시글 번호</th>
										<th>제목</th>
										<th>고객 이름</th>
										<th>글쓴 시간</th>
										<th>상세보기</th>
										<th>답변 상태</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${csList }" var="cs">

										<tr>
											<td>${cs.board_no }</td>
											<td>${cs.title }</td>
											<td>${cs.mem_name }</td>
											<td>${cs.written_time }</td>
											<td><a href="/cs/view?board_no=${cs.board_no }">상세보기</a></td>
											<td><span style="color:blue;">답변 완료</span></td>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<hr>

        <!-- 답변 대기 고객센터  숙소 페이징 처리 -->
               
        <div class="w3-bar">
	    <nav>
		<ul class="pagination" style="padding-left: 40%;">

			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage < 11 }">
				<!-- 첫페이지일때 -->
				<li class="disabled"><a href="/admin/csList"
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
					href="/admin/csList?curPage=${prevPage }" class="w3-button"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이징 번호 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="page">

				<c:if test="${paging.curPage eq page }">
					<li class="active"><a href="/admin/csList?curPage=${page }"
						class="w3-button">${page }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne page }">
					<li><a href="/admin/csList?curPage=${page }" class="w3-button">${page }</a>
					</li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지 -->
			<!-- 마지막 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
				<!-- 마지막 페이지일때 -->
				<li class="disabled"><a
					href="/admin/csList?curPage=${paging.totalPage }" class="w3-button"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<!-- 마지막 페이지가아닐때 -->

				<fmt:parseNumber var="n" integerOnly="true"
					value="${(paging.curPage/paging.pageCount)}" />
				<fmt:parseNumber var="nextPage" integerOnly="true"
					value="${(p+1)*paging.pageCount+1 }" />

				<li><a href="/admin/csList?curPage=${nextPage }"
					class="w3-button" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	    </nav>
        </div> <!-- 답변 대기 고객문의 페이징 처리 끝 -->    
		</div>
	   </div>
	  </c:if> <!-- 답변 완료한 고객센터 목록 -->


		</div>
		<!-- card mb-3 끝 -->
	</div>
	<!-- Wapper 끝 -->


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