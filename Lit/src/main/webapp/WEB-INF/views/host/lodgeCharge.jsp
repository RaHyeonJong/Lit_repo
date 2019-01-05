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
$("#inputCharge").click(function(){

		$.ajax({
			 type: 'POST',
             url: '/host/lodgeCharge',
             data: {
                 "inputCharge" : $('#inputCharge').val()
             },
             success: function(data){
             console.log("성공");
             console.log(data);
            
             if(data == 1){
                
            	 console.log(data);
                 $('#checkCharge').html('<p style="color:red">다시 입력해주세요</p>');
             }else{
            	 console.log(data);
            	 $('#checkCharge').html('<p style="color:blue">정상적으로 입력하셨습니다</p>');
           
             }
              
             },
             error : function(data){
            	 console.log("실패");
         	 
             }
	
			});
		
		});
//기본요금 끝		


		
		
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
		<div>
			<h4>숙소의 요금을 설정해주세요</h4>
		</div>
		<div>
			<div>기본요금을 입력해주세요</div>
			<input type="text" id="inputCharge" name="inputCharge" />
			<div id="checkCharge"></div>
			<button>권장요금 : 45000원</button>
		</div>
	
		

	</div>
	<div class="right" style="border:1px solid blue;">
	</div>



</div>

</body>
</html>
