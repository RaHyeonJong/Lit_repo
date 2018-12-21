<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
<table style="width:100%;">
<tr><td style="width:20%;"><h2>프로필 사진</h2></td></tr>
<tr><td><img width="200px" height="200px" style="border:5px solid #999; border-radius:50%;" src="/resources/images/${member.stored_name }"/></td></tr>
<tr><td>
<input type="file" id="input-photo-for-update" name="file" hidden="hidden"/>
<div style="display:table; margin:0 auto; width:50%; height:50px; text-align:center; background-color:#FF5A5F; border-radius:3px;">
<div id="photo-upload-btn-for-update" style="display:table-cell; vertical-align:middle; color:white; font-size: 16px; cursor:pointer;">사진 업로드</div></div></td></tr>
<tr><td style="width:20%;"><h2>이메일</h2></td><td><div style="border:3px solid #666"></div></td></tr>
<tr><td style="width:20%;"><h2>이름</h2></td><td></td></tr>
<tr><td style="width:20%;"><h2>비밀번호</h2></td><td></td></tr>
<tr><td style="width:20%;"><h2>비밀번호 확인</h2></td><td></td></tr>
<tr><td style="width:20%;"><h2>전화번호</h2></td><td></td></tr>
<tr><td style="width:20%;"><h2>인증번호 입력</h2></td><td></td></tr>
<tr><td style="width:20%;"><h2>자기소개</h2></td></tr>
<tr><td><input type="text" /></td></tr>
</table>
</div>