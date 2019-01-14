<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image/x-ion" href="/resources/images/url.ico" />
<script src="/resources/dist/js/datepicker.min.js"></script>
<!-- Include English language -->
<script src="/resources/dist/js/i18n/datepicker.en.js"></script>
<title>Life if Trip 인생은 여행이다</title>
</head>
<body style="margin:0;">

<div id="wrapper"> 
<div style="position:fixed; left:0; top:0; width:100%; height:100%; overflow:hidden;">
<img width=100% height="100%" src="/resources/images/logo_background.jpg"></div>

<div style="position:fixed; z-index:1; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(255,255,255,0.2); ">
<div style="position:fixed; width:428px; padding-bottom:20px; top:10%; left:5%; background-color:#fefefe; text-align: center; color:#555555;">
	
	<h2 style="margin-bottom:0; text-align:left; padding-left:30px;">Life is Trip에서 나에게 딱!</h2>
	<h2 style="margin-top:0; text-align:right; padding-right:30px;">맞는 숙소를 찾아보세요.</h2>
	<div style="padding:0 30px 0 30px; text-align:left;">
	<p style="margin:0;">혼자하는 여행에 적합한 개인실부터</p>
	<p style="margin:0; text-align:center;">여럿이 함께하는 여행에 좋은 집 전체 숙소까지</p>
	<p style="margin:0; text-align:right;">라이프이즈트립에는 다 있습니다.</p>
	</div>

	<form action="/main/searchMain" method="POST">

		<input type="hidden" id="cityLat" name="cityLat" value="1"/>
		<input type="hidden" id="cityLng" name="cityLng" value="1"/>

		<table style="width:100%;">
		<tr><td colspan="2" style="padding:20px 30px 5px 30px;"><h4 style="margin:0; text-align:left;">목적지</h4></td></tr>
		<tr><td colspan="2" style="padding:0 30px 0 30px; text-align:left;">
		<input id="location-input" type="text" name="location" placeholder="장소를 검색하세요." style="width:338px; padding:10px;"/></td></tr>
		<tr><td style="width:50%; padding:20px 0 0 30px; text-align:left;"><h4 style="margin:0; text-align:left;">체크인</h4></td>
		<td style="width:50%; padding:20px 30px 0 0; text-align:left;"><h4 style="margin:0; text-align:left;">체크아웃</h4></td></tr>
		<tr><td style="padding:5px 0 0 30px; text-align:left;"><input style="width:90%; padding:5px;" type="text" id="checkin" name="checkin" placeholder="년 - 월 - 일" data-language="en" class="datepicker-here" data-date-format="yyyy-mm-dd" autocomplete="off"/></td>
		<td style="padding:5px 30px 0 0; text-align:left;"><input style="width:90%; padding:5px;" type="text" id="checkout" name="checkout" placeholder="년 - 월 - 일" data-language="en" class="datepicker-here" data-date-format="yyyy-mm-dd" autocomplete="off"/></td></tr>
		<tr><td colspan="2" style="padding:20px 30px 5px 30px;"><h4 style="margin:0; text-align:left;">인원수</h4></td></tr>
		<tr><td colspan="2" style="padding:0 30px 0 30px; text-align:left;">
		<select name="peopleCnt" id="peopleCnt"data-vars-select-name="people" style="width:48%; padding:5px;">
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
		</td></tr>
		<tr><td colspan="2" style="padding:30px 30px 5px 30px;"><button style="border:none; width:368px; height:40px; background-color:#FF5A5F; color:white; font-size:20px;">검색</button></td></tr>
		</table>
		
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

// google.maps.event.addDomListener(window, 'load', initAutocomplete);
///////////////////////////////

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&libraries=places&v=3.exp&sensor=false&libraries=places&callback=initAutocomplete"
         async defer></script>
</body>
</html>