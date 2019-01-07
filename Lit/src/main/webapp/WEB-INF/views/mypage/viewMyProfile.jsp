<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="margin-top:20px;">
<table style="width:80%;">
<tr><td style="text-align:center;"><h1 style="display:inline;">${member.mem_name }</h1> <h2 style="display:inline;">님의 프로필입니다.</h2></td></tr>
<tr><td style="text-align:center; padding-top: 30px;">
<c:if test="${member.stored_name ne null }">
<img width="300px" height="300px" style="border:6px solid #999; border-radius:50%;" src="/resources/images/${member.stored_name }"/></c:if>
<c:if test="${member.stored_name eq null }">
<img width="300px" height="300px" style="border:6px solid #999; border-radius:50%;" src="/resources/images/empty_profile_photo.jpg"/></c:if>
</td></tr>
<tr><td style="padding-top:30px;"><div style="border:3px solid #999; border-radius: 5px; min-height:300px; padding:10px; color:#555; font-size:18px;">${member.mem_intro }</div></td></tr>
</table>
</div>











