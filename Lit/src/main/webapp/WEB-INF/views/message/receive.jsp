<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 받은 쪽지함 -->
<script>
$(document).ready(function(){
	$('tr.sub_category').hide();
	
	//받은 쪽지함에서 보낸 쪽지함 버튼 누르면 Ajax가 발동된다.
	
	$('#send').click(function(){
		 
		$.ajax({
			type:"GET",
			url: "/message/send",
			data: {},
			dataType: "html",
			success: function(res)
			{	
				$("#contents-div").html(res);
			},
			error:function()
			{
				alert("에러  났어요!");
			}	
		});
	});
	
// 	페이징 누를 시 이벤트 발생 
	$('.page-to-move-td').click(function(e){
		var curPage = $(e.target).attr("data-curPage");
		
		$.ajax({
			type: "GET",
			url: "/message/receive",
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
<script>
	//td를 누르면 벌어지는 일

	$(".category").click(function(e){
		
		var msg_no = $(e.target).closest('tr').children('td').html();
		var read = $(e.target).closest('tr').children('td.read');
		var t = $(this);
	
		$.ajax({
	         type: "POST",
	         url: "/message/receive",
	         data: {"message_no": msg_no}, 
	         dataType: "json",
	         success : function(){
	        	read.html("읽음");
	        	read.css("color","red");
	        	t.next('tr.sub_category').toggle();		        	 
	     	},
	        error : function(){
	            alert("에러났어요!");
	         }
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
		color:black;
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
		color:blue;
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
	
	.table-list td
	{
		text-align:center;
		max-width: 80px;
		space: nowrap;
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

		<a href="#" class="btn-receive">받은 쪽지함</a> 
		<a href="#" class="btn-send" id="send">보낸 쪽지함</a>

	</div>

	<input type="hidden" value="${member.mem_no }" name="mem_no" />
	<input type="hidden" value="${message.receiver_no }" name="receiver_no" />
	<input type="hidden" value="${message.message_no }" name="message_no" />
	<!-- 테이블 -->
	<table class="table-list" id="table-list">
		<thead>
			<tr>
				<th style="	background-color:#0265e8; color:white;">번 호</th>
				<th style="	background-color:#0265e8; color:white;">내 용</th>
				<th style="	background-color:#0265e8; color:white;">받는 이</th>
				<th style="	background-color:#0265e8; color:white;">보낸 이</th>
				<th style="	background-color:#0265e8; color:white;">시 간</th>
				<th style="	background-color:#0265e8; color:white;">상 태</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${receivelist }" var="r">
			<tr class="category" id="category">
				<td id="message_no">${r.message_no }</td>
				<td id="contents">${r.contents }</td>
				<td id="receiver">${r.receiver }</td>
				<td id="sender"><span style="font-weight: bold"><a href="/viewProfile?mem_no=${r.sender_no}">${r.sender}</a></span></td>
				<td id="send_time">${r.send_time }</td>
				<c:choose>
				<c:when test="${r.read eq 0 }">
					<td id="read" class="read" style="color:blue; font-weight:bold;">읽지 않음 </td>
				</c:when>
				<c:when test="${r.read ne 0 }">
					<td id="read" class="read" style="color:red; font-weight:bold">읽음</td>
				</c:when>
				</c:choose>
				
			</tr>
			<tr class="sub_category" id="sub_category">
				<td id="sub_contents" colspan="6">
				<div>
					${r.contents }
				</div>
				</td>
			</tr>
		</c:forEach>
		
		<tr><td></td></tr>
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
    
	</tr>
	</table>
	
</div>