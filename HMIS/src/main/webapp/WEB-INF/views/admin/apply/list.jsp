<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 취득 자격증 목록</title>
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
										<li class="breadcrumb-item active">취득 자격증 관리</li>
									</ol>
								</div>
								<h4 class="page-title">취득 자격증 등록</h4>
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
											<form class="form-inline">
												<div class="form-group mx-sm-3 mb-2">
													<select class="custom-select" id="status-select"
														name="searchType">
														<option value=""
															<c:out value="${cri.searchType == null?'selected':''}"/>>전체</option>
														<option value="no"
															<c:out value="${cri.searchType eq 'no'?'selected':''}"/>>학번</option>
														<option value="name"
															<c:out value="${cri.searchType eq 'name'?'selected':''}"/>>이름</option>
														<%-- <option value="nn" <c:out value="${cri.searchType eq 'nn'?'selected':''}"/>>학번 또는 이름</option> --%>
													</select>
												</div>
												<div class="form-group mb-2">
													<label for="inputPassword2" class="sr-only">Search</label>
													<input type="text" name="keyword" class="form-control"
														id="keywordInput" placeholder="키워드를 입력해주세요.">&nbsp;&nbsp;
													<input type="button" class="form-control btn-primary"
														id="searchBtn" value="검색">
												</div>
											</form>
										</div>
										<!-- end col-->
									</div>

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
												<c:if test="${!empty allList}">
													<c:forEach items="${allList}" var="aVo" varStatus="status">
														<tr>
															<td>${(pageMaker.totalCount - status.index) -  (pageMaker.cri.page-1) * 10}</td>
															<td>${aVo.userNo}</td>
															<td>${aVo.userName}</td>
															<td><a
																href='read${pageMaker.makeSearch(pageMaker.cri.page)}&applyNo=${aVo.applyNo}'>${aVo.subName}</a></td>
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
												<c:if test="${empty allList}">
													<tr>
														<td colspan="6">내역이 없습니다.</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
								<!-- end card-body-->

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

		$(document).ready(
				function() {

					$('#searchBtn').on(
							"click",
							function(event) {

								self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ $('#keywordInput').val();

							});

				});
	</script>

</body>
</html>