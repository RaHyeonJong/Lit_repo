<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDVZshgMFwiPl0L4xp4unmDwNRwlSBI6U8&libraries=places&callback=initAutocomplete"
         async defer></script>
<script type="text/javascript">
function init() {
    var input = document.getElementById('locationTextField');
    var autocomplete = new google.maps.places.Autocomplete(input);
   
    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        var place = autocomplete.getPlace();
        document.getElementById('city2').value = place.name;
        document.getElementById('cityLat').value = place.geometry.location.lat();
        document.getElementById('cityLng').value = place.geometry.location.lng();
    });
}

google.maps.event.addDomListener(window, 'load', init);
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#backButton").click(function(){
		location.href="/host/firstRoom";
	});
	
	$("#nextButton").click(function(){

		  location.href="/host/checkLocation";
			$('#sendLocation').submit();
	
		
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
.right {width: 49%; float: right;}

.category select{
width:190px;
height:40px;
font-size:15px;

}

.category {
padding: 10px;

}

.input_location > input {
width:300px;
height:40px;	
font-size:15px;
}

.content1-4 > input{
width:185px;
height:40px;
font-size:15px;

}

.content1-5 > input{
width:185px;
height:40px;
font-size:15px;

}


.continue{
float:right;
}
.back{
float:left;
}

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
	  <form action="/host/checkLocation" method="GET" id="sendLocation">
		<div class="category content1-1">
			<h2>숙소의 위치를 알려주세요</h2>
		</div>
		
		<div class="category content1-2">
			<h4>지역을 선택해주세요</h4>
			<select>
				<option>서울</option>
				<option>대전</option>
				<option>대구</option>
				<option>부산</option>
				<option>강원도</option>
				<option>경기도</option>
			</select>
		</div>
		<div class="category input_location content1-3">
			<h4>주소를 입력해주세요</h4>
        	<input id="locationTextField" name="addr" type="text" placeholder="ex)광진구 능동로 25길 36" autocomplete="on">
        	<input type="hidden" id="city2" name="city2" />
    		<input type="hidden" id="cityLat" name="cityLat" />
   			<input type="hidden" id="cityLng" name="cityLng" />
		</div>
		<div class="category content content1-4">
			<h4>나머지 주소를 입력해주세요(선택사항)</h4>
			<input type="text" placeholder="ex)1동1호"/>
		</div>

		</form> <!-- form end -->
		<div class="cut"></div>
		<div class="move-button content1-5">
			<button id="backButton" class="back">뒤로</button>
			<button id="nextButton" class="continue">다음</button>
		</div>
	 
	 </div><!-- inner end -->
	</div><!-- left end -->
	<div class="right" style="border:1px solid blue;">
	</div>



</div>

</body>
</html>

















