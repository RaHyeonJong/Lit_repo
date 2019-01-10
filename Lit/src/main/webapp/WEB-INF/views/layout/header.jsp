<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<!-- 데이트 피커 -->
<link href="/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="/resources/dist/js/datepicker.min.js"></script>
	<!-- Include English language -->
<script src="/resources/dist/js/i18n/datepicker.en.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var modal_login = $('#modal-login');
	var modal_findpw = $('#modal-findpw');
	var modal_terms = $('#modal-terms');
	var modal_join = $('#modal-join');
	var modal_certification = $('#modal-certification');
	var modal_joinResult = $('#modal-joinResult');

	
//	쪽지 갯수 실시간 
//class="message_count"

	setInterval(function(){
		$.ajax({
			type:"GET",
			url:"/mypage/scanMsgCnt",
			data:{},
			dataType:"json",
			success:function(res)
			{
				if(res.count != -1) //로그인 성공
					$('.message_count').html('쪽지  ' + res.count + '개');
				else 			//로그인 실패
					return;
			},
			error:function()
			{
				alert("오류");
			}
			
		})
	}, 5000);
	
// 	로그인으로 가는 버튼을 클릭했을 때...
	$('.goLogin').click(function(){
		modal_findpw.css("display", "none");
		modal_join.css("display", "none");
		$('#inputKeyDiv').css("display", "none");
		dur = 0;
		modal_login.css("display", "block");
		modal_joinResult.css("display", "none");
	});
	
// 	회원가입으로 가는 버튼을 클릭했을 때...
	$('.goTerms').click(function(){
		modal_findpw.css("display", "none");
		modal_login.css("display", "none");
		modal_certification.css("display", "none");
		$('#inputKeyDiv').css("display", "none");
		dur = 0;
		modal_terms.css("display", "block");	
		modal_joinResult.css("display", "none");
	});
	
	$('.goJoin').click(function(){
		modal_certification.css("display", "none");
		$('#inputKeyDiv').css("display", "none");
		modal_join.css("display", "block");
		dur = 0;
	});
		
// 	모달창의 검은색 반투명 배경을 클릭했을 때...
	$(window).click(function(e) {
		if(e.target == modal_login[0]) {
			location.href="/main";
		} else if(e.target == modal_findpw[0]) {
			location.href="/main";
		} else if(e.target == modal_terms[0]) {
			location.href="/main";
		} else if(e.target == modal_join[0]) {
			location.href="/main";
		} else if(e.target == modal_certification[0]){
			location.href="/main";
		} else if(e.target == modal_joinResult[0]){
			location.href="/main";
		} 
	});
	
// 	모달창의 X버튼을 클릭했을 때...
	$(".closeModal").click(function(){
		location.href="/main";
	});
	
