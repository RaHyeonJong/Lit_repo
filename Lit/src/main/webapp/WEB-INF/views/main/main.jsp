<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is trip 인생은 여행이다</title>

<style>
#map {
	position: absolute;
	top: 145px;
	height: 776px;
	width: 50%;
	right: 0px;
/* 	float: right; */
}

#search_filter {
	border-bottom: 1px solid #EBEBEB;
	width: 100%;
	margin-top: 24px;
	padding: 16px 72px !important;
}

#search_filter button {
	font-size: 14px !important;
	line-height: 18px !important;
	letter-spacing: normal !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	text-transform: undefined !important;
	color: #484848 !important;
	padding-top: 6px !important;
	padding-bottom: 6px !important;
	background: none !important;
	border: 1px solid #dce0e0 !important;
	border-radius: 4px !important;
	cursor: pointer !important;
	display: inline-block !important;
	padding-left: 12px !important;
	padding-right: 12px !important;
	position: relative !important;
	text-align: center !important;
	text-decoration: none !important;
	width: auto !important;
}
</style>

</head>
<body>




<div id="wrapper"> 

		<div>
			<!-- header 시작 -->
			<c:import url="../layout/header.jsp" />
		</div>
		<!-- header 끝 -->

		<div id="search_filter">
			<button>날짜</button>
			<button>인원</button>
			<button>숙소 종류</button>
			<button>가격</button>
		</div>

		<h1>main page</h1>
		
		<div id="lodgeList"></div>
	
	
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
				
//	 			map.addListener('center_changed', function() {
//	 				// 3 seconds after the center of the map has changed, pan back to the
//	 				// marker.
//	 				window.setTimeout(function() {
//	 					map.panTo(marker.getPosition());
//	 				}, 3000);
//	 			});


				map.addListener('bounds_changed', function() {
					
					var bounds = map.getBounds();
					var ne = bounds.getNorthEast();
					var sw = bounds.getSouthWest();
					
	 				console.log('bounds_changed');
					console.log(ne.lat());
					console.log(ne.lng());
					console.log(sw.lat());
					console.log(sw.lng());
					
					var neLat = ne.lat();
					var neLng = ne.lng();
					var swLat = sw.lat();
					var swLng = sw.lng();
					
					$.ajax({
						type: "get",
						url: "/main/lodgeListAjax",
						data: {"neLat" : neLat, "neLng" : neLng,
							"swLat" : swLat, "swLng" : swLng},
						dataType: "json",
						success: function(list) {

							console.log("성공");
							console.log(list[0]);
							
							setMarkers(map);
							
							function setMarkers(map) {
								for(var i=0; i<list.length; i++) {
													
									var marker = new google.maps.Marker({
										position: {lat: list[i].latitude, lng: list[i].longitude},
										map: map,
										title: list[i].lodge_name,
										zIndex: i+1
									});
								}
							}
							
							$("#lodgeList").html("");
							
							for(var i=0; i<list.length; i++) {
								
								console.log(list[i]);
								
								$("#lodgeList").append(list[i].lodge_name);
								$("#lodgeList").append("<br>");
								
								
								
								
							}
							$("#lodgeList").append("<hr>");
						},
						error: function() {
							console.log("실패");
						}
					});
	 			});

				
				// 동서남북 좌표
				var bounds = map.getBounds();
// 				var ne = bounds.getNorthEast();
// 				var sw = bounds.getSouthWest();
				
				
// 				console.log(neLat);
				
				
				
				
			}
	
	
	</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&callback=initMap">
		
	</script>

</html>