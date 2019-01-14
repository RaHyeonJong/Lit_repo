<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is trip 인생은 여행이다</title>

<%-- /resources/images/lodge_image/${list.stored_name[0] } --%>

	<!-- jQuery -->
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script src="/resources/dist/js/datepicker.min.js"></script>
<!-- Include English language -->
<script src="/resources/dist/js/i18n/datepicker.en.js"></script>
<link href="/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--Plugin CSS file with desired skin-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.0/css/ion.rangeSlider.min.css" />
<link rel="stylesheet" href="/resources/css/multirange.css">

<script src="//static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

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
	border: 1px solid rgb(235, 235, 235);
	margin: 20px 0;
	width: 48%;
}

#lodgeList2:hover {
	box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 4px !important;
}

#lodgeImage {
	display: table-cell;
	width: 300px;
	height: 200px;
	border: 0px solid rgb(235, 235, 235);
}

#lodgeInfo {
	display: table-cell;
	border: 0px solid rgb(235, 235, 235);
	width: 100%;
	height: 200px !important;
	vertical-align: middle !important;
}

#modal-people2, #modal-cate2, #modal-price2 {
	box-shadow: rgba(0, 0, 0, 0.15) 0px 14px 36px 2px !important;
	border-width: 1px !important;
	border-style: solid !important;
	border-color: rgba(0, 0, 0, 0.2) !important;
	border-image: initial !important;
	border-radius: 4px !important;
	padding: 24px !important;
}

#peopleDiv {
	display: table !important;
	width: 100% !important;
}

#peopleDiv1 {
	display: table-cell !important;
	width: 100% !important;
	vertical-align: middle !important;
	text-align: left;
}

#peopleDiv2 {
	display: table-cell !important;
	vertical-align: middle !important;
}

#peopleDiv21 {
	display: table !important;
	width: 120px !important;
	text-align: center !important;
}

#peopleMinus {
	display: table-cell !important;
	vertical-align: middle !important;
}

#peopleCnt {
	display: table-cell !important;
	vertical-align: middle !important;
}

#peoplePlus {
	display: table-cell !important;
	vertical-align: middle !important;
}

.people-counter-button {
	height: 2em;
	width: 2em;
	border: 1px solid rgb(0, 132, 137);
	border-radius: 50%;
	background-color: transparent;
	line-height: 1;
	color: rgb(0, 132, 137);
}

.Search-box {
	margin-bottom: 13px;
}
</style>

</head>
<body>

	<div id="wrapper">

		<div>
			<!-- header 시작 -->
			<c:import url="../layout/header.jsp" />
		</div>
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

		<!-- header 끝 -->

		<div id="search_filter" style="z-index: 91; top: 0;">
			<button id="dateFilterBtn">날짜</button>
			<button id="peopleFilterBtn">인원</button>
			<button id="cateFilterBtn">숙소 종류</button>
			<button id="priceFilterBtn">가격</button>
		</div>


		<div id="lodgeCount"></div>
		<div>
			<div id="lodgeList" style="margin-left: 20px; margin-top: 142px;"></div>
		</div>

	</div>

	<div id="mapFixed">
		<div id="map"></div>
	</div>
</body>

<!-- <div id="modal-login" style="display:block; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(255,255,255,0.65); "> -->
<!-- <div style="position:fixed; width:568px; height:568px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center; -->
<!-- 		border: 1px solid black;"> -->
<!-- </div></div> -->

<script>
var searchFilter = new Object(); // 검색 필터 오브젝트

searchFilter.peopleCnt = 1;				// 인원 (파라미터)
searchFilter.minPrice = 0;				// 최소 가격(파라미터)
searchFilter.maxPrice = 99999999;		// 최대 가격(파라미터)

searchFilter.startDate = "";
searchFilter.endDate = "";

searchFilter.cate = [];


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
var peopleMax = 20; // 최대 인원

