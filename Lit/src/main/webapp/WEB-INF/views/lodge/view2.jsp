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
	
		
// 	 $start.datepicker({
// 		language : 'en',
// 		onSelect : function(fd, date){
// 			$end.data('datepicker')
// 			.update('minDate',date)
// 		}
// 	})
// 	 $end.datepicker({
// 		language : 'en',
// 	onSelect : function(fd,date){
// 		$start.data('datepicker')
// 		.update('maxDate',date)
// 	}
// 	})
	
	 
	
	$("#update").click(function(){
          var stay_start = $('#start').val(),
         	 stay_end = $('#end').val();

			$.ajax({
    		type : "post",
    		url : "/lodge/view",
	   		data :{ start : stay_start , end : stay_end},
    		dataType:"json",
    		success: function(mav) {
    		
    			console.log(mav);
    		
    			// 배열로 전달받은 날짜만 비활성화 시킴  이 var 부분을 전달 받은 값을 다시 넣어주면 될꺼같음
    			var disabledDates =  ['12/12/2018','02/12/2018','31/12/2018','11/12/2018',]
    			$start.datepicker({
    				language: 'en',
    			       onRenderCell: function(d, type) {
    			           if (type == 'day' ) { 
    			               var disabled = false,
    			               formatted = getFormattedDate(d);
    			               disabled = disabledDates.filter(function(date){
    			                 	return date == formatted;
    			                 }).length
    			             
    			       					return {
    			                 	disabled: disabled
    			                 }
    			       }
    			     }
    		
    			   })
    			   //이 부분이 disabled = disabledDates.filter(function(date) 여기 들어가는 데이터 값 반환 시켜주는듯 함
    			
    				function getFormattedDate(date) {
  				  var year = date.getFullYear(),
  				    month = date.getMonth() + 1,
  				    date = date.getDate();
  				    
  				    return date + '/' + month + '/' + year;
  			}
    			
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
 
 
 	<input id="start" name ="stay_start" type="text" data-language="en"class="datepicker-here"/>
       <input id="end" name ="stay_end" type="text"  data-language="en"class="datepicker-here"/>
		<button id ="update" >예약하기</button>


<!-- content 끝 -->
</div>

<!-- wrapper 끝 -->
</div>



</body>
</html>