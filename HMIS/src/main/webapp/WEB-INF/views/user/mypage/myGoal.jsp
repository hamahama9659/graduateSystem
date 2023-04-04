<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   	
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>HMIS :: 대시보드</title>
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

    </head>

<style>
td, th{
text-align: center;
}

</style>

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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">My Page</a></li>
                                            <li class="breadcrumb-item active">내 목표</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">내 목표</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row mb-2">
                            <div class="col-sm-4">	
                                <button type="button" id="register" class="btn btn-danger btn-rounded mb-3"><i class="mdi mdi-plus"></i> 목표 설정</button>
                            </div>
                            <div class="col-sm-8">
                                <div class="text-sm-right">
                                    <div class="btn-group mb-3">
                                        <button type="button" class="btn btn-primary">전체</button>
                                    </div>
                                    <div class="btn-group mb-3 ml-1">
                                        <button type="button" class="btn btn-light">진행</button>
                                        <button type="button" class="btn btn-light">종료</button>
                                    </div>
                                    <!-- <div class="btn-group mb-3 ml-2 d-none d-sm-inline-block">
                                        <button type="button" class="btn btn-secondary"><i class="dripicons-view-apps"></i></button>
                                    </div>
                                    <div class="btn-group mb-3 d-none d-sm-inline-block">
                                        <button type="button" class="btn btn-link text-muted"><i class="dripicons-checklist"></i></button>
                                    </div> -->
                                </div>
                            </div><!-- end col-->
                        </div> 
                        <!-- end row-->

                        <div class="row">
                        	<c:forEach items="${goalList}" var="gVo">
                            <div class="col-md-6 col-xl-3">
                                <!-- project card -->
                                <div class="card d-block">
                                    <div class="card-body">
                                        <div class="dropdown card-widgets">
                                            <a href="#" class="dropdown-toggle arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                <i class="dripicons-dots-3"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>Edit</a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-delete mr-1"></i>Delete</a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-email-outline mr-1"></i>Invite</a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-exit-to-app mr-1"></i>Leave</a>
                                            </div>
                                        </div>
                                        <!-- project title-->
                                        <h4 class="mt-0">
                                            <a href="myGoalRead?goalNo=${gVo.goalNo}" class="text-title">${gVo.goalName}</a>
                                        </h4>
                                        <c:if test="${gVo.goalState eq '진행' }">
                                        <div class="badge badge-warning mb-3">${gVo.goalState}</div>
										</c:if>
                                        <c:if test="${gVo.goalState eq '종료' }">
                                        <div class="badge badge-success mb-3">${gVo.goalState}</div>
										</c:if>
										&nbsp;<b class="text-danger">D-${gVo.dDay}</b>		
										
                                        <p class="text-muted font-13 mb-3">${gVo.resolution}</p>

                                        <!-- project detail-->
                                        <p class="mb-1">
                                           <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                                <i class="mdi mdi-format-list-bulleted-type text-muted"></i>
                                                	시작일 <b><fmt:formatDate value="${gVo.startDate}" type="date" pattern="yyyy-MM-dd"/></b>	
                                            </span>
                                            <%-- <br>
                                            <span class="text-nowrap mb-2 d-inline-block">
                                                <i class="mdi mdi-comment-multiple-outline text-muted"></i>
                                                <b>D-${gVo.dDay}</b>		
                                            </span> --%>
                                        </p>	
                                    </div> <!-- end card-body-->
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item p-3">
                                            <!-- project progress-->
                                            <c:if test="${gVo.progress < 0 }">
                                            <p class="mb-2 font-weight-bold">진행률 <span class="float-right">0%</span></p>
                                            <div class="progress progress-sm">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                </div>
                                                <!-- /.progress-bar -->
                                            </div>
                                            </c:if>
                                            
                                            <c:if test="${gVo.progress > 0 }">
                                            <p class="mb-2 font-weight-bold">진행률 <span class="float-right">${gVo.progress}%</span></p>
                                            <div class="progress progress-sm">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="${gVo.progress}" aria-valuemin="0" aria-valuemax="100" style="width: ${gVo.progress}%;">
                                                </div>
                                                <!-- /.progress-bar -->
                                            </div>
                                            </c:if>
                                            
                                            <!-- /.progress -->
                                        </li>
                                    </ul>
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                            </c:forEach>
                            
                        </div>
                        <!-- end row-->
                    </div> <!-- container -->

                </div> <!-- content -->

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
$(document).ready(
		function() {
			$('#register').on("click",function(event) {
						self.location = "/user/mypage/myGoalRegister";
					});

		});
		
var msg = "${msg}";

if(msg != ""){
	alert(msg);
}
</script>
</html>