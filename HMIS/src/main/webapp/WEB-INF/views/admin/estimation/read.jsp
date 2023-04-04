<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>HMIS :: 졸업인증점수현황 상세보기</title>
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

</style>
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
                                            <li class="breadcrumb-item"><a href="/admin/estimation/list">졸업인증점수 현황 목록</a></li>
                                            <li class="breadcrumb-item active">졸업인증점수 상세보기</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">졸업인증점수 상세보기</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <form role="form">
						
						<input type="hidden" name="userNo" id="userNo" value="${totalDTO.userNo}">
						<input type='hidden' name='page' value="${cri.page}">
						<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">

                        <div class="row">
                            <div class="col-12">

                                <div class="card">
                                	<div class="card-header">
                                	<h4> 학번 : ${totalDTO.userNo} &nbsp;&nbsp;&nbsp; 이름 : ${totalDTO.userName} &nbsp;&nbsp;&nbsp; 학년 : ${totalDTO.grade} &nbsp;&nbsp;&nbsp; 학적상태 : ${totalDTO.state} &nbsp;&nbsp;&nbsp; 총점 : ${totalDTO.total} 점</h4>
                                    </div>
                                    <div class="card-body">
					                 	<h4>MIS</h4><br>
				                 		<table class="table table-bordered table-centered mb-0">
                                              <thead>
                                                  <tr>
                                                      <th>분류</th>
                                                      <th>영역</th>
                                                      <th>항목명</th>
                                                      <th>총점</th>
                                                  </tr>
                                              </thead>
                                              <tbody>
                                                  <tr>
                                                      <td>필수</td>
                                                  	<td>학생활동/봉사</td>
                                                  	<td>MIS</td>
                                                  	<td>${totalDTO.misTotal}</td>
                                                  </tr>
                                              </tbody>
                                        </table>
                                        <br><br>
                                        <h4>인증항목내역</h4><br>
                                        <table class="table table-bordered table-centered mb-0">
                                              <thead>
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
                                              	<c:forEach items="${acceptList}" var="aVo" varStatus="status">
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
									</div><!-- end card body-->
									<div class="card-footer text-muted">
	                                     <div style="text-align: right;">
	                                     	<button type="button" class="btn btn-success">Excel</button>
											<button type="button" class="btn btn-primary">목록</button>
										</div>
	                                </div>
                                </div> <!-- end card -->
                            </div>
                            <!-- end col-12 -->
                        </div> <!-- end row -->
                        </form><!-- end row -->
                        
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
        <script src="/resources/dist/assets/js/app_admin.js"></script>

        <!-- third party js -->
        <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
        <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
        <!-- third party js ends -->

        <!-- demo app -->
        <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
        <!-- end demo js-->
        
        
 <script>
$(document).ready(function() {
	  $("#detached-check input:radio").click(function() {

	    alert("clicked");
	    
	   });
	  
	  $("input:radio:first").prop("checked", true).trigger("click");
	  
	});


$(document).ready(function() {

	var formObj = $("form[role='form']");

	console.log(formObj);
	
	$('.btn-success').on(
			"click",
			function(event) {
				formObj.attr("method", "get");
				formObj.attr("action", "/admin/estimation/excelEsSelectDown");
				formObj.submit();
			});


	$(".btn-primary").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "/admin/estimation/list");
		formObj.submit();
	});

});
</script>       

  </body>
</html>