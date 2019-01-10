<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


<style>
#infoview{
	position :fixed;
	left: 978px;
	top : 33%;
	width : 292px;
	border: 1px solid rgba(0, 0, 0, 0.15);
}
#reservationView{margin: 100px 410px;}

#facility{margin-top: 70px;}

.small{	height: 200px; padding-bottom: 30px;}

#agreeBtn{ 
  margin-left : 5px;
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
  margin-left : 20px;
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
	
	var pay_method = $("input[name=selectMeans]:checked").val(), //결제수단
		mem_no = "${member.mem_no}", 
		mem_name = "${member.mem_name}",
		amount ="${pay_sum}", //합계
		lodge_no = "${reservation.lodge_no}", //숙소번호
		stay_start = "${startDate}", //체크인 날짜
		stay_end = "${endDate}",	// 체크아웃 날짜
		stay_heads = "${person}",	//인원수
		service_fee = "${service_fee}", //서비스 비용
		stay_term = "${stay_term}"; //숙박일수 
		cleaning_cost = "${clean}"; //청소비

	var pay_method_no = "1";
	if(pay_method == "phone"){
		pay_method_no = "2";
	}
		
		
		
// 		console.log(pay_method);
// 		console.log(pay_method_no);
// 		console.log(mem_no);
// 		console.log(amount);
// 		console.log(lodge_no);
// 		console.log(stay_start);
// 		console.log(stay_end);
// 		console.log(stay_heads);
// 		console.log(stay_term);
		
		
	
	$("#agreeBtn").click(function(){
		var IMP = window.IMP;
		
		IMP.init('imp11365087');
		
		IMP.request_pay({
		    pg : 'html5_inicis', // version 1.1.0부터 지원.
		    pay_method : pay_method,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '결제 결제테스트',
		    amount : 100,
		    buyer_name : mem_name,
		    buyer_tel : '010-4525-6605',
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        location.href = "/main";
		       
		        jQuery.ajax({
		        	
		        	url: "pay",
		        	type : "POST",
		        	dataType : "json",
		        	data : {
		        		"pay_method_no" : pay_method_no,
		        		"mem_no" : mem_no,
						"lodge_no" : lodge_no,		        		
		        		"pay_sum" : amount,
		        		"stay_term" : stay_term,
		        		"start" : stay_start,
		        		"end" : stay_end,
		        		"service_fee" : service_fee,
		        		"cleaning_cost" : cleaning_cost,
		        		"stay_heads" : stay_heads
		        	},
		        }).done(function(data){
		        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		        	if(everythings_fine){
		        		var msg = "결제가 완료되었습니다.";
		        			msg +='\n고유ID :'+rsp.imp_uid;
		        			msg +='\n 상점 거래ID : ' +rsp.merchant_uid;
		        			msg += '\결제 금액 : ' + rsp.paid.amount;
		        			msg += '카드 승인번호 : ' +rsp.apply_num;
		        		
		        			
		        	}else{
		        		//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		        	}
		        });
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
			
		});
			
		
	}); //결제하기
	
	$("input:radio[name=selectMeans]").change(function(){
		pay_method =$(":input:radio[name=selectMeans]:checked").val();
		
		
	}); // 카드, 휴대폰 결제

 
	
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
<li><i class="fas fa-user-friends"></i>게스트 ${person }명</li><br>
<li>요금 <fmt:formatNumber type="number" pattern="###,###" value="${pay_sum }"/>원</li><br>

<li>청소비 <fmt:formatNumber type = "number" pattern="###,###" value = "${clean }"/></li><br>

<li>서비스 수수료 <fmt:formatNumber type ="number" pattern="###,###" value="${service_fee }"/>원</li><br>
<hr style="border-color: rgb(255, 255, 255)">
<li>합계  <fmt:formatNumber type ="number" pattern="###,###" value="${pay_sum }"/>원</li>
</ul>
<label style ="margin-left: 5px;">
<input type="radio" name="selectMeans" value="card" />체크/신용카드 결제</label>
<label><input type="radio" checked="checked" name="selectMeans"value="phone"/>휴대폰 결제</label><br><br>
<button id ="agreeBtn">결제하기</button> <button id ="cencelBtn" onclick="history.back(); return false ;">취소</button>
</div>


<div id = "reservationView">
<div id = "check">
<img class = "small" src="/resources/images/lodge_image/${lodgeimg[0].stored_name }"alt ="이미지를 찾을수 없습니다."><br>
<p style="width: 259px; float: left; font-weight: bold;margin : 0 auto"><c:out value="${reservation.lodge_name }"/></p><br>
<span style = "float: left; padding-right: 20px;"><c:out value="${reservation.lodge_addr }"/><br>후기 <c:out value="${comment}"/>개 </span><br><br><br>
<p style = "font-weight: bold;"><i class="far fa-clock"></i>체크인 가능 시간</p> <c:out value="${reservation.check_in_time}"/><br><br>
<span style = "font-weight: bold;"><i class="far fa-calendar-check"></i>체크인</span><span style ="padding-left: 113px;font-weight: bold;"><i class="far fa-calendar-check"></i>체크아웃</span><br>
<fmt:formatDate type="DATE" pattern="yy년MM월dd일" value="${startDate }"/>
&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-right"></i>&nbsp;&nbsp;&nbsp;
<fmt:formatDate type="DATE" pattern="yy년MM월dd일" value="${endDate }"/><br><br>


</div>

<div id= "facility">
<font size="5px">편의 시설 및 공간</font>
	
	<ul style = "list-style: none; padding: 0;">
	<c:forEach items ="${item}" var="item" begin="1" step="1">
	<li><i class="fas fa-hashtag"></i>&nbsp;${item}</li>
	</c:forEach>	
	</ul>
</div> 




</div>




<!-- content 끝 -->
</div>

<!-- wrapper 끝 -->
</div>



</body>

