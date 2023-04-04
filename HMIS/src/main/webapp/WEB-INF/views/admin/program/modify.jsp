<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 프로그램 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
   content="A fully featured admin theme which can be used to build CRM, CMS, etc."
   name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
   href="/resources/dist/assets/images/favicon.ico">

<!-- inline style to handle loading of various element-->
<!-- page CSS -->
<style>
body.loading {
   visibility: hidden;
}
input.form-control[readonly], textarea.form-control[readonly] { 
  background-color: #fff;
}

ul {
   list-style: none;
   padding-left: 0px;
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
   
   <script  type="text/javascript">
   // 수정 유효성 검사 
   function validate() {
      var proNo = $("#proNo").val();
      var userNo = $("#userNo").val();
      var writer = $("#writer").val();
      var proName = $("#proName").val();
      var type = $("#type").val();
      var limitParti = $("#limitParti").val();
      var appStart = $("#appStart").val();
      var appEnd = $("#appEnd").val();
      var limitParti = $("#limitParti").val();


      if (proName == "") {
         alert("제목을 입력해주세요 .");
         $("proName").focus();
         return false;
      }
      
      
      if (limitParti == "") {
         alert("모집정원 입력해주세요 .");
         $("limitParti").focus();
         return false;
      }
      if (writer == "") {
         alert("담당자를 입력해주세요.");
         $("writer").focus();

         return false;
      }
      if (type == "") {
         alert("분류를 입력해주세요.");
         $("type").focus();

         return false;
      }

      if (appStart == "") {
         alert("시작일을 입력해주세요.");
         $("appStart").focus();

         return false;
      }

      if (appEnd == "") {
         alert("마감일을 입력해주세요.");
         $("appEnd").focus();

         return false;
      }

      return true;

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
                              <li class="breadcrumb-item"><a
                                 href="/admin/main">HMIS</a></li>
                              <li class="breadcrumb-item"><a
                                 href="/admin/subject/list">프로그램</a></li>
                              <li class="breadcrumb-item active">프로그램수정</li>
                           </ol>
                        </div>
                        <h4 class="page-title">프로그램수정</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row">
                  <div class="col-lg-12">
                  <form role="form" name="frm" method="post">
                  <input type='hidden' name='proNo' value="${programVO.proNo}">
                        <input type='hidden' name='page' value="${cri.page}"> 
                        <input type='hidden' name='perPageNum' value="${cri.perPageNum}"> 
                        <input type='hidden' name='searchType' value="${cri.searchType}">
                        <input type='hidden' name='keyword' value="${cri.keyword}"> 
                        
                     <div class="center-align">
                        <div class="card">
                           <div class="card-body">
                              <!-- <h4 class="header-title mb-3">항목정보입력란</h4> -->

                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="form-group">
                                          <label for="proName">제목 <span
                                    class="must-mark">*</span></label>
                                          <input class="form-control" type="text"
                                             name="proName" value="${programVO.proName}" id="proName">
                                       </div>
                                    </div>
                                 </div>
                                    <!-- end row -->
                                    
                                    <div class="row">
                                       <div class="form-group col-md-6">
                                       <label for="type" class="col-form-label">분류<span
                                    class="must-mark">*</span></label>
                                       <input type="text" name="type" id="type"
                                          value="${programVO.type}" class="form-control">
                                       </div>

                                       <div class="form-group col-md-6">
                                       </div>
                                    </div>
                                    <!-- end row -->
                                    
                                    <div class="row">
                                       <div class="form-group col-md-6">
                                       <label for="appStart" class="col-form-label">신청기간: 시작일<span
                                    class="must-mark">*</span></label>
                                          <input type="text" class="form-control date"  name="appStart" id="appStart"
                                          data-toggle="date-picker" data-single-date-picker="true" 
                                          value="<fmt:formatDate value="${programVO.appStart}" pattern="MM/dd/yyyy" />">
                                       </div>
                                    
                                    <div class="form-group col-md-6">
                                       <label for="appEnd" class="col-form-label">신청기간: 마감일<span
                                    class="must-mark">*</span></label>
                                       <input type="text" class="form-control date"  name="appEnd" id="appEnd"
                                          data-toggle="date-picker" data-single-date-picker="true" 
                                          value="<fmt:formatDate value="${programVO.appEnd}" pattern="MM/dd/yyyy" />">
                                    </div>
                                    </div>
                                    <!-- end row -->
                                    
                                    <div class="row">
                                    <div class="form-group col-md-6">
                                       <label for="limitParti" class="col-form-label">모집정원<span
                                    class="must-mark">*</span></label>
                                       <input type="text" name="limitParti" id="limitParti"
                                          value="${programVO.limitParti}" class="form-control">
                                    </div>


                                    <div class="form-group col-md-6">
                                       <label for="writer" class="col-form-label">담당자<span
                                    class="must-mark">*</span></label>
                                       <input type="text" name="writer" id="writere"
                                          value="${programVO.writer}" class="form-control" readonly>
                                    </div>
                                    </div>
                                    <!-- end row -->
                                    
                                    <div class="row">
                                    <div class="form-group col-md-12">
                                    <label for="contents" class="col-form-label">상세내용</label>
                                    <textarea class="form-control" name="contents" id="contents"
                                       rows="5">${programVO.contents}</textarea>
                                    </div>
                                    </div>
                                    <!-- end row -->
                                    
                                    
                                   <div class="form-group">
                                 <label for="exampleInputEmail1"
                                    class="col-sm-2 control-label">첨부파일</label>
                              </div>


                               <div id='mydropzone' class="dropzone">
                                
                                 <input type="file" id="fileUpload" name="fileUpload" style="visibility: hidden;" />

                                 <div class="fileDrop">
                                    <input type="hidden" id="uploadCount">
                                    <div class="dz-message needsclick">
                                       <i class="h1 text-muted dripicons-cloud-upload"></i>
                                       <h3>Drop files here or click to upload.</h3>
                                       <span class="text-muted font-13">첨부파일을 업로드하려면 여기에 첨부파일 파일을 끌어 넣거나 클릭해주세요</span>
                                    </div>
                                    </div>
                                    </div>
                                    <div>
                                
                         <ul class="dropzone-previews clearfix uploadedList">
                         
                           
                           <c:forEach items="${fileVO}" var="fileVO" varStatus="status">
                           <c:set var="filename" value="${fileVO.fileName}" />
                           <c:set var="fileNum" value="${fn:toLowerCase(filename)}" />
                           
                           <li class="dropzone-previews mt-3">
                              <div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
                                 <div class="p-2">
                                    <div class="row align-items-center">
                                                      <c:forTokens var="token" items="${fileNum}" delims="." varStatus="status">
                                                         <c:if test="${status.last}">
                                                            <c:choose>
                                                               <c:when test="${token eq 'hwp'}">
                                                                  <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="한글파일이미지" alt="${filename}" />
                                                               </c:when>
                                                               <c:when
                                                                  test="${token eq 'xls' || token eq 'xlsx' }">
                                                                  <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="/resources/dist/assets/images/excelIcon.png" />
                                                               </c:when>
                                                               <c:when
                                                                  test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
                                                                  <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="/displayFile?fileName=${fileVO.fileLocation}">
                                                               </c:when>
                                                               <c:when test="${token eq 'pdf'}">
                                                                  <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="pdf파일이미지" alt="${filename}" />
                                                               </c:when>
                                                               <c:when test="${token eq 'ppt' }">
                                                                  <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="파워포인트파일이미지" alt="${filename}" />
                                                               </c:when>
                                                               <c:otherwise>
                                                                  <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="/resources/dist/assets/images/file.svg" alt="${filename}" />
                                                               </c:otherwise>
                                                            </c:choose>
                                                         </c:if>
                                                      </c:forTokens>

<%--                                                      <c:choose>
                                                 <c:when test="checkImageType(${fileVO.fileLocation})">
                                                    <div class="col-auto">
                                                    <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="${fileVO.fileName}">
                                                 </div>
                                                 </c:when>

                                                <c:otherwise>
                                                <div class="col-auto">
                                                   <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="/resources/dist/assets/images/file.svg">
                                                </div>
                                                 </c:otherwise>

                                             </c:choose>
 --%>
                                       <div class="col pl-0">
                                          <a href="/displayFile?fileName=${fileVO.fileLocation}" text-muted font-weight-bold data-dz-name=""> ${fileVO.fileName}</a>
                                       </div>
                               <div class="col-auto">
                                    <a href="${fileVO.fileLocation}" class="btn btn-default btn-xs pull-right delbtn"><i class="dripicons-cross"></i></a>
                               </div>                                       
                                    </div>
                                 </div>
                              </div>
                           </li>
                           </c:forEach>
                            </ul>
                                 </div>

                                 <div class="row mt-4">
                                    <div class="col-sm-6">                           
                                       <a href="/admin/program/list?searchType=${cri.searchType}&keyword=${cri.keyword}&page=${cri.page}&perPageNum=${cri.perPageNum}"
                                          class="btn text-muted d-none d-sm-inline-block btn-link font-weight-semibold">
                                          <i class="mdi mdi-arrow-left"></i> 목록으로 돌아가기
                                       </a>
                                    </div>
                                    <!-- end col -->
                                    <div class="col-sm-6">
                                       <div class="text-sm-right">
                                          <button class="btn btn-primary" type="submit" style="font-size: 18px;" >수정</button>
                                       </div>
                                    </div>
                                    <!-- end col -->
                                 </div>
                                 <!-- end row -->
                           </div>
                           
                           <!-- end card-body-->
                        </div>
                        <!-- end card-->
                     </div>
                                 </form>
                     <!-- end col-->
                  </div>
                  <!--  end center-align -->

               </div>
               <!-- end col -->
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


   </div>
   <!-- END wrapper -->


<!-- App js -->
   <script src="../../../../resources/dist/assets/js/app_admin.js"></script>
   <script src="../../../../resources/dist/assets/js/jquery-2.2.4.min.js"></script>
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


</body>

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

<!--  <script>
   $(document).ready(function() {

      var formObj = $("form[role='form']");

      console.log(formObj);

      /* 수정버튼 */
      $(".btn-primary").on("click", function() {
         formObj.submit();
      });

   });
</script>  -->

<script>
   $("input:text[numberOnly]").on("focus", function() {
      var x = $(this).val();
      x = removeCommas(x);
      $(this).val(x);
   }).on("focusout", function() {
      var x = $(this).val();
      if (x && x.length > 0) {
         if (!$.isNumeric(x)) {
            x = x.replace(/[^0-9]/g, "");
         }
         x = addCommas(x);
         $(this).val(x);
      }
   }).on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g, ""));
   });
</script>
<script>
      
      function checkImageType(fileName) {
         
         var pattern = /jpg|gif|png|jpeg/i;

         return fileName.match(pattern);

   }
</script>



<script>

$(document).ready(function() {

    var formObj = $("form[role='form']");

    formObj.submit(function(event) {
       event.preventDefault();
       //유효성 검사
       if (validate()) {
          var that = $(this);
          var str = "";
          $(".uploadedList .delbtn").each(
                function(index) {
                   str += "<input type='hidden' name='files'"
                         + " value='" + $(this).attr("href")
                         + "'> ";
                });
          that.append(str);
          that.get(0).submit();
       }
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


<script
   src="../../../../resources/dist/assets/js/vendor/dataTables.checkboxes.min.js"></script>


</html>