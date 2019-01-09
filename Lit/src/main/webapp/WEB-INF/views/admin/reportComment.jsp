<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<script type="text/javascript">



//전체 체크/해제
function checkAll() {
	// checkbox들
	var $checkboxes=$("input:checkbox[name='checkRow']");

	// checkAll 체크상태 (true:전체선택, false:전체해제)
	var check_status = $("#checkAll").is(":checked");
	
	if( check_status ) {
		// 전체 체크박스를 checked로 바꾸기
		$checkboxes.each(function() {
			this.checked = true;	
		});
	} else {
		// 전체 체크박스를 checked 해제하기
		$checkboxes.each(function() {
			this.checked = false;	
		});
	}
	
	
}

$(document).ready(function() {
//선택체크된 숙소 승인
$("#commentDelete").click(function() {
	// 선택된 체크박스
	var $checkboxes = $("input:checkbox[name='checkRow']:checked");

	//방법1
	// 체크된 대상들을 하나씩 꺼내서 문자열로 합치기
			var names = "";
			var len = $checkboxes.length;
			$checkboxes.each( function(idx) {
				names += $(this).val();
		
				if( len-1 != idx ) {
					names += ",";
				}
		});
			console.log(names); 

	
	// 전송 폼
	var $form = $("<form>")
		.attr("action", "/admin/commentDelete")
		.attr("method", "get")
		.append(
			$("<input>")
				.attr("type", "hidden")
				.attr("name", "names")
				.attr("value", names)
		);
	$(document.body).append($form);
	$form.submit();

});

});


</script>

<body>


	<!-- 사이드 바, 헤더 import -->
	<jsp:include page="layout/header.jsp" />

	<div id="wrapper">
		<jsp:include page="layout/sidebar.jsp" />

		<!--신고관리 데이터 테이블 -->

		<div class="card mb-3" style="padding-left: 40px; padding-top: 40px;">
			<div class="card-header">
				<i class="fas fa-table"></i>&nbsp;&nbsp;신고관리 데이터 테이블
			</div>

			<br>
			<div class="w3-bar w3-black">

				<button class="w3-bar-item w3-button"
					onclick="location.href='/admin/reportMember'">멤버</button>
				<button class="w3-bar-item w3-button"
					onclick="location.href='/admin/reportLodge'">숙소</button>
				<button class="w3-bar-item w3-button"
					onclick="location.href='/admin/reportComment'">댓글</button>				

			</div>

			<!-- 신고 댓글 탭  -->
				<div class="w3-container reportCommentList">
					<div class="card-body" style="padding-bottom: 70px;">
						<div class="table-responsive" style="text-align: center;">

							<table class="table table-bordered" id="dataTable"
								    style="width: 100%; cellspacing: 0; top: 20%">
								<thead>
									<tr>
									    <th><input type="checkbox" id="checkAll" onclick="checkAll();"></th>
										<th>신고 번호</th>
										<th>신고멤버</th>
										<th>신고댓글</th>
										<th>신고댓글내용</th>
										<th>신고당한횟수</th>
										<th>삭제</th>										
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${reportCommentList }" var="reportComment">

										<tr>
										    <td><input type="checkbox" name="checkRow"></td>
											<td>${reportComment.report_no }</td>
											<td><a href="/admin/memberView?mem_no=${reportComment.reporter_no }">${reportComment.reporter_no}</a></td>
											<td>${reportComment.comment_no }</td>
											<td>${reportComment.reportedName }</td>
											<td><span style="color:red;">
											${reportComment.reportCnt }</span></td>
											<td><button class="btn btn-danger" id="commentDelete"
                                             onclick="location.href='/admin/commentDelete?comment_no=${reportComment.comment_no }'">댓글 내용 삭제</button></td>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<hr>

        <!-- 신고멤버 페이징 처리 -->
               
        <div class="pagination">
	    <nav>
		<ul class="pagination" style="padding-left: 300px;">

			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage < 11 }">
				<!-- 첫페이지일때 -->
				<li class="disabled"><a href="/admin/reportComment"
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
					href="/admin/reportComment?curPage=${prevPage }" class="w3-button"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이징 번호 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="page">

				<c:if test="${paging.curPage eq page }">
					<li class="active"><a href="/admin/reportComment?curPage=${page }"
						class="w3-button">${page }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne page }">
					<li><a href="/admin/reportComment?curPage=${page }" class="w3-button">${page }</a>
					</li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지 -->
			<!-- 마지막 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
				<!-- 마지막 페이지일때 -->
				<li class="disabled"><a
					href="/admin/reportComment?curPage=${paging.totalPage }" class="w3-button"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<!-- 마지막 페이지가아닐때 -->

				<fmt:parseNumber var="n" integerOnly="true"
					value="${(paging.curPage/paging.pageCount)}" />
				<fmt:parseNumber var="nextPage" integerOnly="true"
					value="${(p+1)*paging.pageCount+1 }" />

				<li><a href="/admin/reportComment?curPage=${nextPage }"
					class="w3-button" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	    </nav>
        </div> <!-- 페이징 처리 끝 -->    
		</div>
	   </div>


		</div> <!-- card mb-3 끝 -->
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