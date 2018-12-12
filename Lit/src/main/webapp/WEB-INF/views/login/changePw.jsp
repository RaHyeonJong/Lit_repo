<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life Is Trip</title>
</head>
<body><div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;">
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div style="width:568px; height:468px; margin:5%; text-align: center;">
<form action="/login/changePw" method="post">
<input type="hidden" name="mem_id" value="${member.mem_id }"/>
<table style="border-collapse: collapse; border:1px solid #ccc;">
<tr><td style="text-align:left; padding-left:20px;"><h2>비밀번호 재설정</h2></td></tr>
<tr><td style="text-align:left; padding:0 20px 20px 20px; font-size:15px;">비밀번호는 한 개 이상의 기호나 숫자를 포함하여 8자 이상이어야 합니다.</td></tr>
<tr><td style="text-align:left; padding:0 0 5px 20px; font-weight:bold;">비밀번호</td></tr>
<tr><td style="text-align:left; padding-left:20px;"><input type="password" name="mem_pw" style="width:478px; height:36px; padding:5px; font-size:20px;"/></td></tr>
<tr><td style="text-align:left; padding:10px 0 5px 20px; font-weight:bold;">비밀번호 확인</td></tr>
<tr><td style="text-align:left; padding-left:20px;"><input type="password" id="re_pw" style="width:478px; height:36px; padding:5px; font-size:20px;"/></td></tr>
<tr><td style="text-align:left; padding:20px 0 0 20px;">
<button style="border:0; outline:0; width:100px; height:50px; font-size:20px; color:white; background-color:#FF5A5F; border-radius:5px;">제출</button>
</td></tr>
<tr><td style="text-align:left; padding:10px 0 30px 20px; font-size:15px;">'제출'을 클릭하면 LIFE IS TRIP 서비스 약관과<br> 개인정보 처리방침에 동의하는 것입니다.</td></tr>
</table>
</form>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</div></body>
</html>