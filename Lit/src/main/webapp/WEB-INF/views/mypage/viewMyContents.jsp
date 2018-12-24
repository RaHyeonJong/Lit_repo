<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
.my-comm-tr:hover {
	background-color: #eee;
}
</style>

<h3 style="color:#565;">내가 쓴 글 보기</h3>

<div>
<table id="my-comm-table" style="border-collapse:collapse; width:75%;">
<tr style="height:50px; background-color:#333; color:white;">
<td style="width:8%; text-align:center; padding:0 10px 0 10px; white-space:nowrap;">번호</td>
<td style="width:24%; text-align:center;">숙소이름</td>
<td style="width:50%; text-align:center;">댓 글 내 용</td>
<td style="width:18%; text-align:center;">작성시간</td>
</tr>

<c:forEach items="${commList }" var="comm">
<tr class="my-comm-tr" style="height:50px; cursor:pointer; ">
<td style="text-align:center;"><div style="width:85px;">${comm.comment_no }</div></td>
<td style="text-align:center; padding:0 10px 0 10px;"><div style="width:180px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${comm.lodge_name }</div></td>
<td style="text-align:left; padding:0 10px 0 10px;"><div style="width:380px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${comm.contents }</div></td>
<td style="text-align:center; padding:0 10px 0 10px; white-space:nowrap;">
<fmt:formatDate value="${comm.written_time }" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
</tr>
<tr><td colspan="4" style="padding:0;"><hr style="border:1px solid #ccc; margin:0; padding:0;"></td></tr>
</c:forEach>

</table>
</div>





