<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script> 

   
		<form action="/lodge/reservation" method="post">
		<div id = "total">
		<p id = "cost"><fmt:formatNumber type ="number" pattern="###,###" value="${add}"/>원<input type = "hidden" name ="stay_cost" value = "<c:out value= "${add}"/>"></p>
		<p id = "service"><font>서비스 수수료 </font><fmt:formatNumber type="number" pattern="###,###" value ="${ser }"/>원<input type = "hidden" name ="service_fee" value=" <c:out value= "${ser}"/>"></p>
		<p id="sum"><font>합계 </font><fmt:formatNumber type="number" pattern="###,###" value="${total}"/>원<input type = "hidden" name ="pay_sum" value ="<c:out value= "${total}"/>"></p>
		<input type = "hidden" name = "person" value = "<c:out value ="${person }"/>">
		<input type = "hidden" name = "lodge_no" value = "<c:out value ="${lodge_no }"/>">		
		<input type = "hidden" name = "startDate" value = "<c:out value ="${startDate }"/>">		
		<input type = "hidden" name = "endDate" value = "<c:out value ="${endDate}"/>">		
		<br>
		
		<button id = "reserBtn">예약 요청</button>
		</div>
		</form>
		
		
		