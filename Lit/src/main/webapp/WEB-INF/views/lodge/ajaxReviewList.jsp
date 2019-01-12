<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    
    		    <c:forEach items = "${lodgeReview}" var = "review">
    	<c:if test = "${review.parent_comment_no == 0 }">
					<div id="reviewitem<c:out value ="${review.comment_no }"/>" class = "parent_comment<c:out value ="${review.parent_comment_no }"/>"style=" width: 600px; padding: 5px; margin-top: 5px;">    
       				<a href="#" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
 					<img class="user_img" src="/resources/images/empty_profile_photo" height="48" width="48" ></a>
       				 <c:out value="${review.mem_name}"/><br>
	       			<fmt:formatDate value="${review.written_time}" pattern="yyyy년 MM월 dd일"/>
       				 <br/>
       				   <div id="reply<c:out value="${review.comment_no}"/>"><c:out value="${review.contents}"/>
       				   </div>
       				   <c:if test ="${member.mem_no ne review.mem_no }">
       				   <button id = "comment_Report" onclick="comment_Report('<c:out value="${review.comment_no}"/>')" style="left: 850px; position: absolute; "><i class="far fa-flag"></i></button> 
						</c:if>
       				<c:if test ="${ login && member.mem_no eq review.mem_no}">
       				<button id= "replyup" onclick="fn_replyUpdate('<c:out value="${review.comment_no}"/>')">수정</button>
       				 <button id= "replydel" onclick="fn_replyDelete('<c:out value="${review.comment_no}"/>')">삭제</button>
					</c:if>
					<c:if test ="${login && member.mem_no eq view.mem_no}">
 					 <button id = "comment_Report"  onclick="fn_replyReply('<c:out value ="${review.comment_no}"/>')">댓글</button>
					</c:if>	
   			
   				 </div>
				</c:if>
				<c:forEach items = "${lodgeReview}" var = "review2">
					<c:if test="${review2.parent_comment_no == review.comment_no }">
						<div id="reviewitem<c:out value ="${review2.comment_no }"/>" class = "parent_comment<c:out value ="${review2.parent_comment_no }"/>"style=" width: 600px; padding: 5px; margin-top: 5px; margin-left: 20px;">    
	       				<a href="#" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
	 					<img class="user_img" src="/resources/images/empty_profile_photo" height="48" width="48" ></a>
	       				 <c:out value="${review2.mem_name}"/><br>
		       			<fmt:formatDate value="${review2.written_time}" pattern="yyyy년 MM월 dd일"/>
	       				 <br/>
	       				   <div id="reply<c:out value="${review2.comment_no}"/>"><c:out value="${review2.contents}"/>
	       				   </div>
       				
       					 <c:if test ="${review2.mem_no ne member.mem_no}">
       				   <button onclick="comment_Report('<c:out value="${review.comment_no}"/>')" style="left: 850px; position: absolute; "><i class="far fa-flag"></i></button> 
						</c:if>
	       				
	       				<c:if test ="${login && review2.mem_no eq member.mem_no}">
	       				<button id= "replyup2" onclick="fn_replyUpdate('<c:out value="${review2.comment_no}"/>')">수정</button>
	       				 <button id= "replydel2" onclick="fn_replyDelete('<c:out value="${review2.comment_no}"/>')">삭제</button>
	 					 </c:if>
					</div>
					</c:if>
				</c:forEach>
			
					</c:forEach>