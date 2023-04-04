<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>HMIS :: 가족기업 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="../../../../resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<style>
body.loading {
	visibility: hidden;
}
</style>

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

				<form role="form" class="form-horizontal" method="post">
					<input type="hidden" id="arrayUser" name="arrayUser" />
					<!-- Start Content-->
					<div class="container-fluid">

						<!-- start page title -->
						<div class="row">
							<div class="col-12">
								<div class="page-title-box">
									<div class="page-title-right">
										<ol class="breadcrumb m-0">
											<li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
											<li class="breadcrumb-item"><a href="/admin/fcom/list">가족기업</a></li>
											<li class="breadcrumb-item active">가족기업 </li>
										</ol>
									</div>
									<h3 class="page-title">가족기업 등록</h3>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<h4 class="header-title">가족기업등록</h4>
										<p class="text-muted font-13">글로벌 IT경영학과의 가족기업을 등록하는
											페이지입니다.</p>

										<form name="frm" method="post" role="form">
											<!-- <input type="hidden" name="fcomNo" id="fcomNo">  -->
											<input
												type="hidden" name="userNo" id="userNo"
												value="${login.userNo}">
												
											<div class="form-row">
												<div class="form-group col-md-7">
													<label for="inputEmail4" class="col-form-label">기업명</label><span
														class="text-danger">*</span> <input type="text"
														class="form-control" name="fcomName" id="fcomName"
														var="fcomName">

												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-7">
													<label for="inputEmail4" class="col-form-label">유형</label><span
														class="text-danger">*</span> <input type="text"
														class="form-control" name="comType" id="comType"
														var="comType">

												</div>
											</div>

											<div class="form-row">
												<div class="form-group col-md-7">
													<label for="inputEmail4" class="col-form-label">대표자명</label><span
														class="text-danger">*</span> <input type="text"
														class="form-control" name="ceo" id="ceo" var="ceo">

												</div>
											</div>



											<div class="form-group">
												<label for="inputAddress2" class="col-form-label">내용</label>
												<textarea class="form-control" var="contents"
													name="contents" id="contents" rows="15"></textarea>
											</div>
									</div>

									<!-- end card body-->
									<div class="card-footer">
										<div style="text-align: right;">
											<button type="submit" class="btn btn-primary" id="btn_submit">등록</button>
											<button type="button" onclick="location.href='list'"
												class="btn btn-light">취소</button>
										</div>
									</div>
								</div>
								<!-- end card -->
							</div>
							<!-- end col-->


							<!-- end card-body -->

						</div></div>
				</form>
				<!-- end col -->
			</div>
		</div>
	</div>

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
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#btn_submit").on("click", function() {

				var fcomName = $("#fcomName").val();
				var comType = $("#comType").val();
				var ceo = $("#ceo").val();

				if (fcomName == "") {
					alert("기업명을 입력해주세요.");
					document.getElementById("fcomName").focus();
					return false;
				}
				if (comType == "") {
					alert("회사 분야를 입력해주세요.");
					document.getElementById("comType").focus();
					return false;
				}
				if (ceo == "") {
					alert("대표자명을 입력해주세요.");
					document.getElementById("ceo").focus();
					return false;
				}

				formObj.submit();
			});
		});
	</script>



	<script
		src="../../../../resources/dist/assets/js/vendor/dataTables.checkboxes.min.js"></script>
</body>




</html>