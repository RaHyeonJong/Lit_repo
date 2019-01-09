<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>


<!-- 사이드 바, 헤더 import -->
<jsp:include page="layout/header.jsp" />
       
<div id="wrapper">
<jsp:include page="layout/sidebar.jsp"/>

            <!--멤버관리 데이터 테이블 -->
          
            <div class="card mb-3" style="padding-left:40px; padding-top:40px;">
            <div class="card-header">
              <i class="fas fa-table"></i>&nbsp;&nbsp;멤버관리 데이터 테이블 
            </div>
            
            <br>
            <div class="w3-bar w3-black">
            
            <button class="w3-bar-item w3-button" onclick="location.href='/admin/member?mem_case_no=1'">일반유저</button>
            <button class="w3-bar-item w3-button" onclick="location.href='/admin/member?mem_case_no=2'">호스트</button>
            
            </div>
            
             <!-- 활성화 숙소 탭  -->
            <c:if test="${paging.mem_case_no == 1 }">   
            <div class="w3-container member">
            <div class="card-body" style="padding-bottom:70px;">
              <div class="table-responsive" style="text-align:center;">
                
                <table class="table table-bordered" id="dataTable" style="width:100%; cellspacing:0; top:20%">  
                  <thead>
                    <tr>
                      <th>회원 번호</th>
                      <th>회원 아이디</th>
                      <th>회원 이름</th>
                      <th>회원 전화번호</th>
                      <th>회원 생일</th>
                      <th>회원 신고 수</th>
                      <th>회원 상태</th>
                      <th>회원 상세보기</th>                       
                    </tr>
                  </thead>
                  
                 <tbody>
                    <c:forEach items="${memberList }" var="memberList">            
                    <tr>
                      <td>${memberList.mem_no }</td>
                      <td>${memberList.mem_id }</td>
                      <td>${memberList.mem_name }</td>
                      <td>${memberList.mem_phone }</td>
                      <td><fmt:formatDate value="${memberList.mem_birth }" pattern="yyyy-MM-dd"/></td> 
                      <!-- 신고 받은 사람과 아닌 사람 구분 -->
                      <td><c:choose>
                            <c:when test="${memberList.reportCnt == 0 }">
                             <span>${memberList.reportCnt }</span>
                            </c:when>
                            <c:when test="${memberList.reportCnt > 0 }">
                             <span style="color:red;">${memberList.reportCnt }</span>
                            </c:when>
                          </c:choose></td>
                       <!-- 멤버 활성 비활성 구분 -->
                      <td>
                          <c:choose>
                            <c:when test="${memberList.mem_activation == 1 }">
                             <span style="color:blue;">활성</span>
                            </c:when>
                            <c:when test="${memberList.mem_activation != 1 }">
                             <span style="color:light-gray;">비활성</span>
                            </c:when>
                          </c:choose>
                      </td>
                      <td><a href="/admin/memberView?mem_no=${memberList.mem_no }">상세보기</a></td>
                    </tr>
                    </c:forEach>
                  </tbody>       
                </table>               
              </div>
               <hr>
               
        <!-- 일반 유저 페이징 처리 -->
               
        <div class="w3-bar">
	    <nav>
		<ul class="pagination" style="padding-left: 265px;">

			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage < 11 }">
				<!-- 첫페이지일때 -->
				<li class="disabled"><a href="/admin/member"
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
					href="/admin/member?curPage=${prevPage }" class="w3-button"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이징 번호 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="page">

				<c:if test="${paging.curPage eq page }">
					<li class="active"><a href="/admin/member?curPage=${page }"
						class="w3-button">${page }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne page }">
					<li><a href="/admin/member?curPage=${page }" class="w3-button">${page }</a>
					</li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지 -->
			<!-- 마지막 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
				<!-- 마지막 페이지일때 -->
				<li class="disabled"><a
					href="/admin/member?curPage=${paging.totalPage }" class="w3-button"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<!-- 마지막 페이지가아닐때 -->

				<fmt:parseNumber var="n" integerOnly="true"
					value="${(paging.curPage/paging.pageCount)}" />
				<fmt:parseNumber var="nextPage" integerOnly="true"
					value="${(p+1)*paging.pageCount+1 }" />

				<li><a href="/admin/member?curPage=${nextPage }"
					class="w3-button" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	    </nav>
        </div> <!-- 일반 유저 페이징 처리 끝 -->
                             
       </div>
      </div> 
     </c:if> <!-- 일반 유저 탭 끝 -->   
           
            
            
            <!-- 호스트 탭  -->
             
            <c:if test="${paging.mem_case_no == 2 }">        
            <div id="nonActivation" class="w3-container member" >
            <div class="card-body" style="padding-bottom:70px;">
              <div class="table-responsive" style="text-align:center;">
                <table class="table table-bordered" id="dataTable" style="width:100%; cellspacing:0;">  
                  <thead>
                    <tr>
                      <th>회원 번호</th>
                      <th>회원 아이디</th>
                      <th>회원 이름</th>
                      <th>회원 전화번호</th>
                      <th>회원 생일</th>
                      <th>회원 신고 수</th>
                      <th>회원 상태</th>
                      <th>회원 상세보기</th>                 
                      </tr>
                  </thead>
                  
                  <tbody>
                    <c:forEach items="${memberList }" var="memberList">             
                    <tr>
                      <td>${memberList.mem_no }</td>
                      <td>${memberList.mem_id }</td>
                      <td>${memberList.mem_name }</td>
                      <td>${memberList.mem_phone }</td>
                      <td><fmt:formatDate value="${memberList.mem_birth }" pattern="yyyy-MM-dd"/></td> 
                      <!-- 신고 받은 사람과 아닌 사람 구분 -->
                      <td><c:choose>
                            <c:when test="${memberList.reportCnt == 0 }">
                             <span>${memberList.reportCnt }</span>
                            </c:when>
                            <c:when test="${memberList.reportCnt > 0 }">
                             <span style="color:red;">${memberList.reportCnt }</span>
                            </c:when>
                          </c:choose></td>
                       <!-- 멤버 활성 비활성 구분 -->
                      <td>
                          <c:choose>
                            <c:when test="${memberList.mem_activation == 1 }">
                             <span style="color:blue;">활성</span>
                            </c:when>
                            <c:when test="${memberList.mem_activation != 1 }">
                             <span style="color:light-gray;">비활성</span>
                            </c:when>
                          </c:choose>
                      </td>
                      <td class="select">  
                      <a class="button" href="/admin/memberView?mem_no=${memberList.mem_no }">상세보기</a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                 
                </table>    
              </div>
              <hr>
              
        <!-- 호스트 페이징 처리 -->
               
        <div class="w3-bar">
	    <nav>
		<ul class="pagination" style="padding-left: 265px;">

			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage < 11 }">
				<!-- 첫페이지일때 -->
				<li class="disabled"><a href="/admin/member"
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
					href="/admin/member?curPage=${prevPage }" class="w3-button"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이징 번호 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="page">

				<c:if test="${paging.curPage eq page }">
					<li class="active"><a href="/admin/member?curPage=${page }"
						class="w3-button">${page }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne page }">
					<li><a href="/admin/member?curPage=${page }" class="w3-button">${page }</a>
					</li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지 -->
			<!-- 마지막 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
				<!-- 마지막 페이지일때 -->
				<li class="disabled"><a
					href="/admin/member?curPage=${paging.totalPage }" class="w3-button"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<!-- 마지막 페이지가아닐때 -->

				<fmt:parseNumber var="n" integerOnly="true"
					value="${(paging.curPage/paging.pageCount)}" />
				<fmt:parseNumber var="nextPage" integerOnly="true"
					value="${(p+1)*paging.pageCount+1 }" />

				<li><a href="/admin/member?curPage=${nextPage }"
					class="w3-button" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	    </nav>
        </div> <!-- 호스트 페이징 처리 끝 -->           
      </div>
     </div> 
    </c:if> <!-- 호스트 탭 끝 -->
           
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