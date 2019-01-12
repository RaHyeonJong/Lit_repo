<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-ion" href="/resources/images/url.ico" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- 스마트 에디터 적용 -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../../../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../resources/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

    <!-- 다음 지도 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d51498176f71ed8eb0c696c6eb6ebf0c&libraries=services,clusterer,drawing"></script>
    <!-- 다음 주소 API -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>축제 글쓰기</title>
</head>

<body>

   <!-- 사이드 바, 헤더 import -->
<jsp:include page="layout/header.jsp" />
       
<div id="wrapper">
<jsp:include page="layout/sidebar.jsp"/>
		
		
   <div class="container"><br>
 
   <!-- 작성 Form -->
   <form action="/admin/festivalWrite" method="post" enctype="multipart/form-data" id="write" name="write"  onsubmit="return false;">
	
	<!-- 작성,취소 버튼 -->
	<div style="text-align:center; margin-left:560px; ">
      <button type="button" class="btn btn-success" id="submit_post" onclick="submitContents();">등록</button>
      <button type="button" class="btn btn-secondary" onclick="cancle_click();">취소</button> 
    </div>

    <div style="width:500px;"><br>
	<table>
	
     <tr class="bg-info" style="height:45px;">
        <td><font style="color:white;"><b>&nbsp;&nbsp;Life is Trp </b>: Festival Write</font></td>
     </tr>
     
	 <tr style="height:55px;">      
	       <td>
	       <input type="text" id="festival_name" name="festival_name" placeholder="축제 이름을 작성해주세요"
	              style="font-size:20px; width:900px; height:40px;">
	       </td>
	 </tr>
	 
	 <tr style="height:50px;">
	       <td><font style="font-size:15px;">행사기간</font>&nbsp;  
	                   <input type="text" id="datepicker1" name="start_date1" placeholder="시작날짜"> ~ 
	                   <input type="text" id="datepicker2" name="end_date2" placeholder="종료날짜"><br><br></td>	                   
     </tr>
     
     <tr>
            <td><font style="font-size:15px;">장소입력</font>&nbsp; 
            <input type="hidden" id="sample6_postcode" placeholder="우편번호">
            <input type="button" class="btn btn-outline-primary" onclick="sample6_execDaumPostcode()" value="주소검색" 
            style="height: 28px; font-size: 14px;"><br><br>
            <input type="text" id="sample6_address" size="50" name="address" placeholder="주소">
            <input type="hidden" id="latitude" name="latitude1" >
            <input type="hidden" id="longitude" name="longitude1">
            <button id="mapView" onclick="viewMap();" class="btn btn-outline-primary"
            style="height: 28px; font-size: 14px;">지도보기</button>
            <br><br>
            </td>   
     </tr>

     <tr>
            <td><div id="map" style="width:100%;height:300px;"></div></td>
     </tr>

     <tr>
     <td style="padding-bottom:30px;">
     <input type="file" id="input-photo-for-thumb_nail" name="file" hidden="hidden" />
     <div style="display:table; width:100%; height:30px; text-align:center; background-color:#585858; border-radius:6px;">
      <div id="photo-upload-btn-for-thumb_nail" 
           style="display:table-cell; vertical-align:middle; color:white; font-size: 14px; cursor:pointer;">
            썸네일 업로드</div>
     </div>
     <c:if test="${image.stored_name ne null }">
      <p style="text-align:center; padding:5px;">
        <img id="thumbNailPreview" width="500px" height="300px" src="/resources/images/festival/${image.stored_name }">   
      </p>
     </c:if>
     <c:if test="${image.stored_name eq null }">
       <p style="text-align:center; padding:5px;">
        <img id="thumbNailPreview" width="500px" height="300px;" src="/resources/images/noImage.jpg">   
      </p>
     </c:if>
     </td>
     
    </tr>	 	 	 	 	 
	 <tr>
	     <td colspan="2">
	      <textarea name="festival_contents" id="abcd" style="width:100%; height:350px;"></textarea>
	     </td>
	 </tr>
	 
    </table>
    </div>
        
   </form>
      <br><hr>	 
	 </div> <!-- Container 끝 --> 
	</div> <!-- Wrapper 끝  -->

<script type="text/javascript">

var container = document.getElementById('map');
var options = {
	center: new daum.maps.LatLng(37.49899600519825,127.03284983292826),
	level: 3
};

