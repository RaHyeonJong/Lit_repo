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
margin-top:20%;


}



</style>
</head>
<body>
<jsp:include page="hostHeader.jsp"></jsp:include>
<div id="wrapper">
	
	
	<div class="left" style="border: 1px solid red;">
	 <div class="innerleft" style="border: 1px solid green; ">
	 	<label>나와랏 : ${lodge_no}</label>
		<div>
			<h2>호스트로 가는길</h2>
		</div>


			
			<div>
				<h3>1단계</h3>
				<button>숙소상세정보등록</button>
			</div>
			<div>
			  	<h3>2단계</h3>
			  	<button id="move-calendar">예약가능날짜설정 및 사진등록</button>
			</div>

		
		</div><!-- inner end -->
	</div><!-- left end -->
	<div class="right" style="border: 1px solid blue;">
	<img src="/resources/images/host/hostFirstImage.png" style="width:550px; height:400px; margin-top:25%;"  />

		
	
	</div>
</div>








</body>
</html>