<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
 <link rel="shortcut icon" type="image/x-ion" href="/resources/images/url.ico" />

<head>
	<title>Life Is Trip 인생은 여행이다</title>
</head>

<style>

#gallery {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-template-rows: repeat(2, 1fr);
  grid-template-areas: "m m s1 s2" "m m s3 s4";
  height: 600px;
  overflow: hidden;
  background-color: #393939;
  gap: 2px;
  width: -webkit-fill-available;
}

#gallery div.photo img {
  height: 100%;
  width: 100%;
  -o-object-fit: cover;
     object-fit: cover;
  -o-object-position: center center;
     object-position: center center;
}
#gallery div.photo img:hover {
  -webkit-transform: scale(1.1);
          transform: scale(1.1);
  transition: -webkit-transform 0.3s;
  transition: transform 0.3s;
  transition: transform 0.3s, -webkit-transform 0.3s;
  
}


#gallery #photo1 {
  grid-area: m;
}

#gallery #photo2 {
  grid-area: s1;
}
#gallery #photo3 {
  grid-area: s2;
}
#gallery #photo4 {
  grid-area: s3;
}
#gallery #photo5 {
  grid-area: s4;
}
#gallery #photo6 {
  display: none;
}
#gallery #photo7 {
  display: none;
}
#gallery #photo8 {
  display: none;
}
#gallery #photo9 {
  display: none;
}
#gallery.lightbox {
  position: absolute;
  top: 0;
  left: 0;
  height: 100vh;
  width: 100vw;
  grid-template-columns: repeat(4, 1fr);
  grid-template-rows: 8fr 2fr;
  grid-template-areas: "photo1 photo1 photo1 photo1" "photo2 photo3 photo4 photo5";
  padding: 1em 4em;
}
/* 이미지 css 끝*/


/* 숙소이름, 숙소 유형 호스트 이미지 css 시작*/
.row{
	border-spacing: 0;
	border-collapse : collapse;
	text-align: left;
	vertical-align: top;
	padding : 0;
	width : 100%;
	position: relative;
	display : table;
}
.small-10 .large-10 .columns .first{
	font-size: 16px;
	text-ailgn :left;
	line-height : 1.3;
	font-family: Circular, Helvetica, Arial, sans-serif;
	font-weight: normal;
	padding :0;
	color : #0a0a0a;
	padding-right :8px;
	margin: 0;
	padding-bottom: 16px;
	width: 497.33333px;
	padding-left : 16px;
}
.body-text-lg .heavy .row-pad-bot-1{ /*숙소 이름*/
	padding :0;
	margin: 0;
	text-align: left;
	font-size: smaller;
	font-weight: 700;
	font-family: Circular,  Helvetica, Helvetica, Arial, sans-serif;
	color: #484848;
	word-break : normal;
	line-height: 1.2;
	padding-botton : 8px !important;
	margin-bottom: 8px !important;

}
.body-text .light .row-pad-bot-4{
	padding: 0;
	margin: 0 auto; 
	text-align: left;
	padding-bottom: 32px;
	font-weight: 300;
	font-family: Circular  , Helvetica , Helvetica , Arial, sans-serif; 
	color: #484848;
	word-break: normal; 
	line-height: 1.4; 
	font-size: xx-large; 
	margin-bottom: 0px !important;
	
}
.body-text .light{
margin: 0; 
text-align: left;
padding: 0; 
font-weight: 300; 
font-family: Circular , Helvetica , Helvetica , Arial, sans-serif; 
color: #484848;
word-break: normal; 
line-height: 1.4; 
font-size: 18px; 
margin-bottom: 0px !important;
}
.color-rausch .light{ /*호스트에게 메시지 보내기*/ 
font-family: 'Circular', Helvetica, Arial, sans-serif; 
padding: 0; 
margin: 0; 
text-align: left; 
line-height: 1.3; 
text-decoration: none; 
font-weight: 300; 
color: #ff5a5f !important;
}
.dot{
font-size: 15px; 
vertical-align: middle; 
padding-left: 8px; 
padding-right: 8px;
}
.small-2 .large-2 .columns .last{ /*호스트 이미지 부분*/
font-size: 16px; 
text-align: left; 
color: #0a0a0a; 
font-family: 'Circular', Helvetica, Arial, sans-serif; 
font-weight: normal; 
padding: 0; 
line-height: 1.3; 
width: 80.66667px; 
padding-left: 16px;
margin: 0 auto;
padding-bottom: 16px; 
padding-right: 16px;

}
.profile-img{
display: block; 
outline: none; 
text-decoration: none; 
-ms-interpolation-mode: bicubic; 
width: auto; 
clear: both; 
border: none; 
max-width: 77px; 
border-radius: 50%; 
max-height: 77px;

}
.width-77 .row-pad-top-2{
display: block; 
outline: none; 
text-decoration: none; 
-ms-interpolation-mode: bicubic; 
clear: both; 
border: none; 
width: 77px; 
padding-top: 16px; 
max-width: 77px;

}
/*숙소유형,이름, 호스트이미지 css 끝*/

