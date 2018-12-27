<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UFT-8">
<title>Life is Trip 인생은 여행이다</title>
</head>
<body><div id="wrapper">
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<div style="margin-top:20px; padding:2% 20% 0 20%;">
<table style="width:100%;">
<tr><td style="text-align:center;"><h1 style="display:inline;">${other.mem_name }</h1> <h2 style="display:inline;">님의 프로필입니다.</h2></td></tr>
<tr><td style="text-align:center; padding-top: 30px;">
<c:if test="${other.stored_name ne null }">
<img width="300px" height="300px" style="border:6px solid #999; border-radius:50%;" src="/resources/images/${other.stored_name }"/></c:if>
<c:if test="${other.stored_name eq null }">
<img width="300px" height="300px" style="border:6px solid #999; border-radius:50%;" src="/resources/images/empty_profile_photo.jpg"/></c:if>
</td></tr>
<tr><td style="text-align:right;"><button>쪽지보내기</button><button>신고하기</button></td></tr>
<tr><td><div style="border:3px solid #999; border-radius: 5px; min-height:300px; padding:10px; color:#555; font-size:18px;">${other.mem_intro }</div></td></tr>
</table>
</div>
</div>
</body>
</html>