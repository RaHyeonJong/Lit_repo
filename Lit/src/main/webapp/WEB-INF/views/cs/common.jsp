<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<jsp:include page="../layout/header.jsp" />

<head>

	<title>Life Is Trip 인생은 여행이다.</title>

</head>

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

	/* /cs/cs에 질문 항목들을 dl dt dd로 구성하였음 */
	dl, dt, dd {
	    margin: 0;
	    padding: 0;
	}
	
	.faq-list {
	    border-top: 2px solid #b2b2b2;
	    border-bottom: 1px solid #ddd;	
	    text-align:left;
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

	/*Button CSS 및 Hover CSS*/

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
	.button1 {
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

	/*table_list(모든 테이블의 공통 사항) */
	
	.table_list
	{
		width:70%;
		margin-left:15%;
		margin-right:15%;
	}
	
	/* list.jsp의 table class 설정 */
	table.table1 
	{
		border-collapse: collapse;
		text-align: left;
		line-height: 1.5;
		border-left: 1px solid #ccc;
		margin: 20px 10px;
	}

	table.table1 thead th 
	{
		padding: 10px;
		font-weight: bold;
		text-align:center;
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
		border-bottom: 2px solid #fc8080;
		background: #e2e2e0;
	}
	
	table.table1 tbody th 
	{
		width: 70px;
		padding: 10px;
		font-weight: bold;
		text-align:center;
		vertical-align: top;
		border-right: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
		background: #ececec;
	}

	table.table1 td.td1 
	{
		width: 300px;
		padding: 10px;
		vertical-align: top;
		text-align:left;
		border-right: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}

	table.table1 td.td2 
	{
		width: 150px;
		padding: 10px;
		vertical-align: top;
		text-align:center;
		border-right: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}

	/* 그 외 테이블 꾸미기 */
	
	table.table2
	{
		width:100%;
		border:1px solid #e0e0e0;
	}
	
	table.table2 th
	{
		background-color:#fce0d1;
		text-align:center;
		font-size:18px;
		color:black;
		width:200px;
		height:50px;
	}
	

	/* enroll의 textarea */

	textarea
	{
		height:170px; 
		width:772px; 
	}
	
	.btnList
	{
		text-align:right;
		padding-top:40px;
		padding-right:170px;
		
	}
	
</style>

<div class="center">
		<span style="font-size:20px; padding:20px;"><a href="/cs/cs">자주찾는 질문</a></span>
		<span style="font-size:20px; padding:20px;"><a href="/cs/select">1:1 문의</a></span>
</div>