.lodge_info > span{ /*침구 및 정원 정보*/
    font-weight: 600 !important;
    margin: 0 !important;
    word-wrap: break-word !important;
    font-size: 16px !important;
    line-height: 22px !important;
    letter-spacing: normal !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
}
.line{
   border-bottom-style: solid !important;
    border-bottom-color: #f5f5f5 !important;
    width: 650px;
}
.user_img{
	background-color: var(--color-accent-light-gray, #D8D8D8) !important;
    border-radius: var(--border-profile-photo-border-radius, 50%) !important;
    border-width: var(--border-profile-photo-border-width, 2px) !important;
    border-color: var(--color-white, #ffffff) !important;

}
._n5lh69r{
margin: 0px !important;
    /* word-wrap: break-word !important; */
    /* font-size: 14px !important; */
    /* line-height: 18px !important; */
    /* letter-spacing: normal !important; */
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    text-transform: undefined !important;
    color: #484848 !important;
    padding-top: undefined !important;
    padding-bottom: undefined !important;
    font-weight: normal !important;
    display: inline !important;
}
  #map {
      	width: 45%;
        height: 45%;
      }
/*편의시설 모달창*/
a{color:#000;}

.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}

#modalLayer{display:none; position:relative;}
#modalLayer .modalContent{width:300px; height:500px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; top:50%; z-index:11; background:#fff;}
#modalLayer .modalContent button{position:absolute; right:0; top:0; cursor:pointer; 
border: none;}

.close_btn{
    display: inline-block;
    position: relative;
    margin: 6 20px 0 7px;
    padding: 0;
    width: 4px;
    height: 20px;
    background: #000;
    transform: rotate(45deg);
}
.close_btn:before {
    display: block;
    content: "";
    position: absolute;
    top: 50%;
    left: -8px;
    width: 20px;
    height: 4px;
    margin-top: -2px;
    background: #000;


}




.reply{
border: 1px solid gray;
 width: 600px;
 padding: 5px;
 margin-top: 5px;
 display: inline-block;

}
.lodgeReview{
	list-style: none;


}
#lodge_like{
	z-index: 999;
    position: absolute;
    right: 16px;
    top: 90px;
	  color:  #888;
	  font-size: 18px;
	  font-family: inherit;
	  background : #efefef;
/* 	  background : inherit; */
	  border: 0.1em; 
	  border-radius: 4px;
/* 	  padding: 0.333em 1em 0.25em; */
	  line-height: 1.2em;
/* 	  box-shadow: 0 0.25em 1em -0.25em; */
	  cursor: pointer;
	  transition: color 150ms ease-in-out, background-color 150ms ease-in-out, transform 150ms ease-in-out;
	  outline: 0;
/* 	  margin: 5em 0; */
}
#lodge_like:hover {
  color: indianred;
}
#lodge_like:active {
  transform: scale(0.95);
}
#lodge_like.selected {
  color: #FFF;
  background-color: indianred;
  border-color: indianred;
}
#lodge_like .heart-icon {
  display: inline-block;
  fill: currentColor;
  width: 0.8em;
  height: 0.8em;
  margin-right: 0.2em;
}

#comment_Report{
	  font-size: 14px;
	  font-family: inherit;
	  background : #ffffff;
/* 	  background : inherit; */
	  border: 0.1em; 
	  border-radius: 4px;
/* 	  padding: 0.333em 1em 0.25em; */
	  line-height: 1.2em;
/* 	  box-shadow: 0 0.25em 1em -0.25em; */
	  cursor: pointer;
	  transition: color 150ms ease-in-out, background-color 150ms ease-in-out, transform 150ms ease-in-out;
	  outline: 0;
