<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


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
	
	
	$("#searchBtn").click(function(){
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

<script type="text/javascript"> //신고


</script>
<script type="text/javascript">
	
	function reservation(){ //비로그인시 예약요청 클릭시 
		
			var modal = document.getElementById("modal-login");
		
			var btn = document.getElementById("reserBtn1");
		
			{
				modal.style.display="block";
			}
	}
		


</script>

<style>
	.nav_side div { padding: 0; } /* 오류나면 수정 */
/* 	ul li { list-style: none; }  74오류나면 수정*/
	.nav_side { position: absolute; top: 694px; left:1050px; min-width:500px; heigth:800px;}
	.nav_side div { height: 30px; padding: 5px;  margin: 5px 0; list-style: none;}
	a{text-decoration : none; color:#000;}
	label{ vertical-align: middle; margin-left: -3px;}

#reportBtn{
	  font-size: 14px;
	  font-family: inherit;
	  background : #ffffff;
/* 	  background : inherit; */
	  border: 0.1em; 
	  border-radius: 4px;
/* 	  padding: 0.333em 1em 0.25em; */
	  line-height: 1.2em;
/* 	  box-shadow: 0 0.25em 1em -0.25em; */
	  cursor: pointer;
	  transition: color 150ms ease-in-out, background-color 150ms ease-in-out, transform 150ms ease-in-out;
	  outline: 0;
/* 	  margin: 5em 0; */
}
#reportBtn:hover {
  color: indianred;
}
#reportBtn:active {
  transform: scale(0.95);
}
#reportBtn.selected {
  color: #FFF;
  background-color: indianred;
  border-color: indianred;
}
#reportBtn .heart-icon {
  display: inline-block;
  fill: currentColor;
  width: 0.8em;
  height: 0.8em;
  margin-right: 0.2em;
}


#searchBtn{ 
  margin-left : 5px;
  padding: 14px 0;
  border: 2px #4eab75 solid;
  background-color: #4da973;
  cursor: pointer;
  font-family: "Montserrat", "helvetica neue", helvetica, arial, sans-serif;
  font-size: .9em;
  text-transform: uppercase;
  transition: color 0.4s, background-color 0.4s;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  border-radius: 2px;
  display: inline-block;
  vertical-align: middle;
  line-height: 0em;
  outline: none;
  text-align: center;
  text-decoration: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  width: 210px;
  top: 50%;
  left: 50%;
  width: 60px;
  color: white;
  }
#reserBtn{ 
  margin-left : 10px;
  padding: 14px 0;
  border: 2px #4eab75 solid;
  background-color: #4da973;
  cursor: pointer;
  font-family: "Montserrat", "helvetica neue", helvetica, arial, sans-serif;
  font-size: .9em;
  text-transform: uppercase;
  transition: color 0.4s, background-color 0.4s;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  border-radius: 2px;
  display: inline-block;
  vertical-align: middle;
  line-height: 0em;
  outline: none;
  text-align: center;
  text-decoration: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  width: 210px;
  top: 50%;
  left: 50%;
  width: 120px;
  color: white;
  }


</style>
</head>
<body>


<div class="nav_side">
		
		<div>&nbsp;<span  id = "stay_cost"><fmt:formatNumber type ="number" pattern="###,###" value = "${view.stay_cost }"/></span>원/박</div>
		<div id ="date"><font size="4px">&nbsp;&nbsp;날짜</font><br>
      		 <div  id = "picker">
			<input type = "hidden" id ="stay_cost2" name = "stay_cost" value = "<c:out value = "${view.stay_cost }"/>">
      		 <input id="start" name ="stay_start" type="text"  data-language="en" placeholder ="체크인"/>
      		 <input id="end" class = "form-control" name ="stay_end" type="text"  data-language="en"placeholder ="체크아웃"/>
      		
		
		
		<br>	
		<div id ="people" class="number"><font size="4px">성인</font> &nbsp; <a href="#" id="decreaseQuantity"><i class="fas fa-minus"></i></a>
		<span id="numberUpDown"style="font-size: 24px;margin: 0 5px 0 0;">1</span><a href="#" id="increaseQuantity"><i class="fas fa-plus"></i></a>
		<input type = "hidden" id ="stay_cost2" name = "stay_cost" value = "<c:out value = "${view.stay_cost }"/>">	
		<button id = "searchBtn">검색</button>
		
		</div>
		
		
		
		<div id ="total">
		<p id = "cost"></p>
		<p id = "service"></p>
		<p id="sum"></p>
		<c:if test="${not login }">
		<button id = "reserBtn" onclick="reservation()">예약 요청</button>
		</c:if>
		
		<c:if test="${login }">
		<button id = "reserBtn">예약 요청</button>
		</c:if>
		
		<div style = "margin-top: 10px;">
		<button id = "reportBtn" onclick="report()"><i class="far fa-flag"></i> 숙소 신고하기</button> 
		</div>
		</div><!-- 토탈 -->
		</div><!-- 사람수 -->
		</div>

</div>
  			
<div>

</div>








</body>
</html>