<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 신청 현황 조회</title>
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
                        <h4 class="page-title">신청 결과</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->


               <div class="card">
                  <div class="card-body">
                     <div class="row">
                        <div class="form-row col-md-12">
                           <div class="form-group col-md-12">
                              <label for="inputEmail4" class="col-form-label">학생</label>
                              <div class="table-responsive">
                                 <table class="table table-centered mb-0">
                                    <thead class="thead-light">
                                       <tr>
                                          <th>No</th>
                                          <th>제목</th>
                                          <th>이름</th>
                                          <th>신청일</th>
                                          <th>신청결과</th>

                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:if test="${!empty graduTestList}">
                                          <c:forEach items="${graduTestList}" var="GraduationTestVO"
                                             varStatus="listStat">
                                             <tr>
                                                <td>${listStat.count} <input type="hidden"
                                                   name="testNo" id="testNo"
                                                   value="${GraduationTestVO.testNo}">
                                                </td>
                                                <td>${GraduationTestVO.title}</td>
                                                <td>${GraduationTestVO.userName}</td>
                                                <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                      value="${GraduationTestVO.applyDate}" /></td>
                                                <td>${GraduationTestVO.testState}</td>
                                             </tr>
                                          </c:forEach>
                                       </c:if>
                                       <c:if test="${empty graduTestList}">
                                          <tr>
                                             <td colspan="4">내역이 없습니다.</td>
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
                  <!-- end card-body body-->
               </div>
               <!-- end card body-->


            </div>
            <!-- end col-12 -->
         </div>
         <!-- end content -->

      </div>
      <!-- content-page -->

   </div>
   <!-- wrapper -->


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

<!-- <script>

// 부모창으로 정보 보내기
function sendData(subNo, categ, area, subName, score, guide){
   var subNo = subNo;
   var categ = categ;
   var area = area;
   var subName = subName;
   var score = score;
   var guide = guide;
   
   if(score == 0){
      $("#acScore", opener.document).attr('readonly', false);
      $("#acScore", opener.document).val('');
      opener.document.frm.subNo.value = subNo;
      opener.document.frm.categ.value = categ;
      opener.document.frm.area.value = area;
      opener.document.frm.subName.value = subName;
      opener.document.frm.guide.value = guide;
      
   } else if(score > 0){
      $("#acScore", opener.document).attr('readonly', true);
      opener.document.frm.subNo.value = subNo;
      opener.document.frm.categ.value = categ;
      opener.document.frm.area.value = area;
      opener.document.frm.subName.value = subName;
      opener.document.frm.acScore.value = score;
      opener.document.frm.guide.value = guide;
   }
   
   
   window.close();
   
}

//항목 명 유효성 검사
function searchCheck(){
   var subName = $("#subName").val();
   
   if(subName == ""){
      alert("항목 명을 입력해주세요");
      document.getElementById("subName").focus();
      return false;
   }
}

</script>  -->
</html>