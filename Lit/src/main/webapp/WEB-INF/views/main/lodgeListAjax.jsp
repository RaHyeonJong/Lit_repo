<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach items = "${list}" var = "list">
<%-- <c:forEach var="a" begin="1" end="9" step="1"> --%>

<div id="lodgeList2">

	<div id="lodgeImage">
		<div id="lodgeImage2" style="width: 300px; height: 200px;">
			<img src="http://file2.instiz.net/data/cached_img/upload/2015/12/04/0/b550bb847aef49fbbd545088331f9244.jpg" width="100%" height="100%">
		</div>
	</div>

	<div id="lodgeInfo">
			<div id="lodgeInfo2" style="padding: 20px 20px 16px !important;">
				<span style="position: relative !important;height: 100% !important;width: 100% !important;display: inline-block !important;">
					<div>
						${list.lodge_name }
					</div>
					<div>
						인원${list.lodge_capacity }명
					</div>
					<div>
						${list.convenient_facility }
						
					</div>
				</span>
			</div>
		</div>
</div>

</c:forEach>