// 	로그인창에서 id, pw 입력하고 로그인 버튼을 클릭했을 때...
	$('#loginBtn').click(function(){
		var mem_id = $('input[name=mem_id]').val();
		var mem_pw = $('input[name=mem_pw]').val();
		
		$.ajax({
			type: "POST",
			url: "/login",
			data: {"mem_id": mem_id, "mem_pw": mem_pw},
			dataType: "json",
			success : function(res){
				console.log(res.login);
				if(res.login == true){
					window.location.href = "/main";
				}else{
					if(res.ban == false)
						$("#loginMsgDiv").html("로그인 실패! 로그인 정보를 다시 확인해주세요!");
					else
						$("#loginMsgDiv").html("로그인 실패! 관리자에 의해 차단된 계정입니다.");
				}
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
// 	로그인창에서 비밀번호까지 입력 후 엔터키를 눌렀을 때...
	$("#pw_for_login").keypress(function (e) {
        if (e.which == 13){
			$('#loginBtn').click();  // 실행할 이벤트
        }
    });
	
// 	로그인창에서 비밀번호가 생각나지 않으세요? 버튼을 클릭했을 때...
	$('#findpwBtn').click(function(){
		modal_login.css("display", "none");
		modal_findpw.css("display", "block");
	});
	
// 	비밀번호 재설정 창에서 재설정 링크 전송하기 버튼을 클릭했을 때...
	$('#findpwSendLinkBtn').click(function(){
		var mem_id = $('input[name=mem_id_for_findpw]').val();
		
		$.ajax({
			type: "POST",
			url: "/login/findpw",
			data: {"mem_id": mem_id},
			dataType: "json",
			success : function(res){
				if(res.existEmail){
					alert(mem_id+" 로 메일을 전송하였습니다. 메일을 확인해주세요.");
					modal_findpw.css("display", "none");
				} else{
					$('#findpwMsgDiv').html("입력하신 이메일 계정은 존재하지 않습니다. 다시 확인해주세요.");
				}			
			},
			error : function(){
				alert("에러났어요!");
			}
		});
	});
	
// 	이용약관 창에서 동의를 클릭했을 때...
	$('#agree_terms').click(function(){
		$('#modal-terms').css("display", "none");
		$('#modal-join').css("display", "block");
	});
	
// 	이용약관 창에서 거부를 클릭했을 때...
	$('#deny_terms').click(function(){
		$('#modal-terms').css("display", "none");
	});
	
	var validId = false, validName = false, validPw = false, validRepw = false, validBirth = false;
	
// 	회원가입 창에서 이메일 주소 형식검사, 중복검사
	$('#id_for_join').focus(function(){
		$('#valid_id').html("");
	});
	$('#id_for_join').focusout(function(){
		var mem_id =$('#id_for_join').val();
		var emailFormat = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(mem_id.match(emailFormat) != null){
			$.ajax({
				type: "GET",
				url: "/join/checkId",
				data: {"mem_id": mem_id},
				dataType: "json",
				success : function(res){
					if(res.existId){
						$('#valid_id').css("color", "red");
						$('#valid_id').html("이미 가입된 이메일 주소입니다.");
					} else {
						$('#valid_id').css("color", "#03CF5D");
						$('#valid_id').html("사용가능한 이메일 아이디 입니다.");
						validId = true;
					}		
				},
				error : function(){
					alert("에러났어요!");
					return;
				}
			});
		} else {
			$('#valid_id').css("color", "red");
			$('#valid_id').html("이메일 형식에 맞게 작성해주세요.");
		}
	});
	
// 	회원가입 창에서 이름에 특수기호가 포함되었는지 검사
	$('#name_for_join').focus(function(){
		$('#valid_name').html("");
	});
	$('#name_for_join').focusout(function(){
		var mem_name = $('#name_for_join').val();
		var pattern = /[~!@#$%^&*\+=|(){}:;＃＆＆＠§※☆★○●◎◇◆□■△▲▽▼→←←↑↓↔〓◁◀▷▶♤♠♡♥♧♣⊙◈▣◐◑▒▤▥▨▧▦▩♨☏☎☜☞¶†‡↕↗↙↖↘♭♩♪♬㉿㈜№㏇™㏂㏘℡®]/;

		if(pattern.test(mem_name)){
			$('#valid_name').css("color", "red");
			$('#valid_name').html("이름에는 특수기호를 포함할 수 없습니다.");
		} else {
			validName = true;
		}
	});
	
// 	회원가입창에서 비밀번호 형식 검사
	$('#pw_for_join').focus(function(){
		$('#valid_pw').html("");
	});
	$('#pw_for_join').focusout(function(){
		var mem_pw = $('#pw_for_join').val();
		
		var pw_form1 = /[a-zA-Z]/;
		var pw_form2 = /[0-9]/;
		var pw_form3 = /[~!@#$%^&*+-=?]/;
		
		if(mem_pw.length < 8){
			$('#valid_pw').css("color", "red");
			$('#valid_pw').html("비밀번호는 최소 8자 이상이어야 합니다.");
		} else {
			if(!(pw_form1.test(mem_pw) && (pw_form2.test(mem_pw) || pw_form3.test(mem_pw)))){
				$('#valid_pw').css("color", "red");
				$('#valid_pw').html("비밀번호는 숫자나 특수문자를 최소 1자리 이상 포함해야 합니다.");
			} else {
				$('#valid_pw').css("color", "#03CF5D");
				$('#valid_pw').html("사용가능한 비밀번호입니다.");
				validPw = true;
			}
		}
	});
	
// 	회원가입창에서 비밀번호 재입력 검사
	$('#repw_for_join').focus(function(){
		$('#valid_repw').html("");
	});
	$('#repw_for_join').focusout(function(){
		var pw = $('#pw_for_join').val();
		var repw = $('#repw_for_join').val();
		
		if(validPw){
			if(pw == repw){
				validRepw = true;
			} else {
				$('#valid_repw').css("color", "red");
				$('#valid_repw').html("비밀번호가 일치하지 않습니다.");
			}
		}
	});
	
// 	회원가입창에서 생일 입력 후 만 18세 이상인지 검사
	$('#birth_for_join').focus(function(){
		$('#valid_birth').html("");
	});
	$('#birth_for_join').focusout(function(){
		var mem_birth = new Date($('#birth_for_join').val());
		
		var today = new Date();
		var years = today.getFullYear() - mem_birth.getFullYear();
		
		mem_birth.setFullYear(today.getFullYear());
		if(today < mem_birth)
			years--;
		
		if($('#birth_for_join').val() == ""){
			$('#valid_birth').css("color", "red");
			$('#valid_birth').html("생년월일을 정확하게 입력해주세요.");
		} else if(years < 18){
			$('#valid_birth').css("color", "red");
			$('#valid_birth').html("만 18세 미만은 가입하실 수 없습니다.");
		}else{
			validBirth = true;
		}
	});
		
	var mem_id, mem_name, mem_pw, mem_birth, mem_phone;
	
// 	회원가입창에서 가입하기 버튼을 눌렀을 때...
	$('#joinBtn1').click(function(){
		if(validId && validName && validPw && validRepw && validBirth){
			mem_id =$('#id_for_join').val();
			mem_name = $('#name_for_join').val();
			mem_pw = $('#pw_for_join').val();
			mem_birth = new Date($('#birth_for_join').val());
						
			modal_join.css("display", "none");
			modal_certification.css("display", "block");
			
		} else {
			alert("입력하신 회원정보를 다시 한번 확인해 주세요.");
		}
	});
	
// 	쿨sms 휴대폰 인증 기능
	var ukey;
	var timer;
	var dur;
	
// 	전화번호 인증창에서 인증번호 받기 버튼을 눌렀을 때...
	$('#mobile-certi').click(function(){
		mem_phone = $('#mem_phone').val();
		
		$.ajax({
			type: "GET",
			url: "/join/smsCerti",
			data: {"mem_phone": mem_phone},
			dataType: "json",
			success : function(res){
				ukey = res.ukey;
				if(ukey != 0){
					console.log(ukey);
					$('#inputKey').val("");
					$('#inputKeyDiv').css("display", "block");
					
					dur = 180;
					var min, sec;
					timer = setInterval(function(){
						
						min = parseInt(dur/60%60, 10);
						sec = parseInt(dur%60, 10);
						
				        sec = sec < 10 ? "0" + sec : sec;
						
						$('#min').text(min+" :");
						$('#sec').text(sec);
						
						if(dur-- < 1){
							clearInterval(timer);
							alert("인증 실패!! 다시 시도해주세요.");
							$('#inputKeyDiv').css("display", "none");
						}
					}, 1000);
				}
			},
			error : function(){
				alert("에러났어요!");
				return;
			}
		});
	});
	
	var mem_no;
	
// 	전화번호 인증창에서 확인 버튼을 눌렀을 때...
	$('#joinBtn2').click(function(){
		var inputKey = $('#inputKey').val();
		
		if(ukey == inputKey && dur > 0){
			clearInterval(timer);
			mem_phone = $('#mem_phone').val();
			
			$.ajax({
				type: "POST",
				url: "/join/register",
				data: {"mem_id": mem_id,
					"mem_name": mem_name,
					"mem_pw": mem_pw,
					"mem_birth": mem_birth,
					"mem_phone": mem_phone},
				dataType: "json",
				success : function(res){
					if(res.result == 'success'){
						modal_certification.css("display", "none");
						modal_joinResult.css("display", "block");
						mem_no = res.mem.mem_no;
						$('#mem_no_join').val(mem_no);
					} else {
						modal_certification.css("display", "none");
						alert("회원가입 실패!! 관리자에게 문의해주세요.");
					}		
				},
				error : function(){
					alert("에러났어요!");
					return;
				}
			});
		} else {
			$('#inputKeyDiv').css("display", "none");
			dur = 0;
		}
	});
	
// 	회원가입 완료창에서 사진업로드 버튼을 눌렀을 때...
	$('#photo-upload-btn').click(function(){
		$('#input-photo').click();
	});
	
// 	회원가입 완료창에서 사용자가 사진을 업로드 했을 때...
	$('#input-photo').change(function(e){
		e.preventDefault();
		
		var upload = e.target;
		var holder = $('#profile-photo');
				
		var file = upload.files[0];
		var reader = new FileReader();
		
		reader.onload = function (event) {
			var img = new Image();
			holder.attr("src", event.target.result);
		};
		reader.readAsDataURL(file);
		
		$('#later').css("display", "none");
		$('#upload-complete').css("display", "table");

		return false;
	});
	
// 	회원가입 창에서 사진업로드 후 확인 버튼을 눌렀을 때...
	$('#upload-complete').click(function(){		

		$("#form").attr("onsubmit", "return true;");
		$("#form").submit();
	});
	
	

});
</script>      

<style type="text/css">


/* 고친부분 */
/* ul li { */
/*    list-style: none; */
/*    float: left; */
/* } */


body {
	margin: 0;
}

#wrapper {
	min-width:1200px; 
	width: 100%;
	margin:0 auto;"
}

#right-menu ul li {
	list-style: none;
	float: left;
}
.fl-left {
   float: left;
}
.fl-right {
   float: right;
}
.fix-left {
   position: fixed;
   left: 0;
   top: 75px;
}

#header {
/*    position: relative; */
   z-index: 100;
   left: 0;
   top: 0;
   margin: 0 auto;
   width: 100%;
   height: 55px;
   min-width: 978px;
   transition: 0.6s;
   display: block;
   position: -webkit-sticky;
   position: sticky;
   will-change: transform;
}

#header:hover {
   
}
#header.fix {
   position: fixed;
   background: #fffc;
   transition: 0.6s;
}

