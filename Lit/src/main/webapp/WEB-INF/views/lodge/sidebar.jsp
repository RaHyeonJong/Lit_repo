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
	
	});
	
	
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	
// 		parseInt(stat,10);
		num++;

	if(num>"${view.lodge_capacity}"){
	alert('더이상 늘릴수 없습니다.');
	num= ${view.lodge_capacity};
	}
	$('#numberUpDown').text(num);
	
	
	});
	
	
	
	var $start = $('#start'),
		$end = $('#end');
	
	
	
	 $start.datepicker({
		language : 'en',
		minDate : new Date(),
		onSelect : function(fd, date){
			$end.data('datepicker')
			.update('minDate',date)
		}
	})
	 $end.datepicker({
		language : 'en',
		minDate : new Date(),
	onSelect : function(fd,date){
		$start.data('datepicker')
		.update('maxDate',date)
	}
	})
	
	
	$("#search").click(function(){
		var stay_start = $('#start').val(),
			stay_end = $('#end').val(),
			num = $('#numberUpDown').text(),
			lodge_no = "${view.lodge_no}",
			cost = ${view.stay_cost };
			 // 숙박 가격	
	
			 console.log(num);
			 
			if(stay_start == "" || stay_end ==""){
				alert("날짜를 선택해 주세요");
				return;
			} 
		
		$.ajax({
		type : "post",
		url : "search",
			data :{ "stay_cost" : cost , "start" : stay_start, "end" : stay_end, "person" : num, "lodge_no" : lodge_no},
		dataType:"html",
		success: function(mav) {
		
			console.log(mav);
			document.getElementById("total").innerHTML = mav;
// 			$("#stay_cost").html(mav.add);
// 			$("#cost").html(mav.st);
// 			$("#service").html(mav.ser);
// 			$("#sum").html(mav.total);
// 			 $("#reserBtn").click(function(){
// 					location.href = "/lodge/reservation";
// 				});	
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

$(document).ready(function(){
	
	

	
	
	
	
});


</script>


<style>
	.nav_side div { padding: 0; } /* 오류나면 수정 */
/* 	ul li { list-style: none; }  74오류나면 수정*/
	.nav_side { position: absolute; top: 75%; left:1100px; min-width:500px; heigth:800px;}
	.nav_side div { height: 30px; padding: 5px;  margin: 5px 0; list-style: none;}
	a{text-decoration : none; color:#000;}
	label{ vertical-align: middle; margin-left: -3px;}



</style>
</head>
<body>


<div class="nav_side">
		
		<div><span  id = "stay_cost"><fmt:formatNumber type ="number" pattern="###,###" value = "${view.stay_cost }"/></span>원/박</div>
		<div id ="date">날짜<br>
      		 <div  id = "picker">
			<input type = "hidden" id ="stay_cost2" name = "stay_cost" value = "<c:out value = "${view.stay_cost }"/>">
      		 <input id="start" name ="stay_start" type="text"  data-language="en" placeholder ="체크인"/>
      		 <input id="end" class = "form-control" name ="stay_end" type="text"  data-language="en"placeholder ="체크아웃"/>
      		 <button id = "search">검색</button>
			
		</div>
		
		<br>	
		<div id ="people" class="number">성인<a href="#" id="decreaseQuantity">-</a><span id="numberUpDown">1</span><a href="#" id="increaseQuantity">+</a>
		<input type = "hidden" id ="stay_cost2" name = "stay_cost" value = "<c:out value = "${view.stay_cost }"/>">	
		
		<div id ="total">
		<p id = "cost"></p>
		<p id = "service"></p>
		<p id="sum"></p>
		<button id = "reserBtn">예약 요청</button>
		
		</div><!-- 토탈 -->
		</div><!-- 사람수 -->
		</div>


</div>
  			
  			
<div>

</div>








</body>
</html>