var map = new daum.maps.Map(container, options);

var geocoder = new daum.maps.services.Geocoder();



// 지도보기 버튼을 눌렀을 때
function viewMap() {
	
	var addr = document.getElementById('sample6_address').value;
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        
	        console.log(coords);
	        
	        document.getElementById('latitude').value = result[0].y;
	        document.getElementById('longitude').value = result[0].x;
	        

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.panTo(coords);
	        
	    
}
 
 });
	
}

</script>


<script type="text/javascript">

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;
       
        }
    }).open();
}



</script>	

<script>

    //네이버 스마트 에디터 설정하기
    
    //전역변수
     var oEditors = [];     
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "abcd", //textarea의 id와 일치시켜야한다
        sSkinURI: "/resources/editor/SmartEditor2Skin.html", //자신이 적용한 스마트에디터의 SmartEditor2Skin.html 경로를 지정해준다
        fCreator:"createSEditor2", 
        htParams : {
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부
            bUseModeChanger : true,
        }
    });   
    
    //작성 버튼 이벤트
    function submitContents() {
    	  
    	var form = $('#write');
    	
    	// 축제 작성 내용을 입력하지 않을 경우, 경고창
    	if($('#festival_name').val() == "" || $('#festival_name').val() == null ) {
    		
    		alert("축제 이름을 입력해주세요");
    		$('#festival_name').focus();
    		return;
    	}
    	
    	oEditors.getById["abcd"].exec("UPDATE_CONTENTS_FIELD", []);
 		var contents =$("#abcd").val();
 		
 		if(contents == "" || contents== null ||contents=='&nbsp;'  || contents == '<p>&nbsp;</p>' || contents=='<br>')
 		{
 			alert("내용을 입력해주세요!!");
 			oEditors.getById["abcd"].exec("FOCUS"); //포커싱
 			return;
 		}else {
 						
 			//submit 가능한 상태로 변경 
            form.attr('onsubmit','return true;');
  			
 			// submit 구동
 	    	form.submit(); 
 	    	
 	    	//등록 완료할 시 알림창
 	    	alert("등록이 완료 되었습니다."); 			
 		}
    }
    
    //textarea에 이미지 올리기 (경로)
    function pasteHTML(filepath){
    	//img src에 스타일 넣어주기
    	//width:100%를 주면 textarea크기 맞게 나온다
        var sHTML = '<img style="width:70%" src="<%=request.getContextPath()%>/resources/images/'+filepath+'">';
        oEditors.getById["abcd"].exec("PASTE_HTML", [sHTML]);
    }
    
    // 취소 버튼을 누르면 벌어지는 일
    function cancle_click() {
    	
    	alert("이전 페이지로 이동합니다.")
    	history.go(-1);
    }
  
    
    // 축제 기간 작성 데이터피커로 받기
    $(document).ready(function(){
    	
    	//시작 날짜
    	$("#datepicker1").datepicker({
           dateFormat: 'yy/mm/dd'                
           ,minDate: "0" // 오늘 이전의 날짜는 선택 불가
           ,
    	onSelect: function(selected) {
    	$("#datepicker2").datepicker("option","minDate", selected);
    	}
    	});
    	
    	//종료 날짜
    	$("#datepicker2").datepicker({
            dateFormat: 'yy/mm/dd',
    	onSelect: function(selected) {
    	$("#datepicker1").datepicker("option","maxDate", selected);
    	}
    	});
    	});
    
    //썸네일 업로드 버튼 클릭 이벤트
    $(document).ready(function(){
    	$('#photo-upload-btn-for-thumb_nail').click(function(){
    		$('#input-photo-for-thumb_nail').click();
    	});
    }); 

    //썸네일 이미지 미리보기
	$('#input-photo-for-thumb_nail').change(function(e){
		e.preventDefault();
		
		var upload = e.target;
		var holder = $('#thumbNailPreview');
				
		var file = upload.files[0];
		var reader = new FileReader();
		
		reader.onload = function (event) {
			var img = new Image();
			holder.attr("src", event.target.result);
		};
		reader.readAsDataURL(file);

		return false;
	});
    
</script>

   

 
 
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    
    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin.min.js"></script>
    
    <!-- 데이터 피커 적용 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    
</body>
</html>