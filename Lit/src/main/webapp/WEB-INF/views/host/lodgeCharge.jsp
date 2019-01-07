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

<script>
$(document).ready(function(){
	
//		기본요금부분	
$("#inputCharge").focusout(function(){
	
	

		 if(document.getElementById("inputCharge").value <10000 ){
			 
		     $('#checkCharge').html('<p style="color:red">다시 입력해주세요</p>');
			 
			 
		 }else{
			 
			 $('#checkCharge').html('<p style="color:blue">정상적으로 입력하셨습니다</p>');
			 
		 }
		 

	

		});
//기본요금 끝		


	$("#nextButton").click(function(){
			var option1=$("#check_in_hour").val();
			var option2=$("#check_in_min").val();
			var option3=$("#inputCharge").val();
			var option4;

		
			$.ajax({
			 type: 'POST',
            url: '/host/lodgeCharge',
            dataType: "json",
            data: {
                "check_in_hour" : option1, 
                "check_in_min":option2,
                "stay_cost" : option3

            },
            success: function(data){	
            console.log("성공");
            option4 = data.lodge_no;
            window.location.href="/host/hostFirst?lodge_no="+option4;
         
            
           
            },
            error : function(data){
           	 console.log("실패");
        	 
            }
	
			});
			
	
			
	});

		
		
	});
	
	
	

</script>
<style type="text/css">

#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;
}

.left { width: 50%; float: left; }
.right {.width: 50%; float: right; height:500px; }

</style>
</head>
<body>

<div id="wrapper">
	<div class="left" style="border:1px solid red;">
	 <div class="innerleft">
		<div class="content1">
			<h4>숙소의 요금을 설정해주세요</h4>
		</div>
		<div class="content2">
			<div>기본요금을 입력해주세요</div>
			<input type="text" id="inputCharge" name="stay_cost" />
			<div id="checkCharge"></div>
			<button>권장요금 : 45000원</button>
		</div>
		<div class="content3">
			<div>
				<h4>체크인 시간과 체크아웃 시간을 설정해주세요</h4>
				
					<label>체크인시간</label><br>
					<select id="check_in_hour" name="check_in_hour">
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
					</select>
					<label>분</label>
					<select id="check_in_min" name="check_in_min">
						<option value="00">00</option>
						<option value="30">30</option>
					</select>
					<br>
					<br>
					<label>체크아웃시간</label>
					<br>
					<select id="check_out_hour" name="check_out_hour">
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
					</select>
					<label>분</label>
					<select id="check_out_min" name="check_out_min">
						<option value="00">00</option>
						<option value="30">30</option>
					</select>
					
					
					<div class="move-button">
						<button id="backButton" class="back">뒤로</button>
						<button id="nextButton" class="continue">1단계완료</button>
					</div>
				
			</div>
		</div>
		
		
	 </div><!-- inner end -->
	</div><!-- left end -->
	<div class="right" style="border:1px solid blue;">
	</div>



</div>

</body>
</html>
