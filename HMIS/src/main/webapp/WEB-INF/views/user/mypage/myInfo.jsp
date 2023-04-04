<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 내정보</title>
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

<!-- input readonly -->
<style type="text/css">
input.form-control[readonly], textarea.form-control[readonly] { 
  background-color: #fff;
}
body[data-layout=detached] .wrapper {
    overflow: hidden !important;
}
</style>
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

                    <!-- start page title -->
					<div class="row" style=" justify-content: center;">
						<div class="col-7">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">MyPage</a></li>
										<!-- <li class="breadcrumb-item"><a
											href="javascript: void(0);"></a></li> -->
										<li class="breadcrumb-item active">내정보</li>
									</ol>
								</div>
								<h4 class="page-title">내정보</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row" style=" justify-content: center;">
						<div class="col-lg-7">
							<div class="card">
								<div class="card-body">
									<form action="myInfoUpdate" method="get">
										<div class="form-group mb-3">
											<label for="userNo">학번</label>
											<input type="text" class="form-control" name="userNo"
											value="${userVO.userNo}" readonly="readonly"/>
										</div>
										
										<div class="box">
											<div class="form-group mb-3">
												<label for="grade">학년</label>
												<input type="text" class="form-control" readonly="readonly" value="${userVO.grade}">
											</div>
											<div class="form-group mb-3">
												<label for="state">학적상태</label>
												<input type="text" class="form-control" readonly="readonly" value="${userVO.state}">
											</div>
										</div>
										
										<div class="form-group mb-3">
											<label for="userName">이름</label> <input
												type="text" class="form-control" name="userName" value="${userVO.userName }"
												readonly="readonly"/>
										</div>

										
										<div style="text-align: right;">
											<button class="btn btn-primary" type="submit">내정보 수정하기</button>
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
		$(document).ready(function() {
			
	  		$('#gradeSelect option').not(":selected").attr("disabled", "disabled");
	  		$('#stateSelect option').not(":selected").attr("disabled", "disabled");
		});

	</script>
</html>