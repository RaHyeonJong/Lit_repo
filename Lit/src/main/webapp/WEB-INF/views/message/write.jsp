<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		background-color:white;
		background-color:#ededed;	 
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

<button id="myBtn">쪽지 쓰기</button>

<!-- 모달창 틀 만들기-->
<div id="myModal" class="modal">

	<form action="/message/write" method="post">
	<div class="modal-content">
		<span id="close" class="close">&times;</span>
		<h1>Message</h1>
		<hr>
		<p>보낸 사람 : (로그인 한 사람) </p>
		<p>받는 사람 : (보낼 사람)</p>
		<p><textarea class="contents" name="contents"></textarea></p>
		<p style="text-align:right;"><button type="submit" class="sendBtn">쪽지 보내기</button>	
	</div>
	</form>
</div>
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

