<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCouWIJ0KqLSXgPQ-R0zu4ixJlPVMKxHJY&&callback=initMap">
    </script>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

  <script>

      // The following example creates a marker in Stockholm, Sweden using a DROP
      // animation. Clicking on the marker will toggle the animation between a BOUNCE
      // animation and no animation.

      var marker;
	  var map;
	  var geocoder;
	  var locationLat;
	  var locationLng;
	console.log(locationLat);
	  
      function initMap() {	    
    	  locationLat= ${lat};
  	  locationLng= ${lng};

    	  
        map = new google.maps.Map(document.getElementById('map'), {
        
          zoom: 18,
          center: {lat: locationLat , lng: locationLng }
        });
		geocoder = new google.maps.Geocoder();
        marker = new google.maps.Marker({
          map: map,
          draggable: true,
          animation: google.maps.Animation.DROP,
          position: {lat: locationLat, lng: locationLng}
        
        });
        marker.addListener('click', toggleBounce);
        marker.addListener('dragend',function(){
        	showMapPos();
        	showMapAddr();
        	
        });
      }
      function showMapPos(){
    	    var pos=marker.getPosition();

    	    //alert(pos.lat()+"/"+pos.lng());
    	    //return {x:pos.lat(), y:pos.lng()};

    	    document.getElementById("markerX").value = pos.lat();
    	    document.getElementById("markerY").value = pos.lng();

    	    
    	}
      
   // 드래그할 때 맵 중앙 좌표의 주소
      function showMapAddr(){
          geocoder.geocode( { 'location': marker.getPosition()}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                  /*
                  var str="";
                  for(var i=0; i<results[0].address_components.length; i++){
                      str += "/"+results[0].address_components[0].long_name
                  }
                  document.getElementById("txtAddress").innerHTML=str;

                  document.getElementById("txtAddress").innerHTML=results[0].address_components[0].types;
                  */

                  
                  var str="";
                  for(var i=3; i>=0; i--){
                      str += " "+results[0].address_components[i].short_name;
                  }
                  document.getElementById("txtAddress").value=str;
                  //document.getElementById("txtAddress").innerHTML=results[0].address_components[0].long_name;
                  

              } else {
                  alert("Geocode was not successful for the following reason: " + status);
              }
          });
      }

      function toggleBounce() {
        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      }
      
 
      
      
    </script>
<script type="text/javascript">
$(document).ready(function(){
	$("#backButton").click(function(){
		
		location.href="/host/firstLocation";
		
	});
	
	$("#nextButton").click(function(){
		
		location.href="/host/firstConveniences";
	});
	


	
});

</script>
<style type="text/css">

#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;
}

.left { 
width: 50%; 
float: left; 
}
.innerleft{
padding-left:30%;

}
.right {
width: 49%; 
float: right; 
}


#map {

height: 300px;
width: 400px;
margin-left:10px;
      }
#txtAddress{
width:395px;
height:40px;
margin-left:10px;
}
      /* Optional: Makes the sample page fill the window. */


.move-button{
padding:10px;

}

#nextButton{
text-align:center;
text-decoration:none;
display:inline-block;
border:none;
background-color : #fd5e00;
font-size:16px;
color:white;
transition-duration: 0.4s;
width:60px;
height:40px;
border-radius:5%;
float:right;
  

}
#nextButton:hover{

background-color: #d68e88;
color: white;


}

#backButton{
text-align:center;
text-decoration:none;
display:inline-block;
border:none;
background-color : #fd5e00;
font-size:16px;
color:white;
transition-duration: 0.4s;
width:60px;
height:40px;
border-radius:5%;
float:left;
}

#backButton:hover{
background-color: #d68e88; /* Green */
color: white;
}
.cut{
    height: 1px;
    -webkit-box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    -moz-box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    position: relative;


}
    
</style>
</head>
<body>

<div id="wrapper">
	<div class="left" style="border:1px solid red;">
		<div class="innerleft">
			<div class="category">
				<h3>주소를 확인해주세요</h3>
			</div>
			<div>
				<input type="hidden" id="markerX" value="${lat}"/>
				<input type="hidden" id="markerY" value="${lng}"/>
				<input id="txtAddress" value="${addr}"/> <br>
			</div>
			<br>
			<div id="map"></div>
			<br>
			<div class="cut"></div>
			<div class="move-button">
				<button id="backButton">뒤로</button>
				<button id="nextButton">다음</button>
			</div>	
	 	</div><!-- inner end -->
	</div><!-- left end -->
	<div class="right" style="border:1px solid blue;">
		<div>
			<h3>위치가 정확한지 확인하시고 <br>
			숙소의 위치와 다르다면 마커를 움직여서 재설정해주세요</h3>
		</div>
		
	</div><!-- right end -->


</div><!-- wrapper end -->

</body>
</html>