$(document).ready(function() {
	$('#header').css('z-index', 91); // 모달 띄울 때
	$('#header').css('position', 'fixed');
	$('#search-filter').css('position', '0');
	
	// 인원 모달 위치
	var peopleDiv = $("#peopleFilterBtn");
	var peopleDivX = peopleDiv.offset().left;
	var peopleDivY = peopleDiv.offset().top + peopleDiv.height() + 32;
	
	// 가격 모달 위치
	var priceDiv = $("#priceFilterBtn");
	var priceDivX = priceDiv.offset().left;
	var priceDivY = priceDiv.offset().top + priceDiv.height() + 32;
	
	// 달력 모달 위치
	var dateDiv = $("#dateFilterBtn");
	var dateDivX = dateDiv.offset().left;
	var dateDivY = dateDiv.offset().top + dateDiv.height() + 32;
	
	// 숙소 종류 모달 위치
	var cateDiv = $("#cateFilterBtn");
	var cateDivX = cateDiv.offset().left;
	var cateDivY = cateDiv.offset().top + cateDiv.height() + 32;
	
	$('#peopleFilterBtn').click(function() { // 인원 필터 버튼 누를 시
		
		$('.modal').css("display", "none");
		$('#modal-people2').css('left', peopleDivX);
		$('#modal-people2').css('top', peopleDivY);
		$('#modal-people').css("display", "block");
		
		console.log($('#modal-people2').attr('top'));
		console.log($('#modal-people2').attr('left'));
		
	});
	
	$('#lodgeInfo').click(function() {
		var lodge_no = $('#lodgeInfo').attr('data-lodgeNo');
		window.location.href = "/lodge/view?lodge_no="+lodge_no;
	});

	$('#priceFilterBtn').click(function() { // 가격 필터 버튼 누를 시
		$('.modal').css("display", "none");
		$('#modal-price2').css('left', priceDivX);
		$('#modal-price2').css('top', priceDivY);
		$('#modal-price').css("display", "block");
	});
	
	$('#cateFilterBtn').click(function() { // 숙소 종류 필터 버튼 누를 시
		$('.modal').css("display", "none");
		$('#modal-cate2').css('left', cateDivX);
		$('#modal-cate2').css('top', cateDivY);
		$('#modal-cate').css("display", "block");
	});
	
	$('#dateFilterBtn').click(function() { // 달력 필터 버튼 누를 시
		$('.modal').css("display", "none");
		$('#modal-date2').css('left', dateDivX);
		$('#modal-date2').css('top', dateDivY);
		$('#modal-date').css("display", "block");
		$('#datepicker').focus();
	});
	
	$('#peopleSend').click(function() { // 인원 적용 버튼 누를 시
		$('#peopleFilterBtn').html('인원' + searchFilter.peopleCnt + '명');
		$('#peopleFilterBtn').attr("style" , "color:white !important;background-color:#008489 !important");
		searchFilterSend();
	});
	
	$('#peopleCancel').click(function() { // 인원 취소 버튼 누를 시
		searchFilter.peopleCnt = 1;
		$('#peopleFilterBtn').html('인원');
	});
	
	$('#priceFilter-send').click(function() { 
		
		searchFilterSend();
		
		$('#priceFilterBtn').html(searchFilter.minPrice + '원~' + searchFilter.maxPrice + '원');
	});
	
	
	
	$('#cateSend').click(function() {
		searchFilter.cate = [];
		var cnt = 0;
		$('input:checkbox[name="cate"]').each(function(){
			if(this.checked == true){
				cnt++;
				searchFilter.cate.push($(this).val());
			}
		});	
		console.log(searchFilter.cate);
		$('#cateFilterBtn').attr("style" , "color:white !important;background-color:#008489 !important");
		$('#cateFilterBtn').html("숙소종류·" + cnt);
		
		searchFilterSend();
	});
	
	$('#priceSend').click(function() {
		searchFilter.minPrice = $('#ds1').val();
		searchFilter.maxPrice = $('#ds2').val();
		
		$('#priceFilterBtn').html(searchFilter.minPrice + '원~' + searchFilter.maxPrice + '원');
		$('#priceFilterBtn').attr("style" , "color:white !important;background-color:#008489 !important");
		
		searchFilterSend();
	});
	
	function searchFilterSend() {
		
		// 필터 기본값
		$('#priceMinFilter').attr('value', 0);
		$('#priceMaxFilter').attr('value', 99999999);
// 		$('#peopleFilter').attr('value', 1);
		
		
		
		$('.modal').css("display", "none");
		
		
         
            $.ajax({
			    type: "post",
			    url: "/main/searchFilterAjax",
			    data: {"searchFilterJson" : JSON.stringify(searchFilter)},
			    dataType: "json",
			    success: function(list) {

						
						
// 						marker = new google.maps.Marker({
// 							position : myLatlng,
// 							map : map,
// 							title : 'Click to zoom'
// 						});
						
						
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

	// 모달 반투명 배경 클릭
	$(window).click(function(e) {
		if(e.target == $('#modal-people')[0]) {
			$('.modal').css("display", "none");
		} else if(e.target == $('#modal-price')[0]) {
			$('.modal').css("display", "none");
		} else if(e.target == $('#modal-date')[0]) {
			$('.modal').css("display", "none");
			
			var con = $('#datepicker').val();
			searchFilter.startDate =  con.substring(0, 10);
			searchFilter.endDate = con.substring(11, 21);
			
			if(searchFilter.startDate != "") {
				$('#dateFilterBtn').html(searchFilter.startDate + '~' + searchFilter.endDate);
				$('#dateFilterBtn').attr("style" , "color:white !important;background-color:#008489 !important");
				searchFilterSend();
			}
			
			
		}
	});
	
	$('#peopleMinus').click(function() {
		if(searchFilter.peopleCnt > 1) {
			searchFilter.peopleCnt--;
			$('#peopleCnt').html(searchFilter.peopleCnt + '+');
		}
	});
	
	$('#peoplePlus').click(function() {
		if(searchFilter.peopleCnt < peopleMax) {
			searchFilter.peopleCnt++;
			$('#peopleCnt').html(searchFilter.peopleCnt + '+');
		}
	});
	$("#datepicker").datepicker();
	
	$('#datepicker').keypress(function(e){
		if ( e.which == 13 ) { 
			e.preventDefault(); 
			
			$('.modal').css("display", "none");
			
			var con = $('#datepicker').val();
			console.log(con);
			searchFilter.startDate =  con.substring(0, 10);
			searchFilter.endDate = con.substring(11, 21);
				$('#dateFilterBtn').html(searchFilter.startDate + '~' + searchFilter.endDate);
				$('#dateFilterBtn').attr("style" , "color:white !important;background-color:#008489 !important");
				searchFilterSend();
			}
		}
	});
	

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
				
					map2();
				}); // dragend 끝
				
				map.addListener('zoom_changed', function() { // zoom_changed
				
					map2();
				}); // zoom_changed 끝
				
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

<!-- 달력 필터 모달 -->
<div id="modal-date" class="modal"
	style="display: none; position: fixed; z-index: 90; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background: rgba(255, 255, 255, 0.85) !important;">
	<div id="modal-date2"
		style="position: fixed; display: inline; background-color: #fefefe; text-align: center;">
		<div id="modal-date3">
			<!-- price min, max filter 추가 -->
			<!-- 			<label for="min">최소</label> <input type="text" id="priceMinFilter" -->
			<!-- 				name="priceMinFilter" /><br> <label for="max">최대</label> <input -->
			<!-- 				type="text" id="priceMaxFilter" name="priceMaxFilter" /> -->
			<!-- 			<button id="priceFilter-send">적용</button> -->


			<input type="text" style="height: 0px; font-size:0px; border:none;" id="datepicker" data-range="true"
    data-multiple-dates-separator="-"
    data-language="en"></input>
	
		</div>
	</div>
</div>
<!-- 달력 필터 모달 끝 -->

<!-- 가격 필터 모달 -->
<div id="modal-price" class="modal"
	style="display: none; font: 15px Open Sans; position: fixed; z-index: 90; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background: rgba(255, 255, 255, 0.85) !important;">
	<div id="modal-price2"
		style="position: fixed; width: 400px; padding-bottom: 20px; background-color: #fefefe; text-align: center;">
		<div id="modal-price3">

			<!-- 	</div> -->
			<fieldset>
				<!--   <legend>Cost range one</legend> -->
				<div class="range-slider">
					<input type="text" class="js-range-slider1" value="" tabindex="-1" />
					<!--       <div> -->
					<!--         <label for="ds1" class="lbl js-from">From</label> -->
					<!--         <label for="ds2" class="lbl js-to">To</label> -->
					<!--       </div>   -->
					<div class="extra-controls minimised">
						<input id="ds1" type="text" maxlength="10" value="20000"
							class="inp js-from" /> <input id="ds2" type="text"
							maxlength="10" value="190000" class="inp js-to" />
					</div>
				</div>
			</fieldset>
			<div style="display: flex;">
				<div id="priceCancel"
					style="text-align: left; flex-grow: 1 !important; cursor: pointer;">삭제</div>
				<div id="priceSend"
					style="color: rgb(0, 132, 137); cursor: pointer;">적용</div>
			</div>
		</div>
	</div>
</div>
<!-- 가격 필터 모달 끝 -->

<!-- 인원 필터 모달 -->
<div id="modal-people" class="modal"
	style="display: none; position: fixed; z-index: 90; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background: rgba(255, 255, 255, 0.85) !important;">
	<div id="modal-people2"
		style="position: fixed; width: 344px; padding-bottom: 20px; background-color: #fefefe; text-align: center;">
		<div id="modal-people3">

			<div id="peopleDiv" style="margin-bottom: 16px;">
				<div id="peopleDiv1">인원</div>
				<div id="peopleDiv2">
					<div id="peopleDiv21">
						<button class="people-counter-button" id="peopleMinus"
							style="cursor: pointer;">-</button>
						<div id="peopleCnt">1+</div>
						<button class="people-counter-button" id="peoplePlus"
							style="cursor: pointer;">+</button>
					</div>
				</div>
			</div>

			<div style="display: flex;">
				<div id="peopleCancel"
					style="text-align: left; flex-grow: 1 !important; cursor: pointer;">삭제</div>
				<div id="peopleSend"
					style="color: rgb(0, 132, 137); cursor: pointer;">적용</div>
			</div>
			<!-- 모달 내용 -->
			<!-- 	<input type="text" id="peopleFilter" /> -->

			<!-- 	<button id="peopleFilter-send">적용</button> -->
		</div>
	</div>
</div>
<!--   인원 모달 끝    -->

<!-- 숙소종류 필터 모달 -->
<div id="modal-cate" class="modal"
	style="display: none; position: fixed; z-index: 90; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background: rgba(255, 255, 255, 0.85) !important;">
	<div id="modal-cate2"
		style="position: fixed; width: 344px; s padding-bottom: 20px; background-color: #fefefe; text-align: center;">
		<div id="modal-cate3">
			<table sytle="width:100%;">
				<tr>
					<td><input type="checkbox" id="catePension" name="cate"
						value="1" /></td>
					<td style="text-align: left; padding-left: 10px;">펜션</td>
				</tr>
				<tr>
					<td></td>
					<td
						style="text-align: left; padding-left: 10px; font-size: 15px; padding-bottom: 15px;">집
						전체를 단독으로 사용합니다</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="cateMotel" name="cate"
						value="2" /></td>
					<td style="text-align: left; padding-left: 10px;">모텔</td>
				</tr>
				<tr>
					<td></td>
					<td
						style="text-align: left; padding-left: 10px; font-size: 15px; padding-bottom: 15px;">부티크
						호텔, 호스텔 등의 개인실이나 다인실을 이용합니다</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="cateHouse" name="cate"
						value="3" /></td>
					<td style="text-align: left; padding-left: 10px;">게스트하우스</td>
				</tr>
				<tr>
					<td></td>
					<td
						style="text-align: left; padding-left: 10px; font-size: 15px; padding-bottom: 15px;">사적
						공간 없이, 침실이나 욕실 등을 호스트나 다른 게스트와 함께 이용합니다</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
						<div style="display: flex;">
							<div id="cateCancel"
								style="text-align: left; flex-grow: 1 !important; cursor: pointer;">삭제</div>
							<div id="cateSend"
								style="color: rgb(0, 132, 137); cursor: pointer;">적용</div>
						</div>
					</td>
				</tr>
			</table>

		</div>
	</div>
</div>

<!--     jQuery -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->


</html>