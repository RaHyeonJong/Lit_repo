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
	$("#move-calendar").click(function(){
		location.href="/host/manageLodge?lodge_no="+${lodge_no};
	
	});
	
	$("#addView_btn").click(function(){
		location.href="/host/addview?lodge_no=${lodge_no}";	
	});
		
	
});


</script>
<style type="text/css">
#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;

}

.left { width: 50%; float: left; }
.right {.width: 50%; float: right; height:500px; }
#nextbutton{
float:right;

}

</style>
</head>
<body>

<div id="wrapper">
	
	
	<div class="left" style="border: 1px solid red;">
	
	 	<label>나와랏 : ${lodge_no}</label>
		<div id="content1">
			<h2>호스트로 가는길</h2>
		</div>

		<div id="content2">
			
			<div class="content1">
				<h3>1단계</h3>
				<button>숙소상세정보등록</button>
			</div>
			<div class="content2">
			  	<h3>2단계</h3>
			  	<button id="move-calendar">예약가능날짜설정</button>
			</div>
			<div class="content3">
				<h3>3단계</h3>
				<button id = "addView_btn">숙소꾸미기 및 마무리</button>
			</div>
		</div>
		<button id="nextbutton">계속</button>
	</div>
	<div class="right" style="border: 1px solid blue;">
		<h3>이미지들어갈곳</h3>
	
	</div>
</div>








</body>
</html>