<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
.my-favor-tr:hover {
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
			url: "/mypage/viewMyFavorites",
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
	
	$('.delete-favor-btn').click(function(e){
		var favorite_no = $(e.target).attr("data-favorNo");
		var curPage = ${paging.curPage };
				
		$.ajax({
			type: "POST",
			url: "/mypage/deleteMyFavorites",
			data: {"favorite_no": favorite_no, "curPage": curPage}, 
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
<h3 style="color:#565;">내가 찜한 숙소 보기</h3>

<div style="width:75%;">
<table id="my-favor-table" style="border-collapse:collapse; ">
<tr style="height:50px; background-color:#333; color:white;">
<td style="width:85px; text-align:center; white-space:nowrap;">번호</td>
<td style="width:180px; text-align:center;">숙소이름</td>
<td style="width:380px; text-align:center;">숙소주소</td>
<td style="width:80px; text-align:center;">옵션</td>
</tr>

<c:forEach items="${favorList }" var="favor">
<tr class="my-favor-tr" style="height:50px; cursor:pointer;" >
<td  onclick="location.href='/lodge/view?lodge_no=${favor.lodge_no }'" ><div style="width:85px; text-align:center;">${favor.favorite_no }</div></td>
<td  onclick="location.href='/lodge/view?lodge_no=${favor.lodge_no }'"class="my-favor-td">
<div style="width:180px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;text-align:center; padding:0 10px 0 10px;">${favor.lodge_name }</div></td>
<td  onclick="location.href='/lodge/view?lodge_no=${favor.lodge_no }'"class="my-favor-td" >
<div style="width:380px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; text-align:left; padding:0 10px 0 10px;">${favor.lodge_addr }</div></td>
<td style="text-align:center; padding:0 10px 0 10px;">
<button class="delete-favor-btn" style="width:60px; height:30px; cursor:pointer; border:none; border-radius:3px; background-color:#FF5A5F; color:white; font-size:15px;" data-favorNo="${favor.favorite_no }">삭 제</button></td>
</tr>
<tr><td colspan="4" style="padding:0;"><hr style="border:1px solid #ccc; background-color:#ccc; margin:0; padding:0;"></td></tr>
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
</div>


