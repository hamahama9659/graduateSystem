<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>HMIS :: MIS 출결 등록</title>
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

<!-- App css -->
<link href="../../../../resources/dist/assets/css/icons.min.css"
	rel="stylesheet" type="text/css" />
<link href="../../../../resources/dist/assets/css/app.min.css"
	rel="stylesheet" type="text/css" id="main-style-container" />

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

				<form  role="form" class="form-horizontal" method="post">
				<input type="hidden" id="arrayUser" name="arrayUser" />
					<!-- Start Content-->
					<div class="container-fluid">

						<!-- start page title -->
						<div class="row">
							<div class="col-12">
								<div class="page-title-box">
									<div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="/admin/main">HMIS</a></li>
                                            <li class="breadcrumb-item"><a href="/admin/mis/list">MIS 출결 관리</a></li>
                                            <li class="breadcrumb-item active">MIS 출결 등록</li>
                                        </ol>
                                    </div>
									<h3 class="page-title">MIS 출결 등록</h3>
								</div>
							</div>
						</div>
						<!-- <input type="text" name="userNo"> -->

						<div class="row">
							<div class="col-xl-12">

								<div class="card">
									<div class="card-body">

										<div class="form-group col-xs-12">
											<label for="times"  class="col-form-label">회차<span
												class="must-mark">*</span></label>
											
												<input type="text" class="form-control" name="times" id="times"
													placeholder="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
											
										</div>

										<div class="form-group row mb-3">
											<label for="title" class="col-3 col-form-label">제목</label>
											<div class="col-3">
												<input type="text" class="form-control" name="title" id="title"
													placeholder="">
											</div>
										</div>

										<div class="form-group row mb-3">
											<label for="misDate" class="col-3 col-form-label">날짜
												선택</label>
											<div class="col-3">
												<input type="text" class="form-control date"
													name="misDate" data-toggle="date-picker"
													data-single-date-picker="true" id="misDate">
											</div>
										</div>

										<div class="form-group row mb-3">
											<label for="grade" class="col-3 col-form-label">학년</label>
											<div class="col-2">
											
												<select class="form-control" name="grade" id="grade">
													<option value="all">전체</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>
											
											</div>
										</div>


										<br>
										<div class="row">
											<div class="col-lg-12">
												<div class="row">
													<div class="col-lg-6">
														<h4 class="header-title">전체 학생 목록</h4>
														<div style="text-align: right;">
															<button type="button" class="btn btn-outline-primary" id="add">추가</button>
														</div>

														<br>
														<div class="table-responsive-sm">
															<table class="table table-centered w-100 dt-responsive nowrap" id="stuList">
																<thead class="thead-light">
																	<tr>
																		<th class="all" style="width: 20px;">
																			<!-- <div class="custom-control custom-checkbox">
																				<input type="checkbox" class="custom-control-input" id="customCheck1" name="allChcek"> 																					
																					<label class="custom-control-label" for="customCheck1">&nbsp;</label>
																			</div> -->
																			<input type="checkbox" id="allCheck1" name="allCheck1">
																		</th>
																		<th>학년</th>
																		<th>학번</th>
																		<th>이름</th>

																	</tr>
																</thead>

																<tbody>
																	<c:forEach items="${stuList}" var="uVo"
																		varStatus="listStat">
																		<tr class="stu${uVo.grade}">
																			<td>
																				<input type="checkbox" name="check" value="${uVo.userNo}" class="checkBox">
																			</td>
																			<td class="tdGrade">${uVo.grade}</td>
																			<td>${uVo.userNo}</td>
																			<td>${uVo.userName}</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>


													<div class="col-lg-6">
														<h4 class="header-title">출결 학생 목록</h4>

														<div style="text-align: right;">
															<button type="button" class="btn btn-outline-danger" id="delete">삭제</button>
														</div>

														<br>

														<div class="table-responsive-sm">
															<div class="table-responsive-sm">
																<table class="table table-centered w-100 dt-responsive nowrap" id="attList">
																
																	<thead class="thead-light">
																		<tr>
																			<th class="all" style="width: 20px;">
																				<!-- <div class="custom-control custom-checkbox">
																					<input type="checkbox" class="custom-control-input" id="customCheck1" name="check2"> 
																						<label class="custom-control-label" for="customCheck1">&nbsp;</label>
																				</div> -->
																				<input type="checkbox" id="allCheck2" name="allCheck2">
																			</th>
																			<th>학년</th>
																			<th>학번</th>
																			<th>이름</th>

																		</tr>
																	</thead>

																	<tbody>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- end table-responsive-->
										</div>
										<!-- end table-responsive-->
									</div>
									<!-- end card body-->
									<div class="card-footer">
										<div style="text-align: right;">
											<button type="button" class="btn btn-primary" id="btn_submit">등록</button>
											<button type="button" onclick="location.href='list'"
												class="btn btn-light">취소</button>
										</div>
									</div>
								</div>
								<!-- end card -->
							</div>
							<!-- end col-->


							<!-- end card-body -->
						</div>



						<!-- end card -->
					</div>
				</form>
				<!-- end col -->
			</div>
		</div>
	</div>

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


	<!-- App js -->
	<script src="../../../../resources/dist/assets/js/app_admin.js"></script>

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
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	
<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#btn_submit").on("click", function() {
			
			var send_array = Array();
			var send_cnt = 0;
			var chkbox = $(".checkBox2");
			
			var times = $("#times").val();
			var title = $("#title").val();
			var misDate = $("#misDate").val();
			
			if(times == "") {
				alert("회차를 입력해주세요.");
				document.getElementById("times").focus();
				return false;
			}
			if(title == ""){
				alert("제목을 입력해주세요.");
				document.getElementById("title").focus();
				return false;
			}
			if(misDate == ""){
				alert("날짜를 입력해주세요.");
				document.getElementById("misDate").focus();
				return false;
			}

			for(i=0;i<chkbox.length;i++) {
			        send_array[send_cnt] = chkbox[i].value;
			        send_cnt++;
			}
			
			if(send_cnt == 0){
				alert("학생을 추가해주세요.");
				return false;
			}

			$("#arrayUser").val(send_array);
			
			formObj.submit(); });
	});
