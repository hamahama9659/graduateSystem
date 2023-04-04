<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 졸업인증신청자 목록</title>
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

</head>
<style>
td, th {
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
										<li class="breadcrumb-item active">졸업인증신청 승인대기</li>
									</ol>
								</div>
								<h4 class="page-title">졸업인증신청자 목록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">

							<div class="card">

								<div class="card-body">

									<div class="table-responsive">
										<table class="table table-centered mb-0">
											<thead class="thead-light">
												<tr>
													<th>NO</th>
													<th>학번</th>
													<th>이름</th>
													<th>항목명</th>
													<th>신청일</th>
													<th>신청상태</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${!empty waitList}">
													<c:forEach items="${waitList}" var="aVo" varStatus="status">
														<tr>
															<td>${status.count}</td>
															<td>${aVo.userNo}</td>
															<td>${aVo.userName}</td>
															<td><a href='waitRead?applyNo=${aVo.applyNo}'>${aVo.subName}</a></td>
															<td><fmt:formatDate value="${aVo.applyDate}"
																	type="date" pattern="yyyy-MM-dd" var="applyDate" />
																${applyDate}</td>
															<td><c:if test="${aVo.applyState eq '승인' }">
																	<span class="badge badge-success badge-pill">${aVo.applyState}</span>
																</c:if> <c:if test="${aVo.applyState eq '승인대기' }">
																	<span class="badge badge-warning badge-pill">${aVo.applyState}</span>
																</c:if> <c:if test="${aVo.applyState eq '거절' }">
																	<span class="badge badge-danger badge-pill">${aVo.applyState}</span>
																</c:if></td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${empty waitList}">
													<tr>
														<td colspan="6">내역이 없습니다.</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
								<!-- end card-body-->



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

		var msg = "${msg}";

		if (msg != "") {
			alert(msg);
		}
	</script>

</body>
</html>