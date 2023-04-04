<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 졸업심사 글 목록</title>
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

tr, td {
	text-align: center;
	font-family: "맑은고딕";
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

<!-- javaScript -->
<script type="text/javascript">
	function graduationRegister() {
		formObj.submit();
		formObject.method = 'post';
	}
</script>


<script type="text/javascript">
	function postRemove() {

		var formObject = document.contents;

		formObject.method = 'post';
	}
</script>
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


				<div id="vertical-topbar-placeholder"></div>

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a href="/user/main">HMIS</a></li>
										<li class="breadcrumb-item active">졸업심사 글 목록</li>
									</ol>
								</div>
								<h4 class="page-title">졸업심사 글 목록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<form role="form" action="register" method="post">
						<input type="hidden" name="userNo" id="userNo"
							value="${login.userNo}"> <input type="hidden"
							name="graduNo" id="graduNo" value="${graduNo}"> <input
							type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">


						<div class="row">
							<div class="col-12">
								<div class="card widget-inline">
									<div class="card-body p-0">
										<div class="row no-gutters">
											<div class="col-sm-12 col-xl-3">
												<div class="card shadow-none m-0">
													<div class="card-body text-center">
														<i class="dripicons-user-group text-muted"
															style="font-size: 24px;"></i>

														<p class="text-muted font-15 mb-0">학번</p>
														<h3>${totalDTO.userNo}</h3>
													</div>
												</div>
											</div>

											<div class="col-sm-12 col-xl-3">
												<div class="card shadow-none m-0 border-left">
													<div class="card-body text-center">
														<i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>

														<p class="text-muted font-15 mb-0">이름</p>
														<h3>${totalDTO.userName}</h3>
													</div>
												</div>
											</div>

											<div class="col-sm-12 col-xl-3">
												<div class="card shadow-none m-0 border-left">
													<div class="card-body text-center">
														<i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>
														<h3>
															<span><a href="/user/mypage/myScore"></a></span>
														</h3>
														<p class="text-muted font-15 mb-0">학년</p>

														<h3>${totalDTO.grade}학년</h3>
													</div>
												</div>
											</div>
											<div class="col-sm-12 col-xl-3">
												<div class="card shadow-none m-0 border-left">
													<div class="card-body text-center">
														<i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>
														<h3>
															<span><a href="/user/mypage/myScore"></a></span>
														</h3>
														<p class="text-muted font-15 mb-0">학적상태</p>

														<h3>${totalDTO.state}</h3>
													</div>
												</div>
											</div>
										</div>
										<!-- end row -->
									</div>
								</div>
								<!-- end card-box-->
							</div>
							<!-- end col-->
						</div>


						<div class="row">
							<div class="col-12">
								<div class="card widget-inline">
									<div class="card-body p-0">
										<div class="row no-gutters">
											<div class="col-sm-12 col-xl-4">
												<div class="card shadow-none m-0">
													<div class="card-body text-center">
														<i class="dripicons-user-group text-muted"
															style="font-size: 24px;"></i>

														<p class="text-muted font-15 mb-0">MIS 점수</p>
														<h3>${totalDTO.misTotal}</h3>
													</div>
												</div>
											</div>

											<div class="col-sm-12 col-xl-4">
												<div class="card shadow-none m-0 border-left">
													<div class="card-body text-center">
														<i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>

														<p class="text-muted font-15 mb-0">총 졸업 점수</p>
														<h3>${totalDTO.total}</h3>
													</div>
												</div>
											</div>

											<div class="col-sm-12 col-xl-4">
												<div class="card shadow-none m-0 border-left">
													<div class="card-body text-center">
														<i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>

														<p class="text-muted font-15 mb-0">취득 점수</p>
														<h3>${totalDTO.subTotal}</h3>
													</div>
												</div>
											</div>


										</div>
										<!-- end row -->
									</div>
								</div>
								<!-- end card-box-->
							</div>
							</div>
							<!-- end col-->
							<div class="row"  style="justify-content: center;">
                     <div class="col-12 style="margin-top: 0em !important; margin-bottom: 1em;">
                     
                        <div class="text-sm-left">
                           <a href="/user/graduation/list"
                              class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
                              <i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
                           </a>
                        </div>
                        <!-- end col -->
                     
                           <div class="text-sm-right">
                              <button type="submit" class="btn btn-primary btn_submit"
                                 id="btn_submit">신청</button>
                                 

                           </div>
                        
                        <!-- end col -->
                     </div>
                     </div>
								<!-- end row -->
					</form>

				</div>
				<!-- container -->

			</div>
		</div>
	</div>
	<!-- content -->

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




	<script>
		$(document).ready(
				function() {

					$('#searchBtn').on(
							"click",
							function(event) {

								self.location = "/user/graduation/list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ $('#keywordInput').val();

							});

				});
	</script>

	<script>
		/*       var apply_btn = document.getElementById('button');
		 apply_btn.disabled = false;
		
		 var noapply_btn = document.getElementById('button');
		 noapply_btn.disabled = true; */

		$('#noapply_btn').attr('disabled', true); //SMS버튼 비활성화

		$('#apply_btn').attr('disabled', false); //활성화
	</script>

	<!-- 
   <script>
      // searchSub 팝업창 띄우기
      // searchSub 팝업창 띄우기
      $("#apply_btn")
            .click(
                  function() {
                     var url = "searchPopup";
                     var name = "신청 조회";
                     var option = "width = 500, height = 300, top = 100, left = 200, location = no";
                     window.open(url, name, option);
                  });
   </script>
 -->
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#btn_submit").on("click", function() {

				formObj.submit();
			});

			});
			

	</script>


<!-- 	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("제목: ${gvo.title}  \n등록되었습니다.");
		}

		if (result == 'MODIFY') {
			alert("졸업번호: ${gVo.graduNo} 제목: ${gVo.title} \n수정되었습니다.");

		}
	</script> -->
</body>
</html>