</script>


	<script>
	
		$(document).ready(function() {
			
			$("#detached-check input:radio").click(function() {

				alert("clicked");

			});

			$("input:radio:first").prop("checked", true).trigger("click");

		});

		// 추가
		$("#add").click(function() {
				var checkbox = $("input[name=check]:checked");
				checkbox.each(function() {
					
					$(this).parent().parent();
					var tr = $(this).parent().parent();
					
					var td = tr.children();
					
					var userNo = $(this).val();
					
					
					var grade = td.eq(1).text();
					var id = td.eq(2).html();
					var userName = td.eq(3).text();
					var row = "<tr>"
							+ "<td>"
							+ "<input type=\"checkbox\" class=\"checkBox2\" name=\"check2\" value=\"" + userNo + "\"" + ">"
							+ "</td>" + "<td>" + grade
							+ "</td>" + "<td>" + id
							+ "</td>" + "<td>" + userName
							+ "</td>" + "</tr>";

					// 숨긴 값의 체크박스를 false 상태로 바꿈
					$(this).prop("checked", false);
					tr.remove();
					
					$("#attList > tbody").append(row);
					
					$("#allCheck1").prop("checked", false);
					
					
				})
				
		
		});
		
		//삭제
		$("#delete").click(function() {
			var checkbox = $("input[name=check2]:checked");
			checkbox.each(function() {
				
				$(this).parent().parent();
				var tr = $(this).parent().parent();
								var td = tr.children();
								var userNo = $(this).val();
								var grade = td.eq(1).text();
								var id = td.eq(2).html();
								var userName = td.eq(3).text();
								var row = "<tr class=\"stu"+ grade+"\"> "
										+ "<td>"
										+ "<input type=\"checkbox\" class=\"checkBox\" name=\"check\" value=\"" + userNo + "\"" + ">"
										+ "</td>" + "<td>" + grade
										+ "</td>" + "<td>" + id
										+ "</td>" + "<td>" + userName
										+ "</td>" + "</tr>";

								// 숨긴 값의 체크박스를 false 상태로 바꿈
								$(this).prop("checked", false);
								tr.remove();
								$("#stuList > tbody").append(row);
								
								$("#allCheck2").prop("checked", false);
								
							});
				});
		
	
	</script>
	<script src="../../../../resources/dist/assets/js/vendor/dataTables.checkboxes.min.js"></script>
</body>

<!-- 학년 체크 -->
<script>
// 학년 체크 -> 학년 별 올 체크 기능 구현 (이한)
$("#grade").change(function(){
	
	var search = $("#grade option:selected").val();
	
	var tr4 = $(".stu4");
	var tr3 = $(".stu3");
	var tr2 = $(".stu2");
	var tr1 = $(".stu1");
	
	if(search == '4'){
		tr4.show();
		
		// All Check 구현을 위한 name 변경 작업
		tr4.find("input").attr("name", "check");
		
		//기존  3,2,1은 hide
		tr3.hide();
		tr3.find("input").attr("name", "hideCheck");
		
		tr2.hide();
		tr2.find("input").attr("name", "hideCheck");
		
		tr1.hide();
		tr1.find("input").attr("name", "hideCheck");
	}else if(search == '3'){
		tr3.show();
		tr3.find("input").attr("name", "check");
		
		tr4.hide();
		tr4.find("input").attr("name", "hideCheck");
		
		tr2.hide();
		tr2.find("input").attr("name", "hideCheck");
		
		tr1.hide();
		tr1.find("input").attr("name", "hideCheck");
	}else if(search == '2'){
		tr2.show();
		tr2.find("input").attr("name", "check");
		
		tr4.hide();
		tr4.find("input").attr("name", "hideCheck");
		
		tr3.hide();
		tr3.find("input").attr("name", "hideCheck");
		
		tr1.hide();
		tr1.find("input").attr("name", "hideCheck");
	}else if(search == '1'){
		tr1.show();
		tr1.find("input").attr("name", "check");
		
		tr4.hide();
		tr4.find("input").attr("name", "hideCheck");
		
		tr3.hide();
		tr3.find("input").attr("name", "hideCheck");
		
		tr2.hide();
		tr2.find("input").attr("name", "hideCheck");
	}else if(search == 'all'){
		
		tr4.show();
		tr4.find("input").attr("name", "check");
		
		tr3.show();
		tr3.find("input").attr("name", "check");
		
		tr2.show();
		tr2.find("input").attr("name", "check");
		
		tr1.show();
		tr1.find("input").attr("name", "check");
	}
	
});

// allCheck1 Function
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#allCheck1").click(function(){
        //클릭되었으면
        if($("#allCheck1").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    });
});

//allCheck2 Function
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#allCheck2").click(function(){
        //클릭되었으면
        if($("#allCheck2").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check2]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check2]").prop("checked",false);
        }
    });
});


// 회차 - 숫자만 입력 (이한)
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
// 회차 - 문자열 제거 (이한)
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}



  </script>
</html>