/* 	  margin: 5em 0; */
}
#comment_Report:hover {
  color: indianred;
}
#comment_Report:active {
  transform: scale(0.95);
}
#comment_Report.selected {
  color: #FFF;
  background-color: indianred;
  border-color: indianred;
}
#comment_Report .heart-icon {
  display: inline-block;
  fill: currentColor;
  width: 0.8em;
  height: 0.8em;
  margin-right: 0.2em;
}





</style>
 
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
var map;
var latVal = ${view.latitude};//숙소 위도
var lngVal = ${view.longitude}; //숙소 경도


var cont = "${view.lodge_addr}";


   var marker;

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: {lat: latVal, lng: lngVal}
        });

        var infowindow = new google.maps.InfoWindow({
        	content : String(cont)
        })
        
        marker = new google.maps.Marker({
          map: map,
          draggable: true,
          animation: google.maps.Animation.DROP,
          position: {lat: latVal, lng: lngVal}
        });
        marker.addListener('click', toggleBounce);
		infowindow.open(map, marker);
      }

      function toggleBounce() {
        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      };
      
     
      

 

</script>


<script type="text/javascript">
$(document).ready(function(){
	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
	    modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > a").focus(); 
	    return false;
	  });

	  $(".modalContent > button").click(function(){
	    modalLayer.fadeOut("slow");
	    modalLink.focus();
	  });		
	});

</script>

<script type="text/javascript">
function fn_formSubmit(){ //후기 입력
	if($("#contents").val()==""){
		alert("내용을 입력해주세요.");
		return;
		}
    
	$.ajax({
    	url : "insertReview",
    	type : "post",
    	data : {"lodge_no":$("#lodge_no").val(),"mem_name" : $("#mem_name").val(), "mem_no":$("#mem_no").val(), "contents" :$("#contents").val() },
    	dataType :"html",
    	success : function(result){
    		alert("저장되었습니다.");
//    		console.log(result);
// 			$("#review").append(result);
    		$("#contents").val("");
     		document.getElementById("review").innerHTML = result;
    	}
    	})
    	
 }

function fn_replyDelete(comment_no){ //후기 삭제
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	
	$.ajax({
        url: "reviewDelete",
        type:"post", 
        data: {"comment_no":comment_no},
       	dataType : "json",
        success: function(result){
           
                $("#reviewitem"+comment_no).remove();
                alert("삭제되었습니다.");
            
        }
    })

    
     }
    
    
    var updateComm = updateContents = null;
    
    function fn_replyUpdate(comment_no){
		hideDiv("#replyDialog");
		
		if(updateComm){
			$("#replyDiv").appendTo(document.body);
			$("#reply"+updateComm).text(updateContents);
		}
    	
		updateComm = comment_no;
		updateContents = $("#reply"+comment_no).html();
		
		$("#comment_no2").val(comment_no);
		$("#contents2").val(updateContents);
		$("#reply"+comment_no).text("");
		$("#replyDiv").appendTo($("#reply"+comment_no));
		$("#replyDiv").show();
		$("#replyup").hide();
		$("#replyup2").hide();
		$("#replydel").hide();
		$("#replydel2").hide();
		$("#contents2").focus();
    }
    
    function fn_replyUpdateSave(){
    	if($("#contents2").val()==""){
    		alert("내용을 입력해주세요.");
    		return;
    		}
    		
    	$.ajax({
    		url : "updateReview",
    		type:"post",
    		data : {"lodge_no":$("#lodge_no2").val(),"comment_no":$("#comment_no2").val(), "contents": $("#contents2").val()},
    		dataType : "html",
    		success : function(result){
    			if(result!==""){
   				document.getElementById("review").innerHTML = result;
    				$("#replyDiv").hide();
    				alert("수정되었습니다.");
    			}
    			updateComm = updateContents = null;
    		}
    	});
    }
    
    function fn_replyUpdateCancel(){
    	hideDiv("#replyDiv");
    	$("#replyup").show();
    	$("#replydel").show();
    	$("#reply"+updateComm).html(updateContents);
    	updateComm = updateContents = null;
    	
    }
	
    function hideDiv(id){
    	$(id).hide();
    	$(id).appendTo(document.body);
    }
	
    function fn_replyReply(comment_no){
		$("#replyDialog").show();
			
		if(updateComm){
			fn_replyUpdateCancel();
		}
    
    $("#parent_comment_no3").val(comment_no);
	$("#contents3").val("");
	$("#replyDialog").appendTo($("#reply"+comment_no));
	$("#contents3").focus();

    }
    
    function fn_replyReplyCencle(){
    	hideDiv("#replyDialog");
    	$("#replyup2").show();
    	$("#replydel2").show();
    }
    
    function fn_replyReplySave(){

    	$.ajax({

    	url :"lodgeReview",
    	type : "post",
    	data : {"lodge_no":$("#lodge_no3").val(),"mem_no":$("#mem_no3").val(),"contents":$("#contents3").val(),"parent_comment_no":$("#parent_comment_no3").val()},
    	dataType : "html" ,
    	success : function(result){

    		$("#reviewitem").html("");
    		hideDiv("#replyDialog");
    		alert("내용이 저장되었습니다.");
    		$("#contents3").val("");
    		document.getElementById("review").innerHTML = result;

    		
    	}
    	
    	
    });
	
    }
