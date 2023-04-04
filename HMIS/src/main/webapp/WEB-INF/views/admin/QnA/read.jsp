<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	//치환 변수 선언합니다.
	pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
	pageContext.setAttribute("br", "<br/>"); //br 태그
%>




<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8" />
<title>HMIS :: 문의글 상세페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->

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

					<!-- start page title -->
					<div class="row" style="justify-content: center;">
						<div class="col-lg-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
										<li class="breadcrumb-item"><a href="/admin/QnA/list">QnA</a></li>
										<li class="breadcrumb-item active">QnA 상세보기</li>
									</ol>
								</div>
								<h4 class="page-title">QnA</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<form role="form" action="modify" method="post">
						<input type='hidden' name='qnaNo' value="${qnAVO.qnaNo}"
							id="qnaNo"> <input type='hidden' name='userNo'
							value="${qnAVO.userNo}" id="userNo"> <input type='hidden'
							name='page' value="${cri.page}"> <input type='hidden'
							name='perPageNum' value="${cri.perPageNum}"> <input
							type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">


						<div class="row" style="justify-content: center;">
							<div class="col-lg-12">
								<!-- project card -->
								<div class="card d-block">
									<div class="card-body">

										<!-- project title-->
										<h3 class="mt-0">${qnAVO.qnaTitle}</h3>
										<div class="badge badge-secondary mb-3">
											<i class="mdi mdi-face"></i>&nbsp; ${qnAVO.userName}
										</div>
										<div class="badge badge-secondary mb-3">
											<i class="mdi mdi-eye-plus"></i> &nbsp;
											<fmt:formatDate value="${qnAVO.regDate}" pattern="MM/dd/yyyy" />
										</div>
										<div class="badge badge-secondary mb-3">
											<i class="mdi mdi-eye-plus"></i> &nbsp; ${qnAVO.hits}
										</div>

										<p style="font-size: 1em;">${fn:replace(qnAVO.qnaContents, crcn, br)}
										</p>
										<div class="row">
											<div class="col-12">
												<div class="card widget-inline"></div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6">
												<a href="/admin/QnA/list"
													class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
													<i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
												</a>
											</div>
											<div class="col-lg-6">
												<div class="text-sm-right">
										
														<button class="btn btn-danger qnaDelete">삭제</button>
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- end card-body-->


					<!-- 댓글창 -->
					<div class="card">
						<div class="card-body">
							<h4 class="mt-0 mb-3">Comments</h4>
							<form role="form" method="get">
								<input type="hidden" value="${login.userNo}" id="newUserNo">
								<textarea class="form-control form-control-light mb-2"
									placeholder="Write message" id="newReplyText" rows="3"></textarea>
								<div class="text-right">
									<div class="btn-group mb-2">
										<button type="button"
											class="btn btn-link btn-sm text-muted font-18">
										
										</button>
									</div>
									<div class="btn-group mb-2 ml-2">
										<!--   <button type="submit" class="btn btn-primary" id="addBtn">Submit</button> -->
									<a class="btn btn-outline-primary btn-rounded comentAddBtn" style="font-weight:bold; ">댓글 등록</a>

									</div>
								</div>
								<div class="col-lg-12">
									<!--  <img class="mr-3 avatar-sm rounded-circle" src="assets/images/users/avatar-3.jpg" alt="Generic placeholder image"> -->
									<div class="inbox-widget">
										<h5 class="mt-0">댓글 목록</h5>

										<div class="card">
											<ul class="list-group list-group-flush" id="reply">
											</ul>

											<!-- <div style="folt"style="tex"></div><i class=" mdi mdi-delete-circle-outline" ></i> -->
										</div>
										<div style="text-align: right;">

											

										</div>
									</div>

								</div>

								<!-- end card-body-->
							</form>
						</div>
						<!-- end card-->
					</div>
					<!-- end col -->

				</div>
			</div>
		</div>


	</div>
	<!-- end row -->

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
	<script src="/resources/dist/assets/js/app_admin.js"></script>

	<!-- third party js -->
	<script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
	<script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
	<!-- third party js ends -->

	<!-- demo app -->
	<script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
	<!-- end demo js-->

