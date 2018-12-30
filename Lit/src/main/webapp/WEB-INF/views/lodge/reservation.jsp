<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


<style>
#infoview{
	position :absolute;
	left: 978px;
	width : 443px;
	border: 1px solid rgba(0, 0, 0, 0.15);
}
#reservationView{margin: 100px 410px;}

#facility{margin-top: 70px;}

.small{	height: 100px;}

#agreeBtn{ 
  padding: 14px 0;
  border: 2px #4eab75 solid;
  background-color: #4da973;
  cursor: pointer;
  font-family: "Montserrat", "helvetica neue", helvetica, arial, sans-serif;
  font-size: .9em;
  text-transform: uppercase;
  transition: color 0.4s, background-color 0.4s;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  border-radius: 2px;
  display: inline-block;
  vertical-align: middle;
  line-height: 0em;
  outline: none;
  text-align: center;
  text-decoration: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  width: 210px;
  top: 50%;
  left: 50%;
  width: 125px;
  color: white;
  }
#cencelBtn{
padding: 14px 0;
  border: 2px #4eab75 solid;
  background-color: #4da973;
  cursor: pointer;
  font-family: "Montserrat", "helvetica neue", helvetica, arial, sans-serif;
  font-size: .9em;
  text-transform: uppercase;
  transition: color 0.4s, background-color 0.4s;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  border-radius: 2px;
  display: inline-block;
  vertical-align: middle;
  line-height: 0em;
  outline: none;
  text-align: center;
  text-decoration: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  width: 210px;
  top: 50%;
  left: 50%;
  width: 125px;
  color: white;
}


</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#agreeBtn").click(function(){
		
		location.href = "/lodge/pay";
			
		
	});
});	

</script>

<body>
<div id="wrapper"> 
<div><!-- header 시작 -->
<c:import url="../layout/header.jsp"/>
</div>

<div id ="content" style = "margin-top: 7%"><!-- content시작 -->

<font size="5px"style = "margin-left: 410px;">숙소 이용규칙 확인하기</font>

<div id = "infoview">
<ul style ="list-style: none; padding: 0 20 20 20;">
<li><p style="width: 259px; float: left; font-weight: bold;margin : 0 auto"><c:out value="${reservation.lodge_name }"/></p><br><span style = "float: left; padding-right: 20px;"><c:out value="${reservation.lodge_addr }"/><br>후기 <c:out value="${comment}"/>개 </span><img class = "small" src="/resources/images/lodge_image/${lodgeimg[0].stored_name }"alt ="이미지를 찾을수 없습니다."></li>
<li><i class="fas fa-user-friends"></i>게스트 ${person }명</li><br>
<li><i class="far fa-calendar-check"></i><span >체크인  <fmt:formatDate type="DATE" pattern="yy년MM월dd일" value="${startDate }"/></span>&nbsp;&nbsp;&nbsp;
<i class="fas fa-arrow-right"></i>&nbsp;&nbsp;&nbsp;
<span>체크아웃  <fmt:formatDate type="DATE" pattern="yy년MM월dd일" value="${endDate }"/></span></li><br>
<li>요금 <c:out value="${lodge_pay }"/>원</li><br>
<li>청소비</li><br>
<li>서비스 수수료 <fmt:formatNumber type ="number" pattern="###,###" value="${service_fee }"></fmt:formatNumber>원</li><br>
<hr style="border-color: rgb(255, 255, 255);">
<li>합계  <fmt:formatNumber type ="number" pattern="###,###" value="${pay_sum }"></fmt:formatNumber>원</li>
</ul>
</div>


<div id = "reservationView">
<div id = "check">
<font size="5px;"><c:out value="${reservation.lodge_name }"/></font><br><br>
<span style = "font-weight: bold;" ><i class="far fa-calendar-check"></i>체크인</span><span style ="padding-left: 113px;font-weight: bold;"><i class="far fa-calendar-check"></i>체크아웃</span><br>
<fmt:formatDate type="DATE" pattern="yy년MM월dd일" value="${startDate }"/>
&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-right"></i>&nbsp;&nbsp;&nbsp;
<fmt:formatDate type="DATE" pattern="yy년MM월dd일" value="${endDate }"/>
</div>

<div id= "facility">
<font size="5px">편의 시설 및 공간</font>
	
	<ul style = "list-style: none; padding: 0;">
	<c:forEach items ="${item}" var="item" begin="1" step="1">
	<li><i class="fas fa-hashtag"></i>&nbsp;${item}</li>
	</c:forEach>	
	</ul>
</div> 



<button id ="agreeBtn">동의 및 계속하기</button> <button id ="cencelBtn">취소</button>
</div>




<!-- content 끝 -->
</div>

<!-- wrapper 끝 -->
</div>



</body>

