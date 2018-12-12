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
<script type="text/javascript">


</script>
<style type="text/css">
#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;

}

.left { width: 50%; float: left; }
.right {.width: 50%; float: right; height:500px; }


</style>
</head>
<body>

<div id="wrapper">
	
	
	<div class="left" style="border: 1px solid red;">
		<div id="content1">
			<h2>호스트로 가는길</h2>
		</div>

		<div id="content2">
			<h3>1단계</h3>
			<div class="content2-1">
				<h3>등록하려는 숙소 유형을 선택해 주세요.</h3>
			</div>
			<div class="content2-2">
			  <form action="" method="post">
				<select name="category" style="width:124px; height:25px;">
					<option value="show">집유형</option>
					<option value="all">집전체</option>
				    <option value="lot">다인실</option>
				    <option value="alone">개인실</option>
				</select>
				<select name="max-capacity" style="width:124px; height:25px">
					<option value="show">가능인원</option>
				    <option value="one">최대1명숙박가능</option>
				    <option value="two">최대2명숙박가능</option>
				    <option value="three">최대3명숙박가능</option>
				    <option value="four">최대4명숙박가능</option>
				    <option value="five">최대5명숙박가능</option>
				    <option value="six">최대6명숙박가능</option>
				    <option value="seven">최대7명숙박가능</option>
				    <option value="eight">최대8명숙박가능</option>
				    <option value="nine">최대9명숙박가능</option>
				    <option value="ten">최대10명숙박가능</option>
				    <option value="eleven">최대11명숙박가능</option>
				    <option value="twelve">최대12명숙박가능</option>
				    <option value="thirteen">최대13명숙박가능</option>
				    <option value="fourteen">최대14명숙박가능</option>
				    <option value="fifteen">최대15명숙박가능</option>
				    <option value="sixteen">최대16명숙박가능</option>
				</select> <br>
				<input type="text" style="width:250px; height:25px;"/> <br><br>
				<button>계속</button>
			   </form>
			</div>
		</div>
	</div>
	<div class="right" style="border: 1px solid blue;">
		<h3>이미지들어갈곳</h3>
	
	</div>
</div>








</body>
</html>