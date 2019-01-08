<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>


<script type="text/javascript">






</script>


<body>


<div>

</div>

<form name="fileForm" action="/host/addview" method="post" enctype="multipart/form-data">
<input id="imgInput" multiple="multiple" accept="image|gif,image/jpeg,image/png" type="file" name="file">
<input type ="hidden" name ="lodge_no" value="<c:out value="${lodge_no }"/>">
<input type ="submit" value="전송">
</form>

</body>
</html>