#header .inner {
	position: relative;
   	z-index: 1;
   	margin: 0 auto;
	padding: 0px 36px 0;
   	min-width:;
   	max-width:;
   	*zoom: 1;
}
#header .inner:after {
   content: "";
   display: block;
   clear: both;
}
#header h3 {
   position: relative;
   float: left;
   margin: 0;
   height: 60px;
   z-index: 2;
   padding-top: 17px;
   padding-right: 20px;
}
#header h1 img {
   display: block;
   position: absolute;
   left: 0;
   top: 0;
   bottom: 0;
   margin: auto;
   max-height: 100%;
}
#header .fl-right {
   margin: 0;
}
#header ul.hovermenu.category {
   padding-inline-start: 25%;
   text-align: center;
   position: absolute;
   margin: 17px auto 0;
   top: 0;
   bottom: 0;
   left: 3%;
   right: 0;
   z-index: 1;
}
#header .logbar {
   float: right;
   text-align: right;
   z-index: 1;
   padding-top : 10px; 
}
#header .logbar>li {
   margin: 0 0 0 26px;
}
#header .logbar>li.mSearch>a img {
   margin-left: 1px;
   vertical-align: -2px;
}
#header .logbar>li.mCart>a img {
   vertical-align: -6px;
   margin-right: 6px;
}
#header .logbar>li.mCart>a .count {
   
}
#header .logbar>li>a {
   display: inline-block;
   padding: 23px 0 3px 0;
   font-size: 14px;
   letter-spacing: 0.18em;
   line-height: 1.2em;
}
ul.hovermenu {
   
}
ul.hovermenu>li {
   display: inline-block;
   position: relative;
   z-index: 10;
   margin: 0 13px;
   vertical-align: middle;
}
ul.hovermenu>li:hover {
   position: relative;
   z-index: 10;
}
ul.hovermenu>li>a {
   display: inline-block;
   padding: 3px 0;
   font-size: 16px;
   letter-spacing: 0.18em;
   line-height: 1.2em;
   color: #000;
   text-decoration: none;
   font-family: '나눔고딕';
}
#header #right-menu .fl-right li img {
	border: 3px solid #999;
	border-radius: 7px;
	-moz-border-radius: 7px;
	-khtml-border-radius: 7px;
	-webkit-border-radius:50px;
}

