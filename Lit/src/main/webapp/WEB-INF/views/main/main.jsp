<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is trip 인생은 여행이다</title>

<style>
#map {
	height: 700px;
	width: 33%;
	float: right;
}
</style>

</head>
<body>



<div id="wrapper"> 

	<div><!-- header 시작 -->
	<c:import url="../layout/header.jsp"/>
	</div><!-- header 끝 -->
	
	
	<div style="text-align: center">
	<br>
	<h1>Main Page</h1>
	<h3>Life Is Trip 인생은 여행이다</h3>
	</div>
	
	
</div>
	<div id="map"></div>



</body>


	<script>
		function initMap() {
			var myLatlng = {
				lat : ${cityLat},
				lng : ${cityLng}
			};

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : myLatlng
			});

			var marker = new google.maps.Marker({
				position : myLatlng,
				map : map,
				title : 'Click to zoom'
			});

// 			map.addListener('center_changed', function() {
// 				// 3 seconds after the center of the map has changed, pan back to the
// 				// marker.
// 				window.setTimeout(function() {
// 					map.panTo(marker.getPosition());
// 				}, 3000);
// 			});

			marker.addListener('click', function() {
				map.setZoom(8);
				map.setCenter(marker.getPosition());
			});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&callback=initMap">
		
	</script>

</html>