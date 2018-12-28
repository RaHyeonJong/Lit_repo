<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

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
		background-color:#333;
		color:white;
	}
	
	.table-list td
	{
		text-align:center;
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
				<th>번 호(보)</th>
				<th>내 용</th>
				<th>받는 이</th>
				<th>보낸 이</th>
				<th>시 간</th>
				<th>상 태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sendlist }" var="s">
		
			<tr>
				<td>${s.message_no }</td>
				<td>${s.contents }</td>
				<td><span style="font-weight: bold">${s.receiver }</span></td>
				<td>${s.sender }</td>
				<td>${s.send_time }</td>
				<td>${s.read }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
</div>