<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드 바</title>

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


      <!-- 사이드 바 -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="/admin/main">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>DashBoard</span>
          </a>
        </li>  
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>관리 목록</span>
          </a>
          
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="/admin/member">회원 관리</a>

            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/admin/lodge">숙소 관리</a>
            
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/admin/payList">결제 관리</a> 
            
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/admin/csList">고객문의 관리</a> 
            
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/admin/festival">행사 관리</a> 
            
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/admin/reportMember">신고 관리</a> 
                  
          </div>
        </li>
        </ul> <!-- 사이드 바 끝 -->
        
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin.min.js"></script>


</body>
</html>