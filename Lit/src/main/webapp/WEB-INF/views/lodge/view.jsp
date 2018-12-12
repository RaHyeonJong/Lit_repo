<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    <!-- 구글 맵 -->  
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFaqOV0p_zrPFa70xwici5EGqDN9qq0fw&callback=initMap"async defer></script>
<style>
.lodge_image {
  width: 100%;
  height: auto;
  vertical-align: middle;
}

.Grid {
  font-size: 0;
  
}

.Grid-cell {
  font-size: 16px;
  font-size: 1rem;
  display: inline-block;
  vertical-align: top;
  width: 100%;
}

.Grid--withGutter {
  margin-left: -16px;
  margin-left: -1rem;
}

.Grid--withGutter > .Grid-cell {
  box-sizing: border-box;
  padding-left: 16px;
  padding-left: 1rem;
  padding-bottom: 16px;
  padding-bottom: 1rem;
}

.u-size1of2 { width: 50%; }

.Tile {
  position: relative;
  overflow: hidden;
}

.Tile-content {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
}

.u-size1to2 { padding-top: 50%; }
.u-size1to1 { padding-top: 100%; }
img:hover {
      transform: scale(1.1);
      transition: transform 0.3s;
    }
  }
/* 이미지 css 끝*/


/* 숙소이름, 숙소 유형 호스트 이미지 css 시작*/
.row{
	border-spacing: 0;
	border-collapse : collapse;
	text-align: left;
	vertical-align: top;
	padding : 0;
	width : 100%;
	position: relative;
	display : table;
}
.small-10 .large-10 .columns .first{
	font-size: 16px;
	text-ailgn :left;
	line-height : 1.3;
	font-family: Circular, Helvetica, Arial, sans-serif;
	font-weight: normal;
	padding :0;
	color : #0a0a0a;
	padding-right :8px;
	margin: 0;
	padding-bottom: 16px;
	width: 497.33333px;
	padding-left : 16px;
}
.body-text-lg .heavy .row-pad-bot-1{ /*숙소 이름*/
	padding :0;
	margin: 0;
	text-align: left;
	font-size: smaller;
	font-weight: 700;
	font-family: Circular,  Helvetica, Helvetica, Arial, sans-serif;
	color: #484848;
	word-break : normal;
	line-height: 1.2;
	padding-botton : 8px !important;
	margin-bottom: 8px !important;

}
.body-text .light .row-pad-bot-4{
	padding: 0;
	margin: 0 auto; 
	text-align: left;
	padding-bottom: 32px;
	font-weight: 300;
	font-family: Circular  , Helvetica , Helvetica , Arial, sans-serif; 
	color: #484848;
	word-break: normal; 
	line-height: 1.4; 
	font-size: xx-large; 
	margin-bottom: 0px !important;
	
}
.body-text .light{
margin: 0; 
text-align: left;
padding: 0; 
font-weight: 300; 
font-family: Circular , Helvetica , Helvetica , Arial, sans-serif; 
color: #484848;
word-break: normal; 
line-height: 1.4; 
font-size: 18px; 
margin-bottom: 0px !important;
}
.color-rausch .light{ /*호스트에게 메시지 보내기*/ 
font-family: 'Circular', Helvetica, Arial, sans-serif; 
padding: 0; 
margin: 0; 
text-align: left; 
line-height: 1.3; 
text-decoration: none; 
font-weight: 300; 
color: #ff5a5f !important;
}
.dot{
font-size: 15px; 
vertical-align: middle; 
padding-left: 8px; 
padding-right: 8px;
}
.small-2 .large-2 .columns .last{ /*호스트 이미지 부분*/
font-size: 16px; 
text-align: left; 
color: #0a0a0a; 
font-family: 'Circular', Helvetica, Arial, sans-serif; 
font-weight: normal; 
padding: 0; 
line-height: 1.3; 
width: 80.66667px; 
padding-left: 16px;
margin: 0 auto;
padding-bottom: 16px; 
padding-right: 16px;

}
.profile-img{
display: block; 
outline: none; 
text-decoration: none; 
-ms-interpolation-mode: bicubic; 
width: auto; 
clear: both; 
border: none; 
max-width: 77px; 
border-radius: 50%; 
max-height: 77px;

}
.width-77 .row-pad-top-2{
display: block; 
outline: none; 
text-decoration: none; 
-ms-interpolation-mode: bicubic; 
clear: both; 
border: none; 
width: 77px; 
padding-top: 16px; 
max-width: 77px;

}
/*숙소유형,이름, 호스트이미지 css 끝*/

