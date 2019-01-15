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
<script type="text/javascript">
$(document).ready(function(){
	$("#move-button").click(function(){
		
		location.href="/host/firstRoom";
		
	});
	

});
</script>

<style type="text/css">
.top{


width:500px;


	
}
h2{
color:white;

}

body{
height:900px;

background-image:url('/resources/images/host/host_image.jpg');
}

#move-button{
background-color:white;
opacity:0.4;
border:2px solid white;
text-align:center;
text-decoration:none;
display:inline-block;
border:none;
font-size:20px;

transition-duration: 0.4s;
width:100px;
height:45px;
border-radius:5%;
font-weight:900;


}

</style>
</head>
<body>
	<div class="top">
		<h2>Life Is Trip에서 호스트를 시작해보세요</h2>
		<button id="move-button">시작하기</button>
	</div>





</body>
</html>