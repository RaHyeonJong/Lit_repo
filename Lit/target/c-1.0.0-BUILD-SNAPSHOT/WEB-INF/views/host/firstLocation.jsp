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
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDVZshgMFwiPl0L4xp4unmDwNRwlSBI6U8&libraries=places&callback=initAutocomplete"
         async defer></script>
<script type="text/javascript">
function init() {
    var input = document.getElementById('locationTextField');
    var autocomplete = new google.maps.places.Autocomplete(input);
   
    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        var place = autocomplete.getPlace();
        document.getElementById('city2').value = place.name;
        document.getElementById('cityLat').value = place.geometry.location.lat();
        document.getElementById('cityLng').value = place.geometry.location.lng();
    });
}

google.maps.event.addDomListener(window, 'load', init);
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#backButton").click(function(){
		location.href="/host/firstRoom";
	});
	
	$("#nextButton").click(function(){
		location.href="/host/checkLocation";
		
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

.category select{
width:190px;
height:40px;
font-size:13px;

}

.category {
padding: 10px;

}

.input_location > input {
width:300px;
height:30px;	
font-size:13px;
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
	<div class="left" style="border:1px solid red;">
		<div class="category">
			<h2>숙소의 위치를 알려주세요</h2>
		</div>
		
		<div class="category">
			<h4>지역을 선택해주세요</h4>
			<select>
				<option>서울</option>
				<option>대전</option>
				<option>대구</option>
				<option>부산</option>
				<option>강원도</option>
				<option>경기도</option>
			</select>
		</div>
		<div class="category input_location">
			<h4>주소를 입력해주세요</h4>
        	<input id="locationTextField" type="text" placeholder="주소를 입력해주세요" autocomplete="on">
        	<input id="city2" name="city2" />
    		<input id="cityLat" name="cityLat" />
   			<input id="cityLng" name="cityLng" />
		</div>
		<div class="category">
			<h4>나머지 주소를 입력해주세요(선택사항)</h4>
			<input type="text"/>
		</div>
		<div class="category">
			<h4>우편번호</h4>
			<input/>
		</div>
		
		<button id="backButton" class="back">뒤로</button>
		<button id="nextButton" class="continue">다음</button>
	</div>
	<div class="right" style="border:1px solid blue;">
	</div>



</div>

</body>
</html>

















