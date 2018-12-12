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
			<button class="button button1" style="margin-right:50px;">문 의 하 기</button>
			<button class="button button2" style="margin-left:50px;">문 의 내 역</button>
			
			
			</c:if>
		
			<c:if test="${login }">
			
			<button class="button button1" onclick="button1_click();" style="margin-right:50px;">문 의 하 기</button>
			<button class="button button2" onclick="button1_click();" style="margin-left:50px;">문 의 내 역</button>
			
			
			</c:if>
		
			

		</div>

</div>
</body>

<script>

	function button1_click()
	{
		
		window.location.href="/cs/enroll";
		
	}
	//		window.location.href="/cs/enroll";

	function button2_click()
	{
		
		alert("로그인 하세요.");
		
	}

</script>