#header .inner label {
   
   display: inline-block;
   padding: 3px 0;
   font-size: 14px;
   letter-spacing: 0.18em;
   line-height: 1.2em;
   color: #d4ab00;
   width : 100px;
}
ul.hovermenu>li>a:hover {
   padding: 3px 0 2px;
   border-bottom: 1px solid #000;
   transition: 0.2s;
   text-decoration: none;
}
ul.hovermenu>li>.sub {
   visibility: hidden;
   opacity: 0;
   transition: 0.1s;
   position: absolute;
   z-index: 111;
   top: 100%;
   left: 50%;
   margin-left: -97px;
   width: 190px;
}
ul.hovermenu>li:hover>.sub {
   visibility: visible;
   display: block;
   opacity: 1;
   transition: 0.2s;
}
ul.hovermenu>li>.sub ul {
   margin: 10px 0 0;
   padding: 10px 0px;
   background: #fff;
   text-align: left;
}
ul.hovermenu>li>.sub li {
   display: block;
   padding: 0;
   margin: 1px 0;
   padding: 10px 0px 10px 30px;
}
ul.hovermenu>li>.sub li:hover {
   background: #e5e5e5;
}
ul.hovermenu>li>.sub a {
   display: inline-block;
   font-size: 16px;
   letter-spacing: 0.18em;
   color: #000;
   border-bottom: 0px solid #fff;
   line-height: 1.2em;
   text-decoration: none;
}
ul.hovermenu>li>.sub a.last {
   padding: 20px 0px 20px 30px;
}
ul.hovermenu>li>.sub a:hover, ul.hovermenu>li>.sub li.selected a {
   color:;
   transition: 0.2s;
}
.hovermenu li:hover ul.subCate.sub3 {
   display: none;
}
.hovermenu li ul.subCate.sub3::after {
   border: 5px solid transparent;
   border-left-color: gray;
   content: '';
   height: 0;
   position: absolute;
   left: 0px;
   top: 35.5%;
   width: 0;
   z-index: 999;
}
.hovermenu li ul.subCate.sub3 {
   position: absolute;
   left: 190px;
   top: 0px;
   width: 180px;
   height: 89.5%;
}
ul.hovermenu>li>.sub li:hover ul.subCate.sub3 {
   display: block;
}
.hovermenu li ul.subCate.sub4::after {
   border: 5px solid transparent;
   border-left-color: gray;
   content: '';
   height: 0;
   position: absolute;
   left: 0px;
   top: 48.5%;
   width: 0;
   z-index: 999;
}
.hovermenu li:hover ul.subCate.sub4 {
   display: none;
}
.hovermenu li ul.subCate.sub4 {
   position: absolute;
   left: 190px;
   top: 0px;
   width: 180px;
   height: 89.5%;
}
ul.hovermenu>li>.sub li:hover ul.subCate.sub4 {
   display: block;
}
.hovermenu li ul.subCate.sub5::after {
   border: 5px solid transparent;
   border-left-color: gray;
   content: '';
   height: 0;
   position: absolute;
   left: 0px;
   top: 61.5%;
   width: 0;
   z-index: 999;
}
.hovermenu li:hover ul.subCate.sub5 {
   display: none;
}
.hovermenu li ul.subCate.sub5 {
   position: absolute;
   left: 190px;
   top: 0px;
   width: 180px;
   height: 89.5%;
}
ul.hovermenu>li>.sub li:hover ul.subCate.sub5 {
   display: block;
}
.hovermenu li ul.subCate.sub6::after {
   border: 5px solid transparent;
   border-left-color: gray;
   content: '';
   height: 0;
   position: absolute;
   left: 0px;
   top: 75.5%;
   width: 0;
   z-index: 999;
}
.hovermenu li:hover ul.subCate.sub6 {
   display: none;
}
.hovermenu li ul.subCate.sub6 {
   position: absolute;
   left: 190px;
   top: 0px;
   width: 180px;
   height: 89.5%;
}
 ul.hovermenu>li>.sub li:hover ul.subCate.sub6 {
   display: block;
}
.Search {
  position: relative;
  display: flex;
  color: #555;
  padding-top : 16px;
  
}
.Search-box {
  flex: 1 0 auto;
   padding: 0; 
  height: 48px;
  border: 0;
  box-shadow: 0 3px 12px -1px rgba(0, 0, 0, .3);
  transition: all .15s ease-in-out;
  width: 460px;
  vertical-align: middle;
   border : 1px solid #ebebeb;
   border-radius: 4px;
   
}
.Search-label {
  position: absolute;
  top: 14px;
  right: 30px;
  font-size: 40px;
  transition: all .15s ease-in-out;
}
 .Search-box:focus + .Search-label {
  transform: translateX(12px);
}
.search_modal{
    display: block; 
    position: absolute; 
     top: 65px;
     background: #FFFFFF; 
     box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15), 0     15px 20px 0 rgba(0, 0, 0, 0.15); 
     transform-origin:top right; 
     opacity:0; 
     transform:scale(0.95); 
     transition: all .15s ease; 
     border-radius: 4px;
     width: 460px;
}
.search_modal:hover {
      opacity:1; 
     transform:scale(1); 
    transition: all .15s ease; 
}
.inner{
   background-color: #fff;
   border-bottom: 1px solid #e4e4e4;
}
.btn{
   width: 76px;
    height: 50px;
    margin-left: 30px;

	font-size: large;
	font-weight : initial;
	background-color: white;
}
</style>

