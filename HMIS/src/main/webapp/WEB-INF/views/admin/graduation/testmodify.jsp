<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 졸업심사 신청자 상세페이지</title>
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

input.form-control[readonly], textarea.form-control[readonly] {
   background-color: #fff;
}
</style>
<!-- third party css -->
<link href="/resources/dist/assets/css/vendor/fullcalendar.min.css"
   rel="stylesheet" type="text/css" />
<!-- third party css end -->
<!-- App css -->
<link href="../../../../resources/dist/assets/css/icons.min.css"
   rel="stylesheet" type="text/css" />
<link href="../../../../resources/dist/assets/css/app.min.css"
   rel="stylesheet" type="text/css" id="main-style-container" />
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
                              <li class="breadcrumb-item active">신청학생 상세보기</li>
                           </ol>
                        </div>
                        <h4 class="page-title">신청학생 상세보기</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->
               <form role="form" name="frm">
                  <input type='hidden' name='testNo' id="testNo"
                     value="${GraduationTestVO.testNo}"> <input type="hidden"
                     name="userNo" id="userNo" value="${totalDTO.userNo}"> <input
                     type='hidden' name='page' value="${cri.page}"> <input
                     type='hidden' name='perPageNum' value="${cri.perPageNum}">
                  <input type='hidden' name='searchType' value="${cri.searchType}">
                  <input type='hidden' name='keyword' value="${cri.keyword}">
                  <input type='hidden' name='mapping' value="${pageContext.request.queryString}">



                  <div class="row">
                     <div class="col-12">
                        <div class="card widget-inline">
                           <div class="card-body p-0">
                              <div class="row no-gutters">
                                 <div class="col-sm-12 col-xl-3">
                                    <div class="card shadow-none m-0">
                                       <div class="card-body text-center">
                                          <i class="dripicons-user-group text-muted"
                                             style="font-size: 24px;"></i>

                                          <p class="text-muted font-15 mb-0">학번</p>
                                          <h3>${totalDTO.userNo}</h3>
                                       </div>
                                    </div>
                                 </div>

                                 <div class="col-sm-12 col-xl-3">
                                    <div class="card shadow-none m-0 border-left">
                                       <div class="card-body text-center">
                                          <i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>

                                          <p class="text-muted font-15 mb-0">이름</p>
                                          <h3>${totalDTO.userName}</h3>
                                       </div>
                                    </div>
                                 </div>

                                 <div class="col-sm-12 col-xl-3">
                                    <div class="card shadow-none m-0 border-left">
                                       <div class="card-body text-center">
                                          <i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>
                                          <h3>
                                             <span><a href="/user/mypage/myScore"></a></span>
                                          </h3>
                                          <p class="text-muted font-15 mb-0">학년</p>

                                          <h3>${totalDTO.grade}학년</h3>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-12 col-xl-3">
                                    <div class="card shadow-none m-0 border-left">
                                       <div class="card-body text-center">
                                          <i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>
                                          <h3>
                                             <span><a href="/user/mypage/myScore"></a></span>
                                          </h3>
                                          <p class="text-muted font-15 mb-0">학적상태</p>

                                          <h3>${GraduationTestVO.testState}</h3>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <!-- end row -->
                           </div>
                        </div>
                        <!-- end card-box-->
                     </div>
                     <!-- end col-->
                  </div>


                  <div class="row">
                     <div class="col-12">
                        <div class="card widget-inline">
                           <div class="card-body p-0">
                              <div class="row no-gutters">
                                 <div class="col-sm-12 col-xl-3">
                                    <div class="card shadow-none m-0">
                                       <div class="card-body text-center">
                                          <i class="dripicons-user-group text-muted"
                                             style="font-size: 24px;"></i>

                                          <p class="text-muted font-15 mb-0">MIS 점수</p>
                                          <h3>${totalDTO.misTotal}</h3>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-12 col-xl-3">
                                    <div class="card shadow-none m-0 border-left">
                                       <div class="card-body text-center">
                                          <i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>

                                          <p class="text-muted font-15 mb-0">취득 점수</p>
                                          <h3>${totalDTO.subTotal}</h3>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-12 col-xl-3">
                                    <div class="card shadow-none m-0 border-left">
                                       <div class="card-body text-center">
                                          <!-- <i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i> -->
                                          <p class="text-muted font-15 mb-0">추가 점수</p>
                                          <input type="hidden" value="0" name="subNo">
                                          <input type="hidden" value="0" name="acScore">
                                          <h3 id="exh3">0</h3>
                                            <h3><button class="btn btn-primary" type="button" id="subPopup" style="padding: 2px 7px; font-size: 0.5em;">점수 추가</button></h3>
                                       </div>
                                    </div>
                                 </div>

                                 <div class="col-sm-12 col-xl-3">
                                    <div class="card shadow-none m-0 border-left">
                                       <div class="card-body text-center">
                                          <i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>

                                          <p class="text-muted font-15 mb-0">총 졸업 점수</p>
                                          <h3 id="totalh3">${totalDTO.total}</h3>
                                       </div>
                                    </div>
                                 </div>

                              </div>
                              <!-- end row -->
                           </div>
                        </div>
                        <!-- end card-box-->
                     </div>
                     <!-- end col-->
                  </div>
                  <!-- end row -->
               </form>

               <div class="row">
                  <div class="col-12">
                     <div class="card ">
                        <div class="card-body ">
                           <h4 class="header-title mb-3">인증항목내역</h4>
                           <div class="table-responsive">
                              <div class="row no-gutters">
                                 <div class="col-sm-12 ">
                                    <div class="card shadow-none m-0">
                                       <table class="table table-centered mb-0"
                                          style="text-align: center;">
                                          <thead class="thead-light">


                                             <tr>
                                                <th>NO</th>
                                                <th>분류</th>
                                                <th>영역</th>
                                                <th>항목명</th>
                                                <th>점수</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:if test="${!empty acceptList}">
                                                <c:forEach items="${acceptList}" var="aVo"
                                                   varStatus="status">
                                                   <tr>
                                                      <td>${status.count}</td>
                                                      <td>${aVo.categ}</td>
                                                      <td>${aVo.area}</td>
                                                      <td>${aVo.subName}</td>
                                                      <td>${aVo.acScore}</td>
                                                   </tr>
                                                </c:forEach>
                                             </c:if>
                                             <c:if test="${empty acceptList}">
                                                <tr>
                                                   <td colspan="5">내역이 없습니다.</td>
                                                </tr>
                                             </c:if>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>



            </div>
            <!-- container-fluid -->

            <div class="row mt-4"
               style="margin-top: 0em !important; margin-bottom: 1em;">
               <div class="col-sm-6">
                  <i class="mdi mdi-arrow-left"> <a href="/admin/graduation/testlist?graduNo=${GraduationTestVO.graduNo}"
                     class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">목록으로 돌아가기 </a></i> 
               </div>
               <!-- end col -->
               <div class="col-sm-6">
                  <div class="text-sm-right">
                  <c:if test="${GraduationTestVO.testState eq '승인대기'}">
                              
                              <button type="button" class="btn btn-success">승인</button>
                              <button type="button" class="btn btn-danger">거절</button>
                  </c:if>
                     
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
         <!-- ============================================================== -->
         <!-- End Page content -->
         <!-- ============================================================== -->
      </div>
   </div>
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

   <script>
      // searchSub 팝업창 띄우기
      $("#subPopup").click(
                  function() {
                     var url = "searchPopup";
                     var name = "항목 검색";
                     var option = "width = 700, height = 500, top = 100, left = 200, location = no";
                     window.open(url, name, option);
                  });
      
      
   function exTotal(){
      
      //기본 사용자가 취득한 점수
      var total = "<c:out value='${totalDTO.total}'/>";
      //추가 점수
      var ex = document.frm.acScore.value;
      
      var totalNum = parseInt(total);
      var exNum = parseInt(ex);

      $('#exh3').text(exNum);
      $('#totalh3').text(totalNum+exNum);
      
   }   
      
      
      $(document).ready(function() {

         var formObj = $("form[role='form']");

         $(".btn-success").on("click", function() {
            formObj.attr("action", "/admin/graduation/accept");
            formObj.attr("method", "post");
            formObj.submit();
         });

         $(".btn-danger").on("click", function() {
            formObj.attr("action", "/admin/graduation/deny");
            formObj.attr("method", "post");
            formObj.submit();
         });
      });
   </script>
   
   
    <script>
      var result = '${msg}';

      if (result == 'SUCCESS') {
         alert(" 승인되었습니다.");
      }

      if (result == 'DENY') {
         alert("거절되었습니다.");

      }
   </script>
</body>

</html>