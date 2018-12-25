<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/cs/common.jsp" />    

<body>

<div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;">
	<div class="content">

		<div class="sub_title">
				<b>Life Is Trip은 고객님의 목소리를 소중히 여깁니다.<br>
				문의하신 내용은 확인 즉시, 빠르게 답변 드리도록 하겠습니다.</b> 
		</div>

		
		<div class="sub_title1">
				<h2>사용자 문의내역</h2>
		</div>
		

		<div class="table_list">
			<table class="table1">
			<thead>
				<tr>
					<th scope="col">no</th>
					<th scope="col">제 목 </th>
					<th scope="col">날 짜 </th>
					<th scope="col">상 태 </th>
				</tr>
			</thead>
				
			<tbody>
				<c:forEach items="${boardlist }" var="b">
				<tr>
					<th scope="row">${b.board_no }</th>
					<td class="td1"><a href="/cs/view?board_no=${b.board_no }">${b.title }</a></td>
					<td class="td2">${b.written_time }</td>
					<c:choose>
						<c:when test="${b.answer > 0 }">
							<td class="td2" style="color:red; font-weight:bold;">답변 완료 </td>
						</c:when>
						<c:when test="${b.answer eq 0 }">
							<td class="td2" style="color:blue; font-weight:bold">답변 대기</td>
						</c:when>
					</c:choose>
				</tr>
				</c:forEach>		
			</tbody>
			</table>
		</div>
		
		<div class="btnList">
			<button class="button2" onclick="button2_click();">이 전 으 로</button>
		</div>
		
	</div>
</div>
</body>

<script>
	
	function button2_click()
	{
		alert("이전으로 이동합니다.");
		history.go(-1);
		
	}

</script>
