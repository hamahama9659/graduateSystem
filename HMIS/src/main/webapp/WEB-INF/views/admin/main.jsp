<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
      
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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">HMIS</a></li>
                                            <li class="breadcrumb-item active">Dashboard</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">Dashboard</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-12">
                                <div class="card widget-inline">
                                    <div class="card-body p-0">
                                        <div class="row no-gutters">
                                            <div class="col-sm-12 col-xl-4">
                                                <div class="card shadow-none m-0">
                                                    <div class="card-body text-center">
                                                        <i class="dripicons-briefcase text-muted" style="font-size: 24px;"></i>
                                                        <h3><span><a href="/admin/apply/waitList">${applyCount} 건</a></span></h3>
                                                        <p class="text-muted font-15 mb-0">신청 승인대기</p>
                                                    </div>
                                                </div>
                                            </div>
                
                                            <div class="col-sm-12 col-xl-4">
                                                <div class="card shadow-none m-0 border-left">
                                                    <div class="card-body text-center">
                                                        <i class="dripicons-user-group text-muted" style="font-size: 24px;"></i>
                                                        <h3><span><a href="/admin/user/graduateList">${graduateCount} 명</a></span></h3>
                                                        <p class="text-muted font-15 mb-0">졸업예정자 수</p>
                                                    </div>
                                                </div>
                                            </div>
                
                                            <div class="col-sm-12 col-xl-4">
                                                <div class="card shadow-none m-0 border-left">
                                                    <div class="card-body text-center">
                                                       <i class="mdi mdi-school" style="font-size: 24px;"></i>
                                                        <h3><span><a href="/admin/graduation/graduateToBeList">${graduateToBeCount} 명</a></span></h3>
                                                        <p class="text-muted font-15 mb-0">졸업대상자 수</p>
                                                    </div>
                                                </div>
                                            </div>
                
                
                                        </div> <!-- end row -->
                                        
                                    </div>
                                </div> 
                                <!-- end card-box-->
                            </div> <!-- end col-->
                        </div>
                         <!-- end row -->
                         
                         
                           <div class="row">
                            <div class="col-12">
                               <div class="card widget-inline">
                               </div>
                            </div>
                           </div>
                         
                         
                         <div class="row">
                            <div class="col-12">
                                <div class="card widget-inline">
                                    <div class="card-body p-0">
                                        <div class="row no-gutters">
                                           <c:if test="${!empty misList}">
                                           <c:forEach items="${misList}" var="mVo">
                                            <div class="col-sm-12 col-xl-4">
                                                <div class="card shadow-none m-0 border-left">
                                                    <div class="card-body text-center">
                                                        <i class="mdi mdi-calendar-text-outline" style="font-size: 24px;"></i>
                                                        <h5><a href="/admin/mis/list">제 ${mVo.times}회 MIS-DAY</a></h5>
                                                           ${mVo.title}
                                                        <h5><span>${mVo.cnt} 명</span></h5>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            </c:if>
                                            
                                            <c:if test="${empty misList}">
                                            </c:if>
                
                                        </div> <!-- end row -->
                                        
                                    </div>
                                </div> 
                                <!-- end card-box-->
                            </div> <!-- end col-->
                        </div>
                         <!-- end row -->
                         
                         <div class="row">
                            <div class="col-12">
                               <div class="card widget-inline">
                               </div>
                            </div>
                           </div>
                           
                           <div class="row">
                            <div class="col-12">
                                <div class="card widget-inline">
                                    <div class="card-body p-0">
                                        <div class="row no-gutters">
                                           <c:if test="${!empty certList}">
                                           <c:forEach items="${certList}" var="cVo">
                                            <div class="col-sm-12 col-xl-4">
                                                <div class="card shadow-none m-0 border-left">
                                                    <div class="card-body text-center">
                                                        <i class="mdi mdi-certificate" style="font-size: 24px;"></i>
                                                        <h5><a href="/admin/statistics/list">${cVo.subName}</a></h5>
                                                        취득인원
                                                        <h5><span>${cVo.cnt} 명</span></h5>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            </c:if>
                                            
                                            <c:if test="${empty certList}">
                                            </c:if>
                
                                        </div> <!-- end row -->
                                        
                                    </div>
                                </div> 
                                <!-- end card-box-->
                            </div> <!-- end col-->
                        </div>
                        
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

</script>       

  </body>
</html>