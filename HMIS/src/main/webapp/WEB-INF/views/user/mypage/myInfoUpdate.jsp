<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 내정보</title>
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

<!-- password css -->
<style type="text/css">
div.main i{
    position: absolute;
    left: 75%;
    top: 27px;
    color: purple;
  	font-size:20px;
}

div.mainPw input, i {
	display: inline;
}
</style>

<!-- javaScript validate() -->
<script type="text/javascript">
function validate() {

	var userPw = $("#userPw").val();
	var userPwCnf = $("#userPwCnf").val();
	var userName = $("#userName").val();
	
	// 패스워드가 적합한지 검사할 정규식
	var re = /^[a-zA-Z0-9]{4,20}$/;
	
	//이름 유효성 검사
    if(userName == ""){
        alert("이름을 입력해주세요");
        $("#userName").focus();
        
        return false;
    }
	
	//비밀번호 길이 유효성 검사
	if(userPw.length < 4 || userPw.legnth > 20) {
		
		alert("비밀번호를 6자리 ~ 20자리 이내로 입력해주세요.");
		$("#userPw").value = "";
		$("#userPwCnf").value = "";
		$("#userPw").focus();
		
		return false;
	}
	

	if(!/^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$/.test(userPw)){
		
		alert("6자리 ~ 20자리 이내로 영문 대소문자와 숫자를 포함해주세요.");
		$("#userPw").value = "";
		$("#userPwCnf").value = "";
		
		return false;
	}
	
	//비밀번호 변경과 확인 유효성 검사
	if(userPw != userPwCnf) {
		
		alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해주세요.");
		$("#userPwCnf").value = "";
		$("#userPwCnf").focus();
		
		return false;
	} 
	
	//수정 후, 로그아웃
	/* if(con){
	
	return true;
	
	} else{
		
		return false;
	} */
	
	con();
}

function con(){
	
	var con = confirm("수정할 경우 로그아웃이 됩니다.");
	
	//수정 후, 로그아웃
	if(con){
	
	return true;
	
	} else{
		
		return false;
	}
}

/* function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    return false;
} */
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

                    <!-- start page title -->
					<div class="row" style=" justify-content: center;">
						<div class="col-7">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">MyPage</a></li>
										<!-- <li class="breadcrumb-item"><a
											href="javascript: void(0);"></a></li> -->
										<li class="breadcrumb-item active">내정보</li>
									</ol>
								</div>
								<h4 class="page-title">내정보</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row" style=" justify-content: center;">
						<div class="col-lg-7">
							<div class="card">
								<div class="card-body">
									<form action="myInfoUpdate" method="post" onsubmit="return validate();">
										<div class="form-group mb-3">
											<label for="userNo">학번</label>
											<input type="text" class="form-control" name="userNo" id="userNo"
											value="${userVO.userNo}" readonly="readonly"/>
										</div>
										
										<div class="box">
											<div class="form-group mb-3">
												<label for="grade">학년</label>
												<select class="form-control select2" name="grade" id="grade">
													<option value="4"
														<c:out value="${userVO.grade eq '4'?'selected':'' }"/>>4</option>
	                                                <option value="3"
														<c:out value="${userVO.grade eq '3'?'selected':'' }"/>>3</option>
													<option value="2"
														<c:out value="${userVO.grade eq '2'?'selected':'' }"/>>2</option>
													<option value="1"
														<c:out value="${userVO.grade eq '1'?'selected':'' }"/>>1</option>
	                                            </select>
											</div>
											<div class="form-group mb-3">
												<label for="state">학적상태</label>
												<select class="form-control select2" name="state" id="state">
													<option value="재학"
														<c:out value="${userVO.state eq '재학'?'selected':'' }"/>>재학</option>
													<option value="휴학"
														<c:out value="${userVO.state eq '휴학'?'selected':'' }"/>>휴학</option>
													<option value="졸업"
														<c:out value="${userVO.state eq '졸업'?'selected':'' }"/>>졸업</option>
													<option value="수료"
														<c:out value="${userVO.state eq '수료'?'selected':'' }"/>>수료</option>
	                                            </select>
											</div>
										</div>
										
										<div class="form-group mb-3">
											<label for="userName">이름</label>
											<input type="text" class="form-control" id="userName" name="userName" value="${userVO.userName}" readonly="readonly"/>
										</div>
										
										<div>
										<div class="form-group mb-3 mainPw">
											<label for="userPw">비밀번호변경</label><span class="text-danger">*</span>
											<input type="password" class="form-control" id="userPw" name="userPw" style="width:95%;"
											value="${userVO.userPw}" placeholder="새 비밀번호를 입력하세요."/><i class="mdi mdi-eye-circle mdi-24px"></i>
											<h6> 6자리 ~ 20자리로 영문 대소문자와 숫자를 포함하여 만들어주세요.</h6>
										</div>
										
										<div class="form-group mb-3 mainPw">
											<label for="userPwCnf">비밀번호확인</label><span class="text-danger">*</span>
											<input type="password" class="form-control" id="userPwCnf" name="userPwCnf"  style="width:95%;"
											placeholder="새 비밀번호 확인을 위해 다시 입력해주세요."/><i class="mdi mdi-eye-circle mdi-24px"></i>
										</div>
										</div>

										
										<div style="text-align: right;">
											<button class="btn btn-primary" type="submit">수정</button>
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
        <script src="/resources/dist/assets/js/app.js"></script>

        <!-- third party js -->
        <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
        <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
        <!-- third party js ends -->

        <!-- demo app -->
        <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
        <!-- end demo js-->

</body>

<script>
var result = '${user}';

if (result == 'SUCCESS') {
	alert("정보가 수정되었습니다.");
}
</script>

<!-- 비밀번호 보이기/숨기기 기능 -->
<script type="text/javascript">
$(document).ready(function(){
    $('.mainPw i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"mdi mdi-eye-circle-outline mdi-24px")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"mdi mdi-eye-circle mdi-24px")
            .prev('input').attr('type','password');
        }
    });
});

</script>
</html>