<header id="header">

	<div class="inner">
		<div class="fl-left">
			<h3 module="Layout_LogoTop">
				<a href="/main"><img style="height: 50px;"
					src="/resources/images/logo.jpg" alt="로고" /></a>
			</h3>
			<!-- 검색창 -->
			  <form action="/main/searchMain" class="Search" method="POST" name="formname" onsubmit="return check()">
			  		<input type="hidden" id="cityLng" name="cityLng"/>
			  		<input type="hidden" id="cityLat" name="cityLat"/>
   				 <input class="Search-box" type="search" id="location-input" autocomplete="off" onkeypress="JavaScript:press(this.form)">
   					
   				 <label class="Search-label" for="Search-box"><i class="fa fa-search"></i></label>
   				 
   				 <input type="submit" style="display:none;" />
  			</form>
		</div>


		<div id="right-menu">
		<ul class="fl-right logbar hovermenu">
			<!-- 로그인 상태가 아니면 -->
			<c:if test="${not login }">
				<li><a href="/cs/cs">고객센터</a></li>
				<li><a class="goLogin" href="#login">로그인</a></li>
				<li><a class="goTerms" href="#join">회원가입</a></li>
			</c:if>
	
			<c:if test="${login }">
			
				<!-- 일반 로그인 -->
				<c:if test="${member.mem_case eq 'user' }">
				
					<li><a href="/mypage/main?go=message" class="message_count">쪽지 ${counter }개</a>
					<li><a href="#">호스트가 되어보세요</a></li>
					<li><a href="/cs/cs">고객센터</a></li>
					<li><a href="/mypage/main">마이페이지</a></li>
					<li><a href="/logout">로그아웃</a></li>
					<c:if test="${member.stored_name eq null}">
						<li><img style="width:50px; height:50px" src="/resources/images/empty_profile_photo.jpg"/></li>	
					</c:if>
					<c:if test="${member.stored_name ne null}">
						<li><img style="width:50px; height:50px" src="/resources/images/${member.stored_name }"/></li>	
					</c:if>
				</c:if>
	
				<!-- 호스트 로그인 -->
				<c:if test="${member.mem_case eq 'host' }">
					<li><a href="/mypage/main?go=message" class="message_count">쪽지 <b>${counter }</b>개</a>
					<li><a href="#">호스트 페이지</a></li>
					<li><a href="/cs/cs">고객센터</a></li>
					<li><a href="/mypage/main">마이페이지</a></li>
					<li><a href="/logout">로그아웃</a></li>
					<c:if test="${member.stored_name eq null}">
						<li><img style="width:50px; height:50px" src="/resources/images/empty_profile_photo.jpg"/></li>	
					</c:if>
					<c:if test="${member.stored_name ne null}">
						<li><img style="width:50px; height:50px" src="/resources/images/${member.stored_name }"/></li>	
					</c:if>
				</c:if>
	
				<!--  관리자 로그인 -->
				<c:if test="${member.mem_case eq 'admin' }">
					<li><a href="/admin/member">관리자 페이지</a></li>
					<li><a href="/logout">로그아웃</a></li>
					<c:if test="${member.stored_name eq null}">
						<li><img style="width:50px; height:50px" src="/resources/images/empty_profile_photo.jpg"/></li>	
					</c:if>
					<c:if test="${member.stored_name ne null}">
						<li><img style="width:50px; height:50px" src="/resources/images/${member.stored_name }"/></li>	
					</c:if>
				</c:if>
			</c:if>
		
		</ul>
		</div>
	</div>
</header>


