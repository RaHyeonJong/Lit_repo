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
/*편의시설 모달창*/
a{color:#000;}

.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}

#modalLayer{display:none; position:relative;}
#modalLayer .modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; top:50%; z-index:11; background:#fff;}
#modalLayer .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}

.reply{
border: 1px solid gray;
 width: 600px;
 padding: 5px;
 margin-top: 5px;
 display: inline-block;

}

</style>
 

<script type="text/javascript">
var map;
var latVal = ${view.latitude};//숙소 위도
var lngVal = ${view.longitude}; //숙소 경도
var infoWindow;
// function initMap() {
// 	  var uluru = {lat: latVal, lng: lngVal};
// 	  var map = new google.maps.Map(
// 			document.getElementById('map'), {zoom: 15, center: uluru});
   
// 	  var marker = new google.maps.Marker({position: uluru, map: map});
	
	  
//   };
   var marker;

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: {lat: latVal, lng: lngVal}
        });

        marker = new google.maps.Marker({
          map: map,
          draggable: true,
          animation: google.maps.Animation.DROP,
          position: {lat: latVal, lng: lngVal}
        });
        marker.addListener('click', toggleBounce);
      }

      function toggleBounce() {
        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      };
      
      
      
 

</script>


<script type="text/javascript">
$(document).ready(function(){
	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
	    modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > a").focus(); 
	    return false;
	  });

	  $(".modalContent > button").click(function(){
	    modalLayer.fadeOut("slow");
	    modalLink.focus();
	  });		
	});

</script>