</body>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		/* 삭제버튼 */
		$(".qnaDelete").on("click", function() {
			formObj.attr("action", "/admin/QnA/remove");
			
			formObj.submit();
		});

		/* 수정버튼 */
		$(".qnaModify").on("click", function() {
			formObj.attr("action", "/admin/QnA/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});

	});
</script>



<script>
	var qnaNo = $("#qnaNo").val(); // QnA 게시글 번호
	var loginNo = $("#newUserNo").val();
	var userName = $("#userNo").val(); //게시글 쓴 사람 정보 가져오기, QnA 게시글 작성자 번호

	$
			.getJSON(
					"/reply/all/" + qnaNo,
					function(data) {
						var str = "";
						$(data)
								.each(
										function() {

											var strbutton = "";
											str += "<li data-replyNo='" + this.replyNo + "'class='list-group-item'>"
													+ "<div class='inbox-widget'>"
													+ "<div class='inbox-item'>"
													+ "<div class='inbox-item-img'>"
													+ "<img src='/resources/dist/assets/images/users/avatar-7.jpg' class='rounded-circle' alt=''>"
													+ "</div>"
													+ "<div class='inbox-item-author'>"
													+ this.userName
													+ "<div class='inbox-item-text'>"
													+ this.replyText
													+ "<div class='inbox-item-date'>"

											if (loginNo == '1234')//댓글 정보와 로그인 정보 같을 경우 OR 게시글의 주인 인 경우 댓글 삭제 가능
											{
												strbutton += "<div class='pull-right hidden-phone'>"
														+ "  <a href='#' onclick='deleteReply("
														+ this.replyNo
														+ ")' class='btn btn-sm btn-link text-info font-13'>삭제</a>"
														+ "</div>";
											}

											str += strbutton;
											str += "</div></li>";

										});

						$("#reply").html(str);

					});

	//댓글 저장 버튼 클릭 이벤트 submit
	$(".comentAddBtn").on("click", function() {

		// 입력 form 선택자
		var loginNo = $("#newUserNo");
		var replyTextObj = $("#newReplyText");

		var userNo = loginNo.val();
		var replyText = replyTextObj.val();

		if (userNo == "") { //로그인 정보 없을 경우

			alert("로그인 후 댓글 기능을 사용할 수 있습니다.");
			replyTextObj.val("");
			return;

		}

		// 댓글 입력처리 수행
		$.ajax({
			type : "post",
			url : "/reply/",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				qnaNo : qnaNo,
				userNo : userNo,
				replyText : replyText
			}),
			success : function(result) {
				if (result === "SUCCESS") {
					alert("댓글이 등록되었습니다.");
					$("#newReplyText").val(""); //댓글 입력창 공백처리
					getReplies(); //댓글 목록 호출
				}
			}
		});
	});

	function deleteReply(replyNo) {

		$.ajax({
			type : 'delete',
			url : '/reply/' + replyNo,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getReplies();
				}
			}
		});

	}

	function getReplies() {

		$
				.getJSON(
						"/reply/all/" + qnaNo,
						function(data) {
							var str = "";

							$(data)
									.each(
											function() {

												var strbutton = "";
												str += "<li data-replyNo='" + this.replyNo + "'class='list-group-item'>"
														+ "<div class='inbox-widget'>"
														+ "<div class='inbox-item'>"
														+ "<div class='inbox-item-img'>"
														+ "<img src='/resources/dist/assets/images/users/avatar-7.jpg' class='rounded-circle' alt=''>"
														+ "</div>"
														+ "<div class='inbox-item-author'>"
														+ this.userName
														+ "<div class='inbox-item-text'>"
														+ this.replyText
														+ "<div class='inbox-item-date'>"

												if (loginNo == '1234')//댓글 정보와 로그인 정보 같을 경우 OR 게시글의 주인 인 경우 댓글 삭제 가능
												{
													strbutton += "<div class='pull-right hidden-phone'>"
															+ "  <a href='#' onclick='deleteReply("
															+ this.replyNo
															+ ")' class='btn btn-sm btn-link text-info font-13'>삭제</a>"
															+ "</div>";
												}

												str += strbutton;
												str += "</div></li>";
											});

							$("#reply").html(str);

						});

	}
</script>



</html>