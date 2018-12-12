<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<jsp:include page="../layout/header.jsp" />

<style>
	/* 	자주하는질문, 1:1문의하기   가운데*/
	.center
	{
		text-align:center;
		padding:60px;
		margin-bottom:-60px;
	}

	
	/* center 아래 항목들을 전부 가운데 정렬한다 */
	.content
	{
		text-align:center;
		padding:40px;
	}

	/* /cs/cs 테스트 */
	dl, dt, dd {
	    margin: 0;
	    padding: 0;
	    
	}
	.faq-list {
	    border-top: 2px solid #b2b2b2;
	    border-bottom: 1px solid #ddd;	
	}
	.faq-list dt, .faq-list dd {
    border-top: 1px solid #ddd;
    padding: 20px;
    position: relative;
	}
	
.faq-list dt:first-child {
    border-top: 0;
}
.faq-list dt {
    cursor: pointer;
    padding-right: 50px;
}
.faq-list dt:before {
    width: 35px;
    content: "Q.";
    display: inline-block;
    padding-right: 20px;
}
.faq-list dt:after {
    content: "+";
    display: inline-block;
    position: absolute;
    width: 15px;
    text-align: center;
    right: 30px;
    top: 23px;
}
.faq-list dd {
    display: none;
    color: #777
}
.faq-list dt.selected {
    color: #148a75;
}
.faq-list dt.selected:before {
    color: #148a75;
}
.faq-list dt.selected:after {
    content: "-";
}
.faq-list dd:before {
    width: 35px;
    content: "A.";
    display: inline-block;
    padding-right: 20px;
}
.faq-list dd {
    background: #f8f7f2;
    text-align:left;
    font-size:15px;
}

	/* 버튼 설정 */
	.button {
	  border: none;
	  color: white;
	  padding: 16px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  transition-duration: 0.4s;
	  cursor: pointer;
	}
	/* /cs/select 첫번째 버튼 */
	.button1
	{
		background-color:#ff0300;
		color: white;
		border:2px solid #cc2e2c;
		padding:10px 15px;
	
	}
	
	.button1:hover
	{
		background-color:#f74c4a;
		color: white;
	}
	
	/* /cs/select 두번째 버튼 */
	.button2
	{
		background-color:#f29d00;
		color:white;
		border:2px solid #996404;
		padding:10px 15px;
	}
	
	.button2:hover
	{
		background-color:#ffb638;
		color: white;
	}
	
	/* /cs/enroll 찾아보기 버튼 */
	.button3
	{
		background-color:#77a7f4;
		color:white;
		border:2px solid #2676f2;
	}
	
	.button3:hover
	{
		background-color:#a5c5f7;
		color:white;
	}

	/* /cs/enroll 버튼 */
	.button4
	{
		background-color:#a8a8a6;
		color:white;
		padding:10px 15px;
	}
	
	.button4:hover
	{
		background-color:#8e8e8e;
		color:white;
	}
	


	/* enroll.jsp 설정 */
	
	.sub_title, .sub_title1, .table_list
	{
		text-align:left;
		padding-top:20px;
		padding-left:100px;
	}
	
	.btnList
	{
		text-align:right;
		padding-top:20px;
		
	}
	
	table
	{
		width:100%;
		border : 1px solid black;
		text-align:left;
	}
	
	th
	{
		background-color:#d8d8d8;
		text-align:center;
		font-size:18px;
		width:150px;
		height:50px;
	}	

</style>

<div class="center">

		<span style="font-size:20px; padding:50px;"><a href="/cs/cs">자주찾는 질문</a></span>
		<span style="font-size:20px; padding:50px;"><a href="/cs/select">1:1 문의</a></span>
</div>

