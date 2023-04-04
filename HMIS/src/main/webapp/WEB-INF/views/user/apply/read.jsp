<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 취득 자격증 상세보기</title>
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
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">HMIS</a></li>
										<li class="breadcrumb-item active">취득 자격증</li>
									</ol>
								</div>
								<h4 class="page-title">취득 자격증</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

<form role="form" action="list" method="get">
	<input type='hidden' name='page' value="${cri.page}">
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

</form>

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<h4 class="header-title">취득 자격증 상세보기</h4>
									<p class="text-muted font-13">신청 후에 수정과 삭제는 불가합니다.</p>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4" class="col-form-label">분류</label>
												 <input type="text" name="categ" id="categ" value="${applyVO.categ}" class="form-control" disabled="disabled">
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4" class="col-form-label">영역</label>
												<input type="text" name="area" id="area" value="${applyVO.area}" class="form-control" disabled="disabled">
											</div>
										</div>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4" class="col-form-label">항목명</label>
												<div class="input-group">
													<input type="text" class="form-control" name="subName" id="subName" value="${applyVO.subName}" disabled="disabled">
												</div>
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4" class="col-form-label">취득 점수</label>
												<input type="text" name="acScore" id="acScore" class="form-control" value="${applyVO.acScore}" disabled="disabled">
											</div>
										</div>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputCity" class="col-form-label">자격증 일련번호</label>
												 <input type="text" class="form-control" name="serialNum" id="serialNum" value="${applyVO.serialNum}" disabled="disabled">
											</div>
                                                <div class="form-group col-md-6">
                                                    <label for="inputCity" class="col-form-label">취득일</label>
                                                    <fmt:formatDate value="${applyVO.acDate}" type="date" pattern="yyyy-MM-dd" var="acDate" />
                                                    <input type="text" name="acDate" id="acDate" class="form-control" value="${acDate}" disabled="disabled">
                                                </div>
										</div>
										
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputCity" class="col-form-label">신청 상태</label>
												 <input type="text" class="form-control" name="applyState" id="applyState" value="${applyVO.applyState}" disabled="disabled">
											</div>
                                                <div class="form-group col-md-6">
                                                    <label for="inputCity" class="col-form-label">신청일</label>
                                                    <fmt:formatDate value="${applyVO.applyDate}" type="date" pattern="yyyy-MM-dd" var="applyDate" />
                                                    <input type="text" name="applyDate" id="applyDate" class="form-control" value="${applyDate}" disabled="disabled">
                                                </div>
										</div>
										
										<div class="form-group">
											<label for="inputAddress2" class="col-form-label">상세내용</label> 
											<textarea class="form-control" name="content" id="content" rows="5" disabled="disabled">${applyVO.content}</textarea>
										</div>
										
										<div class="form-group">
											<label for="inputAddress2" class="col-form-label">사유</label> 
											<textarea class="form-control" name="reason" id="reason" rows="5" disabled="disabled">${applyVO.reason}</textarea>
										</div>
										
										<c:if test="${!empty fileVO}">
										<div class="form-group">
						                  <label for="exampleInputEmail1" class="col-sm-2 control-label">첨부파일<span class="must-mark">*</span></label>
						                </div>
									
									<ul class="dropzone-previews">
									
									
									<c:forEach items="${fileVO}" var="fileVO" varStatus="status">
									<li class="dropzone-previews mt-3">
										<div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
											<div class="p-2">
											
												<div class="row align-items-center">
															<c:choose>
																<c:when test="checkImageType(${fileVO.fileLocation})">
       															<div class="col-auto">
       															<img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="${fileVO.fileName}">
    															</div>
    															</c:when>

																<c:otherwise>
																<div class="col-auto">
																	<img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="/resources/dist/assets/images/file.svg">
																</div>
															    </c:otherwise>

															</c:choose>

													<div class="col pl-0">
														<a href="/displayFile?fileName=${fileVO.fileLocation}" text-muted font-weight-bold data-dz-name="">${fileVO.fileName}</a>
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
										<button type="button" class="btn btn-primary">목록</button>
										</div>
										

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

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);


		$(".btn-primary").on("click", function() {
			formObj.submit();
		});

	});
	
	function checkImageType(fileName) {
		
		var pattern = /jpg|gif|png|jpeg/i;

		return fileName.match(pattern);

	}
</script>
</html>