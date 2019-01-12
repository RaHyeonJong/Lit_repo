<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<style>
.my-pay-tr:hover {
	background-color: #eee;
}
</style>

<table style="width:810px; border-collapse:collapse;">

<tr style="height:50px; background-color:#333; color:white;">
<td style="width:5%; font-size:13px; text-align:center; padding:0 10px 0 10px; white-space:nowrap;">결제번호</td>
<td style="width:20%; font-size:13px; text-align:center; padding:0 10px 0 10px; white-space:nowrap;">숙소</td>
<td style="width:30%; font-size:13px; text-align:center;">숙박정보</td>
<td style="width:15%; font-size:13px; text-align:center;">결제금액</td>
<td style="width:20%; font-size:13px; text-align:center;">결제일</td>
<td style="width:10%; font-size:13px; text-align:center;">결제상태</td>
</tr>

<c:forEach items="${payList }" var="pay">
<tr class="my-pay-tr" data-lodgeNo="${pay.pay_no }" style="height:50px;" >
<td style="text-align:center; width:72px;">${pay.pay_no }</td>
<td style="text-align:center; padding:0 10px 0 10px; width:156px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${pay.lodge_name }</td>
<td style="text-align:left; padding:0 10px 0 10px; width:232px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
<fmt:formatDate value="${pay.stay_start }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${pay.stay_end }" pattern="yyyy-MM-dd"/><br>
숙박인원 : ${pay.stay_heads }명
</td>
<td style="text-align:center; padding:0 10px 0 10px; width:116px; white-space:nowrap;"><fmt:formatNumber value="${pay.pay_sum }" pattern="###,###"/>원</td>
<td style="text-align:center; padding:0 10px 0 10px; width:155.2px; white-space:nowrap;"><fmt:formatDate value="${pay.pay_time }" pattern="yyyy-MM-dd"/></td>

<c:if test="${pay.pay_state_no eq 1 }">
<td style="text-align:center; padding:0 10px 0 10px; width:78.4px; white-space:nowrap; font-size:13px; color:#03BD55;">${pay.pay_state }</td>
</c:if>
<c:if test="${pay.pay_state_no eq 2 }">
<td style="text-align:center; padding:0 10px 0 10px; width:78.4px; white-space:nowrap; font-size:13px; color:#FF8F0A;">${pay.pay_state }</td>
</c:if>
<c:if test="${pay.pay_state_no eq 3 }">
<td style="text-align:center; padding:0 10px 0 10px; width:78.4px; white-space:nowrap; font-size:13px; color:blue;">${pay.pay_state }</td>
</c:if>


</tr>
<tr><td colspan="6" style="padding:0;"><hr style="border:1px solid #ccc; background-color:#ccc; margin:0; padding:0;"></td></tr>
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