<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life if Trip 인생은 여행이다</title>
</head>
<body style="margin:0;">

<div id="wrapper"> 
<div style="position:fixed; left:0; top:0; width:100%; height:100%; overflow:hidden;">
<img width=100% height="100%" src="/resources/images/logo_background.jpg"></div>

<div style="position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(255,255,255,0.2); ">
<div style="position:fixed; width:468px; height:428px; top:10%; left:5%; background-color:#fefefe; text-align: center;">
	
	<h2>Life is Trip에서 숙소를 찾아보세요.</h2>
	<div>혼자하는 여행에 적합한 개인실부터 여럿이 함께하는 여행에 좋은 집 전체 숙소까지, 라이프이즈트립에는 다 있습니다.</div>

	<form action="/main/searchMain" method="POST">

		<input type="text" id="cityLat" name="cityLat"/>
		<input type="text" id="cityLng" name="cityLng"/>

		목적지<br> <input id="location-input" type="text" name="location" placeholder="Search Box"/><br> 
		<label  for="checkin_input"><small >체크인</small></label>
		<input type="text" name="checkin" placeholder="년-월-일" data-language="en" class="datepicker-here" data-date-format="yyyy-mm-dd"/>
		
		<label  for="checkout_input"><small >체크아웃</small></label>
		<input type="text" name="checkout" placeholder="년-월-일" data-language="en" class="datepicker-here" data-date-format="yyyy-mm-dd"/><br> 
		
		인원수<br>
		<select name="people" data-vars-select-name="people">
			<option selected value="1">성인 1명</option>
			<option value="2">성인 2명</option>
			<option value="3">성인 3명</option>
			<option value="4">성인 4명</option>
			<option value="5">성인 5명</option>
			<option value="6">성인 6명</option>
			<option value="7">성인 7명</option>
			<option value="8">성인 8명</option>
			<option value="9">성인 9명</option>
			<option value="10">성인 10명</option>
			<option value="11">성인 11명</option>
			<option value="12">성인 12명</option>
			<option value="13">성인 13명</option>
			<option value="14">성인 14명</option>
			<option value="15">성인 15명</option>
			<option value="16">성인 16명</option>
		</select>
		<br>
		<button>검색</button>
	</form>
	
</div>
</div>
</div> <!-- wrapper end -->

<script>


////////// 자동완성기능 /////////
function initAutocomplete() {
	var input = document.getElementById('location-input');
	var searchBox = new google.maps.places.Autocomplete(input);
	
	 google.maps.event.addListener(searchBox, 'place_changed', function () {
	        var place = searchBox.getPlace();
	        
	        document.getElementById('cityLat').value = place.geometry.location.lat();
	        document.getElementById('cityLng').value = place.geometry.location.lng();
	    });
	
}

google.maps.event.addDomListener(window, 'load', initAutocomplete);
///////////////////////////////
</script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&libraries=places&callback=initAutocomplete"
         async defer></script>
</body>
</html>