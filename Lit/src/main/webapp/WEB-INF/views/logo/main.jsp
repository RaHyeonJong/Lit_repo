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
<body>

<div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;"> 

	<div><!-- header 시작 -->
	<c:import url="../layout/header.jsp"/>
	</div><!-- header 끝 -->
	
	<h1>로고 페이지</h1>

	<form action="/main" method="POST">

		

		목적지<br> <input id="location-input" type="text" name="location" placeholder="Search Box"/><br> 
		<label  for="checkin_input"><small >체크인</small></label>
		<input type="text" name="checkin" placeholder="년/월/일" data-language="en" class="datepicker-here"/>
		
		<label  for="checkout_input"><small >체크아웃</small></label>
		<input type="text" name="checkout" placeholder="년/월/일" data-language="en" class="datepicker-here"/><br> 
		
		인원수<br>
		<select name="people" data-vars-select-name="people">
			<option selected="" value="1">성인 1명</option>
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
	
</div> <!-- wrapper end -->

<script>
function initAutocomplete() {
	var input = document.getElementById('location-input');
	var searchBox = new google.maps.places.SearchBox(input);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&libraries=places&callback=initAutocomplete"
         async defer></script>
</body>
</html>