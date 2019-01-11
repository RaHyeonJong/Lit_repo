<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 보낸 쪽지함 -->

<script>
$(document).ready(function(){

	//보낸 쪽지함에서 받음 쪽지함 버튼 누르면 Ajax가 발동된다.
	
	$('#receive').click(function(){
		
		$.ajax({
			type:"GET",
			url: "/message/receive",
			data: {},
			dataType: "html",
			success: function(res)
			{
				$('#contents-div').html(res);
			},
			error:function()
			{
				alert("에러났어요!");
			}	
		});
	});
	
	
	$('tr.sub_category').hide();
	$('tr.category').click(function(){
		
		$(this).next('tr.sub_category').toggle();
		
	});

	$('.page-to-move-td').click(function(e){
		var curPage = $(e.target).attr("data-curPage");
		
		$.ajax({
			type: "GET",
			url: "/message/send",
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

<style>

	.msg-box
	{
		padding:15px 0;
		display: inline-block;
		width:100%;
	}
	
	.btn-send
	{
		padding:4px 9px;
		color:red;
		border:1px solid #ccc;
		background-color: #fff;
		text-decoration:none;
		font-weight: 700;
		cursor:pointer;
		text-align:center;
		display:inline-block;
	}
	
	.btn-receive
	{
		padding:4px 9px;
		color:black;
		border:1px solid #ccc;
		background-color: #fff;
		text-decoration:none;
		font-weight: 700;
		cursor:pointer;
		text-align:center;
		display:inline-block;
	}

	.table-list
	{
		border:1px solid #ddd;
		width:90%;
		border-collapse:collapse; 
	}

	.table-list th,
	.table-list td
	{
		border-bottom: 1px solid #ddd;
		padding:10px;
	}
	
	.table-list th
	{
		background-color:#e20025;
		color:white;
	}
	
	.table-list td
	{
		text-align:center;
 		max-width: 100px;
    	overflow: hidden;
  		text-overflow: ellipsis;
   	 	white-space: nowrap;
	}

	.table-list tr:hover
	{
		background:#e0ecff;
	}

</style>

<!-- 보낸 쪽지함 -->
<div id="contents-div">
	<h1>쪽 지 함</h1>

	<div class="msg-box">
	
		<a href="#" class="btn-receive" id="receive">받은 쪽지함</a> 
		<a href="#" class="btn-send">보낸 쪽지함</a>

	</div>

	<input type="hidden" value="${member.mem_no }" name="mem_no" />
	<table class="table-list">
		<thead>
			<tr>
				<th>번 호</th>
				<th>내 용</th>
				<th>받는 이</th>
				<th>보낸 이</th>
				<th>시 간</th>
				<th>상 태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sendlist }" var="s">
		
			<tr class = "category">
				<td>${s.message_no }</td>
				<td>${s.contents }</td>
				<td><span style="font-weight: bold"><a href="/viewProfile?mem_no=${s.receiver_no}">${s.receiver }</a></span></td>
				<td>${s.sender }</td>
				<td>${s.send_time }</td>
				<c:choose>
				<c:when test="${s.read eq 0 }">
					<td class="td2" style="color:blue; font-weight:bold;">읽지 않음 </td>
				</c:when>
				<c:when test="${s.read ne 0 }">
					<td class="td2" style="color:red; font-weight:bold">읽음</td>
				</c:when>
				</c:choose>
			</tr>
			
			<tr class="sub_category">
					<td colspan="6">
				${s.contents }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 처리 -->
	<!-- 쪽지함 페이징 처리 -->
	<table id="paging-table" style="margin:0 auto; border-collapse:collapse; border: 1px solid #bbb; border-radius:3px;">
	<tr>
  
  	<!-- 이전 페이지 --><!-- 첫 페이지라면 금지 표시 -->
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
	   	<td style="background-color:#e20025; color:white;">${page }</td>
	   	</c:if>
	
	   	<c:if test="${paging.curPage ne page }">
	   	<td class="page-to-move-td" style="background-color:white; color:#333;" data-curPage="${page }">${page }</td>
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
    
	</tr>
	</table>

</div>