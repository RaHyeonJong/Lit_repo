<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<!-- 데이트 피커 -->
<link href="/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="/resources/dist/js/datepicker.min.js"></script>
	<!-- Include English language -->
<script src="/resources/dist/js/i18n/datepicker.en.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num--;
	if(num<=0){
	num =1;
	}
	$('#numberUpDown').text(num);
		
// 	$.ajax({
		
// 		url : "/lodge/reservation",
// 		type : "get",
// 		data : {"stay_cost": num },
// 		dataType : "json",
// 		success :function(data){
// 			console.log(data);
// 		}
		
// 	});
	
	
	});
	
	
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num++;

	if(num>5){
	alert('더이상 늘릴수 없습니다.');
	num=5;
	}
	$('#numberUpDown').text(num);
	
	
	});
	
	
	var $start = $('#start'),
		$end = $('#end');
	
	
	$("#search").on("click", function(){
		var stay_start = $('#start').val(),
			stay_end = $('#end').val()
			 // 숙박 가격	
	
			if(stay_start == "" || stay_end ==""){
				alert("날짜를 선택해 주세요");
				return;
			} 
			 
		
		cost = ${view.stay_cost };
		
		$.ajax({
		type : "post",
		url : "search",
			data :{ "stay_cost" : cost , "start" : stay_start, "end" : stay_end},
		dataType:"json",
		success: function(mav) {
		
			console.log(mav);
			$("#stay_cost").html(mav.add);
	
			}
			
		});
		
	});
	
	});


</script>
<script type="text/javascript">
$(document).ready(function(){
	var myDatepicker = $('#start').datepicker().data('datepicker');
	var myDatepicker = $('#end').datepicker().data('datepicker');
	
});


</script>
<script type="text/javascript">



</script>


<style>
	.nav_side div { padding: 0; } /* 오류나면 수정 */
/* 	ul li { list-style: none; }  74오류나면 수정*/
	.nav_side { position: absolute; top: 75%; left:60%; min-width:500px; heigth:800px;}
	.nav_side div { height: 30px; padding: 5px;  margin: 5px 0; list-style: none;}
	a{text-decoration : none; color:#000;}
	label{ vertical-align: middle; margin-left: -3px;}



</style>
</head>
<body>


<div class="nav_side">
		
		<div><span  id = "stay_cost"><c:out value = "${view.stay_cost }"/></span>원/박</div>
		<div id ="date">날짜<br>
		
		
      		 <div  id = "picker" class = "form-control">
			<input type = "hidden" id ="stay_cost2" name = "stay_cost" value = "<c:out value = "${view.stay_cost }"/>">
      		 <input id="start" name ="stay_start" type="text"  data-language="en" placeholder ="체크인"/>
      		 <input id="end" class = "form-control" name ="stay_end" type="text"  data-language="en"placeholder ="체크아웃"/>
      		 <button id = "search">검색</button>
			</div>
		</div>
		
		<br><br>	
		<div class="number">성인<a href="#" id="decreaseQuantity">-</a><span id="numberUpDown">1</span><a href="#" id="increaseQuantity">+</a></div>
	
	<button id = "reserBtn">예약 요청</button>
</div>
  			
  			
<div>

</div>








</body>
</html>