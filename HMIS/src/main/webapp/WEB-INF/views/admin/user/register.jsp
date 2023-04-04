<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon" href="/resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<style>body.loading {visibility: hidden;}</style>

<!-- third party css -->
<link href="/resources/dist/assets/css/vendor/fullcalendar.min.css" rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/assets/css/app.min.css" rel="stylesheet" type="text/css" id="main-style-container" />

<script type="text/javascript">
function validate(){
	
	var userNo = $("#userNo").val();
	var grade = $("#grade").val();
	var state = $("#state").val();
	var userName = $("#userName").val();
	
	//학번 유효성 검사
	if(userNo == "") {
		alert("학번을 입력해주세요.");
		$("#userNo").focus();
		
		return false;
	}
	
	//학년 셀렉박스 유효성 검사
	if(frm.grade.value == ""

	){
		alert("학년을 선택해주세요.");
		$("#grade").focus();
		
		return false;
	}
	
	//학적상태 셀렉박스 유효성 검사
	if(frm.state.value == ""
	){
		alert("학적상태를 선택해주세요.");
		$("#state").focus();
		
		return false;
	}
	
	//이름 유효성 검사
	if(userName == "") {
		alert("이름을 입력해주세요.");
		$("#userName").focus();
		
		return false;
	}
	
	return true;
}

//학번 - 숫자만 입력 (이한)
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
//학번 - 문자열 제거 (이한)
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

// 학번 - 중복검사 AJAX. (이한)
function checkUserNo() {
	var userNo = $("#userNo").val();
	
	if(userNo == ""){
		alert("학번을 입력해주세요.");
		$("#userNo").focus();
		return false;
	}
	else{
		$.ajax({
			url: "checkUserNo?userNo="+userNo,
			type: "GET",
			success: function(data){
				console.log(data);
				if(data == false){
					$("#invalid-feedback").css("display","inline");
					$("#valid-feedback").css("display", "none");
					$("#registerBtn").prop("disabled", "disabled");
				}
				if(data == true){
					$("#invalid-feedback").css("display","none");
					$("#valid-feedback").css("display", "inline");
					$("#registerBtn").prop("disabled", "");
				}
			},
			error: function(){
				console.log("error");
			}
		});		
	}	

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

            <div class="content-page" style="align:center;">
                <div class="content">

                    <div id="vertical-topbar-placeholder"></div>

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                    <!-- start page title -->
					<div class="row" style=" justify-content: center;">
						<div class="col-lg-7">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item">학생관리</li>
										<li class="breadcrumb-item"><a
											href="/admin/user/list">학생목록</a></li>
										<li class="breadcrumb-item active">학생등록</li>
									</ol>
								</div>
								<h4 class="page-title">학생등록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row" style=" justify-content: center;">
						<div class="col-lg-7">
							<div class="card">
								<div class="card-body">
									<h4 class="header-title mb-3">학생정보입력란</h4>

									<form name="frm" method="post" onsubmit="return validate();">
										<!-- <div class="form-group mb-3">
											<div class="col-lg-4">
											<label for="userNo">학번</label>
											<input type="text" class="form-control" name="userNo" id="userNo" placeholder="학번을 입력해주세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
											</div>
											<div class="col-lg-3">
											<input type="button" value="중복확인">
											</div>
											<div class="invalid-feedback" id="checkUserNo" style="display: none;">*중복된 학번입니다.</div>
										</div>	 -->
										
										<div class="form-group mb-3">
		                                      <label>학번</label>
		                                      <div class="input-group">
		                                          <input type="text" class="form-control" name="userNo" id="userNo" placeholder="학번을 입력해주세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
		                                          <div class="input-group-append">
		                                              <button class="btn btn-info" id="checkBtn" type="button" onclick="checkUserNo()">중복확인</button>
		                                          </div>
		                                      </div>
		                                      <div class="invalid-feedback" id="invalid-feedback" style="display: none;">*이미 존재하는 학번입니다.</div>
		                                      <div class="valid-feedback" id="valid-feedback" style="display: none;">*사용 가능한 학번입니다.</div>
                                        </div>
										
										<div class="box">
											<div class="form-group mb-3">
												<label for="grade">학년</label>
												<select class="form-control select2" name="grade" id="grade">
	                                                    <option value="">선택</option>
	                                                    <option value="4">4</option>
	                                                    <option value="3">3</option>
	                                                    <option value="2">2</option>
	                                                    <option value="1">1</option>
	                                            </select>
											</div>
											<div class="form-group mb-3">
												<label for="state">학적상태</label>
												<select class="form-control select2" name="state" id="state">
	                                                    <option value="">선택</option>
	                                                    <option value="재학">재학</option>
	                                                    <option value="휴학">휴학</option>
	                                                    <option value="졸업">졸업</option>
	                                                    <option value="수료">수료</option>
	                                            </select>
											</div>
										</div>
										
										<div class="form-group mb-3">
											<label for="userName">이름</label> <input
												type="text" class="form-control" name="userName" id="userName"
												placeholder="이름을 입력해주세요."/>
										</div>

										<input type="hidden" class="form-control" name="userPw" value="1234">
										<input type="hidden" class="form-control" name="authority" value="0">
										
										<div class="text-sm-right">
											<button class="btn btn-primary" id="registerBtn" disabled="disabled" type="submit">등록</button>
										</div>
									</form>

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

                <!-- Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                2018 - 2019 © Hyper - Coderthemes.com
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-right footer-links d-none d-md-block">
                                    <a href="javascript: void(0);">About</a>
                                    <a href="javascript: void(0);">Support</a>
                                    <a href="javascript: void(0);">Contact Us</a>
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

</body>
</html>