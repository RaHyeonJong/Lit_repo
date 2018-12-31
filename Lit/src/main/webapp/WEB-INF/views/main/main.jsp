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
	position: fixed;
	height: 776px;
	right: 0px;
/* 	float: right; */
}
#mapFixed {
	position: fixed;
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
#lodgeList2 {
	display: table; 
	border: 1px solid gray; 
	margin: 20px 0;
	width: 48%;
}
#lodgeImage {
	display: table-cell; 
	width: 300px; 
	height: 200px;
	border: 1px solid gray;
}
#lodgeInfo {
	display: table-cell; 
	border: 1px solid gray;
	width: 100%;
	height: 200px !important; 
	vertical-align: middle !important;
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
			<button id="peopleFilterBtn">인원</button>
			<button>숙소 종류</button>
			<button>가격</button>
		</div>

		<h1>main page</h1>
		
		
		<div id="lodgeCount"></div>
		
		<div id="lodgeList" style="margin-left: 20px;"></div>
	
	
</div>

	<div id="mapFixed">
		<div id="map">
		</div>
	</div>
</body>

<!-- <div id="modal-login" style="display:block; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(255,255,255,0.65); "> -->
<!-- <div style="position:fixed; width:568px; height:568px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center; -->
<!-- 		border: 1px solid black;"> -->
<!-- </div></div> -->

<script>
var bounds, ne, sw, neLat, neLng, swLat, swLng;
var map;
var myLatlng;
var marker;
var peopleCnt;
var cost;
var infowindow;
var markerArray = [];

$(document).ready(function() {
	
	$('#peopleFilterBtn').click(function() {
		$('.modal').css("display", "none");
		$('#modal-people').css("display", "block");
	});

	$('#peopleFilter-send').click(function() {
		
		$('.modal').css("display", "none");
		peopleCnt = $('#peopleFilter').val();
		
		if(peopleCnt == "")
			peopleCnt = 0;
		
		
         
            $.ajax({
			    type: "post",
			    url: "/main/searchFilterAjax",
			    data: {"peopleCnt" : peopleCnt , "neLat" : neLat, "neLng" : neLng, "swLat" : swLat, "swLng" : swLng},
			    dataType: "json",
			    success: function(list) {
						alert(list.length);
						
						
						marker = new google.maps.Marker({
							position : myLatlng,
							map : map,
							title : 'Click to zoom'
						});
						
						
					for( i in markerArray)
						markerArray[i].setMap(null);
					markerArray = [];
						
			    	setMarkers(map);
					
					function setMarkers(map) {
						for(var i=0; i<list.length; i++) {
										
							marker = new google.maps.Marker({
								position: {lat: list[i].latitude, lng: list[i].longitude},
								map: map,
								title: list[i].lodge_name,
								zIndex: i+1
							});
							
							cost = '￦' + list[i].stay_cost;
							
							infowindow = new google.maps.InfoWindow({
							    content: String(cost)
							});
							
							infowindow.open(map, marker);
							markerArray.push(marker);
						}
					}
					
					$("#lodgeCount").html("");
					$("#lodgeCount").append(list.length + "개의 숙소");
					$("#lodgeCount").append("<br>");
					
					
						////////// 숙소 리스트 ///////////
					$.ajax({
					    type: "post",
					    url: "/main/lodgeListAjax",
					    data: {"list" : JSON.stringify(list)},
					    dataType: "html",
					    success: function(list) {
					    	
					    	$("#lodgeList").html(list);
					        
					    },
					    error: function() {
					        console.log("실패");
					    }
					});
					//////////////////////////////////
					
			    },
			    error: function() {
			        console.log("실패");
			    }
			});
            
        
		
	});
});


	function initMap() {
				
				myLatlng = {
					lat : ${cityLat},
					lng : ${cityLng}
				};

				map = new google.maps.Map(document.getElementById('map'), {
					zoom : 15,
					center : myLatlng
				});
				
				
				
				/* marker = new google.maps.Marker({
					position : myLatlng,
					map : map,
					title : 'Click to zoom'
				}); */
				
//	 			map.addListener('center_changed', function() {
//	 				// 3 seconds after the center of the map has changed, pan back to the
//	 				// marker.
//	 				window.setTimeout(function() {
//	 					map.panTo(marker.getPosition());
//	 				}, 3000);
//	 			});




				
				
					map.addListener('dragend', function() { // dragend 시작
						alert('dragend');
						bounds = map.getBounds();
						ne = bounds.getNorthEast();
						sw = bounds.getSouthWest();
						
						neLat = ne.lat();
						neLng = ne.lng();
						swLat = sw.lat();
						swLng = sw.lng();
						
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
													
										marker = new google.maps.Marker({
											position: {lat: list[i].latitude, lng: list[i].longitude},
											map: map,
											title: list[i].lodge_name,
											zIndex: i+1
										});
										
										cost = '￦' + list[i].stay_cost;
										
										infowindow = new google.maps.InfoWindow({
										    content: String(cost)
										});
										
										infowindow.open(map, marker);
										
										markerArray.push(marker);
									}
								}
								
								$("#lodgeCount").html("");
								$("#lodgeCount").append(list.length + "개의 숙소");
								$("#lodgeCount").append("<br>");
								

								
								////////// 숙소 리스트 ///////////
								$.ajax({
								    type: "post",
								    url: "/main/lodgeListAjax",
								    data: {"list" : JSON.stringify(list)},
								    dataType: "html",
								    success: function(list) {
								    	
								    	$("#lodgeList").html(list);
								        
								    },
								    error: function() {
								        console.log("실패");
								    }
								});
								//////////////////////////////////
							},
							error: function() {
								console.log("실패");
							}
						});
					}); // dragend 끝

			}
	</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&callback=initMap"></script>
<!-- 인원 필터 모달 -->
<div id="modal-people" class="modal" style="display:none; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div style="position:fixed; width:568px; padding-bottom:20px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center;">
<div>
	<input type="text" id="peopleFilter" name="peopleFilter" />
	<button id="peopleFilter-send">적용</button>
</div>
</div></div>
<!--       -->
</html>