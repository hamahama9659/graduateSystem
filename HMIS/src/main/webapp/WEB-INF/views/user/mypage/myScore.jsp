<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 포트폴리오</title>
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

#container {
   text-align: center;
}

#left-box {
   float: left;
}

#center-box {
   margin: 0 auto;
}

#right-box {
   float: right;
}
</style>

<script src="/resources/dist/assets/js/html2canvas.js"></script>
<script src="/resources/dist/assets/js/jspdf.min.js"></script>

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
td, th {
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
                              <li class="breadcrumb-item"><a href="/user/main">전체</a></li>
                              <li class="breadcrumb-item active">포트폴리오</li>
                           </ol>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="row">
                  <div class="col-12">
                     <div id='container'>
                        <div id='right-box'>
                           <button type="button" class="btn btn-info" id="savePdf">PDF
                              저장</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- <div class="col-12">
            <div class="col-4">
               <h4 class="page-title">포트폴리오</h4>
               </div>
               <div class="col-8">
               <button type="button" class="btn btn-info" id="savePdf">PDF 저장</button>
            </div>
         </div> -->
         <div id="pdfDiv">
            <div class="row">
               <div class="col-12">
                  <h4 class="page-title">포트폴리오</h4>
                  <div class="card widget-inline">
                     <div class="card-body p-0">
                        <div class="row no-gutters">

                           <div class="col-sm-12 col-xl-3">
                              <div class="card shadow-none m-0">
                                 <div class="card-body text-center">
                                    <i class="dripicons-user-group text-muted"
                                       style="font-size: 24px;"></i>
                                    <p class="text-muted font-12 mb-0">학번</p>
                                    <h3>
                                       <span><a href="/user/mypage/myInfo">${totalDTO.userNo}</a></span>
                                    </h3>
                                 </div>
                              </div>
                           </div>


                           <div class="col-sm-12 col-xl-3">
                              <div class="card shadow-none m-0 border-left">
                                 <div class="card-body text-center">
                                    <i class="mdi mdi-pencil-outline" style="font-size: 24px;"></i>
                                    <p class="text-muted font-15 mb-0">성명</p>
                                    <h3>
                                       <span><a href="/user/mypage/myScore">${totalDTO.userName}</a></span>
                                    </h3>

                                 </div>
                              </div>
                           </div>


                           <div class="col-sm-12 col-xl-3">
                              <div class="card shadow-none m-0 border-left">
                                 <div class="card-body text-center">
                                    <i class="mdi mdi-calendar-text-outline"
                                       style="font-size: 24px;"></i>
                                    <p class="text-muted font-15 mb-0">학년</p>
                                    <h3>
                                       <span><a href="/user/mypage/myScore">${totalDTO.grade}</a></span>
                                    </h3>

                                 </div>
                              </div>
                           </div>

                           <div class="col-sm-12 col-xl-3">
                              <div class="card shadow-none m-0 border-left">
                                 <div class="card-body text-center">
                                    <i class="mdi mdi-school" style="font-size: 24px;"></i>
                                    <p class="text-muted font-15 mb-0">학적상태</p>
                                    <h3>
                                       <span><a href="/user/mypage/myScore">${totalDTO.state}</a></span>
                                    </h3>

                                 </div>
                              </div>
                           </div>



                        </div>
                     </div>
                  </div>


                  <h4 class="page-title">내 점수</h4>

                  <div class="row">

                     <div class="col-12">
                        <div class="card widget-inline">
                           <div class="card-body p-0">
                              <div class="row no-gutters">


                                 <div class="col-sm-12 col-xl-6">
                                    <div class="card shadow-none m-0 border-left">
                                       <div class="card-body text-center">
                                          <i class="mdi mdi-calendar-text-outline"
                                             style="font-size: 24px;"></i>
                                          <p class="text-muted font-15 mb-0">MIS 총점</p>
                                          <h3>
                                             <span><a href="/user/mypage/myScore">${totalDTO.misTotal}
                                                   / 200</a></span>
                                          </h3>

                                       </div>
                                    </div>
                                 </div>


                                 <div class="col-sm-12 col-xl-6">
                                    <div class="card shadow-none m-0 border-left">
                                       <div class="card-body text-center">
                                          <i class="mdi mdi-school" style="font-size: 24px;"></i>
                                          <p class="text-muted font-15 mb-0">총점</p>
                                          <h3>
                                             <span><a href="/user/mypage/myScore">${totalDTO.total}
                                                   / 1200</a></span>
                                          </h3>

                                       </div>
                                    </div>
                                 </div>


                              </div>
                           </div>
                        </div>


















                        <div class="card">
                           <div class="card-body">



                              <!-- 진로분야 List-->
                              <!-- 윗부분에 style태그로 명시함 ///  진로분야 와 등록버튼 같은 줄에 보임-->
                              <div id='container'>
                                 <div id='left-box'>
                                    <h4>진로</h4>
                                 </div>
                                 <div id='right-box'>
                                    <button name="uscar" type="button" class="btn btn-primary"
                                       onclick="javascript:location.href='/user/mypage/myScore/uscar'">
                                       등록</button>

                                 </div>
                              </div>

                              <br>
                              <br>
                              <br>
                              <table class="table table-centered mb-0">
                                 <thead class="thead-light">

                                    <tr>
                                       <th colspan="3">NO</th>
                                       <th colspan="9">진로명</th>
                                       <th colspan="2">관리</th>

                                    </tr>
                                 </thead>

                                 <tbody>
                                    <c:if test="${!empty everyUscarList}">
                                       <c:forEach items="${everyUscarList}" var="uscar"
                                          varStatus="status">
                                          <tr>
                                             <td colspan="3">${status.count}</td>
                                             <td colspan="9">${uscar.carName}</td>
                                             <td colspan="2"><a class="action-icon"
                                                href="/user/mypage/uscarremove?uscarNo=${uscar.uscarNo}">
                                                   <i class="mdi mdi-delete" onclick="postRemove()"></i>
                                             </a></td>
                                          </tr>
                                       </c:forEach>
                                    </c:if>
                                    <c:if test="${empty everyUscarList}">
                                       <tr>
                                          <td colspan="14">내역이 없습니다.</td>

                                       </tr>
                                    </c:if>
                                 </tbody>
                              </table>
                              <br> <br>

                           </div>
                        </div>


                        <div class="card">
                           <div class="card-body">

                              <!-- MIS List-->
                              <h4>MIS 점수</h4>
                              <br>
                              <table class="table table-centered mb-0">
                                 <thead class="thead-light">
                                    <tr>
                                       <th>분류</th>
                                       <th>영역</th>
                                       <th>항목명</th>
                                       <th>점수</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td>필수</td>
                                       <td>학생활동/봉사</td>
                                       <td>MIS</td>
                                       <td>${totalDTO.misTotal}</td>
                                    </tr>
                                 </tbody>
                              </table>
                              <br> <br>

                           </div>
                        </div>


                        <div class="card">
                           <div class="card-body">
                              <!--인증항목 List-->
                              <h4>취득한 자격증</h4>
                              <br>
                              <table class="table table-centered mb-0">
                                 <thead class="thead-light">
                                    <tr>
                                       <th>NO</th>
                                       <th>분류</th>
                                       <th>영역</th>
                                       <th>항목명</th>
                                       <th>점수</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:if test="${!empty acceptList}">
                                       <c:forEach items="${acceptList}" var="aVo"
                                          varStatus="status">
                                          <tr>
                                             <td>${status.count}</td>
                                             <td>${aVo.categ}</td>
                                             <td>${aVo.area}</td>
                                             <td>${aVo.subName}</td>
                                             <td>${aVo.acScore}</td>
                                          </tr>
                                       </c:forEach>
                                    </c:if>
                                    <c:if test="${empty acceptList}">
                                       <tr>
                                          <td colspan="5">내역이 없습니다.</td>
                                       </tr>
                                    </c:if>
                                 </tbody>
                              </table>
                              <br> <br>

                           </div>
                        </div>



                        <div class="card">
                           <div class="card-body">

                              <!--참여프로그램 List-->
                              <h4>참여한 프로그램</h4>
                              <br>
                              <table class="table table-centered mb-0">
                                 <thead class="thead-light">
                                    <tr>
                                       <th>NO</th>
                                       <th>프로그램명</th>
                                       <th>유형</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:if test="${!empty acceptProList}">
                                       <c:forEach items="${acceptProList}" var="vo"
                                          varStatus="status">
                                          <tr>
                                             <td>${status.count}</td>
                                             <td>${vo.proName}</td>
                                             <td>${vo.type}</td>
                                          </tr>
                                       </c:forEach>
                                    </c:if>
                                    <c:if test="${empty acceptProList}">
                                       <tr>
                                          <td colspan="5">내역이 없습니다.</td>
                                       </tr>
                                    </c:if>
                                 </tbody>
                              </table>
                              <br> <br>

                           </div>
                        </div>


                        <div class="card">
                           <div class="card-body">

                              <!-- 수강한 전공 List-->
                              <!-- 윗부분에 style태그로 명시함 ///  수강한 전공과 수정버튼 같은 줄에 보임-->
                              <div id='container'>
                                 <div id='left-box'>
                                    <h4>수강한 전공</h4>
                                 </div>
                                 <div id='right-box'>
                                    <button type="button" onclick="location.href='modify'"
                                       class="btn btn-primary">수정</button>

                                 </div>
                              </div>

                              <br>
                              <br>
                              <br>
                              <table class="table table-centered mb-0">
                                 <thead class="thead-light">
                                    <tr>
                                       <th>NO</th>
                                       <th>학수번호</th>
                                       <th>과목명</th>
                                       <th>트랙코드</th>
                                       <th>학점</th>
                                       <th>교수명</th>
                                    </tr>
                                 </thead>
                                 <tbody>

                                    <c:if test="${!empty listAll}">
                                       <c:forEach items="${listAll}" var="umVo" varStatus="status">
                                          <tr>
                                             <td>${status.count}</td>
                                             <td>${umVo.courseNo}</td>
                                             <td>${umVo.majorName}</td>
                                             <td>${umVo.trackCode}</td>
                                             <td>${umVo.grade}</td>
                                             <td>${umVo.profName}</td>
                                          </tr>
                                       </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listAll}">
                                       <tr>
                                          <td colspan="6">내역이 없습니다.</td>
                                       </tr>
                                    </c:if>
                                 </tbody>
                              </table>
                           </div>
                           <!-- end card body-->
                        </div>
                        <!-- end card -->
                     </div>
                     <!-- end col-12 -->
                  </div>
               </div>
               <!-- container -->
            </div>
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

      var result = '${msg}';

      if (result == 'REMOVE') {
         alert("삭제되었습니다.");

      }
      
      if (result == '처리 완료되었습니다.') {
          alert("등록되었습니다.");

       }
      if (result == 'MODIFY') {
          alert("등록되었습니다.");

       }
      
   

   });
