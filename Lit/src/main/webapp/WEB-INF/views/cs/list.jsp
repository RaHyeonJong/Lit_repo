<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<<<<<<< HEAD
			<table>
=======
			<table style="width:100%; border:1px solid black; text-align:center; ">
			
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
				<tr>
					<th>번 호</th>
					<th>제 목 </th>
					<th>날 짜 </th>
					<th>상 태 </th>
				</tr>
				
				<tr>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
				</tr>
				
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
