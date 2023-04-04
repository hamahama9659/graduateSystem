<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title> HMIS :: 전공 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon" href="/resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<style>body.loading {visibility: hidden;}</style>

<!-- third party css -->
<link href="/resources/dist/assets/css/vendor/fullcalendar.min.css" rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/assets/css/app.min.css" rel="stylesheet" type="text/css" id="main-style-container" />

<script type="text/javascript">
function validate(){
   
   var courseNo = $("#courseNo").val();
   var majorName = $("#majorName").val();
   var grade = $("#grade").val();
   
   //학수번호 유효성 검사
   if(courseNo == "") {
      alert("학수번호를 입력해주세요.");
      $("#courseNo").focus();
      
      return false;
   }
   
   //과목명 유효성 검사
   if(majorName == "") {
      alert("과목명을 입력해주세요.");
      $("#majorName").focus();
      
      return false;
   }
   
   //학점 유효성 검사
   if(grade == "") {
      alert("학점을 입력해주세요.");
      $("#grade").focus();
      
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

            <div class="content-page" style="align:center;">
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
                              <li class="breadcrumb-item"><a
                                 href="/admin/major/list">전공과목목록</a></li>
                              <li class="breadcrumb-item active">전공과목수정</li>
                           </ol>
                        </div>
                        <h4 class="page-title">전공과목수정</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row" style=" justify-content: center;">
                  <div class="col-lg-7">
                     <div class="card">
                        <div class="card-body">
                           <h4 class="header-title mb-3">전공정보입력란</h4>

                           <form role="form" onsubmit="return validate();" method="post">
                              <div class="form-group mb-3">
                                 <label for="courseNo">학수번호 <span
                                             class="text-danger">*</span></label> <input
                                    type="text" class="form-control" name="courseNo" id="courseNo" value="${majorVO.courseNo}"
                                    numberOnly placeholder="학수번호를 입력해주세요." />
                              </div>
                              <div class="form-group mb-3">
                                 <label for="majorName">과목명 <span
                                             class="text-danger">*</span></label> <input
                                    type="text" class="form-control" name="majorName" id="majorName" value="${majorVO.majorName}"
                                    placeholder="과목명을 입력해주세요." />
                              </div>
                              <div class="form-group mb-3">
                                 <label for="grade">학점 <span
                                             class="text-danger">*</span></label> <input
                                    type="text" class="form-control" name="grade" id="grade" value="${majorVO.grade}"
                                    numberOnly placeholder="학점을 입력해주세요." />
                              </div>                                                                                                      
                              <div class="box">
                                 
                                 <div class="form-group mb-3">
                                    <label for="trackCode">트랙분류 <span
                                             class="text-danger">*</span></label>
                                    <select class="form-control select2" name="trackCode" id="trackCode">
                                                <option value="IT"
                                       <c:out value="${majorVO.trackCode eq 'IT'?'selected':'' }"/>>Global IT Service</option>
                                    <option value="경영"
                                       <c:out value="${majorVO.trackCode eq '경영'?'selected':'' }"/>>Smart Management</option>
                                    <option value="공통"
                                       <c:out value="${majorVO.trackCode eq '공통'?'selected':'' }"/>>공통</option>   
                                               </select>
                                 </div>
                                 <div class="form-group mb-3">
                                    <label for="profName">교수명 <span
                                             class="text-danger">*</span></label>
                                    <select class="form-control select2" name="profName" id="profName" value="${pVO.profName}" >
                                          <c:forEach items="${pList}" var="pVO" varStatus="status">
                                             <option value="${pVO.profName}">${pVO.profName}</option>
                                          </c:forEach>
                                               </select>
                                 </div>
                              </div>
                              

                              <!-- 페이징과 검색처리를 위한 파라미터값 -->
                              <input type="hidden" class="form-control" name="page" value="${cri.page}">
                              <input type="hidden" class="form-control" name="perPageNum" value="${cri.perPageNum}">
                              <input type="hidden" class="form-control" name="searchType" value="${cri.searchType}">
                              <input type="hidden" class="form-control" name="keyword" value="${cri.keyword}">
                              
                              <div class="row mt-4">
                                    <div class="col-sm-6">
                                       <a href="/admin/major/list?searchType=${cri.searchType}&keyword=${cri.keyword}&page=${cri.page}&perPageNum=${cri.perPageNum}"
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
                            <div class="col-md-6">
                                2018 - 2019 © Hyper - Coderthemes.com
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-right footer-links d-none d-md-block">
                                    <a href="javascript: void(0);">About</a>
                                    <a href="javascript: void(0);">Support</a>
                                    <a href="javascript: void(0);">Contact Us</a>
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
</html>