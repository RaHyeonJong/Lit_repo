<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
#paging-table a {
	text-decoration: none;
}
#paging-table td {
	width:36px;
	height:36px;
	border:1px solid #bbb;
	text-align:center;
}
#paging-table td:hover {
	cursor:pointer;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$('.page-to-move-td').click(function(e){
		var curPage = $(e.target).attr("data-curPage");
		
		$.ajax({
			type: "GET",
			url: "/mypage/viewMypayments",
			data: {"curPage": curPage}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
	$('.delete-pay-btn').click(function(e){
		var pay_no = $(e.target).attr("data-payNo");
		var curPage = ${paging.curPage };
				
		$.ajax({
			type: "POST",
			url: "/mypage/deleteMypays",
			data: {"pay_no": pay_no, "curPage": curPage}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});

});
</script>

<div id="contents-div">
<h3 style="color:#565;">결제내역 보기</h3>

<div style="width:75%;">
<table id="my-pay-table" style="border-collapse:collapse; font-size:14px;">
<tr style="height:50px; background-color:#333; color:white;">
<td style="width:140px; text-align:center; padding:0 10px 0 10px; white-space:nowrap;">결제일 (결제번호)</td>
<td style="width:280px; text-align:center;">숙소</td>
<td style="width:280px; text-align:center;">숙박정보</td>
<td style="width:80px; text-align:center;">결제상태</td>
</tr>

<c:forEach items="${payList }" var="pay">
<tr>
<td style="border-right:1px solid #ddd; border-bottom:1px solid #ddd;"><div style="width:140px; text-align:center; padding:10px; font-size:14px;"><fmt:formatDate value="${pay.pay_time }" pattern="yyyy-MM-dd"/> <span style="color:#666;">(${pay.pay_no })</span></div></td>
<td  rowspan="2" style="padding:5px;">
<table onclick="location.href='/lodge/view?lodge_no=${pay.lodge_no }'" style="width:100%; cursor:pointer;"><tr>
<td style="width:50px;"><img src="/resources/images/${pay.stored_name }" width=50px; height=50px;/></td>
<td><div style="width:180px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; text-align:left;">${pay.lodge_name }</div></td>
</tr></table>
</td>
<td  rowspan="2">
<div style="width:280px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;text-align:left; padding:5px;">
<fmt:formatDate value="${pay.stay_start }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${pay.stay_end }" pattern="yyyy-MM-dd"/> ( ${pay.stay_term-1 }박 ${pay.stay_term }일 )<br>
숙박인원 : ${pay.stay_heads }명</div></td>
<td rowspan="2" style="text-align:center; padding:10px;"><div style="width:80px;">${pay.pay_state }</div></td>
</tr>
<tr><td rowspan="2" style="padding:10px; line-height:24px; border-right:1px solid #ddd;">결제금액: <span style="font-weight:bold;"><fmt:formatNumber value="${pay.pay_sum }"/></span>원<br>
<a style="text-decoration:underline; cursor:pointer; color:blue;">주문상세보기</a></td></tr>
<tr><td colspan="3" style="padding:10px; border-top:1px solid #ddd;">호스트에게 문의하기&nbsp;&nbsp;&nbsp;<button>결제취소 요청</button></td></tr>
<tr><td colspan="4" style="padding:0;"><hr style="border:1px solid #ccc; margin:0; padding:0;"></td></tr>

</c:forEach>

<tr><td colspan="4" style="padding-top:30px;">
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
	   	<td style="background-color:#0275D8; color:white;">${page }</td>
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
</div>
</div>


