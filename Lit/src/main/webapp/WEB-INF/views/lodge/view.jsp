<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
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
          var stay_start = $('#start').val(),
         	 stay_end = $('#end').val();

			$.ajax({
    		type : "post",
    		url : "/lodge/view",
	   		data :{ start : stay_start , end : stay_end},
    		dataType:"json",
    		success: function(e) {
    			var disabledDays = [${abc}];
    			console.log(e);
    			$start.datepicker({
    			       language: 'en',
    			       onRenderCell: function (date, cellType) {
    			           if (cellType == 'day') {
    			               var day = date.getDay(),
    			                   isDisabled = disabledDays != -1;

    			               return {
    			                   disabled: isDisabled
    			               }
    			           }
    			       }
    			   });
    		}
    		, error : function(){
    			console.log("실패");
    		}
    		
    	});	
			
         
         
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
<br>
<br>

<h1> 데이트 피커 ajax 테스트</h1>
<!--  	<form action="/lodge/view" method="get">  -->
 	
 	<input id="start" name ="stay_start" type="text" data-language="en"class="form-control"/>
       <input id="end" name ="stay_end" type="text"  data-language="en"class="form-control"/>
		<button id ="update" >예약하기</button>
<!-- 	</form> -->



<!-- content 끝 -->
</div>

<!-- wrapper 끝 -->
</div>



</body>
</html>