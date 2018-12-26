<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
.my-comm-tr:hover {
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

<script type="text/javascript">
$(document).ready(function(){
	$('.page-to-move-td').click(function(e){
		var curPage = $(e.target).attr("data-curPage");
		
		$.ajax({
			type: "GET",
			url: "/mypage/viewMyContents",
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
	
});
</script>

<div id="contents-div">
<h3 style="color:#565;">내가 쓴 글 보기</h3>

<div style="width:75%;">
<table id="my-comm-table" style="border-collapse:collapse; ">
<tr style="height:50px; background-color:#333; color:white;">
<td style="width:8%; text-align:center; padding:0 10px 0 10px; white-space:nowrap;">번호</td>
<td style="width:24%; text-align:center;">숙소이름</td>
<td style="width:50%; text-align:center;">댓 글 내 용</td>
<td style="width:18%; text-align:center;">작성시간</td>
</tr>

<c:forEach items="${commList }" var="comm">
<tr class="my-comm-tr" style="height:50px; cursor:pointer;" onclick="location.href='/lodge/view?lodge_no=${comm.lodge_no}'">
<td style="text-align:center;"><div style="width:85px;">${comm.comment_no }</div></td>
<td style="text-align:center; padding:0 10px 0 10px;"><div style="width:180px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${comm.lodge_name }</div></td>
<td style="text-align:left; padding:0 10px 0 10px;"><div style="width:380px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${comm.contents }</div></td>
<td style="text-align:center; padding:0 10px 0 10px; white-space:nowrap;">
<fmt:formatDate value="${comm.written_time }" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
</tr>
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









