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
<li>게스트 인원수</li>
<li>날짜</li>
<li>숙소 비용</li>
<li>청소비</li>
<li>서비스 수수료</li>
<li>총 합계</li>
</ul>
</div>


 









<!-- content 끝 -->
</div>

<!-- wrapper 끝 -->
</div>



</body>