</script>

<script type="text/javascript">//상세뷰 데이트 피커
$(function() {
    $("#datepicker").datepicker();
    $("#datepicker2").datepicker();
    
    var $start = $("#datepicker2"),
    	$end = $("#datepicker");

	 var select_date = ${view.available_term};
    var now = new Date();
  	 var end_date = new Date(now.getFullYear(), now.getMonth()+select_date, now.getDate());
    
	 	var disabledDates = ${d_off};

    	$start.datepicker({
    		language: 'en',
    	  onRenderCell: function(d, type) {
    	    if (type == 'day') {
    				var disabled = false,
    	      		formatted = getFormattedDate(d);
    	          
    	          disabled = disabledDates.filter(function(date){
    	          	return date == formatted;
    	          	
    	          }).length
    	      
    						return {
    	          	disabled: disabled
    	          }
    	    }
    	  }
    	})
    	$end.datepicker({
    		language: 'en',
    	  onRenderCell: function(d, type) {
    	    if (type == 'day') {
    				var disabled = false,
    	      		formatted = getFormattedDate(d);
    	          
    	          disabled = disabledDates.filter(function(date){
    	          	return date == formatted;
    	          	
    	          }).length
    	      
    						return {
    	          	disabled: disabled
    	          }
    	    }
    	  }
    	})
    	
    	
    	function getFormattedDate(date) {
    	  var year = date.getFullYear(),
    	    month = date.getMonth() + 1,
    	    date = date.getDate();
    	    
    	    return year + '.' + month + '.' + date;
    	}	
    
   	
 	   $start.datepicker({
 		language : 'en',
 		minDate : new Date(),
 		onSelect : function(fd, date){
 			$end.data('datepicker')
 			.update('minDate',date)
 		}
 	})
 	
 	 $end.datepicker({
 		language : 'en',
 		maxDate : end_date,
	 	onSelect : function(fd,date){
 		$start.data('datepicker')
 		.update('maxDate',date)
 	}
 	})
 	
    		
    		
});
</script>

<script type="text/javascript"> //저장(좋아요)
	$(document).ready(function(){

		$('#lodge_like').click(function(){
			if("${!login}"){
				alert("로그인 후 이용해 주세요");
				return;
			}
			var lodge_no = '${view.lodge_no}',
				mem_no = '${member.mem_no}';
				var likeButton = document.getElementById('lodge_like');
				
			$.ajax({
				url: "like",
				type : "post",
				data :{"lodge_no" : lodge_no, "mem_no" : mem_no },
				dataType : "json",
				success : function(data){
					if(data){
					window.lb = likeButton;
					likeButton.classList.toggle('selected');
					}
						
				},
				error : function(data){
					
				},
				
				
				
			});//ajax 끝
		
		
		
		});//클릭 버튼 끝
		
	});//도큐먼트 끝

</script>
<script type="text/javascript"> //댓글 신고

	function comment_Report(comment_no){
		
		var mem_no = "${member.mem_no}";
			console.log(comment_no);
			if(mem_no == ""){
				alert("로그인 후 이용해 주세요");
				return;
			}
			
		$.ajax({
			
			url : "Commentreport",
			type : "GET", 
			data :{"reporter_no":mem_no, "comment_no" : comment_no },
			dataType : "text",
			success : function(data){
				console.log("성공");
				
				if(data == 1){
					alert("댓글이 신고 되었습니다.");
				}else{
					alert("신고가 취소 되었습니다.");
				}
			}
			
			
			
			
		});//ajax 끝
		
	
};//document 끝


</script>



