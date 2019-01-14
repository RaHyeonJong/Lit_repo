<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>예약가능날짜설정</title>
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
	width: 350px;
    margin-left: 120px;
	


}

.explain{
 margin-left: 120px;


}

.content{
width:50%;
margin:0 auto;

}

.move-button{
padding:10px;
width:125px;
float:right;
margin-right:112px;
}



#nextButton{
text-align:center;
text-decoration:none;
display:inline-block;
border:none;
background-color : #c7e700;
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
background-color : #c7e700;
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

#calendar{
width:700px;

}

.selectShow select {
	border-radius:5px;
	 outline:none;
    width: 95px;
    height: 36px;
    border: 0;
    background: #fff url('https://cdn2.iconfinder.com/data/icons/circle-icons-1/64/arrow-down-48.png') no-repeat;
    background-size: 20px;
    background-position:right 10px center;
    font-family: 'Arial';
    padding-left: 24px;
    -webkit-appearance: none;
    -moz-appearance: none;
    border:1px solid #777;
    font-size:15px;
    padding-left:10px;
}

.selectShow button{
height:35px;
text-align:center;
text-decoration:none;
display:inline-block;
border:none;
background-color : #c7e700;
font-size:15px;
color:white;
transition-duration: 0.4s;
width:60px;
border-radius:5%;

}
.selectShow button:hover{
background-color: #d68e88; /* Green */
color: white;
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
    	var test = new Array();
    	var now = new Date();
		var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    	var end_date;
    	var selected_month = 36;
 
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
			, events : [{
				start : '${today }',
				end : '${after3years }',
				rendering : 'background',
				color : '#9BFFD2'
			}]
			, dayClick :  function(date, jsEvent, view){
//클릭했을때 컨트롤러로 해당클릭날짜 전송				
				var element = $(this);
				var color = $(this).css('background-color');				
				var lodge_no = ${lodge_no };
				var selected_date = date.format();
				
				end_date = new Date(now.getFullYear(), now.getMonth()+selected_month, now.getDate());
				
				if(date < today || date > end_date)
					return false;
				
				
				if( color != "rgb(255, 50, 50)"){			
					console.log("color : "+ color);
					$.ajax({
						type: 'post',
						url: '/host/selectDayoff',
						dataType: 'json',
						data: {"lodge_no" : lodge_no, "selected_date" : selected_date, "act" : "insert"},
						success: function(data){
							console.log("성공");
							element.css('background-color', '#FF3232');
						},
				        error : function(data){
							console.log("실패");
				         	 
				        }	
					});
					
				} else {
					console.log("color : "+ color);
					
					$.ajax({
						type: 'post',
						url: '/host/selectDayoff',
						dataType: 'json',
						data: {"lodge_no" : lodge_no, "selected_date" : selected_date, "act" : "delete"},
						success: function(data){
							console.log("성공");
							element.css('background-color', 'white');
						},
				        error : function(data){
							console.log("실패");
				         	 
				        }	
					});
				}
				
			}
			
        });
        
        $("#backButton").click(function(){
    		location.href="/host/otherUse";
    	});
    	
    	$("#nextButton").click(function(){
    		$('#sendMonth').click();
    		location.href="/host/addview?lodge_no="+${lodge_no};
    		
    	});
        
      //달력설정끝 
    	
      	
      
		$("#sendMonth").click(function(){
			var lodge_no = ${lodge_no};
			selected_month = $('#selectShowMonth').val();


			$.ajax({
				type: 'POST',
             	url: '/host/manageLodge',
             	dataType: "json",
             	data: {
					"selectShowMonth" : selected_month,
                 	"lodge_no" : lodge_no
             	},
             	success: function(data){
					$(".fc-day").css('background-color', 'white');

             		console.log(data.testDate);

             		$('#calendar').fullCalendar('removeEvents');
             		var events = [{   
						start: '${today}',
        		        end: data.testDate,
        		        rendering: 'background',
        		        color: '#9BFFD2'
					}];
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
	 <div class="content">
		<div class="selectShow" >
			<h4>몇개월동안 숙소를 활성화 시키시겠습니까? ${testDate}</h4>
			<select  id="selectShowMonth" name="selectShowMonth">
				<option value="3">3개월</option>
				<option value="6">6개월</option>
				<option value="9">9개월</option>
				<option value="12">12개월</option>
				<option value="24">24개월</option>
				<option value="36" selected>36개월</option>
			</select>
			<button id="sendMonth">확인</button>
		</div>
		<br>
		<div class="explain">
			<h4>비활성 날짜를 클릭하여 설정해주세요</h4>
		
		</div>
		<br>

    	<!-- 캘린더부분 -->
    	<div id="calendar"></div>
    	<div class="move-button">
    		<button id="backButton" class="back">뒤로</button>
			<button id="nextButton" class="continue">다음</button>
       	</div>
     </div>
    </div>
</body>
</html>



















