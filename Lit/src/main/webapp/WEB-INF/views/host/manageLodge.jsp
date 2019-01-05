<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>풀캘린더</title>
<style type="text/css">
#wrapper { 
         margin :40px 10px; 
         padding : 0; 
         font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif; */
         font-size : 14px; 
     } 
#calendar {
        max-width : 900px;
        margin : 0 auto;
    }

.selectShow{
	margin: 0 auto;

}
</style>
<link href="/resources/fullcalendar/fullcalendar.css" rel="stylesheet"/>
<link href="/resources/fullcalendar/fullcalendar.min.css" rel="stylesheet"/>
<link href="/resources/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/resources/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="/resources/fullcalendar/lib/jquery.min.js"></script>
<script type="text/javascript" src="/resources/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript">





    $(document).ready(function() {
    	var countNum = 0;
    	
    	
    	
    	
        $("#calendar").fullCalendar({
        	
              defaultDate : '${today}'  //처음 들어가면 오늘날짜로 설정
//             , selectable : true //클릭가능하게 설정
            , dragable: false
            , editable : true
            , eventLimit : true
            , dayNamesShort: ["일","월","화","수","목","금","토"]
        	, monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
        	, monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
        	, dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"]
			, titleFormat : "YYYY MMM" //왼쪽상단 년월로 표시
			, buttonText : { today: "오늘"} //오른쪽상단 버튼이름 
			, dayClick :  function(date, jsEvent, view){
//클릭했을때 컨트롤러로 해당클릭날짜 전송
					console.log("0");
					++countNum;
					if(countNum == 1){
						$(this).css('background-color', 'white');
						console.log("1");
				
						
						
					}else if(countNum == 2){
						$(this).css('background-color', '#ff9f89');
						console.log("2");
						countNum = 0;
					}
			}
			
		      
			
			
		
        });
        
        $("#backButton").click(function(){
    		location.href="/host/otherUse";
    	});
    	
    	$("#nextButton").click(function(){
    		location.href="/host/lodgeCharge";
    		
    	});
        
      //달력설정끝 
    	
      	
      
		$("#selectShowMonth").click(function(){
			var option = $('#selectShowMonth').val();
			console.log(option);
			console.log("${today}");
			

			$.ajax({
			 type: 'POST',
             url: '/host/manageLodge',
             dataType: "json",
             data: {
                 "selectShowMonth" : option 
             },
             success: function(data){	
             console.log(data.testDate);
             
             $('#calendar').fullCalendar('removeEvents');
             
             var events = [
            	    {   
            	    	
            	    	start: '${today}',
        		        end: data.testDate,
        		        rendering: 'background',
        		        color: '#ff9f89'},
            	    
            	];
             
             $('#calendar').fullCalendar('addEventSource', events); 
             },
             error : function(data){
            	 console.log("실패");
         	 
             }
	
			});
		
		});
    	
      
      
        
        
    });
</script>
<body>
	<div id="wrapper">
		<div class="selectShow" >
			<h4>몇개월동안 숙소를 활성화 시키시겠습니까?</h4>
			<select  id="selectShowMonth" name="selectShowMonth">
				<option value="1">1개월</option>
				<option value="2">2개월</option>
				<option value="3">3개월</option>
				<option value="4">4개월</option>
				<option value="5">5개월</option>
				<option value="6">6개월</option>
			</select>
			<button id="test">확인</button>
		</div>
    	<!-- 캘린더부분 -->
    	<div id="calendar"></div>
    	<div>
    		<button id="backButton" class="back">뒤로</button>
			<button id="nextButton" class="continue">다음</button>
    	
    	</div>
    </div>
</body>
</html>



















