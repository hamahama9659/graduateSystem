<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 내 목표</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="/resources/dist/assets/images/favicon.ico">
<style>
ul{
   list-style:none;
   padding-left:0px;
   }
</style>
<!-- END File Upload Style -->

<!-- third party css -->
<link href="/resources/dist/assets/css/vendor/fullcalendar.min.css"
	rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/dist/assets/css/app.min.css" rel="stylesheet"
	type="text/css" id="main-style-container" />

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

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">HMIS</a></li>
											<li class="breadcrumb-item"><a
											href="javascript: void(0);">My Page</a></li>
										<li class="breadcrumb-item active">내 목표</li>
									</ol>
								</div>
								<h4 class="page-title">내 목표 설정</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<h4 class="header-title">내 목표 설정</h4>
									<p class="text-muted font-13">목표 설정은 신중하게!</p>

									<form name="frm" method="post" role="form">
									<input type="hidden" name="userNo" id="userNo" value="${login.userNo}">
										
										<div class="form-row">
											<div class="form-group col-md-12">	
												<label for="inputPassword4" class="col-form-label">목표 명</label>
												<input type="text" name="goalName" id="goalName" class="form-control">
											</div>
										</div>
										
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputPassword4" class="col-form-label">목표 점수</label>
												<input type="text" name="goalScore" id="goalScore" class="form-control">
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4" class="col-form-label">달성 예정일</label>
												<input type="text" name="targetDate" id="targetDate" class="form-control" data-provide="datepicker" readonly="readonly" data-date-autoclose="true">
											</div>
										</div>

										<div class="form-group">
											<label for="inputAddress2" class="col-form-label">각오</label> 
											<textarea class="form-control" name="resolution" id="resolution" rows="5"></textarea>
										</div>
                                    				                   
										<div style="text-align: right;">
										<button type="submit" class="btn btn-primary">등록</button>
										</div>
										
									</form>

								</div>
								<!-- end card-body -->
							</div>
							<!-- end card-->
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
	<script src="/resources/dist/assets/js/app.js"></script>

</body>

</html>