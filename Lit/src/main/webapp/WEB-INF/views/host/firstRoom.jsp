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
		location.href="/host/hostFirst";
	});
	
	$("#nextButton").click(function(){
		location.href="/host/firstLocation";
		
	});
	
	
	
});
	
</script>
<style type="text/css">

#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;
}

.category {
padding: 10px;

}
.category select{
width:190px;
height:40px;
font-size:13px;

}

.lodge-name > input {
width:185px;
height:30px;
font-size:13px;
}

.left { 
width: 50%; 
float: left; 
border:1px solid red;
}
.right {
.width: 50%; 

float: right; 
border:1px solid blue;
}
.continue{
float:right;
}
.back{
float:left;
}

</style>
</head>
<body>

<div id="wrapper">
	<div class="left" >
		<div class="category">
			<h3>호스트의 숙소 정보를 입력해주세요</h3>
		</div>
		<div class="category">
			<h4>건물 유형을 선택해주세요</h4>
			<select>
				<option>건물유형</option>
				<option>아파트</option>
				<option>주택</option>
				<option>별채</option>
				<option>독특한 숙소</option>
				<option>부띠크 호텔</option>
			</select>
		</div>
		<div class="category">
			<h4>숙소 유형을 선택해주세요</h4>
			<select>
				<option>숙소유형</option>
				<option>집전체</option>
				<option>개인실</option>
				<option>다인실</option>
				<option>게스트하우스</option>
			</select>
		</div>
		<div class="lodge-name category" >
			<h4>숙소 이름을 입력해주세요</h4>
			<input type="text"/>
		
		</div>
		<div class="category">
			<h4>숙소의 방개수를 선택해주세요</h4>
			<select>
				<option>1개</option>
				<option>2개</option>
				<option>3개</option>
				<option>5개</option>
				<option>6개</option>
				<option>7개</option>
				<option>8개</option>
			</select>
		</div>
		<button id="backButton" class="back">뒤로</button>
		<button id="nextButton" class="continue">다음</button>
	</div>
	<div class="right" >
		<div>
			<h3>건물 유형과 숙소유형 숙소이름을 입력해야 다음 페이지로 넘어갑니다</h3>
		
		</div>
	</div>



</div>

</body>
</html>

















