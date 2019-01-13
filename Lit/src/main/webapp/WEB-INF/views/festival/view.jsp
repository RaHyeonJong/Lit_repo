<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a161e649deaccd6f18cc3348d4953ab&libraries=services,clusterer,drawing"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<jsp:include page="../layout/header.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
	<title>Life Is Trip 인생은 여행이다.</title>
</head>

<style>

	#wrapper
	{
		margin: 60px 100px 60px 200px;
	}
	
	#box1
	{
		width:450px;
		height:580px;
		float:left;
		margin-right:100px;
		text-align:center;
		margin-top: -20px;
	}
	
	#img_box
	{
		
		text-align:center;
		display:inline-block;
	}
	
	
	#box2
	{
		width:450px;
		height:580px;
		float:left;
		text-align:center;
	}
	
	#img_map,
	#img_contents
	{
		width:450px;	
		display:inline-block;
	}
	
	#img_map
	{ 
		height:400px;
		margin-bottom:30px;	
	}
	
	#img_contents
	{
		width:430px;
		height:237px;
		 
		padding-left:20px;
		text-align:left;
	}
	
	#img_recommend
	{
		width:75%; 
/* 		900px */
		margin-top:100px;
		float:left;
		
	}
	
 	#img_row 
	{ 
 		float:left; 
 		width:32%; 
 		height:300px; 
 		margin-right:10px; 
 	} 
 	
	.column#caption
	{
		position:relative;
	}
	
	.column#caption .text {
		position: absolute;		
    	top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
     	opacity: 0; 
	    transition: all 0.8s ease;
	  	margin-top:-140px;
	  	width:170px;
	  	text-align:center;
	    color: white;
	    font-size: 28px;
	}
	
	.column#caption:hover .text {
		opacity: 1;
	
	}
	
	.column#caption:hover img {
		/*  명도 30% 효과 줌 */
		-webkit-filter: brightness(30%);
	}

</style>

<input type="hidden" value="${festivalView.festival_no }" />

<body>
<div id="wrapper">
	<div id="box1">
	
		<div id="img_box">
			${festivalView.festival_contents }
		</div>
	</div>

	
	<div id="box2">
	
		<div id="img_map">
			<p><p>
		</div>
	
		<div id="img_contents">
			<span style="font-weight:bold;"><i class="fa fa-smile-o" aria-hidden="true"></i> ${festivalView.festival_name } </span><p>
			<span style="font-weight:bold;"><i class="fa fa-map-marker" aria-hidden="true"></i> ${festivalView.address } </span><p>
			<span style="font-weight:bold;"><i class="fa fa-calendar" aria-hidden="true"></i> ${festivalView.start_date} ~ ${festivalView.end_date }</span><p>			
			<span style="font-weight:bold;"><i class="fa fa-pencil" aria-hidden="true"></i> ${festivalView.written_time} </span><p>
		</div>
	</div>

	<div id="img_recommend">
	
		<c:if test="${login }">
		<h1>${member.mem_name }님 여기는 어떨까요!?</h1>
		</c:if>
		
		<c:if test="${not login }">
		<h1>Guest님 여기는 어떨까요!?</h1>
		</c:if>
		
		<c:forEach items="${recommendView }" var="recommend">
		<div id="img_row">
			<a href="/festival/view?festival_no=${recommend.festival_no }" class="column" id="caption">
			<img src="/resources/images/${recommend.stored_name }" style="width:100%; height:300px; border-radius:15%;"><br>
				<span class="text">${recommend.festival_name }</span>
			</a>
		</div>			
		</c:forEach>
	</div>

</div>
</body>
<script>
		
	var container = document.getElementById('img_map');
	var options = {
		center: new daum.maps.LatLng(${festivalView.latitude }, ${festivalView.longitude }),
		level: 3
	};
	
	var map = new daum.maps.Map(container, options);
	
	var markerPosition  = new daum.maps.LatLng(${festivalView.latitude }, ${festivalView.longitude }); 

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

</script>
