<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
			<div class="recommendLodge">
				<div class="h3">
 					<h3>${lodgeComment1 }</h3>
 				</div>
				
				<c:forEach var="list" end="5" items="${lodgeList }">
					<a href="/lodge/view?lodge_no=${list.lodge_no }" style="text-decoration: none;">
						<div class="LodgeList" style="width: 15%; display: inline-block;">
							<div class="LodgeList-image">
								<img src="/resources/images/lodge_image/${list.stored_name[0] }" style="border-radius: 5px;" width="100%" height="100%">
							</div>
							<div>
								<span style="font-weight: 800 !important;
    font-size: 17px !important;
    line-height: 21px !important;
    max-height: 42px !important;
    text-overflow: ellipsis !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 2 !important;
    -webkit-box-orient: vertical !important;
    margin-bottom: 4px !important;
    overflow: hidden !important;color: rgb(72, 72, 72) !important;">${list.lodge_name }</span>
							</div>
							<div>
								<span style="color: rgb(72, 72, 72) !important;"><fmt:formatNumber type="number" pattern="###,###" value="${list.stay_cost }" />원</span>
							</div> 
						</div>
					</a>
				</c:forEach>
				
				<div class="h3">
 					<h3>${festivalComment }</h3>
 				</div>
				
				<c:forEach var="list" items="${festivalList }">
					<a href="/festival/view?festival_no=${list.festival_no }" style="text-decoration: none;">
						<div class="festivalList" style="width: 24%; display: inline-block;">
							<div class="festivalList-image">
								<img src="/resources/images/${list.stored_name }" style="border-radius: 5px;" width="100%" height="100%">
							</div>
							<div>
								<span style="font-weight: 800 !important;
    font-size: 17px !important;
    line-height: 21px !important;
    max-height: 42px !important;
    text-overflow: ellipsis !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 2 !important;
    -webkit-box-orient: vertical !important;
    margin-bottom: 4px !important;
    overflow: hidden !important;color: rgb(72, 72, 72) !important;">${list.festival_name }</span>
							</div>
							<div>
								<span style="color: rgb(72, 72, 72) !important;"><fmt:formatDate type="date" pattern="yyyy-mm-dd" value="${list.start_date }" /> ~
								<fmt:formatDate type="date" pattern="yyyy-mm-dd" value="${list.end_date }" /> </span>
							</div> 
						</div>
					</a>
				</c:forEach>
				
				<div class="h3">
 					<h3>${lodgeComment2 }</h3>
 				</div>
				
				<c:forEach var="list" begin="6" items="${lodgeList }">
					<a href="/lodge/view?lodge_no=${list.lodge_no }" style="text-decoration: none;">
						<div class="LodgeList" style="width: 31%; display: inline-block;">
							<div class="LodgeList-image">
								<img src="/resources/images/lodge_image/${list.stored_name[0] }" style="border-radius: 5px;" width="100%" height="100%">
							</div>
							<div>
								<span style="font-weight: 800 !important;
    font-size: 17px !important;
    line-height: 21px !important;
    max-height: 42px !important;
    text-overflow: ellipsis !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 2 !important;
    -webkit-box-orient: vertical !important;
    margin-bottom: 4px !important;
    overflow: hidden !important;color: rgb(72, 72, 72) !important;">${list.lodge_name }</span>
							</div>
							<div>
								<span style="color: rgb(72, 72, 72) !important;"><fmt:formatNumber type="number" pattern="###,###" value="${list.stay_cost }" />원</span>
							</div> 
						</div>
					</a>
				</c:forEach>
				
			
			</div>