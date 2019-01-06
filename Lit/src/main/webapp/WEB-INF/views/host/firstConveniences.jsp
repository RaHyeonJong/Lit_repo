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

.left { 
width: 50%; 
float: left;
 }

.innerleft{
padding-left:30%;

}
.right {
width: 49%; 
float: right; 
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#backButton").click(function(){
		
		location.href="/host/firstLocation";
		
	});
	
	
	$("#nextButton").click(function(){
		
		$("form").submit();
		
	});
	

	
});
</script>
</head>
<body>

<div id="wrapper">
	<div class="left" style="border:1px solid red;">
		<div class="innerleft">
			<div><h4>숙소의 편의시설을 선택해주세요</h4></div>
				<form id ="conveniences" action="/host/firstConveniences" method="post">
				<div>
					<label><input  type="checkbox"/>필수품목</label><br>
					<label><input name="convenient_facility" value="#무선인터넷" type="checkbox"/>무선인터넷</label><br>
					<label><input name="convenient_facility" value="#샴푸" type="checkbox"/>샴푸</label><br>
					<label><input name="convenient_facility" value="#옷장/서랍장" type="checkbox"/>옷장/서랍장</label><br>
					<label><input name="convenient_facility" value="#TV" type="checkbox"/>TV</label><br>
					<label><input name="convenient_facility" value="#난방" type="checkbox"/>난방</label><br>
					<label><input name="convenient_facility" value="#에어컨" type="checkbox"/>에어컨</label><br>
					<label><input name="convenient_facility" value="#업무가능공간" type="checkbox"/>업무가능공간</label><br>
					<label><input name="convenient_facility" value="#벽난로" type="checkbox"/>벽난로</label><br>
					<label><input name="convenient_facility" value="#다리미" type="checkbox"/>다리미</label><br>
					<label><input name="convenient_facility" value="#헤어드라이어" type="checkbox"/>헤어드라이어</label><br>
					<label><input name="convenient_facility" value="#게스트 전용 출입문" type="checkbox"/>게스트 전용 출입문</label><br>
				</div>
				</form>
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
				<div class="move-button">
					<button id="backButton">뒤로</button>
					<button id="nextButton">다음</button>
				</div>	
			</div>
			
		</div><!-- inner end -->
	</div><!-- left end -->
	<div class="right" style="border:1px solid blue;">
	</div>



</div>

</body>
</html>

















