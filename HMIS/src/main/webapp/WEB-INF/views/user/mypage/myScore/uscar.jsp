<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<style>
ul {
   list-style: none;
   padding-left: 0px;
}
</style>
<!-- END File Upload Style -->

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
#acDate {
   background-color: #fff;
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
               <div class="row" style="justify-content: center;">
                  <div class="col-7">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item"><a
                                 href="javascript: void(0);">HMIS</a></li>
                              <li class="breadcrumb-item active">진로분야 설정</li>
                           </ol>
                        </div>
                        <h4 class="page-title">진로분야 설정</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row" style="justify-content: center;">
                  <div class="col-7">
                     <div class="card">
                        <div class="card-body">
                           <h4 class="header-title">진로분야 설정</h4>
                           <p class="text-muted font-13">설정 후에도 수정이 가능합니다.</p>


                           <form name="frm" method="post" role="form" onsubmit="return validate();">
                              <input type="hidden" name="carNo" id="carNo"> <input
                                 type="hidden" name="userNo" id="userNo"
                                 value="${login.userNo}">

                              <div class="form-row">
                                 <div class="form-group col-md-12">
                                    <label for="inputEmail4" class="col-form-label">진로분야</label><span
                                       class="text-danger">*</span>
                                    <div class="input-group">
                                       <input type="text" class="form-control" name="carName"
                                          id="carName" readonly="readonly"
                                          placeholder="진로분야를 선택해주세요.">
                                       <div class="input-group-append">
                                          
                                             <button class="btn btn-primary" type="button" onClick="window.open('/user/mypage/myScore/searchPopup?userNo=${login.userNo}', 'CLIENT_WINDOW',
                                          'toolbar=yes,menubar=yes,width=700.height=500')"
                                                id="popupBtn">검색</button>
                                          
                                       </div>
                                    </div>
                                 </div>
                              </div>

                              <br>
                              <div style="text-align: right;">
                                 <button type="submit" class="btn btn-primary">등록</button>
                              </div>
                           </form>

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


   </div>
   <!-- END wrapper -->



   <!-- App js -->
   <script src="/resources/dist/assets/js/app.js"></script>

</body>


<script>
   // searchSub 팝업창 띄우기


   // 신청 등록 유효성 검사 
   function validate() {
      var carName = $("#carName").val();
      var userNo = $("#userNo").val();
      var carNo = $("#carNo").val();

      if (carName == "") {
         alert("진로를 선택해주세요.");
         document.getElementById("carName").focus();
         return false;
      }

      return true;

   }
</script>

<!-- <script>
   $(document).ready(function() {

      var formObj = $("form[role='form']");

      console.log(formObj);

      $("#btn_submit").on("click", function() {

         var send_array = Array();
         var send_cnt = 0;
         var chkbox = $(".checkBox2");

         var carName = $("#carName").val();

         if (times == "") {
            alert("진로를 선택해주세요.");
            document.getElementById("carName").focus();
            return false;
         }

         for (i = 0; i < chkbox.length; i++) {
            send_array[send_cnt] = chkbox[i].value;
            send_cnt++;
         }

         if (send_cnt == 0) {
            alert("진로를 추가해주세요.");
            return false;
         }

         $("#check").val(send_array);

         formObj.submit();
      });
   });
</script> -->


<script>
   $(document).ready(function() {

      $("#detached-check input:radio").click(function() {

         alert("clicked");

      });

      $("input:radio:first").prop("checked", true).trigger("click");

   });

   // 추가
   $("#everyUscarList")
         .click(
               function() {
                  var checkbox = $("input[name=check]:checked");
                  checkbox
                        .each(function() {

                           $(this).parent().parent();
                           var tr = $(this).parent().parent();

                           var td = tr.children();

                           var userNo = $(this).val();

                           var carName = td.eq(3).text();
                           var row = "<tr>"
                                 + "<td>"
                                 + "<input type=\"checkbox\" class=\"checkBox2\" name=\"check2\" value=\"" + userNo + "\"" + ">"
                                 + "</td>" + "<td>" + uscarName
                                 + "</td>" + "</tr>";

                           // 숨긴 값의 체크박스를 false 상태로 바꿈
                           $(this).prop("checked", false);
                           tr.remove();

                           $("#everyUscarList > tbody").append(row);

                           $("#everyUscarList").prop("checked", false);

                        })

               });

   //삭제
   $("#delete")
         .click(
               function() {
                  var checkbox = $("input[name=check2]:checked");
                  checkbox
                        .each(function() {

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
                                 + "</td>" + "<td>" + id + "</td>"
                                 + "<td>" + userName + "</td>"
                                 + "</tr>";

                           // 숨긴 값의 체크박스를 false 상태로 바꿈
                           $(this).prop("checked", false);
                           tr.remove();
                           $("#stuList > tbody").append(row);

                           $("#allCheck2").prop("checked", false);

                        });

                  // searchSub 팝업창 띄우기
                  $("#carPopup")
                        .click(
                              function() {
                                 var url = "searchPopup";
                                 var name = "진로 검색";
                                 var option = "width = 700, height = 500, top = 100, left = 200, location = no";
                                 //window.open(url, name, option);      
                                 window
                                       .open(
                                             "/user/mypage/myScore/searchPopup?make_date="
                                                   + make_date,
                                             "_blank",
                                             "toolbar=yes,menubar=yes,width=700.height=500");

                              }
                        //팝업
                        /*    
                           $(document).ready(function(){
                              var formObj = $("form[role='form']");
                              
                              
                              $('#popupBtn').on("click",function(){
                                 var make_date = $("#make_date").val();
                                 
                                 window.open("/user/mypage/myScore/searchPopup?make_date="+make_date,"_blank","toolbar=yes,menubar=yes,width=700.height=500").focus();
                              });
                           
                           } */
                        );
               });
</script>
<script
   src="../../../../resources/dist/assets/js/vendor/dataTables.checkboxes.min.js"></script>
</body>

<!-- SD PROJECT JS -->

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/dist/assets/js/upload.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
   
</script>

</html>