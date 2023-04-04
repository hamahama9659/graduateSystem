<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 가족기업 소개</title>
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


<script type="text/javascript">
   function validate() {

      var fcomName = $("#fcomName").val();
      var comType = $("#comType").val();
      var ceo = $("#ceo").val();
      var contents = $("#contents").val();

      //기업명 유효성 검사
      if (fcomName == "") {

         alert("기업명을 입력해주세요.");
         $("#fcomName").focus();

         return false;
      }
      
      //기업 유형 유효성 검사
      if (comType == "") {

         alert("기업 유형을  입력해주세요.");
         $("#comType").focus();
         

         return false;
      }

      
      //기업 대표자명 유효성 검사
      if (ceo == "") {
         alert("기업 대표자명을 입력해주세요.");
         $("#ceo").focus();

         return false;
      }

      //기업 내용 유효성 검사
      if (contents == "") {

         alert("기업 내용을 입력해주세요.");
         $("#contents").focus();

         return false;
      }

   
      return true;

   }
</script>




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
                        <h3 class="page-title">가족기업 수정</h3>
                     </div>
                  </div>
               </div>

<%-- 
               <form role="form" action="read" method="post">
                  <input type='hidden' name='fcomNo' value="${fcomVO.fcomNo}">
                  <input type='hidden' name='page' value="${cri.page}"> <input
                     type='hidden' name='perPageNum' value="${cri.perPageNum}">
                  <input type='hidden' name='searchType' value="${cri.searchType}">
                  <input type='hidden' name='keyword' value="${cri.keyword}">

               </form>
 --%>
<form role="form" action="read"   onsubmit="return validate();"  method="post">
<input type='hidden' name='fcomNo' value="${fcomVO.fcomNo}">
               <div class="form-row">
                  <div class="form-group col-md-7">
                     <label for="inputEmail4" class="col-form-label">기업명</label>
                     <input type="text" class="form-control" name="fcomName" id="fcomName"
                        value="${fcomVO.fcomName}" var="fcomName">

                  </div>
               </div>
               <div class="form-row">
                  <div class="form-group col-md-7">
                     <label for="inputEmail4" class="col-form-label">유형</label><input
                        type="text" value="${fcomVO.comType}" class="form-control"
                        name="comType" id="comType" var="comType">

                  </div>
               </div>

               <div class="form-row">
                  <div class="form-group col-md-7">
                     <label for="inputEmail4" class="col-form-label">대표자명</label> 
                     <input type="text" class="form-control" name="ceo" id="ceo" var="ceo"
                        value="${fcomVO.ceo}">

                  </div>
               </div>



               <div class="form-group">
                  <label for="inputAddress2" class="col-form-label">내용</label>
                  <textarea class="form-control" name="contents" id="contents"
                     rows="15" var="contents">${fcomVO.contents}</textarea>
               </div>
               </form>
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
                     <button class="btn btn-primary" type="submit">수정</button>
                  </div>
               </div>
               <!-- end col -->
            </div>
         </div>
         <div style="margin-bottom: 2%"></div>
         <!-- end card-body -->
      </div>
      <!-- end card-->
   </div>

   
   <!-- end row -->

   
   <!-- container -->


   <!-- content -->
   <div></div>
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



   <!-- ============================================================== -->
   <!-- End Page content -->
   <!-- ============================================================== -->


   
   <!-- END wrapper -->



        <!-- App js -->
        <script src="/resources/dist/assets/js/app_admin.js"></script>

        <!-- third party js -->
        <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
        <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
        <!-- third party js ends -->

        <!-- demo app -->
        <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
        <!-- end demo js-->

</body>

<script>
   $(document).ready(function() {

      var formObj = $("form[role='form']");

      /* 수정버튼 */
      $(".btn-primary").on("click", function() {
         formObj.attr("action", "/admin/fcom/modify");
         formObj.attr("method", "post");
         formObj.submit();
      });

   });
</script>

</html>