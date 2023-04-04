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
                                           
                                            <li class="breadcrumb-item active">전체</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">전체</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                  
                        <div class="row">
                            <div class="col-12">
                                <div class="card widget-inline">
                                    <div class="card-body p-0">
                                        <div class="row no-gutters">
                                            <div class="col-sm-12 col-xl-3">
                                                <div class="card shadow-none m-0">
                                                    <div class="card-body text-center">
                                                        <i class="dripicons-user-group text-muted" style="font-size: 24px;"></i>
                                                       <h3><span><a href="/user/mypage/myInfo">${totalDTO.userName}</a></span></h3>
                                                        <p class="text-muted font-15 mb-0">학생정보</p>
                                                    </div>
                                                </div>
                                            </div>
                
                                            <div class="col-sm-12 col-xl-3">
                                                <div class="card shadow-none m-0 border-left">
                                                    <div class="card-body text-center">
                                                        <i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>
                                                        <h3><span><a href="/user/mypage/myScore">${totalDTO.subTotal}</a></span></h3>
                                                        <p class="text-muted font-15 mb-0">인증항목 총점</p>
                                                    </div>
                                                </div>
                                            </div>
                                            
                
                                            <div class="col-sm-12 col-xl-3">
                                                <div class="card shadow-none m-0 border-left">
                                                    <div class="card-body text-center">
                                                       <i class="mdi mdi-calendar-text-outline" style="font-size: 24px;"></i>
                                                        <h3><span><a href="/user/mypage/myScore">${totalDTO.misTotal} / 200</a></span></h3>
                                                        <p class="text-muted font-15 mb-0">MIS 총점</p>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-sm-12 col-xl-3">
                                                <div class="card shadow-none m-0 border-left">
                                                    <div class="card-body text-center">
                                                       <i class="mdi mdi-school" style="font-size: 24px;"></i>
                                                        <h3><span><a href="/user/mypage/myScore">${totalDTO.total} / 1200</a></span></h3>
                                                        <p class="text-muted font-15 mb-0">총점</p>
                                                    </div>
                                                </div>
                                            </div>
                
                
                                        </div> <!-- end row -->
                                        
                                    </div>
                                </div> 
                                <!-- end card-box-->
                            </div> <!-- end col-->
                        </div> <!-- end row -->
                        
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
                                                        <h5><a href="#">${cVo.subName}</a></h5>
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
                        
                        
                           
                        
                        
                        <div class="row">
                            <div class="col-12">
                               <div class="card widget-inline">
                               </div>
                            </div>
                           </div>   
                        
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title mb-3">졸업인증신청 내역</h4>
                                        <div class="table-responsive">
                                            <table class="table table-centered mb-0">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>NO</th>
                                                        <th>항목명</th>
                                                        <th>신청일</th>
                                                        <th>신청상태</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                   <c:if test="${!empty mainApplyWaitList}">
                                                    <c:forEach items="${mainApplyWaitList}" var="aVo" varStatus="listStat">
                                                       <tr>
                                                          <td>${listStat.count}</td>
                                                          <td><a href='/user/apply/read?applyNo=${aVo.applyNo}'>
                                                          ${aVo.subName}</a></td>
                                                          <td>
                                                          <fmt:formatDate pattern="yyyy-MM-dd" value="${aVo.applyDate}" />
                                                          </td>
                                                          <td>
                                                          
                                                          <c:if test="${aVo.applyState eq '승인' }">
                                                          <span class="badge badge-success badge-pill">${aVo.applyState}</span>
                                                          </c:if>
                                                          <c:if test="${aVo.applyState eq '승인대기' }">
                                                          <span class="badge badge-warning badge-pill">${aVo.applyState}</span>
                                                          </c:if>
                                                          <c:if test="${aVo.applyState eq '거절' }">
                                                          <span class="badge badge-danger badge-pill">${aVo.applyState}</span>
                                                          </c:if>
                                                          
                                                          </td>   
                                                       </tr>
                                                    </c:forEach>
                                                    </c:if>
                                                    
                                                    <c:if test="${empty mainApplyWaitList}">
                                                       <tr>
                                                          <td colspan="4">내역이 없습니다.</td>
                                                       </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> <!-- end card-body-->
                                    
                                </div>
                            </div>
                            <!-- end col-12 -->
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
        <script src="/resources/dist/assets/js/app.js"></script>

        <!-- third party js -->
        <script src="/resources/dist/assets/js/vendor/jquery-ui.min.js"></script>
        <script src="/resources/dist/assets/js/vendor/fullcalendar.min.js"></script>
        <!-- third party js ends -->

        <!-- demo app -->
        <script src="/resources/dist/assets/js/pages/demo.calendar.js"></script>
        <!-- end demo js-->
        
        
      

  </body>
</html>