<!-- ======// 로그인 모달창 ======================================== -->
<div id="modal-login" style="display:none; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div style="position:fixed; width:568px; padding-bottom:36px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center;">
<table style="width:100%;">
<tr><td colspan="2">
<div style="text-align:right; padding-right:10px;"><span class="closeModal" style="cursor:pointer; font-size:30px;">&times;</span></div></td></tr>
<tr><td colspan="2"><img style="width:100%; overflow:hidden;" src="/resources/images/caitlyn999.jpg"/></td></tr>
<tr><td colspan="2" style="padding-top:10px;">
<div style="text-align:center;"><input type="email" name="mem_id" style="width:528px; height:100%; padding:10px; font-size:20px; " placeholder="이메일 주소"/></div></td></tr>
<tr><td colspan="2" style="padding-top:10px;">
<div style="text-align:center;"><input type="password" id="pw_for_login" name="mem_pw" style="width:528px; height:100%; padding:10px; font-size:20px; " placeholder="비밀번호" /></div></td></tr>
</table>
<div style="height:10px;"></div>
<div style="text-align:left; padding-left:10px;">
<a id="findpwBtn" href="#findpw" style="text-decoration:none; color:#008989; font-size: 15px;">비밀번호가 생각나지 않으세요?</a>
</div>
<div id="loginMsgDiv" style="padding-top:10px; color:red; height:30px; font-size:16px; font-weight:bold;"></div>
<div style="display:table; width:90%; height:50px; margin:0 auto; text-align:center; background-color:#FF5A5F; border-radius:3px;">
<div id="loginBtn" style="display:table-cell; vertical-align:middle; color:white; font-size: 20px; cursor:pointer;">로그인</div>
</div>
<div style="height:10px;"></div>
<div>라이프이즈트립 계정이 없으세요? <a class="goTerms" href="#join" style="text-decoration:none; color:#008989; font-size: 16px; font-weight:bold;">회원 가입</a></div>
</div>
</div>
<!-- ======로그인 모달창 //======================================== -->


<!-- ======// 비밀번호찾기 모달창 ======================================== -->
<div id="modal-findpw" style="display:none; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div style="position:fixed; width:568px; height:428px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center;">
<table style="width:100%;">
<tr><td colspan="2">
<div style="text-align:right; padding-right:10px;"><span class="closeModal" style="cursor:pointer; font-size:30px;">&times;</span></div></td></tr>
<tr><td colspan="2" style="text-align:left; padding-left:10%;"><h1>비밀번호 재설정</h1></td></tr>
<tr><td colspan="2" style="text-align:left; padding:1% 10% 5% 10%; font-size:18px; color:#666">
계정으로 사용하는 이메일 주소를 입력하시면, 비밀번호 재설정 링크를 전송해 드립니다.</td></tr>
<tr><td colspan="2" style="text-align:left; padding-left:10%; font-size:19px;">이메일 주소</td></tr>
<tr><td colspan="2" style="text-align:left; padding:0 10% 0 10%;">
<input type="email" name="mem_id_for_findpw" style="width:95%; height:100%; padding:2% 2%; font-size:20px; " /></td></tr>
<tr><td colspan="2"><div id="findpwMsgDiv" style="padding-top:10px; color:red; height:30px; font-size:14px; font-weight:bold;"></div></td></tr>
<tr>
<td style="width:50%; padding:0 0 0 10%;">
<a href="#login" class="goLogin" style="text-decoration:none; color:#008989;"><span style="font-size:22px;">&lt;</span>로그인으로 돌아가기</a>
</td>
<td style="width:50%; padding:0 10% 0 0;">
<div style="display:table; width:90%; height:50px; margin:0 auto; text-align:center; background-color:#FF5A5F; border-radius:3px;">
<div id="findpwSendLinkBtn" style="display:table-cell; vertical-align:middle; color:white; font-size: 18px; cursor:pointer;">재설정 링크 전송하기</div>
</div></td></tr>
</table>
</div></div>
<!-- ====== 비밀번호찾기 모달창 //======================================== -->


<!-- ====== // 이용약관 동의 모달창 ======================================== -->
<div id="modal-terms" style="display:none; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div style="position:fixed; width:568px; padding-bottom: 40px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center;">
<table style="width:100%;">
<tr><td style="padding:0 40px 0 40px; text-align:left;"><h1>가입하시기 전에</h1></td></tr>
<tr><td style="padding:0 40px 0 40px; text-align:left;">Life is Trip은 모두가 환영받을 수 있고 서로 신뢰할 수 있는 커뮤니티를 만들어 나가고자 합니다.
이를 위해, 회원님에게 Life is Trip 서비스 약관에 동의하고, 
커뮤니티의 회원 모두를 존중하고 차별없이 대할 것을 약속해 주시기를 부탁드리고 있습니다.</td></tr>
<tr><td style="padding:40px 40px 0 40px; text-align:left;"><p style="margin:0; font-weight:bold;">Life is Trip 커뮤니티를 위한 약속</p>
모든 Life is Trip 커뮤니티 회원을 인종, 종교, 출신, 국가, 민족, 피부색, 장애, 성별, 
성적 정체성, 성적 취향 또는 연령에 상관없이 존중하며 개인적 판단이나 편견없이 대하겠습니다.</td></tr>
<tr><td style="padding:40px 40px 0 40px; text-align:left;"><p style="margin:0; font-weight:bold;">Life is Trip 서비스 약관 <a href="/terms" style="text-decoration:none; color:#008989;">[바로가기]</a></p>
Life is Trip 서비스 약관, 결제 서비스 약관, 차별 금지 정책에 동의합니다. 
또한, Life is Trip 개인정보 보호정책에 따른 개인정보 이용 및 처리에도 동의합니다.</td></tr>
<tr><td style="padding:40px 40px 0 40px; text-align:left;">
<button id="agree_terms" style="border:0; border-radius:5px; width:30%; height:50px; background-color:#FF5A5F; font-size:20px; color:white; cursor:pointer; margin-right:40px;">동의</button>
<button id="deny_terms" style="border:0; border-radius:5px; width:30%; height:50px; background-color:orange; font-size:20px; color:white; cursor:pointer;">거부</button>
</td></tr>
</table></div></div>
<!-- ====== 이용약관 동의 모달창 // ======================================== -->


