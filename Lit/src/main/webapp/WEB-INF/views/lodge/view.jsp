<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
   <link href="/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
        <script src="/resources/dist/js/datepicker.min.js"></script>
        <!-- Include English language -->
        <script src="/resources/dist/js/i18n/datepicker.en.js"></script>
<style>


</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		var $start = $('#start'),
			$end = $('#end');
		
			
		$start.datepicker({
			language : 'en',
			onSelect : function(fd, date){
				$end.data('datepicker')
				.update('minDate',date)
			}
		})
		$end.datepicker({
			language : 'en',
		onSelect : function(fd,date){
			$start.data('datepicker')
			.update('maxDate',date)
		}
		})
		$("#update").click(function(){
			var $start = $('#start').val(),
			$end = $('#end').val();
			
			$("#update").submit();	
			console.log($start);
			console.log($end);
		
		});
	
	});

</script>



<body>
<div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;"> 
<div><!-- header 시작 -->
<c:import url="../layout/header.jsp"/>

</div>

<div><!-- content시작 -->

<br>
<br>
<br>
<br>
<br>
<br>

<h1> 데이트 피커 ajax 테스트</h1>

<form action="/lodge/reservation" method="get">
       <input id="start" name ="date" type="text" data-language="en"class="form-control"/>
       <input id="end" name ="date" type="text"  data-language="en"class="form-control"/>
		<button id ="update" >예약하기</button>
		</form>



<!-- content 끝 -->
</div>

<!-- wrapper 끝 -->
</div>



</body>