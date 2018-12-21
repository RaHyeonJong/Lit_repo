<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>



<!-- =================================================================================================== -->

<div>
<table style="width:100%;">
<tr><td><h1>${member.mem_name } 님의 프로필입니다.</h1></td></tr>
<tr><td style="text-align:center;"><img width="300px" style="border:5px solid #999; -webkit-border-radius:160px;" src="/resources/images/${member.stored_name }"/></td></tr>
<tr><td>${member.mem_intro }</td></tr>
</table>
</div>











