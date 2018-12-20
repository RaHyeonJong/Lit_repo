<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/cs/common.jsp" />


<body>


<input type="hidden" value="${boardlist.mem_no }" name="mem_no" />
<div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;">
	<div class="content">


		<div class="sub_title">
				<b>Life Is Trip은 고객님의 목소리를 소중히 여깁니다.<br>
				문의하신 내용은 확인 즉시, 빠르게 답변 드리도록 하겠습니다.</b> 
		</div>
	
		<div class="sub_title1">
				<h2>문의 확인하기</h2>
		</div>
	
		<div class="table_list">
		
			<table style="width:100%; border:1px solid #000000; text-align:left;">
			
				<tr>
					<th> 문의 제목</th>
					<td> ${boardlist.title }</td>
				</tr>
				
				
				<tr>
					<th> 작성자</th>
					<td> ${member.mem_name }</td>
				</tr>	
				
				<tr>
					<th colspan="2"> 문의 내용</th>
					
				</tr>	
				
				<tr>
					<td colspan="2"  style="height:150px;">
					${boardlist.contents }
					</td>
				</tr>
				
				
				<tr>
					<th colspan="2"> 문의 답변</th>
				</tr>		
				
				<tr>
					<c:choose>
						<c:when test="${boardlist.cmt eq NULL}">
						
							<td colspan="2" style="height:150px; color:red; font-weight:bold">
								답변 대기중 </td>
						</c:when>
						<c:when test="${boardlist.cmt ne NULL }">
							
							<td colspan="2" style="height:150px; font-weight:bold">
								${boardlist.cmt }
							</td>
						</c:when>
					
					</c:choose>
					
				</tr>
			
			</table>
		
		</div>
	
		<div class="btnList">
			<button class="button2" onclick="button2_click()">뒤 로 가 기</button>
		</div>
	
	
	</div>
</div>
</body>

<script>

function button2_click()
{
	history.go(-1);
}

</script>
