<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 졸업대상자</title>
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

tr, td {
   text-align:center;
   font-family:"맑은고딕";
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
<script type="text/javascript">
function userRegister() {
   location.href="/admin/user/register";
}
</script>

<script type="text/javascript">
function postRemove() {
   
   var formObject = document.contents;
   
   formObject.method = 'post';
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
                              <li class="breadcrumb-item"><a
                                 href="/admin/main">HMIS</a></li>
                              <li class="breadcrumb-item active">졸업대상자 목록</li>
                           </ol>
                        </div>
                        <h4 class="page-title">졸업대상자 목록</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-body">
                           <div class="row mb-2">
                              <div class="col-lg-8">
                                 
             
                              </div>
                              <!-- end col-->
                           </div>

                         <form role="form" name="frm">
                  <input type='hidden' name='testNo' id="testNo"
                     value="${GraduationTestVO.testNo}"> <input type="hidden"
                     name="userNo" id="userNo" value="${totalDTO.userNo}"> <input
                     type='hidden' name='page' value="${cri.page}"> <input
                     type='hidden' name='perPageNum' value="${cri.perPageNum}">
                  <input type='hidden' name='searchType' value="${cri.searchType}">
                  <input type='hidden' name='keyword' value="${cri.keyword}">
                  <input type='hidden' name='mapping' value="${pageContext.request.queryString}">


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
                                          <th>학년</th>
                                          <th>이름</th>
                                          <th>총 졸업점수</th>
                                           <th>학적상태</th>
                                         
                                          <!-- <th style="width: 125px;">Action</th> -->
                                       </tr>
                                    </thead>

                                    <tbody>
                                       <c:if test="${!empty graduateToBeList}">
                                       <!-- 리스트 내용 -->
                                       <c:forEach items="${graduateToBeList}" var="testVO" varStatus="status">
                                          <tr>
                                             <!-- <td>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                                <label class="custom-control-label" for="customCheck2">&nbsp;</label>
                                                            </div>
                                                        </td> -->
                                                        <td>${status.count}</td>
                                 <%--             <td>${status.count}</td> --%>
                                             <td>${testVO.userNo}</td>
                                             <td>${testVO.grade}</td>
                                             <td>${testVO.userName}</td>
                                             <td>${testVO.total}</td>
                                             <td>${testVO.state}</td>
                                           
                                       </c:forEach>
                                       </c:if>
                                       <c:if test="${empty graduateToBeList}">
                                       <tr>
                                                      <td colspan="6">등록된 학생이 없습니다.</td>
                                                   </tr>
                                       </c:if>
                                    </tbody>
                                 </table>
                              </div>

                     
                              
                           </form>
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
   
</body>


</html>