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
	<style>

	#content_box,
	#recommend_box
	{
		width:80%;
		margin:0 auto;
	}
	
	#fst_title
	{
		color:#ff792a;
		font-size:40px;
		text-align:center;
		padding-bottom:30px;
	}
	
	#fst_img
	{
		width:48%;
		padding-right:30px;
	}

	#fst_map
	{
		width:52%;
		height:60%;
		padding-left:30px;
	}

	#fst_content
	{
		text-align:left;
		padding-top:30px;
	}
	
	#here
	{
		font-size:30px;
		color:#ff792a;
		font-weight:bold;
		padding-top:40px;
	}
  	
  	#stored
  	{
  		padding-top:20px;
  		padding-bottom:30px;
  		display:block;
  		text-align:center;
  		width:95%;
  		height:300px;
		border-radius:15%;
  	}
  	
  	.column#caption
   {
      position:relative;
   }
   
   .column#caption .text {
      position: absolute;      
      top: 50%;
      left: 50%;
      transform: translate(40%, -100%);
      opacity:0;
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
	
</head>



<input type="hidden" value="${festivalView.festival_no }" />

<body>
<div id="wrapper">

	<table id="content_box">
	<thead>
		<tr>
			<td colspan="2" id="fst_title"><i class="fa fa-smile-o" aria-hidden="true"></i> ${festivalView.festival_name }</td>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td rowspan="2" id="fst_img">
					${festivalView.festival_contents }
			</td>
			
			<td id="fst_map"></td>
		</tr>
		
		<tr>
			<td id="fst_content"> 
				<span style="font-weight:bold; color:gray;"><i class="fa fa-map-marker" aria-hidden="true"></i> ${festivalView.address } </span><p>
				<span style="font-weight:bold; color:gray;"><i class="fa fa-calendar" aria-hidden="true"></i> ${festivalView.start_date} ~ ${festivalView.end_date }</span><p>			
				<span style="font-weight:bold; color:gray;"><i class="fa fa-pencil" aria-hidden="true"></i> ${festivalView.written_time} </span>
			</td>
		</tr>
	</tbody>
	</table>
	
	<table id="recommend_box">
	
		<thead>
			<tr>
				<td colspan="3" id="here">
					<c:if test="${login }">
						${member.mem_name } 님 여기는 어떨까요!?
					</c:if>
					
					<c:if test="${not login }">
						Guest 님 여기는 어떨까요!?
					</c:if>
				</td>
			</tr>
			
		</thead>
		<tbody>
			<tr>
			    <c:forEach items="${recommendView }" var="recommend">
         		<td id="recommend_img">   
            		<a href="/festival/view?festival_no=${recommend.festival_no }" class="column col-xs-6" id="caption">      
                  		<img src="/resources/images/${recommend.stored_name }" id="stored"><br>
                  		<span class="text">${recommend.festival_name }</span>
            		</a>   
         		</td>
         </c:forEach>
			</tr>
		</tbody>	
	</table>
	
	
</div>
<jsp:include page="../layout/footer.jsp" />
</body>


<script>
		
	var container = document.getElementById('fst_map');
	var options = {
		center: new daum.maps.LatLng("${festivalView.latitude }", "${festivalView.longitude }"),
		level: 3
	};
	
	var map = new daum.maps.Map(container, options);
	
	var markerPosition  = new daum.maps.LatLng("${festivalView.latitude }", "${festivalView.longitude }"); 

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

</script>
