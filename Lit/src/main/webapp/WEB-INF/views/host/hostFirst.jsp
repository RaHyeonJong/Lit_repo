<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1,2단계 선택 및 수정</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#move-calendar").click(function(){
		location.href="/host/manageLodge?lodge_no="+${lodge_no};
	
	});
	
	$("#fix_lodge").click(function(){
		location.href="/host/hostFirstFix?lodge_no="+${lodge_no};
		
		
	});

	
});


</script>
<style type="text/css">
#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;

}

.left { width: 50%; float: left; height:800px;}
.right {width: 49%; float: right; height:800px; }
#nextbutton{
float:right;

}

.innerleft{
margin-top:12%;


}

.lodge-element{
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

.lodge-element:hover{

background-color: #d68e88;
color: white;


}

.lodge-calendar{
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
.lodge-calendar:hover{

background-color: #d68e88;
color: white;


}

label{
font-size:17px;


}

.one{
padding-top:65px;
padding-left:10px;
 font-style: italic

}

.two{
padding-left:10px;
 font-style: italic

}

.title{
padding-left:10px;

}
.div-button{
padding:10px;
}



</style>
</head>
<body>
<jsp:include page="hostHeader.jsp"></jsp:include>
<div id="wrapper">
	
	
	<div class="left" >
	 <div class="innerleft" >

		<div class="title">
			<h2>호스트로 가는길</h2>
		</div>
		<div style="padding-left:10px;">
			<label>등록한 숙소정보를 변경하거나 예약설정과 숙소사진을 등록해주세요</label>
		
		</div>


			
			<div class="one">
				<label>숙소정보, 편의시설</label><br>
						
			</div>
			<div class="div-button">
				<button id="fix_lodge" class="lodge-element">변경</button>
				<hr>
			</div>
			<br>
			<br>
			<div class="two">
			  	<label>예약설정, 사진등록</label><br>
			
			</div>
			<div class="div-button">
				<button id="move-calendar" class="lodge-calendar">설정</button>
			  	<hr>
			</div>

		
		</div><!-- inner end -->
	</div><!-- left end -->
	<div class="right" >
	<img src="/resources/images/host/hostFirstImage.png" style="width:550px; height:400px; margin-top:8%;"  />

		
	
	</div>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>








</body>
</html>