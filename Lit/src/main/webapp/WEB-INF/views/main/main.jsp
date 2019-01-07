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
	position: fixed;
	z-index: 102;
	background-color: #fff;
	border-bottom: 1px solid #EBEBEB;
	width: 100%;
	margin-top: 78px;
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
		
		<div id="search_filter" style="z-index: 90; top: 0;">
			<button>날짜</button>
			<button id="peopleFilterBtn">인원</button>
			<button>숙소 종류</button>
			<button id="priceFilterBtn">가격</button>
		</div>
		
		
		<div id="lodgeCount"></div>
		<div>
			<div id="lodgeList" style="margin-left: 20px; margin-top: 142px;"></div>
		</div>
	
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
var searchFilter = new Object(); // 검색 필터 오브젝트

searchFilter.peopleCnt = 0;				// 인원 (파라미터)
searchFilter.minPrice = 0;				// 최소 가격(파라미터)
searchFilter.maxPrice = 99999999;		// 최대 가격(파라미터)

// 경계 값 (파라미터)
searchFilter.neLat = 0;
searchFilter.neLng = 0;
searchFilter.swLat = 0;
searchFilter.swLng = 0;


var bounds, ne, sw; // 경계 값 (파라미터)

var map;
var myLatlng;
var marker;
var cost;
var infowindow;
var markerArray = [];

$(document).ready(function() {
	$('#header').css('z-index', 91); // 모달 띄울 때
	$('#header').css('position', 'fixed');
	$('#search-filter').css('position', '0');
	
	// 인원 모달 위치
	var peopleDiv = $("#peopleFilterBtn");
	var peopleDivX = peopleDiv.offset().left;
	var peopleDivY = peopleDiv.offset().top + peopleDiv.height() + 30;
	
	// 가격 모달 위치
	var priceDiv = $("#priceFilterBtn");
	var priceDivX = priceDiv.offset().left;
	var priceDivY = priceDiv.offset().top + priceDiv.height() + 30;
	
	$('#peopleFilterBtn').click(function() { // 인원 필터 버튼 누를 시
		
		$('.modal').css("display", "none");
		$('#modal-people2').css('left', peopleDivX);
		$('#modal-people2').css('top', peopleDivY);
		$('#modal-people').css("display", "block");
		
		console.log($('#modal-people2').attr('top'));
		console.log($('#modal-people2').attr('left'));
	});

	$('#priceFilterBtn').click(function() { // 가격 필터 버튼 누를 시
		$('.modal').css("display", "none");
		$('#modal-price2').css('left', priceDivX);
		$('#modal-price2').css('top', priceDivY);
		$('#modal-price').css("display", "block");
	});
	
	$('#peopleFilter-send').click(function() {
		alert('인원 필터');
		searchFilterSend();
		
	});
	
	$('#priceFilter-send').click(function() { 
		
		
		searchFilterSend();
	});
	
	function searchFilterSend() {
		
		// 필터 기본값
		$('#priceMinFilter').attr('value', 0);
		$('#priceMaxFilter').attr('value', 99999999);
		$('#peopleFilter').attr('value', 0);
		
		
		
		$('.modal').css("display", "none");
		searchFilter.peopleCnt = $('#peopleFilter').val();
		searchFilter.minPrice = $('#priceMinFilter').val();
		searchFilter.maxPrice = $('#priceMaxFilter').val();
		
		alert(JSON.stringify(searchFilter));
		
         
            $.ajax({
			    type: "post",
			    url: "/main/searchFilterAjax",
			    data: {"searchFilterJson" : JSON.stringify(searchFilter)},
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
} // searchFilterSend() end

	
}); // document ready end
	

	function initMap() {
				
				myLatlng = {
					lat : ${cityLat},
					lng : ${cityLng}
				};

				map = new google.maps.Map(document.getElementById('map'), {
					zoom : 15,
					center : myLatlng
				});
				
				map.addListener('dragend', function() { // dragend 시작
					alert('dragend');
				
					map2();
				}); // dragend 끝
				
				/* marker = new google.maps.Marker({
					position : myLatlng,
					map : map,
					title : 'Click to zoom'
				}); */
				
// 	 			map.addListener('tilesloaded', function() { // map 로드 될 때
// 	 				alert('tilesloaded');
// 	 				map2();
// 	 			});
				
				google.maps.event.addDomListener(window, 'load', map2);
					
					function map2() {
						bounds = map.getBounds();
						ne = bounds.getNorthEast();
						sw = bounds.getSouthWest();
						
						searchFilter.neLat = ne.lat();
						searchFilter.neLng = ne.lng();
						searchFilter.swLat = sw.lat();
						searchFilter.swLng = sw.lng();
						
						alert(searchFilter);
						
						$.ajax({
							type: "get",
							url: "/main/lodgeListAjax",
							data: {"searchFilterJson" : JSON.stringify(searchFilter)},
							dataType: "json",
							success: function(list) {
	
								console.log("성공");
								
								setMarkers(map);
								
								function setMarkers(map) {
									for(var i=0; i<list.length; i++) {
										
										//////// test /////////
										console.log(list[i].stored_name);
										
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
						
					} // function map() end
					
			}
	</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&callback=initMap"></script>
	
<!-- 가격 필터 모달 -->
<div id="modal-price" class="modal" style="display:none; position:fixed; z-index:90; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div id="modal-price2" style="position:fixed; width:568px; padding-bottom:20px; background-color:#fefefe; text-align: center;">
<div id="modal-price3">
	<!-- price min, max filter 추가 -->
	<label for="min">최소</label>
	<input type="text" id="priceMinFilter" name="priceMinFilter" /><br>
	<label for="max">최대</label>
	<input type="text" id="priceMaxFilter" name="priceMaxFilter" />
	<button id="priceFilter-send">적용</button>
	
</div>
</div></div>
<!-- 가격 필터 모달 끝 -->

<!-- 인원 필터 모달 -->
<div id="modal-people" class="modal" style="display:none; position:fixed; z-index:90; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div id="modal-people2" style="position:fixed; width:568px; padding-bottom:20px; background-color:#fefefe; text-align: center;">
<div id="modal-people3">
	
	<!-- 모달 내용 -->
	<input type="text" id="peopleFilter" />
	
	<button id="peopleFilter-send">적용</button>
</div>
</div></div>
<!--   인원 모달 끝    -->
</html>