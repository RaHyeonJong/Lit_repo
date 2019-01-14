<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS-->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin.css" rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>

	  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
      <a class="navbar-brand mr-1" href="/admin/main">Life Is Trip Management</a>
      <!-- 목록 바 --> 
      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
      </button> 

      <!-- 네비 바 검색 -->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Life Is Trip 바로가기" aria-label="Search" aria-describedby="basic-addon2">
          <div class="input-group-append">
            <button class="btn btn-light" type="button" onclick="location.href='/main'">Go</button>
          </div>
        </div>
       </form>

      <!-- 검색창 옆 네비 바 -->
      <ul class="navbar-nav ml-auto ml-md-0">
      
        <!-- 알림 바 -->
        <li class="nav-item dropdown no-arrow mx-1">
          <a class="nav-link dropdown-toggle" href="/admin/lodge?lodge_activation=0" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-bell fa-fw"></i>
            <span id="lodge0cnt" class="badge badge-danger">0</span>
          </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
             <a class="dropdown-item" href="/admin/lodge">대기숙소 승인하기</a>
            </div>
        </li>
       
        <!-- 1:1문의내역 답변하기 -->
        <li class="nav-item dropdown no-arrow mx-1">
          <a class="nav-link dropdown-toggle" href="/admin/csList" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-envelope fa-fw"></i>
            <span id="cs0cnt" class="badge badge-danger">0</span>
          </a>
          
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
            <a class="dropdown-item" href="/admin/csList">1:1문의 답변하기</a>
          </div>
        </li>
        
        <!-- 관리자 설정 정보 변경 -->
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="/admin/main" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
        </li>
      </ul>

    </nav>
    
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin.min.js"></script>

    <!-- 숙소, 고객지원 실시간 개수  -->
    <script type="text/javascript">
    
    setInterval(function(){
    
    	$.ajax({
			type:"post",
			url:"/admin/countForAdminHeader",
			data:{},
			dataType:"json",
			success:function(res)
			{
				$('#lodge0cnt').html(res.lodge0Cnt);
				$('#cs0cnt').html(res.cs0Cnt);
				return;
			},
			error:function()
			{
				alert("오류");
			}
			
		})
	}, 1000);
    
    
    </script>
    
    
    
    

</body>
</html>