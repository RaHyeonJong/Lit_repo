<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life Is Trip 인생은 여행이다.</title>
<link rel="shortcut icon" type="image/x-ion" href="/resources/images/url.ico" />
<link href="https://fonts.googleapis.com/css?family=Charm:700" rel="stylesheet">

</head>

<style type="text/css">

.detail-container {
	margin: 0 auto;
	padding: 40px;
	max-width: 500px;
}

dl {
	margin: 0;
	padding: 0;
}

dt {
	font-size: 2.2rem;
	font-weight: 300;
}

dd {
	margin: 0 0 40px 0;
	font-size: 1.8rem;
	padding-bottom: 5px;
	border-bottom: 1px solid #ac2647;
	box-shadow: 0 1px 0 #c52c51;
}
</style>

<body>


	<div class="detail" style="background-color: #E0F2F7;">
	
	     <!-- close 버튼  -->
	     <div id="close" style=" position:relative;  left:92%;">
	        <input type="button" id="close" 
			       style="  border-radius: 10px; padding: 15px; font-size: 22px; width:50px; height:50px;
			         margin: 20px; color: #fff; position: relative; display: inline-block; 
			         background-color: #FA5882;" onclick="history.go(-1);" value="X">
         </div> 
        
        		
		<!-- 프로필 사진 공간 -->
        <div id="profilePhoto" style="text-align:center;">
          <p style="font-family:Charm; font-size:30px; color:#585858;">Member Profile</p>
          <img src="/resources/images/adminImages/${memberView.stored_name }"
               style="width:250px; height:250px; border-radius:50px;">
        </div><br><br>
        
        <!-- 회원 상세 정보 -->
		<div class='detail-container'>			
			<dl>
				<dt>회원 상태</dt>
				<dd><c:choose>
                      <c:when test="${memberView.mem_activation == 1 }">활성
                      </c:when>
                      <c:when test="${memberView.mem_activation != 1 }">비활성
                      </c:when>
                    </c:choose>
                 <span style="font-size:13px; color:gray">신고 수 :</span>
                    <c:choose>
                      <c:when test="${memberView.reportCnt == 0 }">
                       <span style="font-size:13px;">${memberView.reportCnt }</span>
                      </c:when>
                      <c:when test="${memberView.reportCnt > 0 }">
                       <span style="color:red; font-size:13px;">+${memberView.reportCnt }</span>
                      </c:when>
                    </c:choose>
				</dd>
				<dt>회원 이름</dt>
				<dd>${memberView.mem_name }</dd>
				<dt>회원 아이디</dt>
				<dd>${memberView.mem_id }</dd>
				<dt>회원 비밀번호</dt>
				<dd>${memberView.mem_pw }</dd>
				<dt>회원 전화번호</dt>
				<dd>${memberView.mem_phone }</dd>
				<dt>회원 생일</dt>
				<dd><fmt:formatDate value="${memberView.mem_birth }" pattern="yyyy-MM-dd"/></dd>
				<dt>회원 UKEY</dt>
				<dd>${memberView.uKey }</dd>
				<dt>회원 자기소개</dt>
				<dd>${memberView.mem_intro }</dd>
			</dl>
		</div>
	</div>
	<!-- detail 끝 -->


</body>


</html>