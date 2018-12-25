<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/cs/common.jsp" />


<body>

<!-- board에 해당하는 멤버번호들의 리스트가 출력된다. -->
<input type="hidden" value="${boardlist.mem_no }" name="mem_no" />
<div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;">
 

	<div class="content">

		<div class="sub_title">
				<b>Life Is Trip은 고객님의 목소리를 소중히 여깁니다.<br>
				문의하신 내용은 확인 즉시, 빠르게 답변 드리도록 하겠습니다.</b> 
		</div>


		<!-- 관리자가 아닌 사용자 입장에서 보여주기 -->
		<c:if test="${member.mem_case_no ne 0 }">
	
		<div class="sub_title1">
				<h2>문의 확인 하기</h2>
		</div>
	
		<div class="table_list">
		
			<table class="table2">
			
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
								답변 대기중 </td	>
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
	
		</c:if>

<!-- ========================================================================= -->	
	
		<!-- 관리자 입장  -->
		<c:if test="${member.mem_case_no eq 0 }">
		<div class="sub_title1">
				<h2>문의 답변 하기</h2>
		</div>
		
		<!-- Form태그 안에 boarD_no을 받아줘야한다 밖에 쓰면 적용이 안되니 주의할 것 -->
		<form action="/cs/view" method="post">
		<input type="hidden" value="${boardlist.board_no }" name="board_no" />
		<div class="table_list">
		
			<table class="table2">
			
				<tr>
					<th> 문의 제목</th>
					<td> ${boardlist.title }</td>
				</tr>
				
				<tr>
					<th> 작성자</th>
					<td> ${boardlist.mem_name }</td>
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
					<td colspan="2" style="height:150px;">
					<textarea name="contents" id="contents" style="line-height:150%; resize:none">${boardlist.cmt }</textarea>
					</td>
				</tr>
			
			</table>
		
		</div>
		
		<div class="btnList">
			<button type="submit" class="button1">답 변 하 기</button>
		</div>
		</form>
		</c:if>
	
	</div>
</div>
</body>

<script>

function button2_click()
{
	history.go(-1);
}

</script>
