<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HMIS :: 수강정보선택</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
   content="A fully featured admin theme which can be used to build CRM, CMS, etc."
   name="description" />
<meta content="Coderthemes" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
   href="/resources/dist/assets/images/favicon.ico">
<style>
ul{
   list-style:none;
   padding-left:0px;
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
               <div class="row">
                  <div class="col-12">
                     <div class="page-title-box">
                        <div class="page-title-right">
                           <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item"><a
                                 href="javascript: void(0);">HMIS</a></li>
                              <li class="breadcrumb-item active">수강한 전공</li>
                           </ol>
                        </div>
                        <h4 class="page-title">수강정보선택</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->



         <form role="form" action="modify" method="post">
                        <input type='hidden' name="userNo" value="${userNo}">
                        <input type="hidden" id="arrayMajor" name="arrayMajor" />
               <div class="row">
                  <div class="col-12">
                  
                  <%--============================================================================================================== --%>







<%--============================================================================================================== --%>
<%--============================================================================================================== --%>
                     <div class="card">
                        <div class="card-body">
                           
                              <div class="row">
                                 <div class="col-12">
                                    <div class="row"> <%-- 무조건 이 div 안에 있어야 데이터가 왔다갔다 함 --%>
                                       <div class="card-body">
                                          <h4 style="text-align: center;">전체 전공과목 목록</h4>
                                          
                                          <br>
                                          <div class="table-responsive">
                                             <table
                                                class="table table-centered w-100 dt-responsive nowrap"
                                                id="otherList" style="text-align:center;">
                                                <thead class="thead-light">
                                                   <tr>
                                                      <th class="all" style="width: 20px;">
                                                         <div class="custom-control custom-checkbox"  style="padding-left: 0rem;">
                                                            <input type="checkbox" id="allCheck1" class="allCheck1" name="allCheck1"> 
                                                               
                                                         </div>
                                                      </th>
                                                      <!-- <th class="all">NO</th> -->
                                                      <th>학수번호</th>
                                                      <th>과목명</th>
                                                      <th>학점</th>
                                                      <th>트랙분류</th>
                                                      <th>교수명</th>
                                                   </tr>
                                                </thead>

                                                <tbody>
                                                   <c:forEach items="${otherList}" var="umVo"
                                                      varStatus="listStat">
                                                      <tr>
                                                         <td style="text-align:center;" class="custom-control">
                                                         
                                                               <input type="checkbox" name="check" value="${umVo.majorNo}" class="checkBox">
                                                               
                                                         </td>
                                                         <td>${umVo.courseNo}</td>
                                                         <td>${umVo.majorName}</td>
                                                         <td>${umVo.grade}</td>
                                                         <td>${umVo.trackCode}</td>
                                                         <td>${umVo.profName}</td>
                                                      </tr>
                                                   </c:forEach>
                                                </tbody>
                                             </table>
                                          </div>
                                             
                                       </div>
</div>
                                             <div class="card-footer">
                                          <div style="text-align: right;">
                                             <button type="button" class="btn btn-outline-primary" id="add">추가</button>
                                          </div>
                                             </div>
</div>
</div>
</div>
</div>




<div class="card">
                        <div class="card-body">
                           
                              <div class="row">
                                 <div class="col-12">
                                    <div class="row"> <%-- 무조건 이 div 안에 있어야 데이터가 왔다갔다 함 --%>
                                       <div class="card-body">
                                          <h4 style="text-align: center;">수강한 전공과목 목록</h4>
                                       <br>
                                       
                                             <div class="table-responsive">
                                                <table
                                                   class="table table-centered w-100 dt-responsive nowrap"
                                                   id="listAll" style="text-align:center;">
                                                   <thead class="thead-light">
                                                      <tr>
                                                         <th class="all" style="width: 20px;">
                                                            <div class="custom-control custom-checkbox"  style="padding-left: 0rem;">
                                                               <input type="checkbox" class="allCheck2"
                                                                  id="allCheck2" name="allCheck2">
                                                            </div>
                                                         </th>
                                                         <!-- <th class="all">NO</th> -->
                                                         <th>학수번호</th>
                                                         <th>과목명</th>
                                                         <th>학점</th>
                                                         <th>트랙분류</th>
                                                         <th>교수명</th>

                                                      </tr>
                                                   </thead>

                                                   <tbody>
                                                   <c:forEach items="${listAll}" var="umVo" varStatus="listStat">
                                                      <tr>
                                                         <td style="text-align:center;">
                                                            
                                                               <input type="checkbox" class="checkBox2" name="check2" value="${umVo.majorNo}">
                                                            
                                                         </td>
                                                         <%-- <td>${listStat.count}</td> --%>
                                                         <td>${umVo.courseNo}</td>
                                                         <td>${umVo.majorName}</td>
                                                         <td>${umVo.grade}</td>
                                                         <td>${umVo.trackCode}</td>
                                                         <td>${umVo.profName}</td>
                                                      </tr>
                                                   </c:forEach>
                                                   </tbody>
                                                </table>
                                             </div>

                                          <!-- end table-responsive-->
                                       </div>
                                       <!-- end table-responsive-->


                                    </div>
                                             <div class="card-footer" style="background-color:rgba(0,0,0,0)">
                                          <div style="text-align: right;">
                                             <button type="button" class="btn btn-outline-danger" id="delete">삭제</button>
                                          </div>
                                    </div>
                                 </div>
                              </div>

                        </div>
                        <!-- end card-body -->
                     </div>
                     <!-- end card-->
                  <!-- <div class="card-footer"></div> -->
                  <div class="row">
                            <div class="col-12">
                               <div class="card widget-inline">
                               </div>
                            </div>
                        </div>
                           <div class="container-fluid">
                              <div style="text-align: right;">
                                 <button type="submit" class="btn btn-primary" id="btn_submit">수정</button>
                                 <button type="button" class="btn btn-light">목록</button>
                              </div>
                           </div>
                           <div class="container-fluid"></div>
                  <div class="row">
                            <div class="col-12">
                               <div class="card widget-inline">
                               </div>
                            </div>
                        </div>   
</form>
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
               
               var majorNo = $(this).val();
               var courseNo = td.eq(1).text();
               var majorName = td.eq(2).text();
               var grade = td.eq(3).text();
               var trackCode = td.eq(4).text();
               var profName = td.eq(5).text();
               var row = "<tr>"
                     + "<td>"
                     + "<input type=\"checkbox\" class=\"checkBox2\" name=\"check2\" value=\"" + majorNo + "\"" + ">"
                     + "</td>" 
                     + "<td>" + courseNo + "</td>"
                     + "<td>" + majorName + "</td>"
                     + "<td>" + grade + "</td>"
                     + "<td>" + trackCode + "</td>"
                     + "<td>" + profName + "</td>"
                     + "</tr>";

               // 숨긴 값의 체크박스를 false 상태로 바꿈
               $(this).prop("checked", false);
               tr.remove();
               
               $("#listAll > tbody").append(row);
               
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
                     
                     var majorNo = $(this).val();
                     var courseNo = td.eq(1).text();
                     var majorName = td.eq(2).text();
                     var grade = td.eq(3).text();
                     var trackCode = td.eq(4).text();
                     var profName = td.eq(5).text();
                     var row = "<tr> "
                           + "<td>"
                           + "<input type=\"checkbox\" class=\"checkBox\" name=\"check\" value=\"" + majorNo + "\"" + ">"
                           + "</td>" 
                           + "<td>" + courseNo + "</td>"
                           + "<td>" + majorName + "</td>"
                           + "<td>" + grade + "</td>"
                           + "<td>" + trackCode + "</td>"
                           + "<td>" + profName + "</td>"
                           + "</tr>";
                           
                     // 숨긴 값의 체크박스를 false 상태로 바꿈
                     $(this).prop("checked", false);
                     tr.remove();
                     $("#otherList > tbody").append(row);
                     $("#allCheck2").prop("checked", false);
                     });
                  });
   </script>
 
 
 
 
    <script>
   //submit 버튼
      $(document).ready(function(){
      
            var formObj = $("form[role='form']");
      
            console.log(formObj);
      
            $(".btn-light").on("click", function(){
               formObj.attr("method", "get");
               formObj.attr("action", "/user/mypage/myScore");
               formObj.submit();
            });
            
            //삭제
            $(".btn-danger").on("click",function() {
                     formObj.attr("action", "/user/usermajor/remove");
                     formObj.attr("method", "post");   
                     formObj.submit();
                     
            });
            
            //수정
            $(".btn-primary").on("click", function(){
               
               var send_array = Array();
               var send_cnt = 0;
               var chkbox = $(".checkBox2");
            


               for(i=0;i<chkbox.length;i++) {
                       send_array[send_cnt] = chkbox[i].value;
                       send_cnt++;
               }
               
               if(send_cnt == 0){
                  alert("과목을 추가해주세요.");
                  return false;
               }

               $("#arrayMajor").val(send_array);
               
            <%-- arrayMajor에 값이 제대로 들어갔는지 확인하는 alert 창   
               alert($("#arrayMajor").val());
            --%>   
                     
               formObj.submit();
               
               });
            });
</script>


<script>
//allCheck1 Function
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


//회차 - 숫자만 입력 (이한)
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






</html>