<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 문의등록</title>
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
<style>
#acDate {
   background-color: #fff;
}
</style>
<body class="loading">
   <div id="detached-topbar-placeholder"></div>
   <!-- Begin page -->
   <div class="wrapper">

      <div id="detached-sidebar-placeholder"></div>

      <!-- ============================================================== -->
      <!-- Start Page Content here -->
      <!-- ============================================================== -->

      <div class="content-page">
         <div class="content">
            <div id="vertical-topbar-placeholder"></div>
            <!-- Start Content-->
            <div class="container-fluid">
               <!-- start page title -->
               <div class="row" style="justify-content: center;">
                  <div class="col-12">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item">QnA</li>
                              <li class="breadcrumb-item"><a href="/user/QnA/list">문의게시판</a></li>
                              <li class="breadcrumb-item active">문의게시판</li>
                           </ol>
                        </div>
                        <h4 class="page-title">문의 등록</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row" style="justify-content: center;">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-body">

                           <!-- <form role="form"  action="register" method="post"
                              onsubmit="return validate();"> -->
                               <form role="form" name="frm" class="form-horizontal" method="post">
                            
                               <input type="hidden" name="userNo" id="userNo" value="${login.userNo}">


                              <div class="form-group mb-3">
                                 <label for="qnaTitle">제목 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" name="qnaTitle"
                                    id="qnaTitle" placeholder="제목을 입력하세요." />

                              </div>
                              <div class="form-group mb-3">
                                 <label for="userName">작성자 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" name="userName"
                                    id="userName" value="${login.userName}" readonly="readonly" />
                              </div>
                              
                              
                               <div class="form-group mb-3">
                                    <label for="inputPassword4" class="col-form-label">작성일</label>
                                    <input type="text" name="regDate" id="regDate"
                                       class="form-control" data-toggle="date-picker"
                                       data-single-date-picker="true" disabled="disabled">
                                 </div>
                              
                              
                              <div class="form-group mb-3">
                                 <label for="inputAddress2" class="col-form-label">내용</label>
                                 <textarea class="form-control"
                                    name="qnaContents" id="qnaContents" rows="15"></textarea>
                              </div>


                              



                              <div style="text-align: right;">
                                 <button type="submit" class="btn btn-primary" id="btn_submit">등록</button>
                              </div>

                           </form>

                        </div>
                        <!-- end card-body -->
                     </div>
                     <!-- end card-->
                  </div>
                  <!-- end col-12 -->
               </div>
               <!-- end row -->

            </div>
            <!-- container -->

         </div>
         <!-- content -->

         <!-- Footer Start -->
         <footer class="footer">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-6">2018 - 2019 © Hyper - Coderthemes.com
                  </div>
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
   <!-- END wrapper -->



   <!-- App js -->
   <script src="/resources/dist/assets/js/app.js"></script>

</body>


<script>
   // 신청 등록 유효성 검사 
   function validate() {
      var qnaTitle = $("#qnaNo").val();
      var qnaTitle = $("#qnaTitle").val();
      var userNo = $("#userNo").val();
      var qnaContents = $("#qnaContents").val();
      var regDate = $("#regDate").val();

      if ( qnaTitle == "") {
         alert("제목을 입력해주세요.");
         document.getElementById("qnaTitle").focus();
         return false;
      }

      return true;

   }
</script>

<!-- SD PROJECT JS -->

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li class="dropzone-previews mt-3">
<div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
<div class="p-2">
<div class="row align-items-center">
 <div class="col-auto">
    <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="{{imgsrc}}">
 </div>
 <div class="col pl-0">
   <a href="/displayFile?fileName={{fullName}}" text-muted font-weight-bold" data-dz-name="">{{fileName}}</a>
 </div>
 <div class="col-auto">
   <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="dripicons-cross"></i></a>
 </div>
</div>
</div>
</div>
</li>
</script>

<!-- <script>
   $(document).ready(function() {
                  var formObj = $("form[role='form']");

                  formObj.submit(function(event) {
                           event.preventDefault();
                           //유효성 검사

                           var val = validate();
                        });
                  
                  
                  $("#btn_primary").on("click", function() {

                      var proName = $("#proName").val();
                      /* var type = $("#type").val();
                      var writer = $("#writer").val(); */

                  $(".btn-cancel")
                        .on(
                              "click",
                              function() {
                                 self.location = "shop.do?action=list&page=${cri.page}&perPageNum=${cri.perPageNum}"
                                       + "&searchType=${cri.searchType}&listType=${cri.listType}&keyword=${cri.keyword}";
                              });

               });
</script> -->

   <script>
      $(document).ready(function() {

         var formObj = $("form[role='form']");

         console.log(formObj);

         $("#btn_submit").on("click", function() {

            var qnaTitle = $("#qnaTitle").val();
            /* var type = $("#type").val();
            var writer = $("#writer").val(); */

            if (qnaTitle == "") {
               alert("제목을 입력해주세요.");
               document.getElementById("qnaTitle").focus();
               return false;
            }
            /* if(type == ""){
               alert("유형을 입력해주세요.");
               document.getElementById("type").focus();
               return false;
            }
            if(writer == ""){
               alert("담당자를 입력해주세요.");
               document.getElementById("writer").focus();
               return false;
            } */

            formObj.submit();
         });
      });
   </script>






</html>