<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<h3 style="color:#565;">결제내역 보기</h3>

<table id="my-lodge-table" style="border-collapse:collapse; width:100%; ">
<tr style="height:50px; background-color:#333; color:white;">
<td style="width:5%; text-align:center; padding:0 10px 0 10px; white-space:nowrap;">결제번호</td>
<td style="width:15%; text-align:center;">숙박정보</td>
<td style="width:20%; text-align:center;">결제금액</td>
<td style="width:12%; text-align:center;">결제일</td>
<td style="width:12%; text-align:center;">결제상태</td>
</tr>

<c:forEach items="${payList }" var="pay">
<tr class="my-pay-tr" data-lodgeNo="${pay.pay_no }" style="height:50px; cursor:pointer;" >
<td style="text-align:center; width:50px;">${pay.lodge_no }</td>
<td style="text-align:center; padding:0 10px 0 10px; width:150px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${pay.pay_no }</td>
<td style="text-align:left; padding:0 10px 0 10px; width:200px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${pay.pay_no }</td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">${pay.pay_no }개월</td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">${pay.pay_no }</td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">원</td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;"></td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">
<button class="view-pay-btn" data-lodgeNo="${pay.pay_no }" style="width:100px; height:38px; border:none; border-radius:3px; background-color:#FF5A5F; color:white;">결제내역 보기</button></td>
</tr>
<tr><td colspan="8" style="padding:0;"><hr style="border:1px solid #ccc; background-color:#ccc; margin:0; padding:0;"></td></tr>
</c:forEach>

<tr><td colspan="8" style="padding-top:30px;">
<!-- // 페이징처리 -->
<table id="paging-table" style="margin:0 auto; border-collapse:collapse; border: 1px solid #bbb; border-radius:3px;"><tr>
  
  	<!-- 이전 페이지 -->
  	<!-- 첫 페이지라면 금지 표시 -->
  	<c:if test="${paging.startPage eq 1 }"><!-- 첫페이지일때 -->
  	<td class="page-to-move-td" data-curPage="1">&laquo;</td>
  	</c:if>
  	<c:if test="${paging.startPage ne 1 }"><!-- 첫페이지가아닐때 -->
	<fmt:parseNumber var="prevPage" integerOnly="true" value="${paging.startPage - 10 }"/>
  	<td class="page-to-move-td" data-curPage=prevPage>&laquo;</td>
    </c:if>
    
    

    <!-- 페이징 번호 -->
    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
    	<c:if test="${paging.curPage eq page }">
	   	<td style="background-color:#008489; color:white;">${page }</td>
	   	</c:if>
	
	   	<c:if test="${paging.curPage ne page }">
	   	<td class="page-to-move-td" style="background-color:white; color:#0275D8;" data-curPage="${page }">${page }</td>
	   	</c:if>
    </c:forEach>
    
    

    <!-- 다음 페이지 -->
  	<!-- 마지막 페이지라면 금지 표시 -->
  	<c:if test="${paging.endPage eq paging.totalPage }"><!-- 마지막 페이지일때 -->
  	<td class="page-to-move-td" data-curPage="${paging.totalPage }">&raquo;</td>
  	</c:if>
  	<c:if test="${paging.endPage < paging.totalPage }"><!-- 마지막 페이지가아닐때 -->
  	<fmt:parseNumber var="nextPage" integerOnly="true" value="${paging.endPage + 1 }"/>
  	<td class="page-to-move-td" data-curPage=nextPage>&raquo;</td>
    </c:if>
    
</tr></table>
<!-- 페이징처리 // -->
</td></tr>

</table>