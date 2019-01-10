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

.left { 
width: 50%; 
float: left; 
height:800px;
}
.innerleft{
padding-left:30%;

}
.right {
width: 49%; 
float: right;
height:800px;
}

#inputCharge{
width:185px;
height:30px;
font-size:13px;

}
.move-button{
padding:10px;
padding-top:50px;
position: absolute;
margin-top: 225px;
margin-left: 185px;
background-color: white;
width: 380px;
height: 70px;


}

#nextButton{
text-align:center;
text-decoration:none;
display:inline-block;
border:none;
background-color : #fd5e00;
font-size:16px;
color:white;
transition-duration: 0.4s;
width:60px;
height:40px;
border-radius:5%;
float:right;
  

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
background-color : #fd5e00;
font-size:16px;
color:white;
transition-duration: 0.4s;
width:60px;
height:40px;
border-radius:5%;
float:left;
}

#backButton:hover{
background-color: #d68e88; /* Green */
color: white;
}
.cut{
    height: 1px;
    -webkit-box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    -moz-box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    position: relative;
    padding:10px;


}

.right1-1{
border-radius:10%;
width:55%;
border:1px solid green;
padding : 10px;
margin:250px 10px 10px 50px;

}

.category {
padding: 10px;

}

.coast{
width:150px;
    font-family: inherit;
border:0;
outline:0;
background-color:white;
color:green;
}

.content2-1{
margin-bottom:10px;
font-weight:bold;
}

select{


}
    

</style>
</head>
<body>

<div id="wrapper">
	<div class="left">
	 <div class="innerleft">
		<div class="content1 category">
			<h2>숙소의 요금을 설정해주세요</h2>
		</div>	
		<div class="content2 category">
			<div class="content2-1">기본요금을 입력해주세요</div>
			<input type="text" id="inputCharge" name="stay_cost" />
			<div id="checkCharge"></div>
			<div class="coast">제안요금 : 45000원</div>
		</div>
		<div class="content3 category">
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
					<label>시</label>
					<select id="check_in_min" name="check_in_min">
						<option value="00">00</option>
						<option value="30">30</option>
					</select>
					<label>분</label>
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
					<label>시</label>
					<select id="check_out_min" name="check_out_min">
						<option value="00">00</option>
						<option value="30">30</option>
					</select>
					<label>분</label>
					
					
					
					
					
   		
				
			</div>
		</div>
		
		
	 </div><!-- inner end -->
	   <div class="move-button">
	             <div class="cut"></div>
	              <button id="backButton">뒤로</button>
	              <button id="nextButton">완료</button>
            </div>  
	</div><!-- left end -->
	<div class="right">
		<div class="right1-1">
			<img src="/resources/images/hostPageIcon.svg" />
			<p>건물유형과 숙소유형에 따라서 예약표시가 달라질 수 있으니 꼭 유형을 선택해주세요</p>
			<p>숙소이름은 편하게 적어주시고 가능인원이 확실하지 않으시면 평당 인원수로 선택해주세요</p>
		</div>
	</div>



</div>

</body>
</html>
