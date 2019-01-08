<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/cs/common.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../../../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

<body>
<input type="hidden" value="${member.mem_no }" name="mem_no" />
<div id="wrapper" style="min-width:978px; max-width:1200px; margin:0 auto;">
		
	
	<div class="content">
	
		<div class="sub_title">
				<b>Life Is Trip은 고객님의 목소리를 소중히 여깁니다.<br>
				문의하신 내용은 확인 즉시, 빠르게 답변 드리도록 하겠습니다.</b> 
		</div>
		
		<div class="sub_title1">
				<h2>문의내용 작성하기</h2>
		</div>
		
	<!-- onsubmit을 return false를 막아준다 -->	
	<!-- 막아주는 이유 : 스마트에디터 내용을 textarea로 먼저 복사 붙여넣기!! 실행 후, 제출하기 위해서 -->
	<!--  만일 막아주지 않으면 충돌이 일어나서 textarea가 불러오지 않는다. -->
	<form action="/cs/enroll" method="post" name="inquiry" enctype="multipart/form-data" onsubmit="return false;">
	
		<div class="table_list">
		
			<table class="table2">
				<tr>
					<th>문의 제목 </th>
					<td> 
					<input type="text" name="title" placeholder="문의 제목을 입력해주세요"
						style="font-size:20px; width:550px; height:40px; margin-left:10px;">
					</td>
				</tr>
				
				<tr>
					<th>작성자 <input type ="hidden" name ="mem_no" value ="<c:out value="${member.mem_no }"/>"> </th>
					<!-- 세션이 이미 받아와져서 상관없음 -->
					<td><p style="margin-left:10px;">${member.mem_name }</p></td>
				</tr>
				
				<tr>
					<th colspan="2">문의 내용 </th>
					
				</tr>
				
				<tr>
					<td colspan="2"> 
					<textarea name="contents" id="abcd"></textarea>
				
					</td>	
				</tr>
			
			</table>
			
			
		</div>
		<div class="btnList">
				<button class="button1" type="submit" id="submit_post" onclick="submitContents();" style="margin-right:30px" >문의 하기</button>
				<button class="button button2" onclick="button2_click();" >취 소</button>
		</div>
		</form>
	</div>

</div>
<script>

	//네이버 스마트에디터 설정하기
	
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
    
    //전송 버튼 누르면 벌어지는 일
    function submitContents()
    {
    	//enroll.jsp의 form name이 inquiry인 항목을 변수 form에 집어 넣는다 
    	//document.getElementById("form")을 form 하나로 요약해도 된다.
    	var form = document.inquiry;
    	
    	//사용자가 제목을 입력하지 않을 경우, 알림 메시지가 나옴
    	if(!form['title'].value)
    	{
    		alert("제목을 입력해주세요!!");
    		form['title'].focus();
    		return;
    	}
 
    	oEditors.getById["abcd"].exec("UPDATE_CONTENTS_FIELD", []);
 		var contents =$("#abcd").val();
 		
 		if(contents == "" || contents== null ||contents=='&nbsp;'  || contents == '<p>&nbsp;</p>' || contents=='<br>')
 		{
 			alert("내용을 입력해주세요!!");
 			oEditors.getById["abcd"].exec("FOCUS"); //포커싱
 			return;
 			
 		}
 		else
 		{
 			//submit 가능한 상태로 변경 
 	    	form.setAttribute('onsubmit','return true;');
 			
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
        var sHTML = '<img style="width:100%" src="<%=request.getContextPath()%>/resources/images/'+filepath+'">';
        oEditors.getById["abcd"].exec("PASTE_HTML", [sHTML]);
    }
    
 	
    //버튼 2 누르면 벌어지는 일
	function button2_click()
	{
		alert("이전 페이지로 이동합니다.");
		history.go(-1);
	}

</script>
</body>
