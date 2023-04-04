<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>HMIS :: 문의게시판</title>
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

    </head>
<style>
td, th{
text-align: center;
}
body[data-layout=detached] .wrapper {
    overflow: hidden !important;
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

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">HMIS</a></li>
                                            <li class="breadcrumb-item active">문의게시판</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">문의게시판</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title mb-3">문의게시판 목록</h4>
                
                                        <div class="table-responsive">
                                            <table class="table table-centered mb-0">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>NO</th>
                                                        <th>제목</th>
                                                        <th>작성자</th>                       
                                                        <th>등록일</th>
                                                        <th>조회수</th>
                                                    </tr>
                                                </thead>
                                                
                                                <tbody>
                                                   <c:if test="${!empty list}">
                                                    <c:forEach items="${list}" var="qnaVO" varStatus="status">
                                          <tr>
                                             <td>${status.count}</td>
                                             <td><a href='read?qnaNo=${qnaVO.qnaNo}'> ${qnaVO.qnaTitle}</a></td>
                                             <td>${qnaVO.userName}</td>
                                             <td><fmt:formatDate pattern="yyyy-MM-dd" value="${qnaVO.regDate}" /></td>
                                             <td>${qnaVO.hits}</td>
                                          </tr>
                                       </c:forEach>
                                                  
                                                    </c:if>
                                                    
                                                    <c:if test="${empty list}">
                                                       <tr>
                                                          <td colspan="4">내역이 없습니다.</td>
                                                       </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> <!-- end card-body-->
                                    
                                     <!-- start card footer -->
                                    <div class="card-footer">
                              <nav>
                                 <ul class="pagination justify-content-center">
                                    <c:if test="${pageMaker.prev}">
                                       <li class="page-item"><a class="page-link"
                                          aria-label="Previous"
                                          href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }"><span
                                             aria-hidden="true">«</span> <span class="sr-only">Previous</span></a></li>
                                    </c:if>
                                    <c:forEach begin="${pageMaker.startPage }"
                                       end="${pageMaker.endPage }" var="idx">
                                       <li
                                          class="page-item <c:out value="${pageMaker.cri.page == idx? 'class= active':''}"/>">
                                          <a class="page-link"
                                          href="list${pageMaker.makeSearch(idx)}">${idx}</a>
                                       </li>
                                    </c:forEach>
                                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                       <li><a class="page-link"
                                          href="list${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
                                             aria-hidden="true">»</span> <span class="sr-only">Next</span></a></li>
                                    </c:if>
                                 </ul>
                              </nav>
                              <div style="text-align: right;">
                              <button type="button" class="btn btn-primary" onclick="location.href='register'">등록</button>
                              </div>                                 
                                 </div>
                                    <!-- end card footer -->

                                </div>
                            </div>
                            <!-- end col-12 -->
                        </div> <!-- end row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->

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
        <script src="/resources/dist/assets/js/app.js"></script>

        <!-- third party js -->
        <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
        <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
        <!-- third party js ends -->

        <!-- demo app -->
        <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
        <!-- end demo js-->
        
        
      

  </body>
  
  
<script>
var result = '${msg}';

if (result == 'SUCCESS') {
   alert("등록되었습니다.");
}

var result = '${msg}';

if (result == 'MODIFY') {
   alert("수정되었습니다.");
}


var result = '${msg}';

if (result == 'REMOVE') {
   alert("삭제되었습니다.");
}

</script>

<script>
      $(document).ready(function() {
         $("#detached-check input:radio").click(function() {

            alert("clicked");
         });

         $("input:radio:first").prop("checked", true).trigger("click");

      });
   </script>
   
   
</html>