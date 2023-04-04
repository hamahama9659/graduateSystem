<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 전공 등록</title>
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

<!-- javaScript validate() -->
<script type="text/javascript">
   function validate() {

      var courseNo = $("#courseNo").val();
      var majorName = $("#majorName").val();
      var grade = $("#grade").val();
      var trackCode = $("#trackCode").val();
      var profName = $("#profName").val();

      
      //학수번호 유효성 검사
      if (courseNo == "") {

         alert("학수번호를 입력해주세요.");
         $("#courseNo").focus();

         return false;
      }
      
      //과목명 유효성 검사
      if (majorName == "") {
         alert("전공 과목명을 입력해주세요.");
         $("#majorName").focus();

         return false;
      }
      
      //트랙분류 셀렉박스 유효성 검사
      if (frm.trackCode.value == "") {
         alert("트랙분류를 선택해주세요.");
         $("#trackCode").focus();

         return false;
      }

      //학점 유효성 검사
      if (grade == "") {

         alert("학점을 입력해주세요.");
         $("#grade").focus();

         return false;
      }

      //트랙분류 셀렉박스 유효성 검사
      if (frm.profName.value == "") {
         alert("교수명을 선택해주세요.");
         $("#profName").focus();

         return false;
      }


      //안내사항 유효성 검사
      /* if(guide == "") {
         
         alert("안내사항을 입력해주세요.");
         $("#guide").focus();
         
         return false;
      } */
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
               <div class="row" style=" justify-content: center;">
                  <div class="col-7">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item">전공과목관리</li>
                              <li class="breadcrumb-item"><a href="/admin/subject/list">전공과목목록</a></li>
                              <li class="breadcrumb-item active">전공과목등록</li>
                           </ol>
                        </div>
                        <h4 class="page-title">전공과목등록</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row" style=" justify-content: center;">
                  <div class="col-lg-7">
                     <div class="card">
                        <div class="card-body">
                              <!-- <h4 class="header-title mb-3">항목정보입력란</h4> -->

                              <form name="frm" action="/admin/major/adRegister" method="post"
                                 onsubmit="return validate();">
                                 
                                 
                                 
                                 <div class="form-group mb-3">
                                 <label for="courseNo">학수번호 <span
                                             class="text-danger">*</span></label> <input
                                    type="text" class="form-control" name="courseNo" id="courseNo" numberOnly
                                    placeholder="학수번호를 입력해주세요." />
                                    
                              </div>
                              <div class="form-group mb-3">
                                 <label for="majorName">과목명 <span
                                             class="text-danger">*</span></label> <input
                                    type="text" class="form-control" name="majorName" id="majorName" 
                                    placeholder="과목명을 입력해주세요." />
                              </div>
                              <div class="form-group mb-3">
                                 <label for="grade">학점 <span
                                             class="text-danger">*</span></label> <input
                                    type="text" class="form-control" name="grade" id="grade" numberOnly
                                    placeholder="학점을 입력해주세요." />
                              </div>                                                                                                      
                              <div class="box">
                                 
                                 <div class="form-group mb-3">
                                    <label for="trackCode">트랙분류 <span
                                             class="text-danger">*</span></label>
                                 <!-- <select class="form-control select2" name="trackCode" id="trackCode">    -->   
                             
                                               <select class="form-control select2" name="trackCode" id="trackCode">
                                       <option value="">선택하세요...</option>
                                       <option value="IT">Global IT Service</option>
                                       <option value="경영">Smart Management</option>
                                       <option value="공통">공통</option>
                                    </select>
                                    <div class="invalid-feedback">전공과목 트랙분류를 선택해주세요.</div>
                                 </div>
                                 <div class="form-group mb-3">
                                    <label for="profName">교수명 <span
                                             class="text-danger">*</span></label>
         
                                               
                                               <select class="form-control select2"  name="profName" id="profName">
                                          <option value="" hidden selected disabled>선택하세요...</option>
                                       <c:forEach items="${pList}" var="pVO" varStatus="status">
                                          <option value="${pVO.profName}">${pVO.profName}</option>
                                       </c:forEach>
                                    </select>
                                          
                                          
                                    <div class="invalid-feedback">교수명을 선택해주세요.</div>
                                 </div>
                              </div>
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                              
                                 <!-- end row -->
                                 <!-- 
                                 <div class="row">
                                    <div class="col-md-2">
                                       <div class="form-group">
                                          <label for="courseNo">학수번호 <span
                                             class="text-danger">*</span></label> <input numberOnly
                                             class="form-control" type="text" name="courseNo"
                                             id="courseNo" />
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <div class="row">
                                    <div class="col-md-6">
                                       <div class="form-group">
                                          <label for="majorName">전공 과목명 <span
                                             class="text-danger">*</span></label> <input class="form-control"
                                             type="text" placeholder="전공과목을 입력하세요. 예)웹디자인, 웹프로그래밍"
                                             name="majorName" id="majorName">
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <div class="row">
                                 
                                 
                                    <div class="col-md-2">
                                       <div class="form-group">
                                          <label for="grade">학점 <span class="text-danger">*</span></label>
                                          <input numberOnly class="form-control" type="text"
                                             name="grade" id="grade" />
                                       </div>
                                    </div>
                                    
                                 </div>


                                 
                                 <div class="row">
                                    <div class="col-md-2">
                                       <div class="form-group">
                                          <label for="trackCode">트랙분류 <span class="text-danger">*</span></label>
                                          <select data-toggle="select2" name="trackCode" id="trackCode">
                                             <option value="">선택하세요...</option>
                                             <option value="IT">IT</option>
                                             <option value="경영">경영</option>
                                             <option value="빅데이터">빅데이터</option>
                                             <option value="공통">공통</option>
                                          </select>
                                          <div class="invalid-feedback">전공과목 트랙분류를 선택해주세요.</div>
                                       </div>
                                    </div>
                                 </div>
                                 

                                 <div class="row">
                                 
                                    <div class="col-md-2">
                                       <div class="form-group">
                                          <label for="profName">교수명 <span class="text-danger">*</span></label>
                                          
                                          <select data-toggle="select2" name="profName" id="profName">
                                             <option value="" hidden selected disabled>선택하세요...</option>
                                          <c:forEach items="${pList}" var="pVO" varStatus="status">
                                             <option value="${pVO.profName}">${pVO.profName}</option>
                                          </c:forEach>
                                          </select>
                                          
                                          <div class="invalid-feedback">교수명을 선택해주세요.</div>
                                       </div>
                                    </div>
                                 </div>
                                  -->
                                 <!-- end row -->

                                 <div class="row mt-4">
                                    <div class="col-sm-6">
                                       <a href="/admin/major/list"
                                          class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
                                          <i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
                                       </a>
                                    </div>
                                    <!-- end col -->
                                    <div class="col-sm-6">
                                       <div class="text-sm-right">
                                          <button class="btn btn-primary" type="submit">등록</button>
                                       </div>
                                    </div>
                                    <!-- end col -->
                                 </div>
                                 <!-- end row -->
                              </form>
                           </div>
                           <!-- end card-body-->
                        </div>
                        <!-- end card-->
                        
                     <!-- end col-->
                  </div>
                  <!--  end center-align -->

               </div>
               <!-- end col -->
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
   <script src="/resources/dist/assets/js/app_admin.js"></script>

   <!-- third party js -->
   <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
   <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
   <!-- third party js ends -->

   <!-- demo app -->
   <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
   <!-- end demo js-->

   <script>
   $("input:text[numberOnly]").on("focus", function() {
      var x = $(this).val();
      x = removeCommas(x);
      $(this).val(x);
   }).on("focusout", function() {
      var x = $(this).val();
      if (x && x.length > 0) {
         if (!$.isNumeric(x)) {
            x = x.replace(/[^0-9]/g, "");
         }
         x = addCommas(x);
         $(this).val(x);
      }
   }).on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g, ""));
   });
   </script>
</body>
</html>