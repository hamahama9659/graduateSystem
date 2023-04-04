<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
   content="A fully featured admin theme which can be used to build CRM, CMS, etc."
   name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
   href="/resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<style>
body.loading {
   visibility: hidden;
}
</style>

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
   //진로 - 중복검사 AJAX. (경욱)
   function checkCarName() {
      var carName = $("#carName").val();

      if (carName == "") {
         alert("진로를 입력해주세요.");
         $("#carName").focus();
         return false;
      } else {
         $.ajax({
            url : "checkCarName?carName=" + carName,
            type : "GET",
            success : function(data) {
               console.log(data);
               if (data == false) {
                  $("#invalid-feedback").css("display", "inline");
                  $("#valid-feedback").css("display", "none");
                  $("#registerBtn").prop("disabled", "disabled");
               }
               if (data == true) {
                  $("#invalid-feedback").css("display", "none");
                  $("#valid-feedback").css("display", "inline");
                  $("#registerBtn").prop("disabled", "");
               }
            },
            error : function() {
               console.log("error");
            }
         });
      }

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

      <div class="content-page" style="align: center;">
         <div class="content">

            <div id="vertical-topbar-placeholder"></div>

            <!-- Start Content-->
            <div class="container-fluid">

               <!-- start page title -->
               <div class="row" style="justify-content: center;">
                  <div class="col-lg-7">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
                              <li class="breadcrumb-item"><a
                                 href="/admin/carrier/listAll">진로목록 </a></li>
                              <li class="breadcrumb-item active">진로등록</li>
                           </ol>
                        </div>
                        <h4 class="page-title">진로등록</h4>
                     </div>
                  </div>
               </div>

               <!-- end page title -->

               <div class="row" style="justify-content: center;">
                  <div class="col-lg-7">
                     <div class="card">
                        <div class="card-body">
                           <h4 class="header-title mb-3">진로정보입력란</h4>

                           <form name="frm" method="post" onsubmit="return validate();">
                              <!-- <div class="form-group mb-3">
                                            <label>진로명</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="carName" id="carName" placeholder="진로명을 입력해주세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
                                                <div class="input-group-append">
                                                    <button class="btn btn-info" id="checkBtn" type="button" onclick="checkcarName()">중복확인</button>
                                                </div>
                                            </div>
                                            <div class="invalid-feedback" id="invalid-feedback" style="display: none;">*이미 존재하는 진로명입니다.</div>
                                            <div class="valid-feedback" id="valid-feedback" style="display: none;">*등록 가능한 진로명입니다.</div>
                                        </div> -->



                              <!-- <div class="form-group mb-3">
                                 <label for="carName">진로</label> <input
                                    type="text" class="form-control" name="carName" id="carName"
                                    placeholder="진로를 입력해주세요."/>
                              </div> -->

                              <div class="form-group mb-3">
                                 <label>진로</label>
                                 <div class="input-group">
                                    <input type="text" class="form-control" name="carName"
                                       id="carName" placeholder="진로명을 입력해주세요." />
                                    <div class="input-group-append">
                                       <button class="btn btn-info" id="checkBtn" type="button"
                                          onclick="checkCarName()">중복확인</button>
                                    </div>
                                 </div>
                                 <div class="invalid-feedback" id="invalid-feedback"
                                    style="display: none;">*이미 존재하는 진로명입니다.</div>
                                 <div class="valid-feedback" id="valid-feedback"
                                    style="display: none;">*등록 가능한 진로명입니다.</div>
                              </div>

                              <div class="text-sm-right">
                                 <button class="btn btn-primary" id="registerBtn"
                                    disabled="disabled" type="submit">등록</button>
                              </div>
                           </form>

                        </div>
                        <!-- end card-body-->
                     </div>
                     <!-- end card-->
                  </div>
                  <!-- end col-->
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


</html>