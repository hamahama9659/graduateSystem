<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 문의글 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="/resources/dist/assets/images/favicon.ico">
<style>
ul {
	list-style: none;
	padding-left: 0px;
}

input.form-control[disabled], textarea.form-control[disabled] {
	background-color: #fff;
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
										<li class="breadcrumb-item"><a href="/user/main">HMIS</a></li>
										<li class="breadcrumb-item"><a href="/user/QnA/list">문의게시판
										</a></li>
										<li class="breadcrumb-item active">문의글 수정</li>
									</ol>
								</div>
								<h3 class="page-title">문의글 수정</h3>
							</div>
						</div>
					</div>

					<%-- 
               <form role="form" action="read" method="post">
                  <input type='hidden' name='fcomNo' value="${fcomVO.fcomNo}">
                  <input type='hidden' name='page' value="${cri.page}"> <input
                     type='hidden' name='perPageNum' value="${cri.perPageNum}">
                  <input type='hidden' name='searchType' value="${cri.searchType}">
                  <input type='hidden' name='keyword' value="${cri.keyword}">

               </form>
 --%>

					<form role="form" action="frm" method="post">
						<input type='hidden' name='qnaNo' value="${qnAVO.qnaNo}">




						<div class="row">
							<div class="col-lg-12">
								<div class="center-align">
									<div class="card">
										<div class="card-body">


											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label for="proName">제목 <span class="text-danger">*</span></label>
														<input type="text" class="form-control" name="qnaTitle"
															id="qnaTitle" value="${qnAVO.qnaTitle}">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="form-group col-md-6">
													<label for="inputEmail4" class="col-form-label">작성자</label> <input
											type="text" class="form-control" name="userName"
											id="userName" value="${qnAVO.userName}" readonly="readonly">
												</div>

												<div class="form-group col-md-6">
													<label for="inputAddress2" class=" col-md-7">작성일</label> <input
														type="text" name="regDate" id="regDate"
														class="form-control" data-toggle="date-picker"
														data-single-date-picker="true" disabled="disabled">
												</div>



											</div>

											<div class="row">
												<div class="form-group col-md-12">
													<label for="inputEmail4" class="col-form-label">상세내용</label>
										<textarea class="form-control" name="qnaContents"
											id="qnaContents" rows="15">${qnAVO.qnaContents}</textarea>
												</div>
											</div>
											
											
											<div class="row mt-4">
									<div class="col-sm-6">
										<a href="/user/QnA/list"
											class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
											<i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
										</a>
									</div>
									<!-- end col -->
									<div class="col-sm-6">
										<div class="text-sm-right">
											<button class="btn btn-primary" type="submit">수정</button>
										</div>
									</div>
								</div>

										</div>
									</div>
								</div>
							</div>
						</div>

					</form>
				</div>
				<div style="margin-bottom: 2%"></div>
				<!-- end card-body -->
			</div>
			<!-- end card-->
		</div>

	</div>
	<!-- end row -->

	</div>
	<!-- container -->

	</div>
	<!-- content -->
	<div></div>
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

	</div>

	<!-- ============================================================== -->
	<!-- End Page content -->
	<!-- ============================================================== -->


	</div>
	<!-- END wrapper -->



	<!-- App js -->
	<script src="/resources/dist/assets/js/app.js"></script>
</body>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		/* 수정버튼 */
		$(".btn-primary").on("click", function() {
			formObj.attr("action", "/user/QnA/modify");
			formObj.attr("method", "post");
			formObj.submit();
		});

	});
</script>
</html>