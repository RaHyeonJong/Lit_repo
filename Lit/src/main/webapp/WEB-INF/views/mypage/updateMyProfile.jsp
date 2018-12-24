<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script type="text/javascript">
var validNameForUpdate;
var validPwForUpdate;
var validRepwForUpdate;
var validPhoneForUpdate;

$(document).ready(function(){
// 	회원가입 완료창에서 사진업로드 버튼을 눌렀을 때...
	$('#photo-upload-btn-for-update').click(function(){
		$('#input-photo-for-update').click();
	});
	
// 	회원가입 완료창에서 사용자가 사진을 업로드 했을 때...
	$('#input-photo-for-update').change(function(e){
		e.preventDefault();
		
		var upload = e.target;
		var holder = $('#profile-photo-for-update');
				
		var file = upload.files[0];
		var reader = new FileReader();
		
		reader.onload = function (event) {
			var img = new Image();
			holder.attr("src", event.target.result);
		};
		reader.readAsDataURL(file);

		return false;
	});
	
// 	회원정보 수정창에서 이름을 변경했을 때...
	validNameForUpdate = true;

	$('#name-for-update').change(function(){
		var mem_name = $('#name-for-update').val();
		var pattern = /[~!@#$%^&*\+=|(){}:;＃＆＆＠§※☆★○●◎◇◆□■△▲▽▼→←←↑↓↔〓◁◀▷▶♤♠♡♥♧♣⊙◈▣◐◑▒▤▥▨▧▦▩♨☏☎☜☞¶†‡↕↗↙↖↘♭♩♪♬㉿㈜№㏇™㏂㏘℡®]/;

		if(pattern.test(mem_name)){
			$('#valid-name-for-update').css("display", "inline");
			validNameForUpdate = false;
		} else {
			$('#valid-name-for-update').css("display", "none");
			validNameForUpdate = true;
		}
	});
	
// 	회원정보 수정창에서 비밀번호 형식 검사
	validPwForUpdate=true;
	validRepwForUpdate=true;

	$('#pw-for-update').change(function(){
		validRepwForUpdate=false;
		var mem_pw = $('#pw-for-update').val();
		
		var pw_form1 = /[a-zA-Z]/;
		var pw_form2 = /[0-9]/;
		var pw_form3 = /[~!@#$%^&*+-=?]/;
		
		if(mem_pw.length < 8){
			$('#valid-pw-for-update').css("color", "red");
			$('#valid-pw-for-update').html("비밀번호는 최소 8자 이상이어야 합니다.");
			validPwForUpdate = false;
		} else {
			if(!(pw_form1.test(mem_pw) && (pw_form2.test(mem_pw) || pw_form3.test(mem_pw)))){
				$('#valid-pw-for-update').css("color", "red");
				$('#valid-pw-for-update').html("숫자나 특수문자를 최소 1자리 이상 포함해야 합니다.");
				validPwForUpdate = false;
			} else {
				$('#valid-pw-for-update').css("color", "#03CF5D");
				$('#valid-pw-for-update').html("사용가능한 비밀번호입니다.");
				validPwForUpdate = true;
			}
		}
	});
	
// 	회원정보 수정창에서 비밀번호 재입력 검사
	$('#repw-for-update').focusout(function(){
		var pw = $('#pw-for-update').val();
		var repw = $('#repw-for-update').val();
		
		if(validPwForUpdate){
			if(pw == repw){
				$('#valid-repw-for-update').html("");
				validRepwForUpdate = true;
			} else {
				$('#valid-repw-for-update').css("color", "red");
				$('#valid-repw-for-update').html("비밀번호가 일치하지 않습니다.");
				validRepwForUpdate = false;
			}
		}
	});
	
// 	회원정보 수정창에서 전화번호 변경했을 때...
	validPhoneForUpdate = true;

	$('#mem-phone-for-update').change(function(){
		$('#certified').css('display', 'none');
		$('#uncertified').css('display', 'inline');
		validPhoneForUpdate = false;
	});
	
// 	회원정보 수정창에서 인증번호 받기 버튼을 눌렀을 때...
	var timer;

	$('#mobile-certi-for-update').click(function(){
		var mem_phone = $('#mem-phone-for-update').val();
		
		$.ajax({
			type: "GET",
			url: "/join/smsCerti",
			data: {"mem_phone": mem_phone},
			dataType: "json",
			success : function(res){
				ukey = res.ukey;
				if(ukey != 0){
					console.log(ukey);
					$('#input-key-for-update').val("");
					$('#certi-num-tr').css('display', 'table-row');
					
					clearInterval(timer);
					
					dur = 180;
					var min, sec;
					timer = setInterval(function(){
						min = parseInt(dur/60%60, 10);
						sec = parseInt(dur%60, 10);
						
				        sec = sec < 10 ? "0" + sec : sec;
						
						$('#min-update').text(min+" :");
						$('#sec-update').text(sec);
						
						if(dur-- < 1){
							clearInterval(timer);
							alert("인증 실패!! 다시 시도해주세요.");
							$('#certi-num-tr').css("display", "none");
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
	
// 	회원정보 수정창에서 인증번호 입력창에 포커스를 얻고 잃었을 때...
	$('#certi-num-tr-div').focusin(function(){
		$('#certi-num-tr-div').css('border', '1px solid #7B9DD3');
		$('#certi-num-tr-div').css('outline', '1px solid #A6C7FE');
		$('#certi-num-tr-div').css('border-radius', '1px');
	});
	$('#certi-num-tr-div').focusout(function(){
		$('#certi-num-tr-div').css('border', '1px solid #999');
		$('#certi-num-tr-div').css('outline', 'none');
	});
	
// 	회원번호 수정창에서 확인 버튼을 눌렀을 때...
	$('#certify-btn').click(function(){
		var inputKey = $('#input-key-for-update').val();
		
		if(ukey == inputKey && dur > 0){
			$('#certi-num-tr').css("display", "none");
			$('#certified').css('display', 'inline');
			$('#uncertified').css('display', 'none');
			clearInterval(timer);
			mem_phone = $('#mem-phone-for-update').val();
			validPhoneForUpdate = true;
		} else {
			$('#certi-key-for-update').css("display", "none");
			dur = 0;
		}
	});
	

}); // jquery 끝나는 지점

//네이버 스마트에디터 설정하기
//전역변수
var oEditors = [];   

//스마트에디터 프레임생성
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "contents-intro", //textarea의 id와 일치시켜야한다
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

//전송 버튼 누르면 벌어지는 일
$('#update-complete').click(function(){ 
	oEditors.getById["contents-intro"].exec("UPDATE_CONTENTS_FIELD", []);
	
	if(validNameForUpdate && validPwForUpdate && validRepwForUpdate && validPhoneForUpdate){
		$('#update-form').attr('onsubmit', "return true;");
		$('#update-form').submit();
	} else {
		alert("입력하신 정보를 다시 확인해주세요.");
		return;
	}
	//등록 완료할 시 알림창
	alert("수정되었습니다.");
});

//textarea에 이미지 올리기 (경로)
function pasteHTML(filepath){
	//img src에 스타일 넣어주기
	//width:100%를 주면 textarea크기 맞게 나온다
    var sHTML = '<img style="max-width:100%" src="<%=request.getContextPath()%>/resources/images/'+filepath+'">';
    oEditors.getById["contents-intro"].exec("PASTE_HTML", [sHTML]);
}

</script>


<div>
<form id="update-form" action="/mypage/updateMyProfile" method="post" enctype="multipart/form-data" onsubmit="return false;">
<table style="width:100%;">
<tr><td style="width:20%; color:#565;"><h3>프로필 사진</h3></td></tr>
<tr><td style="text-align:center;"><img id="profile-photo-for-update" width="200px" height="200px" style="border:5px solid #999; border-radius:50%;" src="/resources/images/${member.stored_name }"/></td></tr>
<tr><td style="padding-bottom:30px;">
<input type="file" id="input-photo-for-update" name="file" hidden="hidden" />
<div style="display:table; margin:0 auto; width:50%; height:50px; text-align:center; background-color:#FF5A5F; border-radius:6px;">
<div id="photo-upload-btn-for-update" style="display:table-cell; vertical-align:middle; color:white; font-size: 16px; cursor:pointer;">사진 업로드</div></div></td></tr>
<tr><td style="width:20%; color:#565;"><h3>이메일</h3></td>
<td><input type="text" style="width:40%; height:40px; font-size:16px; padding-left:10px;cursor:default;" value="${member.mem_id }" readonly/><span style="color:tomato;">&nbsp;수정불가</span></td></tr>
<tr><td></td><td style="padding-bottom:30px; color:#565;">이메일 주소는 수정하실 수 없으며, 다른 라이프이즈트립 회원에게 공개되지 않습니다.</td></tr>
<tr><td style="width:20%; color:#565;"><h3>이름</h3></td>
<td><input type="text" id="name-for-update" name="name-for-update" style="width:40%; height:40px; font-size:16px; padding-left:10px;" value="${member.mem_name }" />
<span id="valid-name-for-update" style="display:none; color:tomato; font-size:16px;">&nbsp;이름에는 특수기호를 포함할 수 없습니다.</span></td></tr>
<tr><td></td><td style="padding-bottom:30px; color:#565;">공개 프로필에는 성을 제외한 이름만 표시됩니다.<br>예약 요청 시 호스트는 회원님의 성과 이름을 모두 확인할 수 있습니다.</td></tr>
<tr><td style="width:20%; padding-bottom:15px; color:#565;"><h3>비밀번호</h3></td>
<td style="padding-bottom:15px;"><input id="pw-for-update" name="pw-for-update" type="password" style="width:40%; height:40px; font-size:16px; padding-left:10px;" value="${member.mem_pw }" />
<span id="valid-pw-for-update"></span></td></tr>
<tr><td style="width:20%; color:#565;"><h3>비밀번호 확인</h3></td>
<td><input id="repw-for-update" type="password" style="width:40%; height:40px; font-size:16px; padding-left:10px;"  value="${member.mem_pw }" />
<span id="valid-repw-for-update"></span></td></tr>
<tr><td></td><td style="padding-bottom:30px; color:#565;">보안을 위해 6개월에 한번씩 비밀번호를 변경해주세요.<br>*** 비밀번호 설정규칙 : 숫자나 특수기호를 포함한 최소 8자리 이상</td></tr>
<tr><td style="width:20%; color:#565;"><h3>전화번호</h3></td>
<td><input id="mem-phone-for-update" name="mem-phone-for-update" type="text" style="width:27%; height:40px; font-size:16px; padding-left:10px;" value="${member.mem_phone }" />
<span id="certified" style="color:#03CF5D;">인증됨</span>
<span id="uncertified" style="display:none;"><button id="mobile-certi-for-update" style="width: 120px; padding:9px; font-size:14px;">인증번호 받기</button></span></td></tr>
<tr><td></td><td style="padding-bottom:30px; color:#565;">예약 요청, 미리 알림 및 기타 알림을 보내드립니다.<br>*** 하이픈(' - ')없이 번호만 입력해주세요.</td></tr>
<tr id="certi-num-tr" style="display:none;"><td style="width:20%; padding-bottom:30px; color:#565;"><h3>인증번호 입력</h3></td>
<td style="padding-bottom:30px;">
<div id="certi-num-tr-div" style="display: inline-block; width:240px; height:40px; border:1px solid #999;">
<input id="input-key-for-update" type="text" style="width:160px; height:38px; font-size:16px; padding-left:10px; border: none; outline:none;" />
<span id="min-update" style="color:red; font-size: 20px; font-style: italic;"></span>
<span id="sec-update" style="color:red; font-size: 20px; font-style: italic;"></span>
</div>
<button id="certify-btn" style="margin-left:10px; width:70px; height:40px; border: none; border-radius:3px; background:#FF5A5F; color:white; font-size:16px;">확인</button>
</td></tr>
<tr><td style="width:20%; color:#565;"><h3>자기소개</h3></td></tr>
<tr><td colspan="2" style=" color:#565;">
<div style="width:75%; min-width:615px;"><textarea rows="10" id="contents-intro" name="intro-for-update" style="width:100%;">${member.mem_intro }</textarea></div>
<br>에어비앤비는 사람들 간의 관계를 기반으로 만들어졌습니다. 회원님이 어떤 사람인지 알려주세요. <br>
<br>어떤 것들을 좋아하는지 알려주세요. 가장 좋아하는 여행지, 책, 영화, TV 프로그램, 음악, 음식 등 뭐든지 좋습니다.<br>
<br>회원님은 어떤 스타일의 게스트 또는 호스트인가요? <br>
<br>인생의 좌우명은 무엇인가요?</td></tr>
</table>
<div style="margin:36px 35% 0 0; text-align:center;">
<button type="button" onclick="location.href='/mypage/main';" style="width:100px; height:50px; border:none; border-radius:6px; text-decoration:none; background-color:orange; color:white; font-size: 20px;">취소</button>
<button id="update-complete" style="width:100px; height:50px; margin-left: 30px; border:none; border-radius:6px; text-decoration:none; background-color:#FF5A5F; color:white; font-size: 20px;">확인</button>
</div>
</form>
</div>