<body>
	<div id="wrapper">
		<div>
			<!-- header 시작 -->
			<c:import url="../layout/header.jsp" />
		</div>

<div >
		
			<!-- content시작 -->
    <div id="gallery">
    	
      <div class="photo " id="photo1" style =" overflow: hidden;"><img src="/resources/images/lodge_image/${lodgeimg[0].stored_name }"/></div>
      <div class="photo " id="photo2" style =" overflow: hidden;"><img src="/resources/images/lodge_image/${lodgeimg[1].stored_name }"/></div>
      <div class="photo " id="photo3" style =" overflow: hidden;"><img src="/resources/images/lodge_image/${lodgeimg[2].stored_name }"/>
      <button id = "lodge_like"><svg class="heart-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
      <path d="M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z"/></svg>저장</button></div>
      <div class="photo " id="photo4" style =" overflow: hidden;"><img src="/resources/images/lodge_image/${lodgeimg[3].stored_name }"></div>
      <div class="photo " id="photo5" style =" overflow: hidden;"><img src="/resources/images/lodge_image/${lodgeimg[4].stored_name }"/></div>
      <div class="photo " id="photo6" style =" overflow: hidden;"><img src=""/></div>
      <div class="photo " id="photo7" style =" overflow: hidden;"><img src=""/></div>
      <div class="photo " id="photo8" style =" overflow: hidden;"><img src=""/></div>
      <div class="photo " id="photo9" style =" overflow: hidden;"><img src=""/></div>
      </div>
      
      <div style = "margin-left: 21%;">
			
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!--  호스트 정보 -->
			<div style="padding-top: 24px; padding-bottom: 24px">
				<table class="row">
					<tbody>
						<tr>
							<th class="small-10 large-10 columns first"style ="width :500px;">
								<p class="body-text-lg heavy row-pad-bot-1"
									style="font-size: smaller;">
									<c:if test = "${view.building_case_no  == 1}" >
									<span>펜션</span>
									</c:if>
									<c:if test = "${view.building_case_no == 2}" >
									<span>모텔</span>
									</c:if>
									<c:if test = "${view.building_case_no == 3}" >
									<span>게스트하우스</span>
									</c:if>											
									</p>
								<p class="body-text light row-pad-bot-4"style="font-size: xx-large;">${view.lodge_name }</p>
								<p class="body-text light">
									<span>
									<c:if test="${login }"> 
						
										<c:if test="${member.mem_case eq 'user' or member.mem_case eq 'host' }">
											<a href="/viewProfile?mem_no=${view.mem_no }" class="color-rausch light"><i class="far fa-envelope" style="color:skyblue;"></i> 호스트와 연락하기</a>
										</c:if>
										
										<c:if test="${member.mem_case eq 'admin' }">
											<a href="#" onClick="alert('관리자는 이용 불가입니다.');" class="color-rausch light"><i class="far fa-envelope" style="color:skyblue;"></i> 호스트와 연락하기</a>
										</c:if>
										
									</c:if>
									<c:if test="${not login }">
										<a href="#" onClick="alert('로그인을 해주세요!!');" class="color-rausch light"><i class="far fa-envelope" style="color:skyblue;"></i> 호스트와 연락하기</a>
									</c:if>
									</span> 
								</p>
							</th>
							<th class="small-2 large-2 columns last"><a href="#"
								class=""
								style="font-family: 'Circular', Helvetica, Arial, sans-serif; font-weight: normal; padding: 0; margin: 0; text-align: left; line-height: 1.3; color: #2199e8; text-decoration: none">
									
								<c:if test="${view.profile_stored_name eq null }">		
									<img src="/resources/images/empty_profile_photo.jpg"alt="" class="profile-img">
								</c:if>
								<c:if test="${view.profile_stored_name ne null }">		
									<img src="/resources/images/${view.profile_stored_name }"alt="" class="profile-img">
								</c:if>
							</a>
							
							</th>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 숙소이름, 숙소 유형 호스트 이미지  끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 숙소 정원, 유형, 침대 개수 -->

			<div class="lodge_info">
				<i class="fas fa-users"></i> 
				<span> 수용 인원  ${view.lodge_capacity }명</span>
				<c:if test = "${view.building_case_no  == 1}" >
				<span>아파트</span>
				</c:if>
				<c:if test = "${view.building_case_no == 2}" >
				<span>단독주택</span>
				</c:if>
				<c:if test = "${view.building_case_no == 3}" >
				<span>연립주택</span>
				</c:if>
				<span>${item[10]}</span>
			</div>
			<!-- 유형 끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 편의시설 -->
			<div class="facility">
