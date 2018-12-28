<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
#infoview{
	position :absolute;
	left: 1200px;
	border: 1px solid black;
}
#check{
	margin: 100px 550px;

}
#facility{
	margin: 100px 550px;
}
#right{
  width:9px;
  height:9px;
  position:relative;
  text-indent:-9999px;

}
#right:before{
  content:'';
  width:9px;
  height:9px;
  position:absolute;
  left:50%;
  top:50%;
  border-left:2px solid #000;
  border-top:2px solid #000;
  transform:translate(-50%,-50%) rotate(135deg);
}
#right:after{
  content:'';
  width:9px;
  height:2px;
  position:absolute;
  right:3px;
  top:50%;
  transform:translateY(-50%);
  background:#000
}


</style>
<script type="text/javascript">


</script>

<body>
<div id="wrapper"> 
<div><!-- header 시작 -->
<c:import url="../layout/header.jsp"/>
</div>

<div id ="content" style = "margin-top: 7%"><!-- content시작 -->

<font size="5px"style = "margin-left: 600px;">숙소 이용규칙 확인하기</font>

<div id = "infoview">
<ul style ="list-style: none;">
<li>숙소 이름, 사진</li>
<li>${person }명</li>
<li><span>체크인  <fmt:formatDate type="DATE" pattern="yy년MM월dd" value="${startDate }"/></span>&nbsp;&nbsp;&nbsp;
<span id = "right"></span>&nbsp;&nbsp;&nbsp;
<span>체크아웃  <fmt:formatDate type="DATE" pattern="yy년MM월dd" value="${endDate }"/></span></li>
<li>숙소 비용</li>
<li>청소비</li>
<li>서비스 수수료</li>
<li>총 합계</li>
</ul>
</div>

<div id = "check">
<font size="5px;"><c:out value="${reservation.lodge_name }"/></font> 숙박일수<br><br>
<span>체크인<fmt:formatDate type="DATE" pattern="yy년MM월dd" value="${startDate }"/></span>&nbsp;&nbsp;&nbsp;
<span id = "right"></span>&nbsp;&nbsp;&nbsp;
<span>체크아웃<fmt:formatDate type="DATE" pattern="yy년MM월dd" value="${endDate }"/></span>
</div>

<div id= "facility">
<font>편의 시설 및 공간</font>

</div> 



<button>동의 및 계속하기</button> <button>취소</button>





<!-- content 끝 -->
</div>

<!-- wrapper 끝 -->
</div>



</body>

