<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 졸업심사 등록</title>
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

<!-- third party css -->
<link href="/resources/dist/assets/css/vendor/fullcalendar.min.css"
	rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/dist/assets/css/app.min.css" rel="stylesheet"
	type="text/css" id="main-style-container" />

<script type="text/javascript">
	function validate() {

		var title = $("#title").val();
		var appStart = $("#appStart").val();
		var appEnd = $("#appEnd").val();
		var graduState = $("#graduState").val();
		var contents = $("#contents").val();

		//제목 유효성 검사
		if (title == "") {

			alert("제목을 입력해주세요.");
			$("#title").focus();

			return false;
		}

		//신청일 유효성 검사
		if (appStart == "") {
			alert("신청일을 선택해주세요.");
			$("#appStart").focus();

			return false;
		}

		//마감일 유효성 검사
		if (appEnd == "") {
			alert("마감일을 선택해주세요.");
			$("#appEnd").focus();

			return false;
		}

		//마감상태 유효성 검사
		if (graduState == "") {

			alert("마감상태를 입력해주세요.");
			$("#graduState").focus();

			return false;
		}

		/*  //내용 유효성 검사
		 if (contents == "") {

		    alert("내용을 입력해주세요.");
		    $("#contents").focus();

		    return false; 
		    
		 }
		 */
		return true;

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
										<li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
										<li class="breadcrumb-item"><a
											href="/admin/graduation/list">졸업심사 글 목록</a></li>
										<li class="breadcrumb-item active">졸업심사 글 등록</li>
									</ol>
								</div>
								<h4 class="page-title">졸업심사 글 등록</h4>
							</div>
						</div>
					</div>

					<!-- end page title -->

					<div class="row">
						<div class="col-lg-12">


							<input type='hidden' name='page' value="${cri.page}"> <input
								type='hidden' name='perPageNum' value="${cri.perPageNum}">
							<input type='hidden' name='searchType' value="${cri.searchType}">
							<input type='hidden' name='keyword' value="${cri.keyword}">




							<div class="row" style="justify-content: center;">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
											<h4 class="header-title mb-3">졸업심사 정보입력란</h4>

											<form role="form" onsubmit="return validate();" method="post">
												<div class="form-group mb-3">
													<label for="title">제목 <span class="text-danger">*</span>
													</label> <input class="form-control" name="title" id="title"
														value="${graduationVO.title}">
												</div>




												<div class="row">
													<div class="form-group col-md-6">
														<label for="inputPassword4" class="col-form-label">작성일</label>
														<input type="text" name="regDate" id="regDate"
															class="form-control" data-toggle="date-picker"
															data-single-date-picker="true" disabled="disabled">
													</div>
												</div>
												<div class="row">
													<div class="form-group col-md-6">
														<label for="appStart" class="col-form-label">신청기간:
															시작일</label> <input type="text" class="form-control date"
															name="appStart" id="appStart" data-toggle="date-picker"
															data-single-date-picker="true"
															value="<fmt:formatDate value="${graduationVO.appStart}" pattern="MM/dd/yyyy"/>">
													</div>

													<div class="form-group col-md-6">
														<label for="appEnd" class="col-form-label">신청기간:
															마감일</label> <input type="text" class="form-control date"
															name="appEnd" id="appEnd" data-toggle="date-picker"
															data-single-date-picker="true"
															value="<fmt:formatDate value="${graduationVO.appEnd}" pattern="MM/dd/yyyy"/>">
													</div>
												</div>


												<div class="form-group mb-3">
													<label for="graduState">마감 상태</label> 
													<select class="form-control select2" name="graduState" id="graduState">
														<option value="">선택하세요..</option>
														<option value="신청대기">신청대기</option>
														<option value="모집중">모집중</option>
														<option value="마감">마감</option>

													</select>
												</div>

											</form>



											<%--   <!-- 페이징과 검색처리를 위한 파라미터값 -->
                              <input type="hidden" class="form-control" name="page" value="${cri.page}">
                              <input type="hidden" class="form-control" name="perPageNum" value="${cri.perPageNum}">
                              <input type="hidden" class="form-control" name="searchType" value="${cri.searchType}">
                              <input type="hidden" class="form-control" name="keyword" value="${cri.keyword}"> --%>

											<div class="row mt-4">
												<div class="col-sm-6">
													<a
														href="/admin/graduation/list"
														class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
														<i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
													</a>


												</div>
												<!-- end col -->
												<div class="col-sm-6">
													<div class="text-sm-right">
														<button class="btn btn-primary" type="submit">등록</button>
													</div>
												</div>
												<!-- end col -->
											</div>
											<!-- end row -->

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
				</div>

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
		</div>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->


	</div>
	<!-- END wrapper -->


	<!-- App js -->
	<script src="../../../../resources/dist/assets/js/app_admin.js"></script>
	<script src="../../../../resources/dist/assets/js/jquery-2.2.4.min.js"></script>
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

</body>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		/* 수정버튼 */
		$(".btn-primary").on("click", function() {
			formObj.submit();
		});

	});
</script>
<script>
	$("input:text[numberOnly]").on("focus", function() {
		var x = $(this).val();
		x = removeCommas(x);
		$(this).val(x);
	}).on("focusout", function() {
		var x = $(this).val();
		if (x && x.length > 0) {
			if (!$.isNumeric(x)) {
				x = x.replace(/[^0-9]/g, "");
			}
		}
	}).on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
</script>
</html>