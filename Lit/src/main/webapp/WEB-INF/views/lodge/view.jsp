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
    			
    			
    			$start.datepicker({
    			       language: 'en',
    			       onRenderCell: function(date, cellType) {
    			           if (cellType == 'day' && date.getDate() == 11) { // 이부분을 잘 풀면 될꺼같음, 맨뒤에 11은 매월 11일이 비활성화 된다.
    			        	   // http://t1m0n.name/air-datepicker/docs/ 여기서 도큐먼트 활용하거나 controller에서 스플릿으로 '일'만 잘라서 해야될꺼같음.
    			               return {
    			            	   html: stay_start.split("/"), // Custom cell content 
    			               
    			            	   disabled: true
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