<<<<<<< HEAD
				<h3><i class="fas fa-home"></i> 편의 시설</h3>
				<span> 
				 <span> ${item.get(1)}</span>
				  <br>
				 <span> ${item.get(2)}</span> 
				  <br> 
				 <span> ${item.get(3)}</span>
				  <br> 
				 <span> ${item.get(4)}</span> 
				  <br> 
				</span>
=======
				<h3>편의 시설</h3>
				<c:forEach items="${item }" var ="item" step="1" end="4">
				${item}<br>
				</c:forEach>
>>>>>>> branch 'master' of https://github.com/RaHyeonJong/Lit_repo.git
			</div><br>
			<a href="#modalLayer" class="modalLink">편의시설 더 보기</a>
			<div id="modalLayer">
 			 <div class="modalContent">
    			<a href="#"style = "font-size: 20px;font-weight: bold;text-decoration:none !important;">모든 편의 시설</a>
    			<c:forEach items="${item}" var = "lodgeItem">
    			${lodgeItem }<br>
    			</c:forEach>
 				
    			<p style = "font-size: 20px;font-weight: bold;">편의 공간</p>
    			<c:forEach items= "${area}" var = "area">
    			${area}<br>
					    			
    			</c:forEach>
    			<button class = "close_btn" type="button"></button>
 			 </div>
			</div>
			<!-- 편의시설 끝 -->
		<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 예약 달력 -->
			<div style = "width: 900px;">
			<p style ="font-size: 20px; font-weight: bold;"><i class="far fa-calendar-check"></i> 예약 날짜<p>
			<p id="datepicker" data-language='en' style=" width: 600px;  margin: 0; float: right;"></p>
			<p id="datepicker2" data-language='en'></p>
			</div>
			
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 후기 -->
			
				<h2><i class="fas fa-pencil-alt"></i>  후 기</h2>
			
				<c:if test ="${login && payd}">
				<!-- 후기 작성 -->
				<div id = "replyform" style="border: 1px solid; width: 493px; padding: 5px">
        		<input type="hidden" id="lodge_no" name="lodge_no" value="<c:out value="${view.lodge_no}"/>"> 
        		<input type="hidden" id = "mem_name" name = "mem_name" value="<c:out value ="${member.mem_name }"/>"> 
        		<input type="hidden" id = "mem_no" name = "mem_no" value="<c:out value ="${member.mem_no }"/>"> 
      			  <textarea id= "contents" class="form-control" name="contents" rows="5" cols="60" placeholder="후기를 작성해주세요"<c:out value="${reply.contents}"/>></textarea>
       			 <button onclick="fn_formSubmit()">저장</button>  				 
				</div>
				</c:if>
				
					<div id="review"> <!-- 후기 리스트 -->
				
				    <c:forEach items = "${lodgeReview}" var = "review">
    	<c:if test = "${review.parent_comment_no == 0 }">
					<div id="reviewitem<c:out value ="${review.comment_no }"/>" class = "parent_comment<c:out value ="${review.parent_comment_no }"/>"style=" width: 600px; padding: 5px; margin-top: 5px;">    
       				<a href="/viewProfile?mem_no=${review.mem_no }" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
       				<c:if test="${review.stored_name ne null }">
 					<img class="user_img" src="/resources/images/${review.stored_name }" height="48" width="48" >
       				</c:if>
       				<c:if test="${review.stored_name eq null }">
 					<img class="user_img" src="/resources/images/empty_profile_photo.jpg" height="48" width="48" >
       				</c:if></a>
       				 <c:out value="${review.mem_name}"/><br>
	       			<fmt:formatDate value="${review.written_time}" pattern="yyyy년 MM월 dd일"/>
       				 <br/>
       				   <div id="reply<c:out value="${review.comment_no}"/>"><c:out value="${review.contents}"/>
       				   
       				   </div>
       				   
       				   <c:if test ="${member.mem_no ne review.mem_no }">
       				   <button id = "comment_Report" onclick="comment_Report('<c:out value="${review.comment_no}"/>')" style="left: 850px; position: absolute; "><i class="far fa-flag"></i></button> 
       				</c:if>
       				
       				<c:if test ="${login && member.mem_no eq review.mem_no }">
       				<button id= "replyup" onclick="fn_replyUpdate('<c:out value="${review.comment_no}"/>')">수정</button>
       				 <button id= "replydel" onclick="fn_replyDelete('<c:out value="${review.comment_no}"/>')">삭제</button>
					</c:if>
					<c:if test ="${login && member.mem_no eq view.mem_no }">
 					 <button  onclick="fn_replyReply('<c:out value ="${review.comment_no}"/>')">댓글</button>
   					</c:if>
   					
   				 </div>
				</c:if>
				
				<c:forEach items = "${lodgeReview}" var = "review2">
					<c:if test="${review2.parent_comment_no == review.comment_no }">
						<div id="reviewitem<c:out value ="${review2.comment_no }"/>" class = "parent_comment<c:out value ="${review2.parent_comment_no }"/>"style=" width: 600px; padding: 5px; margin-top: 5px; margin-left: 20px;">    
	       				<a href="#" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
	 					<c:if test="${review2.stored_name ne null }">
 						<img class="user_img" src="/resources/images/${review.stored_name }" height="48" width="48" >
       					</c:if>
       					<c:if test="${review2.stored_name eq null }">
 						<img class="user_img" src="/resources/images/empty_profile_photo.jpg" height="48" width="48" >
       					</c:if></a>
	       				
	       				 <c:out value="${review2.mem_name}"/><br>
		       			<fmt:formatDate value="${review2.written_time}" pattern="yyyy년 MM월 dd일"/>
	       				 <br/>
	       				   <div id="reply<c:out value="${review2.comment_no}"/>"><c:out value="${review2.contents}"/></div>
					
					<c:if test ="${ review2.mem_no ne member.mem_no}">
       				   <button id = "comment_Report" onclick="comment_Report('<c:out value="${review.comment_no}"/>')" style="left: 850px; position: absolute; "><i class="far fa-flag"></i></button> 
					</c:if>
					
	       				<c:if test ="${login && review2.mem_no eq member.mem_no }">
	       				<button id = "replyup2" onclick="fn_replyUpdate('<c:out value="${review2.comment_no}"/>')">수정</button>
	       				 <button id = "replydel2" onclick="fn_replyDelete('<c:out value="${review2.comment_no}"/>')">삭제</button>
					</c:if>
					</div>
					</c:if>
				</c:forEach>
			
					</c:forEach>
		
				<!-- 후기 리스트 끝 -->
				</div>
				
		
				
				
					<!-- 댓글 수정 -->
				<div id = "replyDiv" style ="width:99%; display:none">
							<input type ="hidden" id = "lodge_no2" name ="lodge_no" value ="<c:out value ="${view.lodge_no }"/>">
							<input type ="hidden" id = "mem_no2" name ="mem_no2">
							<input type ="hidden" id = "comment_no2" name ="comment_no">
							<textarea class = "form-control" id ="contents2"  name = "contents2" rows="5" cols="60"></textarea>
							<button onclick ="fn_replyUpdateSave()">저장</button>
							<button onclick ="fn_replyUpdateCancel()">취소</button>
					</div>
				<!-- 댓글수정 끝 -->
	
				<div id = "replyDialog" style = "width:99%; display: none">
				<input type = "hidden" id = "lodge_no3" name = "lodge_no" value = "<c:out value="${view.lodge_no }"/>">
				<input type = "hidden" id = "comment_no3" name = "comment_no">
				<input type = "hidden" id = "parent_comment_no3" name = "parent_comment_no">
				<input type = "hidden" id = "mem_no3" name = mem_no3 value = "<c:out value ="${member.mem_no}"/>">	<br>
					<textarea class ="form-control" id="contents3" name = "contents3"rows="5" cols="60"></textarea>
				<button onclick ="fn_replyReplySave()">저장</button>				
				<button  onclick ="fn_replyReplyCencle()">취소</button>				
				</div>
				
				
			
				



			<!-- 후기 끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 지역정보 -->
			<div>
			<h3><i class="fas fa-map-marker-alt"></i> 위 치</h3>
			<div id="map"></div>
			
			</div>

</div>

			<!-- content 끝 -->
		</div>

		<!-- wrapper 끝 -->
	</div>
<c:import url="../layout/footer.jsp"/>
<c:import url="../lodge/sidebar.jsp"/>
   <!-- 구글 맵 -->  
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTG_c6ER7OJVOjxEwH0H723PhlQcWS2F8&callback=initMap"
    async defer></script>

</body>

</html>

