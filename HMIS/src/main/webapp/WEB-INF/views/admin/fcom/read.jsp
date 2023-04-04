<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 가족기업 상세보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
   content="A fully featured admin theme which can be used to build CRM, CMS, etc."
   name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
   href="/resources/dist/assets/images/favicon.ico">
<style>
ul {
   list-style: none;
   padding-left: 0px;
}

input.form-control[disabled], textarea.form-control[disabled] {
   background-color: #fff;
}
</style>
<!-- END File Upload Style -->

<!-- third party css -->
<link href="/resources/dist/assets/css/vendor/fullcalendar.min.css"
   rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet"
   type="text/css" />
<link href="/resources/dist/assets/css/app.min.css" rel="stylesheet"
   type="text/css" id="main-style-container" />

</head>

<body class="loading">

   <!-- Begin page -->
   <div class="wrapper">

      <div id="vertical-sidebar-placeholder"></div>

      <!-- ============================================================== -->
      <!-- Start Page Content here -->
      <!-- ============================================================== -->

      <div class="content-page">
         <div class="content">

            <div id="vertical-topbar-placeholder"></div>


            <!-- Start Content-->
            <div class="container-fluid">

               <!-- start page title -->
               <div class="row">
                  <div class="col-12">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
                              <li class="breadcrumb-item"><a href="/admin/fcom/list">가족기업</a></li>
                              <li class="breadcrumb-item active">가족기업</li>
                           </ol>
                        </div>
                        <h3 class="page-title">가족기업 상세보기</h3>
                     </div>
                  </div>
               </div>


               <form role="form" action="modify" method="post">
                  <input type='hidden' name='fcomNo' value="${fcomVO.fcomNo}">
                  <input type='hidden' name='page' value="${cri.page}"> <input
                     type='hidden' name='perPageNum' value="${cri.perPageNum}">
                  <input type='hidden' name='searchType' value="${cri.searchType}">
                  <input type='hidden' name='keyword' value="${cri.keyword}">
               </form>

  <div class="card d-block">
                        <div class="card-body">
                           
                           <!-- project title-->
                           <h3 class="mt-0">${fcomVO.fcomName}</h3>
                           <div class="badge badge-secondary mb-3"> <i class="mdi mdi-wrench"></i>&nbsp; ${fcomVO.comType} </div>
                           <div class="badge badge-secondary mb-3">  <i class="mdi mdi-human-child"></i> &nbsp; ${fcomVO.ceo}</div>

                                        <p style="font-size: 1em;">
                                            ${fn:replace(fcomVO.contents, crcn, br)}
                                        </p>

                           </div>

            
            </div>



            <div class="row mt-4">
               <div class="col-sm-6">
                  <a href="/admin/fcom/list"
                     class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
                     <i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
                  </a>
               </div>
               <!-- end col -->
               <div class="col-sm-6">
                  <div class="text-sm-right">
                     <button class="btn btn-danger" type="submit">삭제</button>
                     <button class="btn btn-primary" type="submit">수정</button>
                  </div>
               </div>
               <!-- end col -->
            </div>
         </div>
         <!-- content -->

         <!-- Footer Start -->
         <footer class="footer">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-6">2018 - 2019 © Hyper - Coderthemes.com</div>
                  <div class="col-md-6">
                     <div class="text-md-right footer-links d-none d-md-block">
                        <a href="javascript: void(0);">About</a> <a
                           href="javascript: void(0);">Support</a> <a
                           href="javascript: void(0);">Contact Us</a>
                     </div>
                  </div>
               </div>
            </div>
         </footer>
         <!-- end Footer -->
      </div>
      <!-- ============================================================== -->
      <!-- End Page content -->
      <!-- ============================================================== -->

   </div>
   </div>
   <!-- END wrapper -->





   <!-- App js -->
   <script src="../../../../resources/dist/assets/js/app_admin.js"></script>

   <!-- third party js -->
   <script
      src="../../../../resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
   <script
      src="../../../../resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
   <!-- third party js ends -->

   <!-- demo app -->
   <script
      src="../../../../resources/dist/assets/js/pages/demo.calendar.js"></script>
   <!-- end demo js-->
</body>

<script>
   $(document).ready(function() {

      var formObj = $("form[role='form']");

      console.log(formObj);

      /* 삭제버튼 */
      $(".btn-danger").on("click", function() {
         formObj.attr("action", "/admin/fcom/remove");
         formObj.submit();
      });

      /* 수정버튼 */
      $(".btn-primary").on("click", function() {
         formObj.attr("action", "/admin/fcom/modify");
         formObj.attr("method", "get");
         formObj.submit();
      });

   });
</script>
</html>