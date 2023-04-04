<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="/resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<!-- page CSS -->
<style>
body.loading {
	visibility: hidden;
}
input.form-control[readonly], textarea.form-control[readonly] { 
  background-color: #fff;
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
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">인증항목관리</a></li>
										<!-- <li class="breadcrumb-item"><a
											href="javascript: void(0);"></a></li> -->
										<li class="breadcrumb-item active">인증항목등록</li>
									</ol>
								</div>
								<h4 class="page-title">인증항목등록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-lg-12">
							<div class="center-align">
								<div class="card">
									<div class="card-body">
										<!-- <h4 class="header-title mb-3">항목정보입력란</h4> -->

										<form role="form" method="post" >
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label for="categ">분류 <span
															class="text-danger">*</span></label>
														<select data-toggle="select2" name="categ" id="categSelect">
															<option value="필수"
															<c:out value="${subjectVO.categ eq '필수'?'selected':'' }"/>>필수</option>
															<option value="선택"
															<c:out value="${subjectVO.categ eq '선택'?'selected':'' }"/>>선택</option>
														</select>
														<div class="invalid-feedback">인증항목 분류을 선택해주세요.</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label for="billing-last-name">영역 <span
															class="text-danger">*</span></label>
															
															<select data-toggle="select2" name="area" id="areaSelect">
																<option value="외국어"
																<c:out value="${subjectVO.area eq '외국어'?'selected':'' }"/>>외국어</option>
																<option value="학생활동봉사"
																<c:out value="${subjectVO.area eq '학생활동봉사'?'selected':'' }"/>>학생활동/봉사</option>
																<option value="정보화"
																<c:out value="${subjectVO.area eq '정보화'?'selected':'' }"/>>정보화</option>
																<option value="금융회계"
																<c:out value="${subjectVO.area eq '금융회계'?'selected':'' }"/>>금융/회계</option>
																<option value="교육"
																<c:out value="${subjectVO.area eq '교육'?'selected':'' }"/>>교육</option>
																<option value="취업진학"
																<c:out value="${subjectVO.area eq '취업진학'?'selected':'' }"/>>취업/진학</option>
																<option value="공모전기타"
																<c:out value="${subjectVO.area eq '공모전기타'?'selected':'' }"/>>공모전/기타</option>
															</select>
															<div class="invalid-feedback">인증항목 영역을 선택해주세요.</div>
													</div>
												</div>
											</div>
											<!-- end row -->
										
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label for="sub-Name">평가항목 <span
															class="text-danger">*</span></label>
														<input class="form-control" type="text"
															name="subName" value="${subjectVO.subName }"
															readonly="readonly">
													</div>
												</div>
												<div class="col-md-2">
													<div class="form-group">
														<label for="score">평가점수 <span
															class="text-danger">*</span></label>
														<input class="form-control" type="text" name="score"
															value="${subjectVO.score }" readonly="readonly" />
													</div>
												</div>
												<div class="col-md-2">
													<div class="form-group"></div>
												</div>
												<div class="col-md-2">
													<div class="form-group"></div>
												</div>
											</div>
											<!-- end row -->
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label for="publication">발행처 <span
															class="text-danger">*</span></label>
														<input class="form-control" type="text"
															name="publication" value="${subjectVO.publication }" readonly="readonly"/>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group"></div>
												</div>
											</div>
											<!-- end row -->
									
											<div class="row">
												<div class="col-12">
													<div class="form-group mt-3">
														<label for="example-textarea">추가 안내사항</label>
														<textarea class="form-control" name="guide" id="example-textarea"
															rows="3" readonly="readonly">${subjectVO.guide}</textarea>
															
														<input type="hidden" class="form-control" name="regdate" value="${subjectVO.regdate }">
														<input type="hidden" class="form-control" name="subNo" value="${subjectVO.subNo }">
														<input type="hidden" class="form-control" name="page" value="${cri.page}">
														<input type="hidden" class="form-control" name="perPageNum" value="${cri.perPageNum}">
														<input type="hidden" class="form-control" name="searchType" value="${cri.searchType}">
														<input type="hidden" class="form-control" name="keyword" value="${cri.keyword}">
													</div>
												</div>
											</div>
											<!-- end row -->

											<div class="row mt-4">
												<div class="col-sm-6">
													<a href="/admin/subject/list"
														class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
														<i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
													</a>
												</div>
												<!-- end col -->
												<div class="col-sm-6">
													<div class="text-sm-right">
														<button class="btn btn-danger" type="submit">삭제</button>
														<button class="btn btn-primary" type="submit">수정</button>
													</div>
												</div>
												<!-- end col -->
											</div>
											<!-- end row -->
										</form>
									</div>
									<!-- end card-body-->
								</div>
								<!-- end card-->
							</div>
							<!-- end col-->
						</div>
						<!--  end center-align -->

					</div>
					<!-- end col -->
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
			
	  		$('#categSelect option').not(":selected").attr("disabled", "disabled");
	  		$('#areaSelect option').not(":selected").attr("disabled", "disabled");
		});

	</script>
	
	<!-- 삭제, 수정 페이지 이동 -->
	<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);
		
		/* 삭제버튼 */
		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/admin/subject/remove");
			formObj.submit();
		});
		
		/* 수정버튼 */
		$(".btn-primary").on("click", function() {
			formObj.attr("action", "/admin/subject/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});

	});
	</script>

</body>
</html>