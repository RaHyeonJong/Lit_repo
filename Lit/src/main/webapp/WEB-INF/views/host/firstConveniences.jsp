<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편의시설</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
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
overflow:auto;
 }

.innerleft{
padding-left:30%;
overflow:auto;
height:700px;


}
.right {
width: 49%; 
float: right; 
height:800px;
}

.move-button{
padding:10px;
padding-top:50px;
position: absolute;
margin-top: -30px;
margin-left: 180px;
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

.cut{
    height: 1px;
    -webkit-box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    -moz-box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    box-shadow: 0 -1px 0 rgba(0,0,0,0.08);
    position: relative;
    padding:10px;


}

/* Base for label styling */
[type="checkbox"]:not(:checked),
[type="checkbox"]:checked {
  position: absolute;
  left: -9999px;
}
[type="checkbox"]:not(:checked) + label,
[type="checkbox"]:checked + label {
  position: relative;
  padding-left: 1.95em;
  cursor: pointer;
}

/* checkbox aspect */
[type="checkbox"]:not(:checked) + label:before,
[type="checkbox"]:checked + label:before {
  content: '';
  position: absolute;
  left: 0; top: 0;
  width: 1.25em; height: 1.25em;
  border: 2px solid #ccc;
  background: #fff;
  border-radius: 4px;
  box-shadow: inset 0 1px 3px rgba(0,0,0,.1);
}
/* checked mark aspect */
[type="checkbox"]:not(:checked) + label:after,
[type="checkbox"]:checked + label:after {
  content: '\2713\0020';
  position: absolute;
  top: .15em; left: .22em;
  font-size: 1.3em;
  line-height: 0.8;
  color: #09ad7e;
  transition: all .2s;
  font-family: 'Lucida Sans Unicode', 'Arial Unicode MS', Arial;
}
/* checked mark aspect changes */
[type="checkbox"]:not(:checked) + label:after {
  opacity: 0;
  transform: scale(0);
}
[type="checkbox"]:checked + label:after {
  opacity: 1;
  transform: scale(1);
}
/* disabled checkbox */
[type="checkbox"]:disabled:not(:checked) + label:before,
[type="checkbox"]:disabled:checked + label:before {
  box-shadow: none;
  border-color: #bbb;
  background-color: #ddd;
}
[type="checkbox"]:disabled:checked + label:after {
  color: #999;
}
[type="checkbox"]:disabled + label {
  color: #aaa;
}
/* accessibility */
[type="checkbox"]:checked:focus + label:before,
[type="checkbox"]:not(:checked):focus + label:before {
  border: 2px dotted blue;
}

/* hover style just for information */
label:hover:before {
  border: 2px solid #4778d9!important;
}





</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#backButton").click(function(){
		
		location.href="/host/firstLocation";
		
	});
	
	
	$("#nextButton").click(function(){
		
		var check = $("input[type=checkbox][name=convenient_facility]:checked").val();

		var etc_check = $("input[type=checkbox][name=convenient_area]:checked").val(); 
		
		if(check==null){
			alert("편의시설을 선택해 주세요");
			return;
		}else if(etc_check==null){
			alert("기타시설을 선택해 주세요");
			return;
		}
		
		$('form').submit();

	});
	

	
});
</script>
</head>
<body>
<jsp:include page="hostHeader.jsp"></jsp:include>

<div id="wrapper">
	<div class="left">
		<div class="innerleft">
			<div class="category"><h2>숙소의 편의시설을 선택해주세요</h2></div>
				<form id ="conveniences" action="/host/firstConveniences" method="post">
					<div class="category checkbox-container">
						<p><input name="convenient_facility" value="#무선인터넷" type="checkbox" id="a1"/><label for="a1">무선인터넷</label><br></p>
						<p><input name="convenient_facility" value="#샴푸" type="checkbox" id="a2"/><label for="a2">샴푸</label></p>
						<p><input name="convenient_facility" value="#옷장/서랍장" type="checkbox" id="a3"/><label for="a3">옷장/서랍장</label><br></p>
						<p><input name="convenient_facility" value="#TV" type="checkbox" id="a4"/><label for="a4">TV</label></p>
						<p><input name="convenient_facility" value="#난방" type="checkbox" id="a5"/><label for="a5">난방</label></p>
						<p><input name="convenient_facility" value="#에어컨" type="checkbox" id="a6"/><label for="a6">에어컨</label></p>
						<p><input name="convenient_facility" value="#업무가능공간" type="checkbox" id="a7"/><label for="a7">업무가능공간</label></p>
						<p><input name="convenient_facility" value="#벽난로" type="checkbox" id="a8"/><label for="a8">벽난로</label></p>
						<p><input name="convenient_facility" value="#다리미" type="checkbox" id="a9"/><label for="a9">다리미</label></p>
						<p><input name="convenient_facility" value="#헤어드라이어" type="checkbox" id="a10"/><label for="a10">헤어드라이어</label></p>
						<p><input name="convenient_facility" value="#게스트 전용 출입문" type="checkbox" id="a11"/><label for="a11">게스트 전용 출입문</label></p>
					</div>
				
					
					<div class="category">
						<h2>기타시설을 선택해주세요</h2>		
					</div>
					<div class="category checkbox-container">
					
						<p><input name="convenient_area" value="#수영장" type="checkbox" id="a12" /><label for="a12">수영장</label></p>
						<p><input name="convenient_area" value="#주방" type="checkbox" id="a13"/><label for="a13">주방</label></p>
						<p><input name="convenient_area" value="#세탁실" type="checkbox" id="a14"/><label for="a14">세탁실</label></p>
						<p><input name="convenient_area" value="#주차" type="checkbox" id="a15"/><label for="a15">주차</label></p>
						<p><input name="convenient_area" value="#엘리베이터" type="checkbox" id="a16"/><label for="a16">엘리베이터</label></p>
						<p><input name="convenient_area" value="#욕조" type="checkbox" id="a17"/><label for="a17">욕조</label></p>
						<p><input name="convenient_area" value="#헬스장" type="checkbox" id="a18"/><label for="a18">헬스장</label></p>
					
					</div>
				</form>
			<br>
					
			
		
			
		</div><!-- inner end -->
			<div class="move-button">
				     <div class="cut"></div>
					<button id="backButton">뒤로</button>
					<button id="nextButton">다음</button>
				</div>	
	</div><!-- left end -->
	<div class="right">
	 	<div class="right1-1">
			<img src="/resources/images/hostPageIcon.svg" />
			<p>숙소의 편의시설과 기타시설을 체크해주세요</p>
			<p>하나이상의 시설은 무조건 체크해주셔야합니다</p>
		</div>
	</div>



</div>

</body>
</html>

