.lodge_info > span{ /*침구 및 정원 정보*/
    font-weight: 600 !important;
    margin: 0 !important;
    word-wrap: break-word !important;
    font-size: 16px !important;
    line-height: 22px !important;
    letter-spacing: normal !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
}
.line{
   border-bottom-style: solid !important;
    border-bottom-color: #f5f5f5 !important;
}
.user_img{
	background-color: var(--color-accent-light-gray, #D8D8D8) !important;
    border-radius: var(--border-profile-photo-border-radius, 50%) !important;
    border-width: var(--border-profile-photo-border-width, 2px) !important;
    border-color: var(--color-white, #ffffff) !important;

}
._n5lh69r{
margin: 0px !important;
    /* word-wrap: break-word !important; */
    /* font-size: 14px !important; */
    /* line-height: 18px !important; */
    /* letter-spacing: normal !important; */
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    text-transform: undefined !important;
    color: #484848 !important;
    padding-top: undefined !important;
    padding-bottom: undefined !important;
    font-weight: normal !important;
    display: inline !important;
}
  #map {
      	width: 45%;
        height: 45%;
      }

</style>
 

<script type="text/javascript">
var map;
function initMap() {
	  var uluru = {lat: 37.497436, lng: 127.02990};
	  var map = new google.maps.Map(
			document.getElementById('map'), {zoom: 10, center: uluru});
   
	  var marker = new google.maps.Marker({position: uluru, map: map});

  };

</script>

<body>
	<div id="wrapper"
		style="min-width: 978px; max-width: 1200px; margin: 0 auto;">
		<div>
			<!-- header 시작 -->
			<c:import url="../layout/header.jsp" />

		</div>

		<div>
			<!-- content시작 -->

			<h3>숙소 이미지</h3>
			<div class="Grid">
				<div class="Grid-cell  u-size1of2">
					<div class="Tile  u-size1to1">
						<div class="Tile-content">
							<img class="lodge_image" src="/resources/images/lodge_image/${lodgeimg[0].stored_name }" alt="placeholder" 
							style="height: 524px;">
						</div>
						<!-- .Tile-content -->
					</div>
					<!-- .Tile -->
				</div>
				<!-- .Grid-cell -->
				<div class="Grid-cell  u-size1of2">
					<div class="Tile  u-size1to2">
						<div class="Tile-content">
							<img class="lodge_image" src="/resources/images/lodge_image/${lodgeimg[1].stored_name }" alt="placeholder">
						</div>
						<!-- .Tile-content -->
					</div>
					<!-- .Tile -->
					<div class="Grid">
						<div class="Grid-cell  u-size1of2">
							<div class="Tile  u-size1to1">
								<div class="Tile-content">
									<img class="lodge_image" src="/resources/images/lodge_image/${lodgeimg[2].stored_name }" alt="placeholder">
								</div>
								<!-- .Tile-content -->
							</div>
							<!-- .Tile -->
						</div>
						<!-- .Grid-cell -->
						<div class="Grid-cell  u-size1of2">
							<div class="Tile  u-size1to1">
								<div class="Tile-content">
									<img class="lodge_image" src="/resources/images/lodge_image/${lodgeimg[3].stored_name }" alt="placeholder">
								</div>
								<!-- .Tile-content -->
							</div>
							<!-- .Tile -->
						</div>
						<!-- .Grid-cell -->
					</div>
					<!-- .Grid -->
				</div>
				<!-- .Grid-cell -->
			</div>
			<!-- .Grid -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!--  호스트 정보 -->
			<div style="padding-top: 24px; padding-bottom: 24px">
				<table class="row">
					<tbody>
						<tr>
							<th class="small-10 large-10 columns first">
								<p class="body-text-lg heavy row-pad-bot-1"
									style="font-size: smaller;">${view[0].building_case }</p>
								<p class="body-text light row-pad-bot-4"style="font-size: xx-large;">${view[0].lodge_name }</p>
								<p class="body-text light">
									<span> <a href="#" class="color-rausch light">호스트 에게
											연락하기</a></span> <span class="dot">• </span> <span> <a href="#"
										class="color-rausch light">+1 (234) 567-8910 </a>
									</span>
								</p>
							</th>
							<th class="small-2 large-2 columns last"><a href="#"
								class=""
								style="font-family: 'Circular', Helvetica, Arial, sans-serif; font-weight: normal; padding: 0; margin: 0; text-align: left; line-height: 1.3; color: #2199e8; text-decoration: none">
									<img
									src="https://a0.muscache.com/im/pictures/2dcf3c71-aa22-4fbe-8a7f-2f4ee519e393.jpg?aki_policy=profile_x_medium"
									alt="" class="profile-img"> <img alt=""
									class="width-77 row-pad-top-2"
									src="https://a1.muscache.com/airbnb/rookery/dls/5.0_stars-8b3a9b9fe0d1aa014b1f97859cd599b1.png">
							</a></th>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 숙소이름, 숙소 유형 호스트 이미지  끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 숙소 정원, 유형, 침대 개수 -->

			<div class="lodge_info">
				<span>󰄂</span> 
				<span>수용 인원${view[0].lodge_capacity }명</span>
				<c:if test = "${view[0].building_case_no  == 1}" >
				<span>아파트</span>
				</c:if>
				<c:if test = "${view[0].building_case_no == 2}" >
				<span>단독주택</span>
				</c:if>
				<c:if test = "${view[0].building_case_no == 3}" >
				<span>연립주택</span>
				</c:if>
				<span>${view[0].convenient_facility}</span>
				<span>욕실</span>
			</div>
			<!-- 유형 끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 편의시설 -->
			<p class="facility">
				<span >
				 <span>- 편의시설</span>
				  <br>
				  <span>- 편의시설</span> 
				  <br> 
				  <span>- 편의시설</span>
				  <br> 
				  <span>- 편의시설</span> 
				  <br> 
				</span>
			</p>
			<button type="button" class="facility_btn" aria-busy="false">편의시설 모두 보기</button>
			<!-- 편의시설 끝 -->
		<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 예약 달력 -->
			<div>
			<input id="start" name ="stay_start" type="text" data-language="en"class="datepicker-here"/>
      		 <input id="end" name ="stay_end" type="text"  data-language="en"class="datepicker-here"/>
			</div>
			<!-- 달력 끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 후기 -->
 				<div class="_e296pg" style="height:48px;width:48px;display:block">
 				<a href="/users/show/61727682" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
 				<img class="user_img" src="https://a0.muscache.com/im/pictures/user/f4118b8f-179e-4655-9185-c2d2693b53a6.jpg?aki_policy=profile_x_medium" height="48" width="48" alt="Hyun님의 사용자 프로필" title="Hyun님의 사용자 프로필">
 				</a>
 				</div>	
 			
			<!-- 후기 끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 지역정보 -->
			<div>
				구글 맵 사용 하여 숙소 위치 표시		
			<div id="map"></div>
			
			</div>






			<!-- content 끝 -->
		</div>

		<!-- wrapper 끝 -->
	</div>


</body>
</html>
