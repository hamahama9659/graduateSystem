<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8" />
<title>HMIS :: 졸업 신청자 목록 </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
   href="/resources/dist/assets/images/favicon.ico">
<!-- inline style to handle loading of various element-->
<style>
body.loading {
   visibility: hidden;
}
tr, td {
   text-align: center;
   font-family: "맑은고딕";
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
<!-- javaScript -->
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
                              <li class="breadcrumb-item"><a
                                 href="/admin/graduation/testlist">신청자 관리</a></li>
                              <li class="breadcrumb-item active">신청자 목록</li>
                           </ol>
                        </div>
                        <h4 class="page-title">신청자 목록</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-body">




                            <!-- <form id="form" method="get"> -->
                              <input type='hidden' name='testNo' value="${GraduationTestVO.testNo}">
                              <div class="table-responsive">
                                 <table class="table table-centered mb-0">
                                    <thead class="thead-light">
                                       <tr>
                                          <!-- <th style="width: 20px;">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                                <label class="custom-control-label" for="customCheck1">&nbsp;</label>
                                                            </div>
                                                        </th> -->
                                          <th>NO</th>
                                          <th>학번</th>
                                          <th>이름</th>
                                          <th>신청 상태</th>
                                          <th>관리</th>
                                          <!-- <th style="width: 125px;">Action</th> -->
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:if test="${!empty allList}">
                                          <!-- 리스트 내용 -->
                                          <c:forEach items="${allList}" var="GraduationTestVO"
                                             varStatus="status">
                                             <tr>
                                                <!-- <td>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                                <label class="custom-control-label" for="customCheck2">&nbsp;</label>
                                                            </div>
                                                        </td> -->
                                               <%--  <td>${(pageMaker.totalCount - status.index) -  (pageMaker.cri.page-1) * 10 }</td> --%>
                                                <td>${status.count}</td>
                                             <td>${GraduationTestVO.userNo}</td> 
                                                <td>${GraduationTestVO.userName}</td>
                                                <td>${GraduationTestVO.testState}</td>
                                                <td><a class="action-icon"
                                                   href='/admin/graduation/testmodify?graduNo=${GraduationTestVO.graduNo}&userNo=${GraduationTestVO.userNo}&testNo=${GraduationTestVO.testNo}'>
                                                      <i class="mdi mdi-square-edit-outline"></i></a> 
                                                </td>

                                                
                                                <%-- <td><a class="action-icon"
                                                   href='/admin/graduation/testmodify${pageMaker.makeSearch(pageMaker.cri.page)}&testNo=${GraduationTestVO.testNo}'>
                                                      <i class="mdi mdi-square-edit-outline"></i> </a> --%>
                                                <%--  <a href='testmodify?testNo=${GraduationTestVO.testNo}'> <i class="mdi mdi-square-edit-outline"></i></a> --%>

                                                   <%-- <a class="action-icon" href="/admin/user/remove?userNo=${userVO.userNo}">
                                                   <i class="mdi mdi-delete"></i></a> --%>
                                                
                                             </tr>
                                          </c:forEach>
                                       </c:if>
                                       <c:if test="${empty allList}">
                                          <tr>
                                             <td colspan="5">신청 학생이 없습니다.</td>
                                          </tr>
                                       </c:if>
                                    </tbody>
                                 </table>
                              </div>
                              
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                              <!-- 페이징처리 -->
                              

                              <div style="text-align: left;">
                                 <a href="/admin/graduation/list"
                     class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
                     <i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
                  </a>
                              </div>
                           <!-- </form> -->
                           <!-- form -->
                        </div>
                        <!-- end card-body-->
                     </div>
                     <!-- end card-->
                  </div>
                  <!-- end col -->
               </div>
               <!-- end row -->
            </div>
            <!-- end container-fluid-->
         </div>
         <!-- end content -->
      </div>
      <!-- end content-page -->
   </div>
   <!-- end wrapper -->

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
</body></html>