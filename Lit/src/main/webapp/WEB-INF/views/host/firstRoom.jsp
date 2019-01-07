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
		
	
	
	$("#backButton").click(function(){
		location.href="/host/hostFirst";
	});
	
	$("#nextButton").click(function(){
		
		
		if(document.getElementById('lodge_name').value == ""){
			
			alert("이름을 입력해주세요");
			
		}else{
			$("#room").submit();
	
		}
	});

	$('.minus').click(function () {
		var $input = $(this).parent().find('.inputNumber');
		var count = parseInt($input.val()) - 1;
		count = count < 1 ? 1 : count;
		$input.val(count);
		$input.change();
		return false;
	});
	$('.plus').click(function () {
		var $input = $(this).parent().find('.inputNumber');
		$input.val(parseInt($input.val()) + 1);
		$input.change();
		return false;
	});
	

	
	
});
	
</script>


<style type="text/css">

#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;
}

.category {
padding: 10px;

}
.category > select{
width:190px;
height:40px;
font-size:16px;
font-family: inherit;
font-weight:bold;
-webkit-appearance: none; /* 화살표 없애기 for chrome*/
-moz-appearance: none;    /* 화살표 없애기 for firefox*/
appearance: none;         /* 화살표 없애기 공통*/
background: url('/resources/images/select-arrow.svg') no-repeat 95% 50%; /* 화살표 아이콘 추가 */       
}
}


.lodge-name > input {
width:185px;
height:30px;
font-size:13px;

}

.left { 
width: 50%; 
float: left; 
border:1px solid red;

}

.innerleft{
padding-left:30%;




}
.right {

width: 49%; 

float: right; 
border:1px solid blue;
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

span {
cursor:pointer; 
}
.number{

}
.minus, .plus{
width:20px;
height:20px;
background:#f2f2f2;
border-radius:4px;
padding:8px 5px 8px 5px;
border:1px solid #ddd;
display: inline-block;
vertical-align: middle;
text-align: center;
}
.inputNumber{
height:34px;
width: 50px;
text-align: center;
font-size: 26px;
border:1px solid #ddd;
border-radius:4px;
display: inline-block;
vertical-align: middle;
}

h3{
color:#8c8c8c;

}
.right1-1{
width:55%;
border:1px solid green;
padding : 10px;
margin:100px 10px 10px 10px;

}
			

</style>
</head>
<body>

<div id="wrapper">
	<div class="left" >
	 <div class="innerleft">
	  
		<div class="category content2_1">
			<h2>호스트의 숙소 정보를 입력해주세요</h2>
		</div>
		<form id = "room" action = "/host/firstRoom" method="post">
		<div class="category content2_2">
			<h3>건물 유형을 선택해주세요</h3>

			<select id ="building_no" name = "building_case_no">
				<option>건물유형</option>
				<option  value="1">아파트</option>
				<option	 value="2">단독주택</option>
				<option  value="3">연립주택</option>
			</select>
		</div>
		<div class="category content2_3">
			<h3>숙소 유형을 선택해주세요</h3>

			<select id= "lodge_case" name = "lodge_case_no">
				<option>숙소유형</option>
				<option value="1">팬션</option>
				<option value="2">모텔</option>
				<option value="3">게스트하우스</option>
			</select>
		</div>
		
		<div class="lodge-name category" >
			<h3>숙소 이름을 입력해주세요</h3>
			<input class="inputName" id="lodge_name" name= "lodge_name" type="text" style="width:185px;height:30px;font-size:13px;"/>
		
		</div>
		<div class="category content2_5">
			<h3>숙소의 방개수를 선택해주세요</h3>
				<div class="number">
					<span class="minus">-</span>
					<input id="inputRoomNum" name = "lodge_room" class="inputNumber" type="text" value="1"/>
					<span class="plus">+</span>
				</div>
		</div>
		<div class="category content2-4">
			<h3>가능 인원을 선택해주세요</h3>
				<div class="number">
					<span class="minus">-</span>
					<input id="inputCapacity" name= "Lodge_capacity" class="inputNumber" type="text" value="1"/>
					<span class="plus">+</span>
				</div>
		</div>
	</form>
		<div class="cut"></div>
		<div class="move-button content2_6">
			<button id="backButton" class="back">뒤로</button>
			<button id="nextButton" class="continue">다음</button>
		</div>
		
	 </div><!-- inner end -->
	</div><!-- left end -->
	<div class="right" >
		<div class="right1-1">
			<img src="/resources/images/hostPageIcon.svg" />
			<p>건물유형과 숙소유형에 따라서 예약표시가 달라질 수 있으니 꼭 유형을 선택해주세요</p>
			<p>숙소이름은 편하게 적어주시고 가능인원이 확실하지 않으시면 평당 인원수로 선택해주세요</p>
			
		</div>
	</div>



</div>

</body>
</html>

