</script>

<script>
   var userNo = "<c:out value="${totalDTO.userNo}"/>";
   var resultName = userNo + '_portfolio.pdf';
   $(document).ready(
         function() {
            $('#savePdf').click(
                  function() { // pdf저장 button id

                     alert('PDF을 다운로드 합니다.');

                     html2canvas($('#pdfDiv')[0]).then(
                           function(canvas) { //저장 영역 div id

                              // 캔버스를 이미지로 변환
                              var imgData = canvas
                                    .toDataURL('image/png');

                              var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
                              var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
                              var imgHeight = canvas.height
                                    * imgWidth / canvas.width;
                              var heightLeft = imgHeight;
                              var margin = 10; // 출력 페이지 여백설정
                              var doc = new jsPDF('p', 'mm');
                              var position = 0;

                              // 첫 페이지 출력
                              doc.addImage(imgData, 'PNG', margin,
                                    position, imgWidth, imgHeight);
                              heightLeft -= pageHeight;

                              // 한 페이지 이상일 경우 루프 돌면서 출력
                              while (heightLeft >= 20) {
                                 position = heightLeft - imgHeight;
                                 doc.addPage();
                                 doc.addImage(imgData, 'PNG', 0,
                                       position, imgWidth,
                                       imgHeight);
                                 heightLeft -= pageHeight;
                              }

                              // 파일 저장
                              doc.save(resultName);

                           });

                  });

         })
</script>


</html>