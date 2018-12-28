<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is Trip 인생은 여행이다</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#report-member-btn').click(function(){
		var reporter_no = '${member.mem_no}';
		var mem_no = '${other.mem_no }';
		
		$.ajax({
			type: "GET",
			url: "/reportMember",
			data: {"reporter_no": reporter_no, "mem_no": mem_no }, 
			dataType: "text",
			success : function(res){
				if(res == 1){
					alert("회원신고가 접수되었습니다.");
				} else {
					alert("이미 신고한 회원입니다.");
				}				
			},
			error : function(){
				alert("에러났어요!");
			}
		});
		
	});
});
</script>

<style>

.modal
	{
		display:none;
		position:fixed;
		z-index:1;
		left:0;
		top:0;
		width:100%;
		height:100%;
		overflow:auto;
		background-color:rgba(0,0,0,0.55);	 
	}

	.modal-content
	{
		background-color:#fefefe;
		margin:10% auto;
		padding:15px;
		border:5px solid #e0ecff;
		width:320px; 
	}
	
	.contents
	{
		width:320px;
		height:150px;
		resize:none;
	}
	
	.close
	{
		color:#aaa;
		float:right;
		font-size:28px;
		font-weight:bold;
	}

	.close:hover,
	.close:focus
	{
		color:skyblue;
		text-decoration:none;
		cursor:pointer;
	}
	
	.sendBtn
	{
		width:120px;
		height:30px;
	}


</style>

</head>
<body><div id="wrapper">
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div style="margin-top:20px; padding:2% 20% 0 20%;">
<table style="width:100%;">
<tr><td style="text-align:center;"><h1 style="display:inline;">${other.mem_name }</h1> <h2 style="display:inline;">님의 프로필입니다.</h2></td></tr>
<tr><td style="text-align:center; padding-top: 30px;">
<c:if test="${other.stored_name ne null }">
<img width="300px" height="300px" style="border:6px solid #999; border-radius:50%;" src="/resources/images/${other.stored_name }"/></c:if>
<c:if test="${other.stored_name eq null }">
<img width="300px" height="300px" style="border:6px solid #999; border-radius:50%;" src="/resources/images/empty_profile_photo.jpg"/></c:if>
</td></tr>
<tr><td style="text-align:right;">
<button id="myBtn" style="width:80px; height:40px; cursor:pointer; text-decoration:none; border:none; border-radius:3px; background-color:#FF5A5F; color:white;">쪽 지</button>&nbsp;
<button id="report-member-btn" style="width:80px; height:40px; cursor:pointer; text-decoration:none; border:1px solid #FF5A5F; border-radius:3px; background-color:white; color:#FF5A5F;">신고하기</button>
</td></tr>
<tr><td><div style="border:3px solid #999; border-radius: 5px; min-height:300px; padding:10px; color:#555; font-size:18px;">${other.mem_intro }</div></td></tr>
</table>
</div>
</div>

<div id="myModal" class="modal">
	<div class="modal-content">
		<span id="close" class="close">&times;</span>
		<h1>Message</h1>
		<hr>
		<p>보낸 사람 :  ${member.mem_name }</p>
		<p>받는 사람 :  ${other.mem_name}</p>
		<p><textarea class="contents" name="contents"></textarea></p>
		<p style="text-align:right;"><button type="submit" class="sendBtn">쪽지 보내기</button>	
	</div>
</div>


</body>

<script>

	var modal = document.getElementById("myModal");
	var btn = document.getElementById("myBtn");
	var span = document.getElementById("close");

	btn.onclick = function()
	{
		modal.style.display = "block";
		
	}

	span.onclick = function()
	{
		
		modal.style.display="none";
	}

	window.onclick = function(event)
	{
		if(event.target == modal)
		{
			
			modal.style.display = "none";	
		}
		
	}

</script>
</html>

