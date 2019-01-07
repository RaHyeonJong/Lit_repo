<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
 

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
#modalLayer .modalContent{width:300px; height:700px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; top:50%; z-index:11; background:#fff;}
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

<script type="text/javascript">
$(function() {
    $("#datepicker").datepicker();
    $("#datepicker2").datepicker();
    
    var $start = $("#datepicker"),
    	$end = $("#datepicker2");
 	
    		// What dates should be disabled - year.month.date
	 	var disabledDates = ${off};
        	

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
    		
  
    		
    		
});
</script>

<script type="text/javascript"> //저장(좋아요)
	$(document).ready(function(){

		document.addEventListener('DOMContentLoaded', function() {
			  var likeButton = document.getElementById('lodge_like');
			   if("${like}" == 1){
			  	window.lb = likeButton;
			    likeButton.classList.toggle('selected');
			   }
			   
			}, false);
		
		
		$('#lodge_like').click(function(){
			var lodge_no = '${view.lodge_no}',
				mem_no = '${member.mem_no}';
				var likeButton = document.getElementById('lodge_like');
				
			$.ajax({
				url: "like",
				type : "post",
				data :{"lodge_no" : lodge_no, "mem_no" : mem_no },
				dataType : "json",
				success : function(data){
					if(data.like){
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

<script type="text/javascript">

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
      <div class="photo " id="photo5" style =" overflow: hidden;"><img src="/resources/images/lodge_image/${lodgeimg[0].stored_name }"/></div>
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
									<a href="/viewProfile?mem_no=${view.mem_no }" class="color-rausch light">호스트 에게 연락하기</a></span> 
									</span>
								</p>
							</th>
							<th class="small-2 large-2 columns last"><a href="#"
								class=""
								style="font-family: 'Circular', Helvetica, Arial, sans-serif; font-weight: normal; padding: 0; margin: 0; text-align: left; line-height: 1.3; color: #2199e8; text-decoration: none">
									<img
									src="https://a0.muscache.com/im/pictures/2dcf3c71-aa22-4fbe-8a7f-2f4ee519e393.jpg?aki_policy=profile_x_medium"
									alt="" class="profile-img"> <img alt=""
									class="width-77 row-pad-top-2"
									src="https://a1.muscache.com/airbnb/rookery/dls/5.0_stars-8b3a9b9fe0d1aa014b1f97859cd599b1.png">
							</a></th>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 숙소이름, 숙소 유형 호스트 이미지  끝 -->
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 숙소 정원, 유형, 침대 개수 -->

			<div class="lodge_info">
				<span>󰄂</span> 
				<span>수용인원 ${view.lodge_capacity }명</span>
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
				<h3>편의 시설</h3>
				<span > 
				<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 19px; width: 19px; fill: currentcolor;"><path d="m12 15a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0 5a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm5.92-5.78a.5.5 0 1 1 -.84.55c-1.19-1.81-3.07-2.77-5.08-2.77s-3.89.96-5.08 2.78a.5.5 0 0 1 -.84-.55c1.38-2.1 3.58-3.23 5.92-3.23s4.54 1.13 5.92 3.23zm2.98-3.03a.5.5 0 1 1 -.79.61c-1.66-2.14-5.22-3.8-8.11-3.8-2.83 0-6.26 1.62-8.12 3.82a.5.5 0 0 1 -.76-.65c2.05-2.42 5.75-4.17 8.88-4.17 3.19 0 7.05 1.8 8.9 4.19zm2.95-2.33a.5.5 0 0 1 -.71-.02c-2.94-3.07-6.71-4.84-11.14-4.84s-8.2 1.77-11.14 4.85a.5.5 0 0 1 -.72-.69c3.12-3.27 7.14-5.16 11.86-5.16s8.74 1.89 11.86 5.16a.5.5 0 0 1 -.02.71z" fill-rule="evenodd"></path></svg>
				 <span> ${item.get(1)}</span>
				  <br>
				  <svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 19px; width: 19px; fill: currentcolor;"><path d="m23.99 18.38-.5-2a .5.5 0 0 0 -.49-.38h-22a .5.5 0 0 0 -.49.38l-.5 2a .5.5 0 0 0 .49.62h23a .5.5 0 0 0 .49-.62zm-1.13-.38h-21.72l.25-1h21.22zm-21.36-3h21a .5.5 0 0 0 .5-.53c-.21-3.22-1.22-5.47-3-5.47a4911.8 4911.8 0 0 0 -8.8 0h-1.71c-.2 0-.26-.08-.19-.27a9.59 9.59 0 0 1 .17-.48c.13-.34.27-.68.43-1 .41-.79.82-1.25 1.1-1.25h10.5c.87 0 1.43-.7 1.4-1.52s-.64-1.48-1.55-1.48h-11.35c-3.84 0-7.29 4.4-8.99 11.38a.5.5 0 0 0 .49.62zm8.5-11h11.35c.35 0 .55.21.56.52.01.29-.14.48-.4.48h-10.51c-.8 0-1.42.68-1.99 1.8a10.74 10.74 0 0 0 -.65 1.61c-.31.82.23 1.59 1.13 1.59h1.71a33801.74 33801.74 0 0 1 8.8 0c .94 0 1.71 1.58 1.95 4h-19.8c1.65-6.21 4.7-10 7.85-10zm5 8a1 1 0 1 1 2 0 1 1 0 0 1 -2 0zm3 0a1 1 0 1 1 2 0 1 1 0 0 1 -2 0z" fill-rule="evenodd"></path></svg>
				 <span> ${item.get(2)}</span> 
				  <br> 
				<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 19px; width: 19px; fill: currentcolor;"><path d="M22.5 23H21V1h1.5a.5.5 0 0 0 0-1H.5a.5.5 0 1 0 0 1H2v22H.5a.5.5 0 1 0 0 1h22a.5.5 0 0 0 0-1zM11 3v20H3V1h8v2zm9 20h-8V1h8v22zM4.146 10.854a.5.5 0 0 1 0-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 1 1-.708.708L7 9.707V14.5a.5.5 0 0 1-1 0V9.707l-1.146 1.147a.5.5 0 0 1-.708 0zm10 2a.5.5 0 1 1 .708-.708L16 13.293V8.5a.5.5 0 1 1 1 0v4.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2z" fill-rule="evenodd"></path></svg>
				 <span> ${item.get(3)}</span>
				  <br> 
				<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 19px; width: 19px; fill: currentcolor;"><path d="m5 3.5a1.5 1.5 0 1 0 -3 0 1.5 1.5 0 0 0 3 0zm-1.5.5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm4 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm0-2a .5.5 0 1 1 0 1 .5.5 0 0 1 0-1zm4.5 3c-4.41 0-8 3.59-8 8s3.59 8 8 8 8-3.59 8-8-3.59-8-8-8zm0 15c-3.86 0-7-3.14-7-7s3.14-7 7-7 7 3.14 7 7-3.14 7-7 7zm9.5-21h-19a2.51 2.51 0 0 0 -2.5 2.5v19c0 1.38 1.12 2.5 2.5 2.5h19c1.38 0 2.5-1.12 2.5-2.5v-19c0-1.38-1.12-2.5-2.5-2.5zm1.5 21.5c0 .83-.68 1.5-1.5 1.5h-19c-.83 0-1.5-.68-1.5-1.5v-19c0-.83.68-1.5 1.5-1.5h19c .83 0 1.5.68 1.5 1.5zm-6.17-6.12a.5.5 0 0 1 .04.71 2.49 2.49 0 0 1 -.63.48c-1.15.65-2.67.65-4.49-.38-1.52-.85-2.66-.85-3.51-.38a1.57 1.57 0 0 0 -.37.27.5.5 0 1 1 -.75-.66 2.49 2.49 0 0 1 .63-.48c1.15-.65 2.67-.65 4.49.38 1.52.85 2.66.85 3.51.38a1.57 1.57 0 0 0 .37-.27.5.5 0 0 1 .71-.04zm0-3.5a.5.5 0 0 1 .04.71 2.49 2.49 0 0 1 -.63.48c-1.15.65-2.67.65-4.49-.38-1.52-.85-2.66-.85-3.51-.38a1.57 1.57 0 0 0 -.37.27.5.5 0 1 1 -.75-.66 2.49 2.49 0 0 1 .63-.48c1.15-.65 2.67-.65 4.49.38 1.52.85 2.66.85 3.51.38a1.57 1.57 0 0 0 .37-.27.5.5 0 0 1 .71-.04z" fill-rule="evenodd"></path></svg>
				 <span> ${item.get(4)}</span> 
				  <br> 
				</span>
			</div>
			<a href="#modalLayer" class="modalLink">편의시설 더 보기</a>
			<div id="modalLayer">
 			 <div class="modalContent">
    			<a href="#"style = "font-size: 20px;font-weight: bold;text-decoration:none !important;">모든 편의 시설</a>
    			<c:forEach items="${item}" var = "lodgeItem">
    			${lodgeItem }<br><br>
    			</c:forEach>
 				
    			<p style = "font-size: 20px;font-weight: bold;">노트북 작업공간</p>
    			<c:out value = "${view.convenient_area }"/>
    			<button class = "close_btn" type="button"></button>
 			 </div>
			</div>
			<!-- 편의시설 끝 -->
		<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 예약 달력 -->
			<div style = "width: 900px;">
			<p style ="font-size: 20px; font-weight: bold;">예약 가능 날짜<p>
			<p id="datepicker" data-language='en' style=" width: 600px;  margin: 0; float: right;"></p>
			<p id="datepicker2" data-language='en'></p>
			</div>
			
			<div style="margin-top:24px;margin-bottom:24px"><div class="line"></div></div>
			<!-- 후기 -->
			
			
			
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
       				<a href="/resources/" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
 					<img class="user_img" src="https://a0.muscache.com/im/pictures/user/f4118b8f-179e-4655-9185-c2d2693b53a6.jpg?aki_policy=profile_x_medium" height="48" width="48" alt="Hyun님의 사용자 프로필" title="Hyun님의 사용자 프로필"></a>
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
	       				<a href="/users/show/61727682" target="_blank" rel="noopener noreferrer" class="_1oa3geg" aria-busy="false">
	 					<img class="user_img" src="https://a0.muscache.com/im/pictures/user/f4118b8f-179e-4655-9185-c2d2693b53a6.jpg?aki_policy=profile_x_medium" height="48" width="48" alt="Hyun님의 사용자 프로필" title="Hyun님의 사용자 프로필"></a>
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
				</div>
				
				<!-- 후기 리스트 끝 -->
				
				
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
				구글 맵 사용 하여 숙소 위치 표시		
			<div id="map"></div>
			
			</div>

</div>

			<!-- content 끝 -->
		</div>

		<!-- wrapper 끝 -->
	</div>

<c:import url="../lodge/sidebar.jsp"/>
   <!-- 구글 맵 -->  
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIJtUuAMaDJxl6mn0sm9e6UCuE6cUTXD8&callback=initMap"
    async defer></script>

</body>

</html>