<script type="text/javascript">
function fn_formSubmit(){
    var form1 = document.replyform;
    
    if (form1.contents.value=="") {
        alert("글 내용을 입력해주세요.");
        form1.contents.focus();
        return;
    }
    form1.submit();    
} 




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
									style="font-size: smaller;">${view.building_case }</p>
								<p class="body-text light row-pad-bot-4"style="font-size: xx-large;">${view.lodge_name }</p>
								<p class="body-text light">
									<span> 
									<a href="#" class="color-rausch light">호스트 에게 연락하기</a></span> <span class="dot">• </span> <span> <a href="#"
										class="color-rausch light"> </a>
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
				<span>수용 인원${view.lodge_capacity }명</span>
				<c:if test = "${view.building_case_no  == 1}" >
				<span>아파트</span>
				</c:if>
				<c:if test = "${view.building_case_no == 2}" >
				<span>단독주택</span>
				</c:if>
				<c:if test = "${view.building_case_no == 3}" >
				<span>연립주택</span>
				</c:if>
				<span>${item[10]}</span>
			</div>
			<!-- 유형 끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 편의시설 -->
			<div class="facility">
				<h3>편의 시설</h3>
				<span > 
				<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 19px; width: 19px; fill: currentcolor;"><path d="m12 15a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0 5a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm5.92-5.78a.5.5 0 1 1 -.84.55c-1.19-1.81-3.07-2.77-5.08-2.77s-3.89.96-5.08 2.78a.5.5 0 0 1 -.84-.55c1.38-2.1 3.58-3.23 5.92-3.23s4.54 1.13 5.92 3.23zm2.98-3.03a.5.5 0 1 1 -.79.61c-1.66-2.14-5.22-3.8-8.11-3.8-2.83 0-6.26 1.62-8.12 3.82a.5.5 0 0 1 -.76-.65c2.05-2.42 5.75-4.17 8.88-4.17 3.19 0 7.05 1.8 8.9 4.19zm2.95-2.33a.5.5 0 0 1 -.71-.02c-2.94-3.07-6.71-4.84-11.14-4.84s-8.2 1.77-11.14 4.85a.5.5 0 0 1 -.72-.69c3.12-3.27 7.14-5.16 11.86-5.16s8.74 1.89 11.86 5.16a.5.5 0 0 1 -.02.71z" fill-rule="evenodd"></path></svg>
				 <span> ${item.get(1)}</span>
				  <br>
				  <svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 19px; width: 19px; fill: currentcolor;"><path d="m23.99 18.38-.5-2a .5.5 0 0 0 -.49-.38h-22a .5.5 0 0 0 -.49.38l-.5 2a .5.5 0 0 0 .49.62h23a .5.5 0 0 0 .49-.62zm-1.13-.38h-21.72l.25-1h21.22zm-21.36-3h21a .5.5 0 0 0 .5-.53c-.21-3.22-1.22-5.47-3-5.47a4911.8 4911.8 0 0 0 -8.8 0h-1.71c-.2 0-.26-.08-.19-.27a9.59 9.59 0 0 1 .17-.48c.13-.34.27-.68.43-1 .41-.79.82-1.25 1.1-1.25h10.5c.87 0 1.43-.7 1.4-1.52s-.64-1.48-1.55-1.48h-11.35c-3.84 0-7.29 4.4-8.99 11.38a.5.5 0 0 0 .49.62zm8.5-11h11.35c.35 0 .55.21.56.52.01.29-.14.48-.4.48h-10.51c-.8 0-1.42.68-1.99 1.8a10.74 10.74 0 0 0 -.65 1.61c-.31.82.23 1.59 1.13 1.59h1.71a33801.74 33801.74 0 0 1 8.8 0c .94 0 1.71 1.58 1.95 4h-19.8c1.65-6.21 4.7-10 7.85-10zm5 8a1 1 0 1 1 2 0 1 1 0 0 1 -2 0zm3 0a1 1 0 1 1 2 0 1 1 0 0 1 -2 0z" fill-rule="evenodd"></path></svg>
				 <span> ${item.get(2)}</span> 
				  <br> 
				<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 19px; width: 19px; fill: currentcolor;"><path d="M22.5 23H21V1h1.5a.5.5 0 0 0 0-1H.5a.5.5 0 1 0 0 1H2v22H.5a.5.5 0 1 0 0 1h22a.5.5 0 0 0 0-1zM11 3v20H3V1h8v2zm9 20h-8V1h8v22zM4.146 10.854a.5.5 0 0 1 0-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 1 1-.708.708L7 9.707V14.5a.5.5 0 0 1-1 0V9.707l-1.146 1.147a.5.5 0 0 1-.708 0zm10 2a.5.5 0 1 1 .708-.708L16 13.293V8.5a.5.5 0 1 1 1 0v4.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2z" fill-rule="evenodd"></path></svg>
				 <span> ${item.get(3)}</span>
				  <br> 
				<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 19px; width: 19px; fill: currentcolor;"><path d="m5 3.5a1.5 1.5 0 1 0 -3 0 1.5 1.5 0 0 0 3 0zm-1.5.5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm4 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm0-2a .5.5 0 1 1 0 1 .5.5 0 0 1 0-1zm4.5 3c-4.41 0-8 3.59-8 8s3.59 8 8 8 8-3.59 8-8-3.59-8-8-8zm0 15c-3.86 0-7-3.14-7-7s3.14-7 7-7 7 3.14 7 7-3.14 7-7 7zm9.5-21h-19a2.51 2.51 0 0 0 -2.5 2.5v19c0 1.38 1.12 2.5 2.5 2.5h19c1.38 0 2.5-1.12 2.5-2.5v-19c0-1.38-1.12-2.5-2.5-2.5zm1.5 21.5c0 .83-.68 1.5-1.5 1.5h-19c-.83 0-1.5-.68-1.5-1.5v-19c0-.83.68-1.5 1.5-1.5h19c .83 0 1.5.68 1.5 1.5zm-6.17-6.12a.5.5 0 0 1 .04.71 2.49 2.49 0 0 1 -.63.48c-1.15.65-2.67.65-4.49-.38-1.52-.85-2.66-.85-3.51-.38a1.57 1.57 0 0 0 -.37.27.5.5 0 1 1 -.75-.66 2.49 2.49 0 0 1 .63-.48c1.15-.65 2.67-.65 4.49.38 1.52.85 2.66.85 3.51.38a1.57 1.57 0 0 0 .37-.27.5.5 0 0 1 .71-.04zm0-3.5a.5.5 0 0 1 .04.71 2.49 2.49 0 0 1 -.63.48c-1.15.65-2.67.65-4.49-.38-1.52-.85-2.66-.85-3.51-.38a1.57 1.57 0 0 0 -.37.27.5.5 0 1 1 -.75-.66 2.49 2.49 0 0 1 .63-.48c1.15-.65 2.67-.65 4.49.38 1.52.85 2.66.85 3.51.38a1.57 1.57 0 0 0 .37-.27.5.5 0 0 1 .71-.04z" fill-rule="evenodd"></path></svg>
				 <span> ${item.get(8)}</span> 
				  <br> 
				</span>
			</div>
			<a href="#modalLayer" class="modalLink">편의시설 더 보기</a>
			<div id="modalLayer">
 			 <div class="modalContent">
    			<a href="#">모든 편의 시설</a> 
    			<button type="button">닫기</button>
 			 </div>
			</div>
			<!-- 편의시설 끝 -->
		<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 예약 달력 -->
			
			<div>
			<input id="start" name ="stay_start" type="text" data-language="en"class="datepicker-here" placeholder="체크인"/>
      		 <input id="end" name ="stay_end" type="text"  data-language="en"class="datepicker-here" placeholder ="체크아웃"/>
			</div>
			<!-- 달력 끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 후기 -->
				
				
				<c:if test = "${login }">
				<div style="border: 1px solid; width: 600px; padding: 5px">
   				 <form name = "replyform" action="lodgereview" method="post">
        		<input type="hidden" name="lodge_no" value="<c:out value="${view.lodge_no}"/>"> 
        		<input type="hidden" name = "mem_no" value="${member.mem_no }"> 
      			  <textarea id ="contents" name="contents" rows="5" cols="60" placeholder="후기를 작성해주세요"<c:out value="${reply.contents}"/>></textarea>
       			 <a href ="#" onclick="fn_formSubmit()">저장</a>  				 
       			  </form>
				</div>
				</c:if>	
<!-- 				<div id = "replyList"> -->
<%-- 				 <c:forEach var="replylist" items="${replylist}" varStatus="status"> --%>
<!--  				<a href="/users/show/61727682" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false"> -->
<!--  				<img class="user_img" src="https://a0.muscache.com/im/pictures/user/f4118b8f-179e-4655-9185-c2d2693b53a6.jpg?aki_policy=profile_x_medium" height="48" width="48" alt="Hyun님의 사용자 프로필" title="Hyun님의 사용자 프로필"> -->
<!--  				</a> -->
<%--  				<div id="replyItem <c:out value ="${reply.comment_no}"/>"> --%>
<%--  				<c:out value = "${reply. mem_name}"/><c:out value ="${reply.written_time }"/> <!-- 작성자, 작성 시간 --> --%>
<%--  				<a href="#" onclick="fn_replyDelete('<c:out value="${reply.comment_no}"/>')">삭제</a> --%>
<%--    				<a href="#" onclick="fn_replyUpdate('<c:out value="${reply.comment_no}"/>')">수정</a> --%>
<%--    				<a href="#" onclick="fn_replyReply('<c:out value="${reply.comment_no}"/>')">댓글</a> --%>
<!--  				</div> -->
<%--  				</c:forEach> --%>
<!--  				</div>	 -->
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