<!-- ======// 회원가입 모달창 ======================================== -->
<div id="modal-join" style="display:none; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div style="position:fixed; width:568px; padding-bottom: 20px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center;">
<table style="width:100%;">
<tr><td colspan="2">
<div style="text-align:right; padding-right:10px;"><span class="closeModal" style="cursor:pointer; font-size:30px;">&times;</span></div></td></tr>
<tr><td colspan="2"><h1 style="text-align:left; margin:0; padding:0 30px 10px 30px;">회원가입</h1></td></tr>
<tr><td colspan="2"><hr style="width:90%; height:2px; background-color:#999; border:0;"></td></tr>
<tr><td colspan="2" style="padding-top:5px;">
<div style="text-align:center;"><input type="email" id="id_for_join" name="mem_id" style="width:458px; height:100%; padding:10px; font-size:20px;" placeholder="이메일 주소"/></div></td></tr>
<tr><td colspan="2" style="padding-top:0px;"><div id="valid_id" style="text-align:left; padding-left:40px;"></div></td></tr>
<tr><td colspan="2" style="padding-top:16px;">
<div style="text-align:center;"><input type="text" id="name_for_join" name="mem_name" style="width:458px; height:100%; padding:10px; font-size:20px;" placeholder="이름" /></div></td></tr>
<tr><td colspan="2" style="padding-top:0px;"><div id="valid_name" style="text-align:left; padding-left:40px;"></div></td></tr>
<tr><td colspan="2" style="padding-top:16px;">
<div style="text-align:center;"><input type="password" id="pw_for_join" name="mem_pw" style="width:458px; height:100%; padding:10px; font-size:16px;" placeholder="비밀번호 입력 (특수문자나 숫자를 포함한 최소 8자 이상)" /></div></td></tr>
<tr><td colspan="2" style="padding-top:0px;"><div id="valid_pw" style="text-align:left; padding-left:40px;"></div></td></tr>
<tr><td colspan="2" style="padding-top:16px;">
<div style="text-align:center;"><input type="password" id="repw_for_join" style="width:458px; height:100%; padding:10px; font-size:16px;" placeholder="비밀번호 재입력" /></div></td></tr>
<tr><td colspan="2" style="padding-top:0px;"><div id="valid_repw" style="text-align:left; padding-left:40px;"></div></td></tr>
<tr><td colspan="2" style="padding:16px 0 0 40px; text-align:left;">
<h3 style="margin:0; padding:0; line-height: 36px;">생일</h3>회원가입을 하시려면 만 18세 이상이어야 합니다.<br>생일은 다른 회원에게는 공개되지 않습니다.</td></tr>
<tr><td colspan="2" style="padding:16px 0 0 40px; text-align:left;">
<input type="date" id="birth_for_join" name="mem_birth" style="width:180px; height:100%; padding-left:10px; font-size:16px; color:#666;"/>
</td></tr>
<tr><td colspan="2" style="padding-top:0px;"><div id="valid_birth" style="text-align:left; padding-left:40px;"></div></td></tr>
</table>

<div style="display:table; width:30%; height:50px; margin:36px auto 10px; text-align:center; background-color:#FF5A5F; border-radius:5px;">
<div id="joinBtn1" style="display:table-cell; vertical-align:middle; color:white; font-size: 20px; cursor:pointer;">다음</div></div>

<div style="height:10px;"></div>
<div>잠깐!! 이미 아이디가 있으시다고요?! <a class="goLogin" href="#join" style="text-decoration:none; color:#008989; font-size: 16px; font-weight:bold;">&nbsp;&nbsp;&nbsp;로그인 하러 가기</a></div>
</div>
</div>
<!-- ======회원가입 모달창 //======================================== -->


