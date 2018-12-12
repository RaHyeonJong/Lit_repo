<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>로고 페이지</h1>

	<form>

		목적지<br> <input type="text" name=""/><br> 
		<label  for="checkin_input"><small >체크인</small></label>
		<input type="date" name="checkin" placeholder="년/월/일" />
		
		<label  for="checkout_input"><small >체크아웃</small></label>
		<input type="date" name="checkout" placeholder="년/월/일" /><br> 
		
		인원수<br>
		<select id="adults" name="adults" data-vars-select-name="adults">
			<option selected="" value="1">성인 1명</option>
			<option value="2">성인 2명</option>
			<option value="3">성인 3명</option>
			<option value="4">성인 4명</option>
			<option value="5">성인 5명</option>
			<option value="6">성인 6명</option>
			<option value="7">성인 7명</option>
			<option value="8">성인 8명</option>
			<option value="9">성인 9명</option>
			<option value="10">성인 10명</option>
			<option value="11">성인 11명</option>
			<option value="12">성인 12명</option>
			<option value="13">성인 13명</option>
			<option value="14">성인 14명</option>
			<option value="15">성인 15명</option>
			<option value="16">성인 16명</option>
		</select>
		<br>
		<button>검색</button>
	</form>

</body>
</html>