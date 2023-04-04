<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 졸업인증신청 상세보기</title>
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
input.form-control[disabled], textarea.form-control[disabled] {
	background-color: #fff;
}

ul {
	list-style: none;
	padding-left: 0px;
}

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
										<li class="breadcrumb-item"><a href="/admin/apply/list">졸업인증신청
												목록</a></li>
										<li class="breadcrumb-item active">졸업인증신청 상세보기</li>
									</ol>
								</div>
								<h4 class="page-title">졸업인증신청</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->


					<form role="form">

						<input type='hidden' name='applyNo' value="${applyVO.applyNo}">
						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">


						<div class="row">
							<div class="col-12">

								<div class="card">
									<div class="card-body">
										<h4 class="header-title">졸업인증신청 상세보기</h4>
										<p class="text-muted font-13">신청 후에 수정과 삭제는 불가합니다.</p>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4" class="col-form-label">학번</label> <input
													type="text" name="userNo" id="userNo"
													value="${applyVO.userNo}" class="form-control"
													disabled="disabled">
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4" class="col-form-label">이름</label>
												<input type="text" name="userName" id="userName"
													value="${applyVO.userName}" class="form-control"
													disabled="disabled">
											</div>
										</div>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4" class="col-form-label">분류</label> <input
													type="text" name="categ" id="categ"
													value="${applyVO.categ}" class="form-control"
													disabled="disabled">
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4" class="col-form-label">영역</label>
												<input type="text" name="area" id="area"
													value="${applyVO.area}" class="form-control"
													disabled="disabled">
											</div>
										</div>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4" class="col-form-label">항목명</label>
												<div class="input-group">
													<input type="text" class="form-control" name="subName"
														id="subName" value="${applyVO.subName}"
														disabled="disabled">
												</div>
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4" class="col-form-label">취득
													점수</label> <input type="text" name="acScore" id="acScore"
													class="form-control" value="${applyVO.acScore}"
													disabled="disabled">
											</div>
										</div>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputCity" class="col-form-label">자격증
													일련번호</label> <input type="text" class="form-control"
													name="serialNum" id="serialNum"
													value="${applyVO.serialNum}" disabled="disabled">
											</div>
											<div class="form-group col-md-6">
												<label for="inputCity" class="col-form-label">취득일</label>
												<fmt:formatDate value="${applyVO.acDate}" type="date"
													pattern="yyyy-MM-dd" var="acDate" />
												<input type="text" name="acDate" id="acDate"
													class="form-control" value="${acDate}" disabled="disabled">
											</div>
										</div>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputCity" class="col-form-label">신청 상태</label>
												<input type="text" class="form-control" name="applyState"
													id="applyState" value="${applyVO.applyState}"
													disabled="disabled">
											</div>
											<div class="form-group col-md-6">
												<label for="inputCity" class="col-form-label">신청일</label>
												<fmt:formatDate value="${applyVO.applyDate}" type="date"
													pattern="yyyy-MM-dd" var="applyDate" />
												<input type="text" name="applyDate" id="applyDate"
													class="form-control" value="${applyDate}"
													disabled="disabled">
											</div>
										</div>

										<div class="form-group">
											<label for="inputAddress2" class="col-form-label">상세내용</label>
											<textarea class="form-control" name="content" id="content"
												rows="5" disabled="disabled">${applyVO.content}</textarea>
										</div>

										<c:if test="${applyVO.applyState eq '승인대기'}">
											<div class="form-group" id="reason">
												<label for="inputAddress2" class="col-form-label">사유</label>
												<select class="custom-select" id="selectReason"
													name="reason">
													<option selected value="승인되었습니다.">승인되었습니다.</option>
													<option value="불충분한 양식으로 거절되었습니다.">불충분한 양식으로
														거절되었습니다.</option>
													<option value="학과사무실로 연락주시길 바랍니다.">학과사무실로 연락주시길
														바랍니다.</option>
													<option value="1">직접입력</option>
												</select>
											</div>

											<div class="form-group" style="display: none;">
												<label for="inputAddress2" class="col-form-label">사유
													:: 직접입력</label> <input type="text" id="directReason" name="reason"
													class="form-control" disabled="disabled">
											</div>
										</c:if>

										<c:if
											test="${applyVO.applyState eq '승인' or  applyVO.applyState eq '거절'}">
											<div class="form-group" id="reason">
												<label for="inputAddress2" class="col-form-label">사유</label>
												<textarea class="form-control" name="reason" id="reason"
													rows="5" disabled="disabled">${applyVO.reason}</textarea>
											</div>
										</c:if>

										<c:if test="${!empty fileVO}">
											<div class="form-group">
												<label for="exampleInputEmail1" class="col-form-label">첨부파일<span
													class="must-mark">*</span></label>
											</div>

											<ul class="dropzone-previews">

												<c:forEach items="${fileVO}" var="fileVO" varStatus="status">
													<li class="dropzone-previews mt-3">
														<div
															class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
															<div class="p-2">

																<div class="row align-items-center">
																	<c:choose>
																		<c:when test="checkImageType(${fileVO.fileLocation})">
																			<div class="col-auto">
																				<img data-dz-thumbnail=""
																					class="avatar-sm rounded bg-light"
																					src="${fileVO.fileName}">
																			</div>
																		</c:when>

																		<c:otherwise>
																			<div class="col-auto">
																				<img data-dz-thumbnail=""
																					class="avatar-sm rounded bg-light"
																					src="/resources/dist/assets/images/file.svg">
																			</div>
																		</c:otherwise>

																	</c:choose>

																	<div class="col pl-0">
																		<a href="/displayFile?fileName=${fileVO.fileLocation}"
																			text-muted font-weight-bold data-dz-name="">${fileVO.fileName}</a>
																	</div>
																</div>
															</div>
														</div>
													</li>
												</c:forEach>
											</ul>
										</c:if>
										<c:if test="${empty fileVO}">
										</c:if>


										<div style="text-align: right;">
											<c:if test="${applyVO.applyState eq '승인대기'}">
												<button type="button" class="btn btn-danger">거절</button>
												<button type="button" class="btn btn-success">승인</button>
											</c:if>
											<button type="button" class="btn btn-primary">목록</button>
										</div>


									</div>
									<!-- end card body-->
								</div>
								<!-- end card -->
							</div>
							<!-- end col-12 -->
						</div>
						<!-- end row -->
					</form>
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

		$("#selectReason")
				.change(
						function() {
							$("#selectReason option:selected")
									.each(
											function() {
												if ($(this).val() == "1") {
													$("#selectReason").attr(
															"name", "disabled");
													$("#directReason").attr(
															"disabled", false);
													$("#directReason")
															.parent()
															.attr("style",
																	"display:inline;");
												} else {
													$("#selectReason").attr(
															"name", "reason");
													$("#directReason").attr(
															"disabled", true);
													$("#directReason")
															.parent()
															.attr("style",
																	"display:none;");
												}
											});
						});

		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-success").on("click", function() {
				formObj.attr("action", "/admin/apply/accept?mapping=list");
				formObj.attr("method", "post");
				formObj.submit();
			});

			$(".btn-danger").on("click", function() {
				formObj.attr("action", "/admin/apply/deny?mapping=list");
				formObj.attr("method", "post");
				formObj.submit();
			});

			$(".btn-primary").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/admin/apply/list");
				formObj.submit();
			});

		});

		function checkImageType(fileName) {

			var pattern = /jpg|gif|png|jpeg/i;

			return fileName.match(pattern);

		}
	</script>

</body>
</html>