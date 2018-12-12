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
				<h2>문의내용 작성하기</h2>
		</div>
		
		
		<div class="table_list">
		
			<table style="width:100%; border:1px solid black; text-align:left;">
				<tr>
					<th>문의 제목 </th>
					<td> <input type="text" placeholder="문의 제목을 입력해주세요"
						style="font-size:20px; width:700px; height:40px; margin-left:10px;"> </td>
				</tr>
				
				<tr>
					<th>작성자 </th>
					<td><p style="margin-left:10px;">작성자 이름</p></td>
				</tr>
				
				<tr>
					<th>사진 첨부 </th>
					<td> <input type="text" style="width:600px; height:40px; margin-left:10px;"> 
					<button class="button3">찾아보기</button></td>
				</tr>
				
				<tr>
					<th colspan="2">문의 내용 </th>
					
				</tr>
				
				<tr>
					<td colspan="2"> 
					<textarea id="text_area" maxlength="300"></textarea>
				
					</td>	
				</tr>
				
			
			</table>
			
			<div class="btnList">
				<button class="button1" onclick="button1_click();" style="margin-right:30px" >문의 하기</button>
				<button class="button2" onclick="button2_click();">취 소</button>
			</div>
		</div>
	
	
	
	</div>
</div>
</body>


<script>
	
	function button1_click()
	{
		if(confirm("문의내용을 작성하시겠습니까!?"))
		{
			alert("리스트로 이동합니다.");
			window.location.href='/cs/list';
		}else
		{
			alert("다시 입력해주세요.");
			
		}
		
	}
	
	function button2_click()
	{
		alert("이전 페이지로 이동합니다.");
		history.go(-1);
	}

</script>
