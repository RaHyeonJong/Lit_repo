<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<table style="width:100%; padding:0 20px 0 20px; font-size:14px;">
<tr><td style="text-align:left;"><h1 style="margin:0;">결제상세정보</h1></td>
<td colspan="2" style="vertical-align:bottom; padding-bottom:2px; font-size:14px; text-align:right;">&nbsp; ▶ 결제번호 : <span style="font-weight:bold;">${pay.pay_no }</span>
&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;결제일자 : <span style="font-weight:bold;"><fmt:formatDate value="${pay.pay_time }" pattern="yyyy월 MM월 dd일"/></span></td></tr>
<tr><td colspan="3" style="text-align:center;"><hr style="border:2px solid black; background-color:black;"></td></tr>

<!-- 결제정보 개요 테이블 -->
<tr><td colspan="3">
<table style="width:100%; border-collapse:collapse; border-top:1px solid #777; border-bottom:1px solid #777;"><tr style="border-bottom:1px solid #ccc; background-color:#eee;">
<td style="width:220px; padding:10px; border-right:1px solid #ccc;">숙박정보</td>
<td style="width:126px; padding:10px; border-right:1px solid #ccc;">상품금액<br><span style="font-size:12px;">(숙박단가 x 일수)</span></td>
<td style="width:84px; padding:10px; border-right:1px solid #ccc;">청소비</td>
<td style="width:84px; padding:10px; border-right:1px solid #ccc;">서비스<br>수수료</td>
<td style="width:123px; padding:10px; border-right:1px solid #ccc;">숙소</td>
<td style="width:85px; padding:10px;">결제상태</td>
</tr><tr>
<td style="padding:10px; border-right:1px solid #ccc;">
<fmt:formatDate value="${pay.stay_start }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${pay.stay_end }" pattern="yyyy-MM-dd"/><br>
( ${pay.stay_term-1 }박 ${pay.stay_term }일 )<br>
숙박인원 : <span style="font-weight:bold;">${pay.stay_heads }</span>명
</td>
<td style="padding:10px; border-right:1px solid #ccc;">
<fmt:formatNumber value="${lodge.stay_cost }"/>원<br>X ${pay.stay_term-1 }박<br>= <fmt:formatNumber value="${lodge.stay_cost * (pay.stay_term-1) }"/>원</td>
<td style="padding:10px; border-right:1px solid #ccc;"><fmt:formatNumber value="${pay.cleaning_cost }"/>원</td>
<td style="padding:10px; border-right:1px solid #ccc;"><fmt:formatNumber value="${pay.service_fee }"/>원</td>
<td style="padding:10px; border-right:1px solid #ccc;">${lodge.lodge_name }</td>
<td style="padding:10px;">
<c:if test="${pay.pay_state_no eq 1 }"><div style="color:#03BD55;">${pay.pay_state }</div></c:if>
<c:if test="${pay.pay_state_no eq 2 }"><div style="color:#FF8F0A;">${pay.pay_state }</div></c:if>
<c:if test="${pay.pay_state_no eq 3 }"><div style="color:blue;">${pay.pay_state }</div></c:if></td>
</tr></table>
</td></tr>

<tr><td colspan="3">

<table style="width:100%;"><tr>

<!-- 호스트 정보 테이블 -->
<td style="width:49%; text-align:left; vertical-align:top;">
<h3 style="margin:30px 0 10px 0; padding-left:10px;">호스트 정보</h3>
<table style="width:100%; border-collapse:collapse; border-top:1px solid #777; border-bottom:1px solid #777;">
<tr style="border-bottom:1px solid #ccc;"><td style="text-align:left; padding:10px; border-right:1px solid #ccc; width:70px; background-color:#eee">호스트</td><td style="text-align:left; padding:10px;">${host.mem_name }</td></tr>
<tr style="border-bottom:1px solid #ccc;"><td style="text-align:left; padding:10px; border-right:1px solid #ccc;background-color:#eee">연락처</td><td style="text-align:left; padding:10px;">${host.mem_phone }</td></tr>
<tr><td style="text-align:left; padding:10px; border-right:1px solid #ccc;background-color:#eee">숙소주소</td><td style="text-align:left; padding:10px;">${lodge.lodge_addr }</td></tr>
</table>
</td>
<td style="width:2%;"></td>
<!-- 오른쪽 결제정보 테이블 -->
<td style="width:49%; text-align:left;">
<h3 style="margin:30px 0 10px 0; padding-left:10px;">결제 정보</h3>
<table style="width:100%; border-collapse:collapse; border-top:1px solid #777; border-bottom:1px solid #777;">
<tr style="border-bottom:1px solid #ccc;"><td style="text-align:left; padding:10px; border-right:1px solid #ccc; width:100px; background-color:#eee">최종 결제금액</td><td style="text-align:right; padding:10px; color:red;"><span style="font-weight:bold;"><fmt:formatNumber value="${lodge.stay_cost * (pay.stay_term-1) + pay.cleaning_cost + pay.service_fee }"/></span> 원</td></tr>
<tr style="border-bottom:1px solid #777;"><td style="text-align:left; padding:10px; border-right:1px solid #ccc;background-color:#eee">결제수단</td><td style="text-align:right; padding:10px;">${pay.pay_method }</td></tr>
<tr style="border-bottom:1px solid #ccc;"><td style="text-align:left; padding:10px; border-right:1px solid #ccc;background-color:#eee">상품금액</td><td style="text-align:right; padding:10px;"><span style="font-weight:bold;"><fmt:formatNumber value="${lodge.stay_cost * (pay.stay_term-1) }"/></span> 원</td></tr>
<tr style="border-bottom:1px solid #ccc;"><td style="text-align:left; padding:10px; border-right:1px solid #ccc;background-color:#eee">청소비</td><td style="text-align:right; padding:10px;"><span style="font-weight:bold;"><fmt:formatNumber value="${pay.cleaning_cost }"/></span> 원</td></tr>
<tr style="border-bottom:1px solid #777;"><td style="text-align:left; padding:10px; border-right:1px solid #ccc;background-color:#eee">서비스 수수료</td><td style="text-align:right; padding:10px;"><span style="font-weight:bold;"><fmt:formatNumber value="${pay.service_fee }"/></span> 원</td></tr>
</table>
</td>
</tr></table>
</td></tr>
</table>