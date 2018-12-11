<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/cs/common.jsp" />


<style>
.button {
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1
{
	background-color:#ff0300;
	color: white;
	border:2px solid #cc2e2c;

}

.button1:hover
{
	background-color:#f74c4a;
	color: white;
}

.button2
{
	background-color:#f29d00;
	color:white;
	border:2px solid #996404;
}

.button2:hover
{
	background-color:#ffb638;
	color: white;
}

</style>


<body>
<div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;">
	
	
		<div class="content">
		
		<span style="font-size:1.3em; padding-top:100px"><b>
	
			로그인 후 문의하시면 상세한 답변이 제공되며,<br>
			답변 내용을 더 편리하게 확인하실 수 있습니다.
		</b></span>
			
		
		<br><br><br>	
		<button class="button button1" onclick="location.href='/cs/enroll'" 
		style="margin-right:50px;">문 의 하 기</button>
		<button class="button button2" onclick="location.href='/cs/list'"
		style="margin-left:50px;">문 의 내 역</button>
		</div>

</div>
</body>
