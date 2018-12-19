<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    
    <c:forEach items = "${replyList}" var = "reply">
					<div id="replyitem<c:out value ="${reply.comment_no }"/>" style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;
					margin-left: 10px;">    
       				<a href="/users/show/61727682" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
 					<img class="user_img" src="https://a0.muscache.com/im/pictures/user/f4118b8f-179e-4655-9185-c2d2693b53a6.jpg?aki_policy=profile_x_medium" height="48" width="48" alt="Hyun님의 사용자 프로필" title="Hyun님의 사용자 프로필"></a>
       				 <c:out value="${reply.mem_name}"/><br>
	       			<fmt:formatDate value="${reply.written_time}" pattern="yyyy년 MM월 dd일"/>
       				 <br/>
       				   <div id="reply<c:out value="${reply.comment_no}"/>"><c:out value="${reply.contents}"/></div>

<%--        				<c:if test ="${login && mem_no eq sessionScope.mem_no }"> --%>
       				<button onclick="fn_replyUpdate('<c:out value="${reply.comment_no}"/>')">수정</button>
       				 <button  onclick="fn_replyDelete('<c:out value="${reply.comment_no}"/>')">삭제</button>
 					 <button  onclick="fn_replyReply('<c:out value ="${reply.comment_no}"/>')">댓글</button>
						
<%--						</c:if> --%>
   				 </div>
					</c:forEach>