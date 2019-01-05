<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Life is Trip 인생은 여행이다</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 왼쪽 사이드 메뉴 버튼을 클릭했을 때 css처리
	$(window).click(function(e){
		if(e.target.id == 'view-profile-btn' || e.target.id == 'update-profile-btn' || e.target.id == 'view-mycontents-btn'
				|| e.target.id == 'view-myfavorites-btn' || e.target.id == 'view-mypayments-btn' || e.target.id == 'delete-membership-btn'){
			$('#view-profile-btn').css("color", "#666");
			$('#update-profile-btn').css("color", "#666");
			$('#view-mycontents-btn').css("color", "#666");
			$('#view-myfavorites-btn').css("color", "#666");
			$('#view-mypayments-btn').css("color", "#666");
			$('#delete-membership-btn').css("color", "#666");
			
			$('#view-profile-btn').css("font-weight", "normal");
			$('#update-profile-btn').css("font-weight", "normal");
			$('#view-mycontents-btn').css("font-weight", "normal");
			$('#view-myfavorites-btn').css("font-weight", "normal");
			$('#view-mypayments-btn').css("font-weight", "normal");
			$('#delete-membership-btn').css("font-weight", "normal");
			
			$('#'+e.target.id).css("color", "#333");
			$('#'+e.target.id).css("font-weight", "bold");
		}	
	});
		
	// 프로필 보기를 클릭했을 때...
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
	
});
</script>
</head>

<body><div id="wrapper">
<c:import url="/WEB-INF/views/layout/header.jsp"/><br>

<div style="width:80%; margin:0 auto;">
<table style="width:100%;">
<tr>
<!-- 메뉴 -->
<td style="width:20%; vertical-align:top;">
<div id="view-profile-btn" style="text-align:left; margin-top:30px; font-size:16px; color:#333; white-space:nowrap; cursor:pointer; font-weight: bold;">프로필 보기</div>
<div id="update-profile-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">회원정보 수정</div>
<div id="view-mycontents-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">내가 쓴 글 보기</div>
<div id="view-myfavorites-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">내가 찜한 숙소 보기</div>
<div id="view-mypayments-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">결제내역 보기</div>
<div id="delete-membership-btn" style="text-align:left; margin-top:20px; font-size:16px; color:#666; white-space:nowrap; cursor:pointer;">회원 탈퇴하기</div>
</td>
<!-- 내용 -->
<td style="width:80%; vertical-align:top;">
<div id="contents-div">
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
</div>
</td>
</tr>
</table>
</div>

</div></body>
</html>