<!-- ======// 전화번호인증 모달창 ======================================== -->
<div id="modal-certification" style="display:none; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div style="position:fixed; width:568px; padding-bottom:20px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center;">
<table style="width:100%;">
<tr><td colspan="2">
<div style="text-align:right; padding-right:10px;"><span class="closeModal" style="cursor:pointer; font-size:30px;">&times;</span></div></td></tr>
<tr><td colspan="2"><h1 style="text-align:left; margin:0; padding:0 30px 10px 30px;">전화번호 인증</h1></td></tr>
<tr><td colspan="2"><hr style="width:90%; height:2px; background-color:#999; border:0;"></td></tr>
<tr><td colspan="2" style="padding-top:5px;">
<div style="text-align:left; padding-left:36px;"><input type="text" id="mem_phone" style="width:258px; height:100%; padding:10px; font-size:14px;" placeholder="전화번호 입력 ( ' - ' 없이 번호만 입력 )"/>
<button id="mobile-certi" style="width: 120px; padding:9px; font-size:14px;">인증번호 받기</button>
</div></td></tr>
<tr><td colspan="2"><div id="inputKeyDiv" style="display:none; text-align:left; padding:20px 0 10px 36px;">
<input type="text" id="inputKey" style="width:258px; height:100%; padding:10px; font-size:14px;" placeholder="인증번호 입력"/>
<span id="min" style="color:red; font-size: 20px; font-style: italic;"></span>
<span id="sec" style="color:red; font-size: 20px; font-style: italic;"></span></div></td></tr>
<tr><td style="width:30%; text-align:center; padding-top:36px;">
<a href="#join" class="goJoin" style="text-decoration:none; color:#008989;"><span style="font-size:22px;">&lt;</span>돌아가기</a>
</td>
<td style="width:70%; text-align:right; padding:36px 36px 0 0;">
<div style="display:table; margin:0 0 0 200px; width:40%; height:50px; text-align:center; background-color:#FF5A5F; border-radius:3px;">
<div id="joinBtn2" style="display:table-cell; vertical-align:middle; color:white; font-size: 18px; cursor:pointer;">확인</div>
</div></td></tr>
</table>
</div></div>
<!-- ====== 전화번호인증 모달창 //======================================== -->


<!-- ====== // 프로필 사진 등록 모달창 ======================================== -->
<div id="modal-joinResult" style="display:none; position:fixed; z-index:101; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.65); ">
<div style="position:fixed; width:568px; padding-bottom:20px; top:50%; left:50%; transform:translate(-50%, -50%); background-color:#fefefe; text-align: center;">
<form id="form" action="/join/insertMyPhoto" method="POST" enctype="multipart/form-data" onsubmit="return false;">
<table style="width:100%;">
<tr><td>
<div style="text-align:right; padding-right:10px;"><span class="closeModal" style="cursor:pointer; font-size:30px;">&times;</span></div></td></tr>
<tr><td><h1 style="text-align:left; margin:0; padding:0 30px 10px 30px;">회원가입을 축하합니다.</h1></td></tr>
<tr><td style="text-align:left; padding:1% 10% 5% 10%; font-size:18px; color:#666">
회원님의 사진을 올려주세요.<br> 
사진은 프로필에 추가되어 라이프이즈트립의 다른 회원에게 표시됩니다.<br> 
얼굴이 선명하게 보이는 사진이어야 합니다.<br> 
호스트나 게스트가 보게 되는 사진이므로 개인 정보나 민감한 정보가 표시되지 않은 사진을 사용하세요.</td></tr>
<tr><td><div style="width:160px; height:160px; margin:0 auto; overflow:hidden;"><img id="profile-photo" style="width:90%; height:90%; border: 3px solid #999; border-radius:50%;" src="/resources/images/empty_profile_photo.jpg"></div></td></tr>
<tr><td style="padding-top:36px;">
<input id="mem_no_join" type="hidden" name="mem_no" />
<input type="file" id="input-photo" name="file" hidden="hidden"/>
<div style="display:table; margin:0 auto; width:40%; height:50px; text-align:center; background-color:#FF5A5F; border-radius:3px;">
<div id="photo-upload-btn" style="display:table-cell; vertical-align:middle; color:white; font-size: 18px; cursor:pointer;">사진 업로드</div></div></td></tr>
<tr><td style="padding:36px 0 36px 0;"><a id="later" style="text-decoration:none; color:#008989;" href="/main">나중에 하겠습니다.</a>
<div id="upload-complete" style="display:none; margin:0 auto; width:40%; height:50px; text-align:center; background-color:#4568FF; border-radius:3px;">
<div style="display:table-cell; vertical-align:middle; color:white; font-size: 18px; cursor:pointer;">확인</div></div></td></tr>
</table>
</form>
</div></div>
<!-- ====== 프로필 사진 등록 모달창 // ======================================== -->

<!-- 검색창 자동완성기능 -->
<script>
////////// 자동완성기능 /////////
function initAutocomplete() {
	var input = document.getElementById('location-input');
	var searchBox = new google.maps.places.Autocomplete(input);
	
	 google.maps.event.addListener(searchBox, 'place_changed', function () {
	        var place = searchBox.getPlace();
	        
	        document.getElementById('cityLat').value = place.geometry.location.lat();
	        document.getElementById('cityLng').value = place.geometry.location.lng();
	    });
	
}

google.maps.event.addDomListener(window, 'load', initAutocomplete);
///////////////////////////////
function press(f) { 
		if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
			formname.submit(); //formname에 사용자가 지정한 form의 name입력 
			console.log("enter");
		} 
}

function check() {
	if(document.getElementById('cityLat').value) {
		alert("장소를 입력하세요!");
		return false;
	}
	return true;
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?&libraries=places"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&libraries=places&v=3.exp&sensor=false&callback=initAutocomplete"
         async defer></script>
