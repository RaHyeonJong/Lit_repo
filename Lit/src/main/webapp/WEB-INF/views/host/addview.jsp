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



var sel_files =[];

$(document).ready(function(){

	$("#input_imgs").on("change",handleImgsFilesSelect);
	
});
	function handleImgsFilesSelect(e){
		var files =e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\""+e.target.result+"\"/>";
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}




</script>
<style>
.imgs_wrap{
 	width : 600px;
 	margin-top: 50px;
}
.imgs_wrap img{
	max-width: 200px;
}

</style>

<body>


<div>
<div class= "imgs_wrap">

</div>

</div>
<form name="fileForm" action="/host/addview" method="post" enctype="multipart/form-data">
<input id = "input_imgs" multiple="multiple" accept="image|*" type="file" name="file">
<input type ="hidden" name ="lodge_no" value="<c:out value="${lodge_no }"/>">
<input type ="submit" value="전송">
</form>

</body>
</html>