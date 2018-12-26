<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    
    		    <c:forEach items = "${lodgeReview}" var = "review">
    	<c:if test = "${review.parent_comment_no == 0 }">
					<div id="reviewitem<c:out value ="${review.comment_no }"/>" class = "parent_comment<c:out value ="${review.parent_comment_no }"/>"style=" width: 600px; padding: 5px; margin-top: 5px;">    
       				<a href="/users/show/61727682" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
 					<img class="user_img" src="https://a0.muscache.com/im/pictures/user/f4118b8f-179e-4655-9185-c2d2693b53a6.jpg?aki_policy=profile_x_medium" height="48" width="48" alt="Hyun님의 사용자 프로필" title="Hyun님의 사용자 프로필"></a>
       				 <c:out value="${review.mem_name}"/><br>
	       			<fmt:formatDate value="${review.written_time}" pattern="yyyy년 MM월 dd일"/>
       				 <br/>
       				   <div id="reply<c:out value="${review.comment_no}"/>"><c:out value="${review.contents}"/></div>

       				<c:if test ="${ login && member.mem_no eq review.mem_no}">
       				<button onclick="fn_replyUpdate('<c:out value="${review.comment_no}"/>')">수정</button>
       				 <button  onclick="fn_replyDelete('<c:out value="${review.comment_no}"/>')">삭제</button>
					</c:if>
					<c:if test ="${login && member.mem_no eq view.mem_no}">
 					 <button  onclick="fn_replyReply('<c:out value ="${review.comment_no}"/>')">댓글</button>
					</c:if>	
   			
   				 </div>
				</c:if>
				<c:forEach items = "${lodgeReview}" var = "review2">
					<c:if test="${review2.parent_comment_no == review.comment_no }">
						<div id="reviewitem<c:out value ="${review2.comment_no }"/>" class = "parent_comment<c:out value ="${review2.parent_comment_no }"/>"style=" width: 600px; padding: 5px; margin-top: 5px; margin-left: 10px;">    
	       				<a href="/users/show/61727682" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
	 					<img class="user_img" src="https://a0.muscache.com/im/pictures/user/f4118b8f-179e-4655-9185-c2d2693b53a6.jpg?aki_policy=profile_x_medium" height="48" width="48" alt="Hyun님의 사용자 프로필" title="Hyun님의 사용자 프로필"></a>
	       				 <c:out value="${review2.mem_name}"/><br>
		       			<fmt:formatDate value="${review2.written_time}" pattern="yyyy년 MM월 dd일"/>
	       				 <br/>
	       				   <div id="reply<c:out value="${review2.comment_no}"/>"><c:out value="${review2.contents}"/></div>
	
	       				<c:if test ="${login && review2.mem_no eq member.mem_no}">
	       				<button onclick="fn_replyUpdate('<c:out value="${review2.comment_no}"/>')">수정</button>
	       				 <button  onclick="fn_replyDelete('<c:out value="${review2.comment_no}"/>')">삭제</button>
	 					 </c:if>
					</div>
					</c:if>
				</c:forEach>
			
					</c:forEach>