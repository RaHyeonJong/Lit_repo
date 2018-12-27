<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#delete-member-btn').click(function(){
		var mem_id = '${member.mem_id }';
		var mem_pw = $('#pw-for-delete').val();
		
		$.ajax({
			type: "POST",
			url: "/mypage/deleteMember",
			data: {"mem_id": mem_id, "mem_pw": mem_pw }, 
			dataType: "text",
			success : function(res){
				if(res == 1){
					alert("회원탈퇴가 완료되었습니다.");
					$(location).attr('href','/main');
				} else {
					alert("회원탈퇴가 실패하였습니다.\n비밀번호를 다시 확인해주세요.");
				}				
			},
			error : function(){
				alert("에러났어요!");
			}
		});
		
	});
});
</script>
    
<table style="width:75%; height:100%;">
<tr><td style="text-align:center; vertical-align:middle;">
<div style="width:568px; padding-bottom:30px; margin:0 auto;">

<table style="width:100%; margin:30px auto; border-collapse:collapse; border:1px solid #333;">
<tr style="background-color:#333;"><td colspan="2" style="color:white;"><h3>회원탈퇴</h3></td></tr>
<tr><td colspan="2" style="color:#666; text-align:left; font-size:13px; padding:10px; line-height:20px;">비밀번호 확인 후 아이디는 즉시 탈퇴됩니다.<br>
탈퇴 후에는 동일 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없으니 신중하게 선택해 주세요.</td></tr>
<tr><td colspan="2"><hr style="width:92%; background-color:#999;"></td></tr>
<tr><td style="text-align:left; padding:10px 10px 10px 30px; font-size:14px;">아이디</td>
<td style="text-align:left; padding:10px;">${member.mem_id }</td></tr>
<tr><td style="text-align:left; padding:10px 10px 10px 30px; font-size:14px;">비밀번호</td>
<td style="text-align:left; padding:10px;"><input type="password" id="pw-for-delete" style="width:300px; height:20px; font-size:14px; padding:10px;"/></td></tr>
<tr><td colspan="2"><hr style="width:92%; background-color:#999;"></td></tr>
<tr><td colspan="2" style="padding-bottom:10px;">
<button onclick="location.href='/mypage/main'" style="width:80px; height:40px; cursor:pointer; text-decoration:none; border:1px solid #FF5A5F; border-radius:3px; background-color:white; color:#FF5A5F;">탈퇴 취소</button>
&nbsp;&nbsp;&nbsp;<button id="delete-member-btn" style="width:80px; height:40px; cursor:pointer; text-decoration:none; border:none; border-radius:3px; background-color:#FF5A5F; color:white;">확인</button></td></tr>
</table>

</div>
</td></tr>
</table>