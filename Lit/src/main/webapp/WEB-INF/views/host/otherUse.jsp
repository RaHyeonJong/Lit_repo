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
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#backButton").click(function(){
			
			location.href="/host/firstConveniences";
			
		});
		$("#nextButton").click(function(){
			
			$("#other").submit();
//			location.href="/host/manageLodge";
			
		});
		
		
	});

</script>
<style type="text/css">

#wrapper{
max-width:1200px;
margin:0 auto;
}

.left { width: 50%; float: left; }
.right {.width: 50%; float: right; height:500px; }

</style>
</head>
<body>

<div id="wrapper">
	<div class="left" style="border:1px solid red;">
		<div>
			<h4>기타 사용 가능 시설을 선택해주세요</h4>
		</div>
		<div>
		<form id = "other" action="/host/otherUse" method="post">
			<input type="checkbox" /><label>수영장</label><br>
			<input type="checkbox" /><label>주방</label><br>
			<input type="checkbox" /><label>세탁실</label><br>
			<input type="checkbox" /><label>주차</label><br>
			<input type="checkbox" /><label>엘리베이터</label><br>
			<input type="checkbox" /><label>욕조</label><br>
			<input type="checkbox" /><label>헬스장</label>
		</form>
		</div>
		<div>
			<button id="backButton">뒤로</button>
			<button id="nextButton">다음</button>
		</div>	
	
	</div>
	<div class="right" style="border:1px solid blue;">
	</div>



</div>

</body>
</html>

















