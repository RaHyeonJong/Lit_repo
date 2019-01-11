<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is Trip 인생은 여행이다</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(window).click(function(e){
		var element = $(e.target).parent('tr');
		var className = element.attr('class');
		
		if(className = 'my-lodge-tr'){
			var lodge_no = element.attr('data-lodgeNo');
			if(lodge_no != undefined)
				window.location.href='/lodge/view?lodge_no='+lodge_no;
		} 
	});
	$('.view-pay-btn').click(function(e){
		var lodge_no = $(e.target).attr('data-lodgeNo');
		
		$.ajax({
			type: "get",
			url: "/host/viewPayList",
			data: {"lodge_no": lodge_no},
			dataType: "html",
			success : function(res){
				$('#view-pay-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
				return;
			}
		});

	});

});
</script>
<style type="text/css">
.my-lodge-tr:hover {
	background-color: #eee;
}
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
</head>
<body>
<div id="wrapper">
<c:import url="/WEB-INF/views/layout/header.jsp"/><br>

<div style="width:80%; margin:0 auto;">
<table style="width:100%;">
<tr>
<td style="width:15%; vertical-align:top;">
<div id="view-lodge-btn" style="text-align:left; margin-top:30px; font-size:16px; color:#333; white-space:nowrap; cursor:pointer; font-weight: bold;">내 숙소 보기</div>
</td>
<!-- 내용 -->
<td style="width:80%; vertical-align:top;">

<div id="contents-div">
<h3 style="color:#565;">내 숙소 보기</h3>

<div style="width:80%;">
<table id="my-lodge-table" style="border-collapse:collapse; width:100%; ">
<tr style="height:50px; background-color:#333; color:white;">
<td style="width:5%; text-align:center; padding:0 10px 0 10px; white-space:nowrap;">번호</td>
<td style="width:15%; text-align:center;">숙소이름</td>
<td style="width:20%; text-align:center;">장소</td>
<td style="width:12%; text-align:center;">노출 기간</td>
<td style="width:12%; text-align:center;">체크인 시간</td>
<td style="width:12%; text-align:center;">숙박단가</td>
<td style="width:12%; text-align:center;">등록일</td>
<td style="width:12%; text-align:center;">예약/결제내역</td>
</tr>

<c:forEach items="${lodgeList }" var="lodge">
<tr class="my-lodge-tr" data-lodgeNo="${lodge.lodge_no }" style="height:50px; cursor:pointer;" >
<td style="text-align:center; width:50px;">${lodge.lodge_no }</td>
<td style="text-align:center; padding:0 10px 0 10px; width:150px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${lodge.lodge_name }</td>
<td style="text-align:left; padding:0 10px 0 10px; width:200px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${lodge.lodge_addr }</td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">${lodge.available_term }개월</td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">${lodge.check_in_time }</td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">
<fmt:formatNumber value="${lodge.stay_cost }" pattern="###,###"/>원</td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">
<fmt:formatDate value="${lodge.regit_date }" pattern="yyyy-MM-dd"/></td>
<td style="text-align:center; padding:0 10px 0 10px; width:120px; white-space:nowrap;">
<button class="view-pay-btn" data-lodgeNo="${lodge.lodge_no }" style="width:100px; height:38px; border:none; border-radius:3px; background-color:#FF5A5F; color:white;">결제내역 보기</button></td>
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
</div>

<div id="view-pay-div" style="width:80%; padding-top:50px;"></div>


</div>
</td>
</tr>
</table>
</div>

</div>
</body>
</html>