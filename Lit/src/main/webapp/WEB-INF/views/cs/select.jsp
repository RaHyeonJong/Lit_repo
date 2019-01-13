<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<jsp:include page="/WEB-INF/views/cs/common.jsp" />

<body>
<div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;">

		<div class="content">
		
		<span style="font-size:1.3em; padding-top:100px"><b>
	
			로그인 후 문의하시면 상세한 답변이 제공되며,<br>
			답변 내용을 더 편리하게 확인하실 수 있습니다.
		</b></span>
			
		
		<br><br><br>	
		
			<c:if test="${not login }">
				<button class="button button1" id="modal" style="margin-right:50px;">문 의 하 기</button>
				<button class="button button2" id="modal1" style="margin-left:50px;">문 의 내 역</button>
			</c:if>
		
			<c:if test="${login }">
				<button class="button button1" onclick="button1_click();" style="margin-right:50px;">문 의 하 기</button	>
				<button class="button button2" onclick="button2_click();" style="margin-left:50px;">문 의 내 역</button>	
			</c:if>
	</div>

</div>
</body>

<script>
	//비로그인 버튼 누르면 벌어지는 일
	
	//header의 <div id="modal-login">을 불러온다
	var modal = document.getElementById("modal-login");
	
	//현재 /cs/select에 <button id="modal_login">
	var btn = document.getElementById("modal");
	var btn1 = document.getElementById("modal1");
	
	btn.onclick=function()
	{
		modal.style.display="block";
	}
	
	btn1.onclick=function()
	{
		modal.style.display="block";
	}
	//로그인 후 버튼 누르면 벌어지는 일
	function button1_click()
	{
		window.location.href="/cs/enroll";	
	}

	function button2_click()
	{
		window.location.href="/cs/list?mem_no=${member.mem_no}";
	}
	
</script>
