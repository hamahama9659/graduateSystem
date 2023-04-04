<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 진로분야 선택</title>
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

</head>
<style>
td, th {
   text-align: center;
}
</style>
<body class="loading">
   <!-- Begin page -->
   <div class="wrapper">
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
                        <h4 class="page-title">진로분야 검색</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row">
                  <div class="col-12">
                  
                  <!-- 검색기능 안쓰기로 결정  - 사유 :: 검색하면 선택했던 진로분야가 나타남 (오류수정 시간부족) -->
                     <!-- <div class="card">
                        <div class="card-body">
                           <div class="row">
                              <div class="form-row col-md-12">
                                 <div class="form-group col-md-12">
                                    <label for="inputEmail4" class="col-form-label">진로분야</label>
                                    <form action="searchCar" method="get"
                                       onsubmit="return searchCheck();">
                                       <div class="input-group">
                                          <input type="text" class="form-control" id="carName"
                                             name="carName" placeholder="진로분야를 선택해주세요.">
                                          <div class="input-group-append">
                                             <button class="btn btn-primary" type="submit">검색</button>
                                          </div>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                           end row
                        </div>
                        end card body
                     </div> -->
                     <!-- end card -->

                     <div class="card">
                        <div class="card-body">
                           <div class="row">
                              <div class="form-row col-md-12">
                                 <div class="form-group col-md-12">
                                    <label for="inputEmail4" class="col-form-label">전체
                                       진로리스트</label>
                                    <div class="table-responsive">
                                       <table class="table table-centered mb-0">
                                          <thead class="thead-light">
                                             <tr>
                                                <th>NO</th>
                                                <th>진로명</th>

                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:if test="${!empty carList}">
                                                <c:forEach items="${carList}" var="carrierVO"
                                                   varStatus="listStat">
                                                   <tr>
                                                      <td>${listStat.count} <input type="hidden"
                                                         name="carNo" id="carNo" value="${carrierVO.carNo}">
                                                      </td>
                                                      
                                                      <td><a href="#"
                                                         onclick="sendData('${carrierVO.carNo}', '${carrierVO.carName}')">${carrierVO.carName}</a></td>
                                                      
                                                   </tr>
                                                </c:forEach>
                                             </c:if>
                                             <c:if test="${empty carList}">
                                                <tr>
                                                   <td colspan="2">내역이 없습니다.</td>
                                                </tr>
                                             </c:if>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- end row -->
                        </div>
                        <!-- end card body-->
                     </div>

                  </div>
                  <!-- end col-12 -->
               </div>
               <!-- end row -->

            </div>
            <!-- container -->

         </div>
         <!-- content -->


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
   // 부모창으로 정보 보내기
   function sendData(carNo,carName) {
      var carNo = carNo;
      
      var carName = carName;
      

      if (carNo == 0) {
         $("#carNo", opener.document).attr('readonly', false);
         $("#carNo", opener.document).val('');
         opener.document.frm.carNo.value = carNo;
         
         
         opener.document.frm.carName.value = carName;
         

      } else if (carNo > 0) {
         $("#carNo", opener.document).attr('readonly', true);
         opener.document.frm.carNo.value = carNo;
         
         opener.document.frm.carName.value = carName;
         
      }

      window.close();

   }

   //항목 명 유효성 검사
   function searchCheck() {
      var carName = $("#carName").val();

      if (carName == "") {
         alert("진로분야를 선택해주세요.");
         document.getElementById("carName").focus();
         return false;
      }
   }
</script>
</html>