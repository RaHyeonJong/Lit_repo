<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">

#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;
}

.left { width: 50%; float: left; }
.right {.width: 50%; float: right; height:500px; }

</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#backButton").click(function(){
		
		location.href="/host/checkLocation";
		
	});
	
	$("#nextButton").click(function(){
		
		location.href="/host/otherUse";
	});
	

	
});
</script>
</head>
<body>

<div id="wrapper">
	<div class="left" style="border:1px solid red;">
		<div><h4>숙소의 편의시설을 선택해주세요</h4></div>
		<div>
			<input type="checkbox"/><label>필수품목</label><br>
			<input type="checkbox"/><label>무선인터넷</label><br>
			<input type="checkbox"/><label>샴푸</label><br>
			<input type="checkbox"/><label>옷장/서랍장</label><br>
			<input type="checkbox"/><label>TV</label><br>
			<input type="checkbox"/><label>난방</label><br>
			<input type="checkbox"/><label>에어컨</label><br>
			<input type="checkbox"/><label>업무가능공간</label><br>
			<input type="checkbox"/><label>벽난로</label><br>
			<input type="checkbox"/><label>다리미</label><br>
			<input type="checkbox"/><label>헤어드라이어</label><br>
			<input type="checkbox"/><label>게스트 전용 출입문</label><br>
		</div>
		<br>
		
		<div>
			<div>
				<h5>안전시설</h5>		
			</div>
			<div>
				<input type="checkbox"/><label>연기 감지기</label><br>
				<input type="checkbox"/><label>일산화탄소 감지기</label><br>
				<input type="checkbox"/><label>구급상자</label><br>
				<input type="checkbox"/><label>소화기</label><br>
				<input type="checkbox"/><label>침실문 잠금장치</label><br>
			</div>
			<div>
			
				<button id="backButton">뒤로</button>
				<button id="nextButton">다음</button>
			</div>	
		
		</div>
		
	
	
	</div>
	<div class="right" style="border:1px solid blue;">
	</div>



</div>

</body>
</html>

















