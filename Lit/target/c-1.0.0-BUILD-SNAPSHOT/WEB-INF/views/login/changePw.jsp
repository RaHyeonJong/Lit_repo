<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life Is Trip 인생은 여행이다</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var pw_form1 = /[a-zA-Z]/;
	var pw_form2 = /[0-9]/;
	var pw_form3 = /[~!@#$%^&*+-=?]/;
	
	var valid = false;

	$('#pw').focusout(function(){
		var pw = $('#pw').val();
		
		if(pw.length < 8){
			$('#validDiv').css("color", "red");
			$('#validDiv').html("비밀번호는 최소 8자 이상이어야 합니다.");
			return;
		} else {
			$('#validDiv').html("");
		}
				
		if(!(pw_form1.test(pw) && (pw_form2.test(pw) || pw_form3.test(pw)))){
			$('#validDiv').css("color", "red");
			$('#validDiv').html("비밀번호는 숫자나 특수기호를 최소 1자리 이상 포함해야 합니다.");
			return;
		} else {
			$('#validDiv').css("color", "#03CF5D");
			$('#validDiv').html("사용가능한 비밀번호입니다.");
		}
	});
	$('#submit').click(function(){
		var pw = $('#pw').val();
		var re_pw = $('#re_pw').val();
		
		if(re_pw != pw){
			$('#validDiv2').html("비밀번호가 일치하지 않습니다.");
			return;
		}
		$('#form').attr("onsubmit", "return true");
		$('#form').submit();
	});
});
</script>
</head>
<body><div id="wrapper">
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div style="width:568px; height:468px; margin:5%; text-align: center;">
<form id="form" action="/login/changePw" method="post" onsubmit="return false;">
<input type="hidden" name="mem_id" value="${member.mem_id }"/>
<table style="border-collapse: collapse; border:1px solid #ccc;">
<tr><td style="text-align:left; padding-left:20px;"><h2>비밀번호 재설정</h2></td></tr>
<tr><td style="text-align:left; padding:0 20px 20px 20px; font-size:15px;">비밀번호는 한 개 이상의 기호나 숫자를 포함하여 8자 이상이어야 합니다.</td></tr>
<tr><td style="text-align:left; padding:0 0 5px 20px; font-weight:bold;">비밀번호</td></tr>
<tr><td style="text-align:left; padding-left:20px;"><input type="password" id="pw" name="mem_pw" style="width:478px; height:36px; padding:5px; font-size:20px;"/></td></tr>
<tr><td><div id="validDiv" style="text-align:left; padding:5px 0 5px 20px;"></div></td></tr>
<tr><td style="text-align:left; padding:10px 0 5px 20px; font-weight:bold;">비밀번호 확인</td></tr>
<tr><td style="text-align:left; padding-left:20px;"><input type="password" id="re_pw" style="width:478px; height:36px; padding:5px; font-size:20px;"/></td></tr>
<tr><td><div id="validDiv2" style="text-align:left; padding:5px 0 5px 20px; color:red;"></div></td></tr>
<tr><td style="text-align:left; padding:20px 0 0 20px;">
<button id="submit" style="border:0; outline:0; width:100px; height:50px; font-size:20px; color:white; background-color:#FF5A5F; border-radius:5px; cursor:pointer;">제출</button>
</td></tr>
<tr><td style="text-align:left; padding:10px 0 30px 20px; font-size:15px;">'제출'을 클릭하면 LIFE IS TRIP 서비스 약관과<br> 개인정보 처리방침에 동의하는 것입니다.</td></tr>
</table>
</form>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</div></body>
</html>