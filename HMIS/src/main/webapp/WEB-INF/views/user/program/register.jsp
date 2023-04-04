<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 프로그램 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
   content="A fully featured admin theme which can be used to build CRM, CMS, etc."
   name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
   href="/resources/dist/assets/images/favicon.ico">

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
<style>
body.loading {
   visibility: hidden;
}
ul{
   list-style:none;
   padding-left:0px;
   }
td, th {
   text-align: center;
}

body[data-layout=detached] .wrapper {
   overflow: hidden !important;
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
                              <li class="breadcrumb-item"><a
                                 href="javascript: void(0);">HMIS</a></li>
                              <li class="breadcrumb-item active">프로그램신청</li>
                           </ol>
                        </div>
                        <h4 class="page-title">프로그램신청</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-body">
                           <h4 class="header-title">프로그램신청</h4>
                           <p class="text-muted font-13">신청 후에 수정과 삭제는 불가합니다.</p>

                           <form role="form" name="frm" method="post">
                              <!-- <form action="http://localhost:8181/user/program/register" method="POST"> -->
                              <input type="hidden" name="proNo" value="${programVO.proNo}">




                              <div class="form-group mb-3">
                                 <label for="proNo">프로그램명</label> <input type="text"
                                    class="form-control" name="proName" id="proName"
                                    value="${programVO.proName}" readonly="readonly" />
                              </div>


                              <div class="form-group mb-3">
                                 <label for="proName">학번</label> <input type="text"
                                    class="form-control" name="userNo" id="userNo"
                                    value="${login.userNo}" readonly="readonly" />
                              </div>

                              <div class="form-group mb-3">
                                 <label for="proName">이름</label> <input type="text"
                                    class="form-control" name="userName" id="userName"
                                    value="${login.userName}" readonly="readonly" />
                              </div>


                              <div class="form-group md-3">
                                 <label for="inputPassword4" class="col-form-label">작성일</label>
                                 <input type="text" name="apllyDate" id="applyDate"
                                    class="form-control" data-toggle="date-picker"
                                    data-single-date-picker="true" disabled="disabled">
                              </div>

                              <div class="form-group">
                                 <label for="exampleInputEmail1"
                                    class="col-sm-2 control-label">첨부파일<span
                                    class="must-mark">*</span></label>
                              </div>


                              <div id='mydropzone' class="dropzone">

                                 <input type="file" id="fileUpload" name="fileUpload"
                                    style="visibility: hidden;" />

                                 <div class="fileDrop">
                                    <input type="hidden" id="uploadCount">
                                    <div class="dz-message needsclick">
                                       <i class="h1 text-muted dripicons-cloud-upload"></i>
                                       <h3>Drop files here or click to upload.</h3>
                                       <span class="text-muted font-13">첨부파일을 업로드하려면 여기에
                                          첨부파일 파일을 끌어 넣거나 클릭해주세요</span>
                                    </div>
                                 </div>
                              </div>
                              <div>
                                 <ul class="dropzone-previews clearfix uploadedList">
                                 </ul>
                              </div>
                           </form>
                           <div style="text-align: right;">
                              <jsp:useBean id="now" class="java.util.Date" />
                              <fmt:formatDate value="${now}" pattern="yyyyMMdd"
                                 var="nowDate" />
                              <fmt:formatDate value="${programVO.appStart}"
                                 pattern="yyyyMMdd" var="openDate" />
                              <fmt:formatDate value="${programVO.appEnd}" pattern="yyyyMMdd"
                                 var="closeDate" />

                             <c:if test="${openDate > nowDate || closeDate < nowDate}">
                                 <td><span class="badge badge-danger badge-pill"
                                    style="font-size: 14px;">마감</span></td>
                              </c:if>
                              <c:if test="${openDate < nowDate && closeDate > nowDate}">
                                 <td>
                                    <button type="button" class="btn btn-primary"
                                       id="btn_submit" style="font-size: 14px;">신청</button>
                                 </td>
                              </c:if>
                              <c:if test="${openDate eq nowDate || closeDate eq nowDate}">
                                 <td>
                                    <button type="button" class="btn btn-primary"
                                       id="btn_submit" style="font-size: 14px;">신청</button>
                                 </td>
                              </c:if>
                           </div>




                        </div>
                        <!-- end card-body -->
                     </div>
                     <!-- end card-->
                  </div>
                  <!-- end col-12 -->
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
<!-- SD PROJECT JS -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li class="dropzone-previews mt-3">
<div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
<div class="p-2">
<div class="row align-items-center">
 <div class="col-auto">
    <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="{{imgsrc}}">
 </div>
 <div class="col pl-0">
   <a href="/displayFile?fileName={{fullName}}" text-muted font-weight-bold" data-dz-name="">{{fileName}}</a>
 </div>
 <div class="col-auto">
   <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="dripicons-cross"></i></a>
 </div>
</div>
</div>
</div>
</li>
</script>

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

<!-- 다중 파일 업로드 js
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
 -->
<script>
   // searchSub 팝업창 띄우기
   $("#subPopup")
         .click(
               function() {
                  var url = "searchPopup";
                  var name = "항목 검색";
                  var option = "width = 700, height = 500, top = 100, left = 200, location = no";
                  window.open(url, name, option);
               });

   // 신청 등록 유효성 검사 
   function validate() {
      var subNo = $("#subNo").val();
      var userNo = $("#userNo").val();
      var acScore = $("#acScore").val();
      var acDate = $("#acDate").val();

      if (subNo == "") {
         alert("항목명을 입력해주세요.");
         document.getElementById("subName").focus();
         return false;
      }
      if (acScore == "") {
         alert("취득 점수를 입력해주세요.");
         document.getElementById("acScore").focus();

         return false;
      }
      if (acDate == "") {
         alert("취득일자를 입력해주세요.");
         document.getElementById("acDate").focus();

         return false;
      }

      return true;

   }
</script>

<!-- SD PROJECT JS -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li class="dropzone-previews mt-3">
<div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
<div class="p-2">
<div class="row align-items-center">
 <div class="col-auto">
    <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="{{imgsrc}}">
 </div>
 <div class="col pl-0">
   <a href="/displayFile?fileName={{fullName}}" text-muted font-weight-bold" data-dz-name="">{{fileName}}</a>
 </div>
 <div class="col-auto">
   <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="dripicons-cross"></i></a>
 </div>
</div>
</div>
</div>
</li>
</script>

<script>
   $(document)
         .ready(
               function() {
                  var formObj = $("form[role='form']");

                  formObj
                        .submit(function(event) {
                           event.preventDefault();
                           //유효성 검사

                           var val = validate();

                           if (val) {

                              var that = $(this);

                              var str = "";

                              $(".uploadedList .delbtn")
                                    .each(
                                          function(index) {
                                             str += "<input type='hidden' name='files'"
                                                   + " value='"
                                                   + $(this)
                                                         .attr(
                                                               "href")
                                                   + "'> ";
                                          });

                              that.append(str);
                              console.log(str);

                              that.get(0).submit();

                           }//if문 종료

                        });

                  $(".btn-cancel")
                        .on(
                              "click",
                              function() {
                                 self.location = "shop.do?action=list&page=${cri.page}&perPageNum=${cri.perPageNum}"
                                       + "&searchType=${cri.searchType}&listType=${cri.listType}&keyword=${cri.keyword}";
                              });

               });

   $('#mydropzone').click(function(event) {

      document.frm.fileUpload.click();

   });

   var template = Handlebars.compile($("#template").html());

   $(".fileDrop").on("dragenter dragover", function(event) {
      event.preventDefault();
   });

   $(".fileDrop").on("drop", function(event) {
      event.preventDefault();

      var uploaded = $("#uploadCount").val();

      var files = event.originalEvent.dataTransfer.files;

      var file = files[0];

      var formData = new FormData();

      formData.append("file", file);

      $.ajax({
         url : '/uploadAjax',
         data : formData,
         dataType : 'text',
         processData : false,
         contentType : false,
         type : 'POST',
         success : function(data) {

            var fileInfo = getFileInfo(data);
            var html = template(fileInfo);

            var str = "";

            $(".uploadedList").append(html);

            uploaded++;
            $("#uploadCount").attr("value", uploaded);

            $(".uploadedList").append(str);
         }
      });
   });

   //클릭으로 파일 업로드할 때 호출되는 함수
   $("#fileUpload").on("change", function(event) {
      event.preventDefault();

      var uploaded = $("#uploadCount").val();

      if (uploaded >= 3) {
         alert('첨부파일은 3개 까지 업로드할 수 있습니다.');
         return;
      }

      // 파일업로드 인풋에서 파일을 받음
      var file = document.getElementById("fileUpload").files[0];

      // 새로운 폼데이터를 생성
      var formData = new FormData();

      // 폼데이터에 파일을 붙임
      formData.append("file", file);

      // AJAX로 uploadAjax 메소드를 호출해서 파일을 업로드함
      $.ajax({
         url : '/uploadAjax',
         data : formData,
         dataType : 'text',
         processData : false,
         contentType : false,
         type : 'POST',
         success : function(data) {

            var fileInfo = getFileInfo(data);
            var html = template(fileInfo);

            var str = "";

            $(".uploadedList").append(html);

            uploaded++;
            $("#uploadCount").attr("value", uploaded);

            $(".uploadedList").append(str);
         }
      });
   });

   $(".uploadedList").on("click", ".delbtn", function(event) {
      event.preventDefault();

      var that = $(this);
      var uploaded = $("#uploadCount").val();

      $.ajax({
         url : "/deleteFile",
         type : "post",
         data : {
            fileName : $(this).attr("href")
         },
         dataType : "text",
         success : function(result) {

            if (result == 'deleted') {

               that.closest("li").remove();
               uploaded--;
               $("#uploadCount").attr("value", uploaded);

            }
         }

      });

   });

   function getOriginalName(fileName) {

      if (checkImageType(fileName)) {
         return;
      }

      var idx = fileName.indexOf("_") + 1;
      return fileName.substr(idx);

   }

   function getImageLink(fileName) {

      if (!checkImageType(fileName)) {
         return;
      }
      var front = fileName.substr(0, 12);
      var end = fileName.substr(14);

      return front + end;

   }
</script>

<script>
   $(document).ready(function() {

      var formObj = $("form[role='form']");

      console.log(formObj);

      $("#btn_submit").on("click", function() {

         var proName = $("#proName").val();
         /* var type = $("#type").val();
         var writer = $("#writer").val(); */

         if (proName == "") {
            alert("프로그램 명을 입력해주세요.");
            document.getElementById("proName").focus();
            return false;
         }
         /* if(type == ""){
            alert("유형을 입력해주세요.");
            document.getElementById("type").focus();
            return false;
         }
         if(writer == ""){
            alert("담당자를 입력해주세요.");
            document.getElementById("writer").focus();
            return false;
         } */

         formObj.submit();
      });
   });
</script>


<script
   src="../../../../resources/dist/assets/js/vendor/dataTables.checkboxes.min.js"></script>



</html>