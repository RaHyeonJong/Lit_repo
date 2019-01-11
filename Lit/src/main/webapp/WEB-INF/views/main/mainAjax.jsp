<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
 			
			<hr>
			<div class="recommendLodge">
				<div class="h3">
 					<h3>${lodgeComment1 }</h3>
 				</div>
				
				<c:forEach var="list" end="5" items="${lodgeList }">
					<div class="LodgeList" style="width: 15%; display: inline-block;">
						<div class="LodgeList-image">
							<img src="/resources/images/main/recommendLodgeList1.jpg" width="100%" height="100%">
						</div>
						<div>
							<span>${list.lodge_name }</span>
						</div>
						<div>
							<span><fmt:formatNumber type="number" pattern="###,###" value="${list.stay_cost }" />원</span>
						</div> 
					</div>
				</c:forEach>
				
				<div class="h3">
 					<h3>${festivalComment }</h3>
 				</div>
				
				<c:forEach var="list" items="${festivalList }">
					<div class="festivalList" style="width: 24%; display: inline-block;">
						<div class="festivalList-image">
							<img src="/resources/images/festival/${list.stored_name }" width="100%" height="100%">
						</div>
						<div>
							<span>${list.festival_name }</span>
						</div>
						<div>
							<span><fmt:formatDate type="date" pattern="yyyy-mm-dd" value="${list.start_date }" /> ~
							<fmt:formatDate type="date" pattern="yyyy-mm-dd" value="${list.end_date }" /> </span>
						</div> 
					</div>
				</c:forEach>
				
				<div class="h3">
 					<h3>${lodgeComment2 }</h3>
 				</div>
				
				<c:forEach var="list" begin="6" items="${lodgeList }">
					<div class="LodgeList" style="width: 31%; display: inline-block;">
						<div class="LodgeList-image">
							<img src="/resources/images/main/recommendLodgeList1.jpg" width="100%" height="100%">
						</div>
						<div>
							<span>${list.lodge_name }</span>
						</div>
						<div>
							<span><fmt:formatNumber type="number" pattern="###,###" value="${list.stay_cost }" />원</span>
						</div> 
					</div>
				</c:forEach>
				
			
			</div>