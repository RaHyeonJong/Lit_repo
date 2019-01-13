<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
$(document).ready(function() {
	$('#lodgeInfo').click(function() {
		var lodge_no = $('#lodgeInfo').attr('data-lodgeNo');
		window.location.href = "/lodge/view?lodge_no="+lodge_no;
	});
});
</script>

<c:forEach items = "${list}" var ="list" varStatus="status">
<%-- <c:forEach var="a" begin="1" end="9" step="1"> --%>


	
<div id="lodgeList2">
	<div id="lodgeImage">
		<div id="lodgeImage2" style="width: 300px; height: 200px;">
<%-- 			<img src="/resources/images/lodge_image/${list.stored_name[0] }" width="100%" height="100%"> --%>
			
			<div id="carousel-example-generic${status.index }" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					
    				<div class="item active" style="width: 300px; height: 200px;">
      					<img height="100%" width="100%" src="/resources/images/lodge_image/${list.stored_name[0] }">
					</div>
    				
    				
					
					
 				<c:if test="${fn:length(list.stored_name) gt 1 }">
 				
					<c:forEach items="${list.stored_name }" var="list2" varStatus="status1">
						<c:if test="${not status1.first }">
							<div class="item"  style="width: 300px; height: 200px;">
	      						<img height="100%" width="100%" src="/resources/images/lodge_image/${list2 }">
	 						</div>
 						</c:if>
					</c:forEach>
				</c:if>
    				
    				
				</div>

				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel-example-generic${status.index }" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel-example-generic${status.index }" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				  
			</div>
		</div>
	</div>
	
	<div id="lodgeInfo" data-lodgeNo="${list.lodge_no}" style="cursor: pointer;">
		<div id="lodgeInfo2" style="padding: 20px 20px 16px !important;">
			<span style="position: relative !important;height: 100% !important;width: 100% !important;display: inline-block !important;">
					<div style="font-weight: bold;font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;">
						${list.lodge_name }
					</div>
					<div>
						인원${list.lodge_capacity }명
					</div>
					<div>
						${list.convenient_facility }
					</div>
					<div style="text-align: right;">
						￦${list.stay_cost }/박
					</div>
			</span>
				
		</div>
			
	</div>
</div>

</c:forEach>