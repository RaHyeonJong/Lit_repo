<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life Is Trip 인생은 여행이다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="shortcut icon" type="image/x-ion" href="/resources/images/url.ico" />
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

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
$("#btnAccess").click(function() {
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
		.attr("action", "/admin/checkLodgeActivation")
		.attr("method", "post")
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
<jsp:include page="layout/sidebar.jsp"/>

            <!--숙소관리 데이터 테이블 -->
          
            <div class="card mb-3" style="padding-left:40px; padding-top:40px;">
            <div class="card-header">
              <i class="fas fa-table"></i>&nbsp;&nbsp;숙소관리 데이터 테이블 
            </div>
            
            <br>
            <div class="w3-bar w3-black">
            
            <button class="w3-bar-item w3-button" onclick="location.href='/admin/lodge?lodge_activation=0'">승인대기 숙소</button>
            <button class="w3-bar-item w3-button" onclick="location.href='/admin/lodge?lodge_activation=1'">활성화 숙소</button>
            
            </div>
            
             <!-- 활성화 숙소 탭  -->
            <c:if test="${paging.lodge_activation == 1 }">   
            <div id="activation" class="w3-container lodge">
            <div class="card-body" style="padding-bottom:70px;">
              <div class="table-responsive" style="text-align:center;">
                <table class="table table-bordered" id="dataTable" style="width:100%; cellspacing:0; top:20%; margin-left:0%;" >  
                  <thead>
                    <tr>
                      <th>숙소 번호</th>
                      <th>건물 유형</th>
                      <th>숙소 유형</th>
                      <th>숙소 이름</th>
                      <th>수용 인원</th>
                      <th>숙소 주소</th>
                      <th>숙소 신고 수</th>
                      <th>상세보기</th>                          
                    </tr>
                  </thead>
                  
                  <tbody>
                    <c:forEach items="${adminLodgeList }" var="lodge">   
           
                   <tr>
                      <td>${lodge.lodge_no }</td>
                      <td><c:choose>
                           <c:when test="${lodge.lodge_case_no == 1}">아파트</c:when>
                           <c:when test="${lodge.lodge_case_no == 2}">연립주택</c:when>
                           <c:when test="${lodge.lodge_case_no == 3}">단독주택</c:when>
                          </c:choose> </td>
                      <td><c:choose>
                           <c:when test="${lodge.lodge_case_no == 1 }">펜션</c:when>
                           <c:when test="${lodge.lodge_case_no == 2 }">모텔</c:when>
                           <c:when test="${lodge.lodge_case_no == 3 }">게스트하우스</c:when>
                          </c:choose></td>
                      <td>${lodge.lodge_name }</td>
                      <td>${lodge.lodge_capacity }</td> 
                      <td style="width:500px;">${lodge.lodge_addr }</td> 
                      <!-- 신고 받은 숙소 -->
                      <td><c:choose>
                            <c:when test="${lodge.reportCnt == 0 }">
                             <span>${lodge.reportCnt }</span>
                            </c:when>
                            <c:when test="${lodge.reportCnt > 0 }">
                             <span style="color:red;">${lodge.reportCnt }</span>
                            </c:when>
                          </c:choose></td>
                      <td><a href="/lodge/view?lodge_no=${lodge.lodge_no }">상세보기</a></td>                    
                    </tr>
                
                    </c:forEach>
                  </tbody>                               
                </table>
              </div>
               <hr>
               
        <!-- 활성화 숙소 페이징 처리 -->
               
        <div class="pagination">
	    <nav>
		<ul class="pagination" style="padding-left: 300px;">

			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage < 11 }">
				<!-- 첫페이지일때 -->
				<li class="disabled"><a href="/admin/lodge"
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
					href="/admin/lodge?lodge_activation=1&&curPage=${prevPage }" class="w3-button"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이징 번호 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="page">

				<c:if test="${paging.curPage eq page }">
					<li class="active"><a href="/admin/lodge?lodge_activation=1&&curPage=${page }"
						class="w3-button">${page }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne page }">
					<li><a href="/admin/lodge?lodge_activation=1&&curPage=${page }" class="w3-button">${page }</a>
					</li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지 -->
			<!-- 마지막 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
				<!-- 마지막 페이지일때 -->
				<li class="disabled"><a
					href="/admin/lodge?lodge_activation=1&&curPage=${paging.totalPage }" class="w3-button"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<!-- 마지막 페이지가아닐때 -->

				<fmt:parseNumber var="n" integerOnly="true"
					value="${(paging.curPage/paging.pageCount)}" />
				<fmt:parseNumber var="nextPage" integerOnly="true"
					value="${(p+1)*paging.pageCount+1 }" />

				<li><a href="/admin/lodge?lodge_activation=1&&curPage=${nextPage }"
					class="w3-button" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	    </nav>
        </div> <!-- 활성화된 숙소 페이징 처리 끝 -->
                             
       </div>
      </div> 
     </c:if> <!-- 활성화된 숙소 탭 끝 -->   
           
           <!-- 비활성화 숙소 탭  -->
             
            <c:if test="${paging.lodge_activation == 0 }">        
            <div id="nonActivation" class="w3-container lodge" >
            <div class="card-body" style="padding-bottom:70px;">
              <div class="table-responsive" style="text-align:center;">
                <div style="text-align: right;">
                  <button id="btnAccess" name="btnAccess" class="btn btn-outline-primary">전체승인</button>
                 </div>&nbsp;
                <table class="table table-bordered" id="dataTable" style="width:100%; cellspacing:0;">  
                  <thead>
                    <tr>
                      <th><input type="checkbox" id="checkAll" onclick="checkAll();"></th>
                      <th>숙소 번호</th>
                      <th>건물 유형</th>
                      <th>숙소 유형</th>
                      <th>숙소 이름</th>
                      <th>수용 인원</th>
                      <th>방 개수</th>
                      <th>상세보기</th>              
                      <th>승인</th>              
                      </tr>
                  </thead>
                  
                  <tbody>
                    <c:forEach items="${adminLodgeList }" var="lodge">            
                    <tr>
                      <td><input type="checkbox" name="checkRow" value="${lodge.lodge_no }"></td>
                      <td>${lodge.lodge_no }</td>
                      <td><c:choose>
                           <c:when test="${lodge.lodge_case_no == 1}">아파트</c:when>
                           <c:when test="${lodge.lodge_case_no == 2}">연립주택</c:when>
                           <c:when test="${lodge.lodge_case_no == 3}">단독주택</c:when>
                          </c:choose> </td>
                      <td><c:choose>
                           <c:when test="${lodge.lodge_case_no == 1 }">펜션</c:when>
                           <c:when test="${lodge.lodge_case_no == 2 }">모텔</c:when>
                           <c:when test="${lodge.lodge_case_no == 3 }">게스트하우스</c:when>
                          </c:choose></td>
                      <td>${lodge.lodge_name }</td>
                      <td>${lodge.lodge_capacity }</td> 
                      <td>${lodge.lodge_room }</td>
                      <td><a href="/lodge/view?lodge_no=${lodge.lodge_no }">상세보기</a></td>
                      <td><button class="btn btn-primary" 
                                  onclick="location.href='/admin/lodgeActive?lodge_no=${lodge.lodge_no }'">승인</button></td>
                    </tr>
                    </c:forEach>
                  </tbody>
                 
                </table>
              </div>
              
        <!-- 비활성화 숙소 페이징 처리 -->
               
        <div class="pagination">
	    <nav>
		<ul class="pagination" style="padding-left: 300px;">

			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage < 11 }">
				<!-- 첫페이지일때 -->
				<li class="disabled"><a href="/admin/lodge"
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
					href="/admin/lodge?lodge_activation=0&&curPage=${prevPage }" class="w3-button"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이징 번호 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="page">

				<c:if test="${paging.curPage eq page }">
					<li class="active"><a href="/admin/lodge?lodge_activation=0&&curPage=${page }"
						class="w3-button">${page }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne page }">
					<li><a href="/admin/lodge?lodge_activation=0&&curPage=${page }" class="w3-button">${page }</a>
					</li>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지 -->
			<!-- 마지막 페이지라면 금지 표시 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
				<!-- 마지막 페이지일때 -->
				<li class="disabled"><a
					href="/admin/lodge?lodge_activation=0&&curPage=${paging.totalPage }" class="w3-button"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<!-- 마지막 페이지가아닐때 -->

				<fmt:parseNumber var="n" integerOnly="true"
					value="${(paging.curPage/paging.pageCount)}" />
				<fmt:parseNumber var="nextPage" integerOnly="true"
					value="${(p+1)*paging.pageCount+1 }" />

				<li><a href="/admin/lodge?lodge_activation=0&&curPage=${nextPage }"
					class="w3-button" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	    </nav>
        </div> <!-- 비활성화된 숙소 페이징 처리 끝 -->           
      </div>
     </div> 
    </c:if> <!-- 비활성화된 숙소 탭 끝 -->
           
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