<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is Trip 인생은 여행이다</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="shortcut icon" type="image/x-ion" href="/resources/images/url.ico" />
<script type="text/javascript">
$(document).ready(function(){
	
	// 왼쪽 사이드 메뉴 버튼을 클릭했을 때 css처리
	// 나의 쪽지함 추가했습니다.
	$(window).click(function(e){
		if(e.target.id == 'view-profile-btn' || e.target.id == 'update-profile-btn' || e.target.id == 'view-mycontents-btn'
				|| e.target.id == 'view-myfavorites-btn' || e.target.id == 'view-mypayments-btn' || e.target.id == 'delete-membership-btn' || e.target.id =='message-btn'){
			$('#view-profile-btn').css("color", "#666");
			$('#update-profile-btn').css("color", "#666");
			$('#view-mycontents-btn').css("color", "#666");
			$('#view-myfavorites-btn').css("color", "#666");
			$('#view-mypayments-btn').css("color", "#666");
			$('#delete-membership-btn').css("color", "#666");
			$('#message-btn').css("color","#666");
			
			$('#view-profile-btn').css("font-weight", "normal");
			$('#update-profile-btn').css("font-weight", "normal");
			$('#view-mycontents-btn').css("font-weight", "normal");
			$('#view-myfavorites-btn').css("font-weight", "normal");
			$('#view-mypayments-btn').css("font-weight", "normal");
			$('#delete-membership-btn').css("font-weight", "normal");
			$('#message-btn').css("font-weight","normal");
			
			
			$('#'+e.target.id).css("color", "#333");
			$('#'+e.target.id).css("font-weight", "bold");
		}	
	});
	
	// 프로필 보기
	$('#view-profile-btn').click(function(){
		
		$.ajax({
			type: "GET",
			url: "/mypage/viewMyProfile",
			data: {}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
		
	// 회원정보 수정을 클릭했을 때...
	$('#update-profile-btn').click(function(){
		$.ajax({
			type: "GET",
			url: "/mypage/updateMyProfile",
			data: {}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
	//나의 쪽지함을 클릭했을 떄...

	$('#message-btn').click(function(){
		$.ajax({
			type: "GET",
			url: "/message/receive",
			data: {},
			dataType: "html",
			success: function(res){
				$("#contents-div").html(res);
				console.log(1);
			},
			error:function()
			{
				alert("에러났어요!");
			}
			
		});
	});
	
	// 내가 쓴 글 보기를 클릭했을 때...
	$('#view-mycontents-btn').click(function(){
		$.ajax({
			type: "GET",
			url: "/mypage/viewMyContents",
			data: {}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
	// 내가 찜한 숙소 보기를 클릭했을 때...
	$('#view-myfavorites-btn').click(function(){
		$.ajax({
			type: "GET",
			url: "/mypage/viewMyFavorites",
			data: {}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
	// 구매내역 보기를 클릭했을 때...
	$('#view-mypayments-btn').click(function(){
		$.ajax({
			type: "GET",
			url: "/mypage/viewMyPayments",
			data: {}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
	$('#delete-membership-btn').click(function(){
		$.ajax({
			type: "GET",
			url: "/mypage/deleteMember",
			data: {}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
	
//받은 쪽지함에서 보낸 쪽지함 버튼 누르면 Ajax가 발동된다.
	
	$('#send').click(function(){
		
		$.ajax({
			type:"GET",
			url: "/message/send",
			data: {},
			dataType: "html",
			success: function(res)
			{
				$('#contents-div').html(res);				
			},
			error:function()
			{
				alert("에러났어요!");
			}	
		});
	});

	$('tr.sub_category').hide();
	$('tr.category').click(function(){
		
		$(this).next('tr.sub_category').toggle();
		
	});
// 	페이징 누를 시 이벤트 발생 
	$('.page-to-move-td').click(function(e){
		var curPage = $(e.target).attr("data-curPage");
		
		$.ajax({
			type: "GET",
			url: "/message/receive",
			data: {"curPage": curPage}, 
			dataType: "html",
			success : function(res){
				$('#contents-div').html(res);
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
});
</script>

<!--  파라미터가 Null 이 아니면 (메시지) -->
<style>

	.msg-box
	{
		padding:15px 0;
		display: inline-block;
		width:100%;
	}
	
	.btn-send
	{
		padding:4px 9px;
		color:black;
		border:1px solid #ccc;
		background-color: #fff;
		text-decoration:none;
		font-weight: 700;
		cursor:pointer;
		text-align:center;
		display:inline-block;
	}
	
	.btn-receive
	{
		padding:4px 9px;
		color:blue;
		border:1px solid #ccc;
		background-color: #fff;
		text-decoration:none;
		font-weight: 700;
		cursor:pointer;
		text-align:center;
		display:inline-block;
	}

	.table-list
	{
		border:1px solid #ddd;
		width:90%;
		border-collapse:collapse; 
	}

	.table-list th,
	.table-list td
	{
		border-bottom: 1px solid #ddd;
		padding:10px;
	}
	
	.table-list td
	{
		text-align:center;
		 max-width: 100px;
    	overflow: hidden;
  		text-overflow: ellipsis;
   	 	white-space: nowrap;
	}
	
	.table-list tr:hover
	{
		background:#e0ecff;
	}

	#paging-table a {
		text-decoration: none;
	}
	#paging-table td {
		width:36px;
		height:36px;
		border:1px solid #bbb;
		text-align:center;
	}
	#paging-table td:hover {
		cursor:pointer;
	}

</style>

</head>

<body><div id="wrapper">
<c:import url="/WEB-INF/views/layout/header.jsp"/><br>

<div style="width:80%; margin:0 auto;">
<table style="width:100%;">
<tr>
<td style="width:20%; vertical-align:top;">
<!-- 메뉴[go가 있는지 없는지에 따라서 변화됨] -->
<c:if test="${go eq null }">
<div id="view-profile-btn" style="text-align:left; margin-top:30px; font-size:16px; color:#333; white-space:nowrap; cursor:pointer; font-weight: bold;">프로필 보기</div>
<div id="update-profile-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">회원정보 수정</div>
<div id="message-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">나의 쪽지함</div>
<div id="view-mycontents-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">내가 쓴 글 보기</div>
<div id="view-myfavorites-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">내가 찜한 숙소 보기</div>
<div id="view-mypayments-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">결제내역 보기</div>
<div id="delete-membership-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">회원 탈퇴하기</div>
</c:if>
<c:if test="${go ne null }">
<div id="view-profile-btn" style="text-align:left; margin-top:30px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">프로필 보기</div>
<div id="update-profile-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">회원정보 수정</div>
<div id="message-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#333; white-space:nowrap; cursor:pointer; font-weight: bold;">나의 쪽지함</div>
<div id="view-mycontents-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">내가 쓴 글 보기</div>
<div id="view-myfavorites-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">내가 찜한 숙소 보기</div>
<div id="view-mypayments-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">결제내역 보기</div>
<div id="delete-membership-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">회원 탈퇴하기</div>
</c:if>
</td>
<!-- 내용 -->
<td style="width:80%; vertical-align:top;">

<div id="contents-div">
<c:if test="${go eq null}" >
<div style="margin-top:20px;">
<table style="width:80%;">
<tr><td style="text-align:center;"><h1 style="display:inline;">${member.mem_name }</h1> <h2 style="display:inline;">님의 프로필입니다.</h2></td></tr>
<tr><td style="text-align:center; padding-top: 30px;">
<c:if test="${member.stored_name ne null }">
<img width="300px" height="300px" style="border:6px solid #999; border-radius:50%;" src="/resources/images/${member.stored_name }"/></c:if>
<c:if test="${member.stored_name eq null }">
<img width="300px" height="300px" style="border:6px solid #999; border-radius:50%;" src="/resources/images/empty_profile_photo.jpg"/></c:if>
</td></tr>
<tr><td style="padding-top:30px;"><div style="border:3px solid #999; border-radius: 5px; min-height:300px; padding:10px; color:#555; font-size:18px;">${member.mem_intro }</div></td></tr>
</table>
</div>
</c:if>

<c:if test="${go ne null}">
	<h1>쪽 지 함</h1>
	
	<div class="msg-box">

		<a href="#" class="btn-receive">받은 쪽지함</a> 
		<a href="#" class="btn-send" id="send">보낸 쪽지함</a>

	</div>

	<input type="hidden" value="${member.mem_no }" name="mem_no" />
	<input type="hidden" value="${message.receiver_no }" name="receiver_no" />
	<table class="table-list">
		<thead>
			<tr>
				<th style="	background-color:#0265e8; color:white;">번 호(받)</th>
				<th style="	background-color:#0265e8; color:white;">내 용</th>
				<th style="	background-color:#0265e8; color:white;">받는 이</th>
				<th style="	background-color:#0265e8; color:white;">보낸 이</th>
				<th style="	background-color:#0265e8; color:white;">시 간</th>
				<th style="	background-color:#0265e8; color:white;">상 태</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${receivelist }" var="r">
			<tr class="category">
				<td>${r.message_no }</td>
				<td>${r.contents }</td>
				<td>${r.receiver }</td>
				<td><span style="font-weight: bold"><a href="/viewProfile?mem_no=${r.sender_no}">${r.sender}</a></span></td>
				<td>${r.send_time }</td>
				<c:choose>
				<c:when test="${r.read eq 0 }">
					<td class="td2" style="color:blue; font-weight:bold;">읽지 않음 </td>
				</c:when>
				<c:when test="${r.read ne 0 }">
					<td class="td2" style="color:red; font-weight:bold">읽음</td>
				</c:when>
				</c:choose>
			</tr>
			<tr class="sub_category">
				<td colspan="6">
				<div>
				${r.contents }
				</div>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<!-- 쪽지함 페이징 처리 -->
	<table id="paging-table" style="margin:0 auto; border-collapse:collapse; border: 1px solid #bbb; border-radius:3px;"><tr>
  
  	<!-- 이전 페이지 -->
  	<!-- 첫 페이지라면 금지 표시 -->
  	<c:if test="${paging.startPage eq 1 }"><!-- 첫페이지일때 -->
  	<td class="page-to-move-td" data-curPage="1">&laquo;</td>
  	</c:if>
  	<c:if test="${paging.startPage ne 1 }"><!-- 첫페이지가아닐때 -->
	<fmt:parseNumber var="prevPage" integerOnly="true" value="${paging.startPage - 10 }"/>
  	<td class="page-to-move-td" data-curPage=prevPage>&laquo;</td>
    </c:if>
    
    

    <!-- 페이징 번호 -->
    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
    	<c:if test="${paging.curPage eq page }">
	   	<td style="background-color:#0275D8; color:white;">${page }</td>
	   	</c:if>
	
	   	<c:if test="${paging.curPage ne page }">
	   	<td class="page-to-move-td" style="background-color:white; color:#0275D8;" data-curPage="${page }">${page }</td>
	   	</c:if>
    </c:forEach>
    
    

    <!-- 다음 페이지 -->
  	<!-- 마지막 페이지라면 금지 표시 -->
  	<c:if test="${paging.endPage eq paging.totalPage }"><!-- 마지막 페이지일때 -->
  	<td class="page-to-move-td" data-curPage="${paging.totalPage }">&raquo;</td>
  	</c:if>
  	<c:if test="${paging.endPage < paging.totalPage }"><!-- 마지막 페이지가아닐때 -->
  	<fmt:parseNumber var="nextPage" integerOnly="true" value="${paging.endPage + 1 }"/>
  	<td class="page-to-move-td" data-curPage=nextPage>&raquo;</td>
    </c:if>
    
</tr></table>
	
</c:if>

</div>
</td>
</tr>
</table>
</div>

</div></body>
</html>
