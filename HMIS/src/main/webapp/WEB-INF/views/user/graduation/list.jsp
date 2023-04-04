<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 졸업심사</title>
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
<script type="text/javascript">
   function graduationRegister() {
      location.href = "/admin/graduation/register";
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
               <div class="row">
                  <div class="col-12">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
                              <li class="breadcrumb-item active">졸업심사 </li>
                           </ol>
                        </div>
                        <h4 class="page-title">졸업심사 목록</h4>
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
                                <%--  <form class="form-inline">
                                    <div class="form-group mx-sm-3 mb-2">
                                       <select class="custom-select" id="status-select"
                                          name="searchType">
                                          <option value=""
                                             <c:out value="${cri.searchType == null?'selected':''}"/>>전체</option>
                                          <option value="t"
                                             <c:out value="${cri.searchType eq 't'?'selected':''}"/>>신청이력</option>
                                       </select>
                                    </div>
                                    <div class="form-group mb-2">
                                       <label for="inputPassword2" class="sr-only">Search</label>
                                       <input type="hidden" name="keyword" class="form-control"
                                          value="${login.userNo}" id="keywordInput"
                                          placeholder="키워드를 입력해주세요.">&nbsp;&nbsp; 
                                       <input
                                          type="button" class="form-control btn-primary"
                                          id="searchBtn" value="검색">
                                    </div>
                                 </form> --%>
                              </div>
                              <!-- end col-->
                           </div>
                           
                           <div class="table-responsive">
                              <table class="table table-centered mb-0"
                                 style="text-align: center;">
                                 <thead class="thead-light">
                                    <tr>
                                       <th>NO</th>
                                       <th>제목</th>
                                       <th>신청기간</th>
                                       <th>마감 상태</th>

                                    </tr>
                                 </thead>

                                 <tbody>
                                    <%--========================== 위의 리스트 : 승인대기 중인 리스트 , 아래부터 : 신청하지 않은 리스트 ==================================================================================== --%>
                                    <c:if test="${!empty listSearch}">
                                    <c:forEach items="${allList}" var="gVo"
                                       varStatus="listStatus">
                                       <tr>
                                          <c:if test="${pageMaker.cri.page==1}">
                                             <td>${listStatus.count}</td>
                                          </c:if>
                                          <c:if test="${pageMaker.cri.page!=1}">
                                             <td>${listStatus.count + ((pageMaker.cri.page-1)*10)}</td>
                                          </c:if>

                                          <td><%-- <a
                                             href='read${pageMaker.makeSearch(pageMaker.cri.page)}&graduNo=${gVo.graduNo}'>
                                                </a> --%>
                                                ${gVo.title}</td>

                                          <td style="text-align: center;"><fmt:formatDate
                                                pattern="yyyy-MM-dd" value="${gVo.appStart}" /> ~ <fmt:formatDate
                                                pattern="yyyy-MM-dd" value="${gVo.appEnd}" /></td>

                                          <c:choose>
                                             <c:when test="${gVo.graduState eq '모집중'}">
                                                <td><input type="submit"
                                                   style="padding: 1px; font-size: 10px;"
                                                   onclick="location.href='register${pageMaker.makeSearch(pageMaker.cri.page)}&userNo=${login.userNo}&graduNo=${gVo.graduNo}'"
                                                   class="btn btn-primary"  value="모집중">
                                                </td>
                                             </c:when>
                                             <c:when test="${gVo.graduState eq '마감'}">
                                                <td><input type="button"
                                                   style="padding: 1px; font-size: 10px;"
                                                   class="btn btn-secondary btn-rounded" id="noapply_btn"
                                                   value="마감" disabled></td>
                                             </c:when>
                                             <c:when test="${gVo.graduState eq '승인대기'}">
                                                <td><input type="button"
                                                   style="padding: 1px; font-size: 10px;"
                                                   onclick="window.open('/user/graduation/searchPopup?userNo=${login.userNo}&graduNo=${gVo.graduNo}', 'CLIENT_WINDOW',
                                                                                       'toolbar=yes,menubar=yes,width=800,height=500')"
                                                   class="btn btn-primary" id="applyed_btn" value="승인 대기" >
                                                </td>
                                             </c:when>
                                             <c:when test="${gVo.graduState eq '승인'}">
                                                <td><input type="button"
                                                   style="padding: 1px; font-size: 10px;"
                                                   onclick="window.open('/user/graduation/searchPopup?userNo=${login.userNo}', 'CLIENT_WINDOW',
                                                                                       'toolbar=yes,menubar=yes,width=800,height=500')"
                                                   class="btn btn-primary" id="applyed_btn" value="승인">
                                                </td>
                                             </c:when>
                                             <c:when test="${gVo.graduState eq '거절'}">
                                                <td><input type="button"
                                                   style="padding: 1px; font-size: 10px;"
                                                   onclick="window.open('/user/graduation/searchPopup?userNo=${login.userNo}', 'CLIENT_WINDOW',
                                                                                       'toolbar=yes,menubar=yes,width=800,height=500')"
                                                   class="btn btn-primary" id="applyed_btn" value="거절" >
                                                </td>
                                             </c:when>
                                          </c:choose>


                                       </tr>
                                    </c:forEach>
                                 </c:if>
                                 <c:if test="${empty listSearch}">
                                    <tr>
                                       <td colspan="6">내역이 없습니다.</td>
                                    </tr>
                                 </c:if>
                                 </tbody>
                              </table>
                           </div>

                           <!-- end card-body-->

                           <!-- start card footer -->
                           <div class="card-footer">
                              <nav>
                                 <ul class="pagination justify-content-center">
                                    <c:if test="${pageMaker.prev}">
                                       <li class="page-item"><a class="page-link"
                                          aria-label="Previous"
                                          href="allList${pageMaker.makeSearch(pageMaker.startPage - 1) }"><span
                                             aria-hidden="true">«</span> <span class="sr-only">Previous</span></a></li>
                                    </c:if>
                                    <c:forEach begin="${pageMaker.startPage }"
                                       end="${pageMaker.endPage }" var="idx">
                                       <li
                                          class="page-item <c:out value="${pageMaker.cri.page == idx? 'class= active':''}"/>">
                                          <a class="page-link"
                                          href="allList${pageMaker.makeSearch(idx)}">${idx}</a>
                                       </li>
                                    </c:forEach>
                                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                       <li><a class="page-link"
                                          href="allList${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
                                             aria-hidden="true">»</span> <span class="sr-only">Next</span></a></li>
                                    </c:if>
                                 </ul>
                              </nav>
                           </div>


                        </div>
                     </div>

                  </div>
                  <!-- end card footer -->
               </div>

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
   <script src="/resources/dist/assets/js/app.js"></script>

   <!-- third party js -->
   <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
   <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
   <!-- third party js ends -->

   <!-- demo app -->
   <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
   <!-- end demo js-->




   <script>
      $(document).ready(
            function() {

               $('#searchBtn').on(
                     "click",
                     function(event) {

                        self.location = "/user/graduation/list"
                              + '${pageMaker.makeQuery(1)}'
                              + "&searchType="
                              + $("select option:selected").val()
                              + "&keyword="
                              + $('#keywordInput').val();

                     });

            });
   </script>

   <script>
      /*       var apply_btn = document.getElementById('button');
       apply_btn.disabled = false;
      
       var noapply_btn = document.getElementById('button');
       noapply_btn.disabled = true; */

      $('#noapply_btn').attr('disabled', true); //마감 버튼 비활성
      $('#applyed_btn').attr('disabled', false); // 신청 버튼 활성화
   </script>

   <!-- 
   <script>
      // searchSub 팝업창 띄우기
      // searchSub 팝업창 띄우기
      $("#apply_btn")
            .click(
                  function() {
                     var url = "searchPopup";
                     var name = "신청 조회";
                     var option = "width = 500, height = 300, top = 100, left = 200, location = no";
                     window.open(url, name, option);
                  });
   </script>
 -->



 <script>
      var result = '${msg}';

      if (result == 'SUCCESS') {
         alert("신청 되었습니다.");
      }

   </script>


</body>
</html>