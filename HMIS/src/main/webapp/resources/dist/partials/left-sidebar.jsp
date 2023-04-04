<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Topbar Start -->
<!-- ========== Left Sidebar Start ========== -->
<div class="left-side-menu">

   <div class="slimscroll-menu" id="left-side-menu-container">


<!-- LOGO -->
       <a href="/admin/main" class="logo text-center"> <span
         class="hmis-lg"> <img
            src="/resources/dist/assets/images/hmis_logoW.png" alt="" height="25"
            id=""></span>   
            <span class="logo-sm"> <img
            src="/resources/dist/assets/images/logo_sm.png" alt="" height="16"
            id="side-sm-main-logo">
      </span>
      </a> 


      <!--- Sidemenu -->
      <ul class="metismenu side-nav">


         <li class="side-nav-title side-nav-item">CATEGORY</li>



         <!--- Dashboards -->
         <li class="side-nav-item"><a href="/admin/main"
            class="side-nav-link"> <i class="mdi mdi-home"></i> <span
               class="badge badge-success float-right"></span> <span> HOME
            </span>
         </a></li>



         <!--- 출결관리  -->
         <li class="side-nav-item"><a href="/admin/mis/list"
            class="side-nav-link"> <i
               class=" mdi mdi-account-multiple-check"></i> <span
               class="badge badge-success float-right"></span> <span> MIS
                  출결</span>
         </a></li>




         <!--- 프로그램 관리  -->
         <li class="side-nav-item"><a href="javascript: void(0);"
            class="side-nav-link"> <i class="mdi mdi-tablet"></i> <span
               class="badge badge-success float-right"></span> <span> 프로그램</span>
               <span class="menu-arrow"></span>
         </a>
            <ul class="side-nav-second-level" aria-expanded="false">
               <li><a href="/admin/program/list">프로그램 목록</a></li>
               <li><a href="/admin/userprogram/list">프로그램 신청자 목록</a></li>
            </ul></li>




         <!--- 졸업인증신청 관리  -->
         <li class="side-nav-item"><a href="javascript: void(0);"
            class="side-nav-link"> <i class="mdi mdi-account-card-details"></i>
               <span> 자격증</span> <span class="menu-arrow"></span>
         </a>
            <ul class="side-nav-second-level" aria-expanded="false">

               <li><a href="/admin/apply/list">전체 내역</a></li>
               <li><a href="/admin/apply/waitList">승인 대기</a></li>

            </ul></li>


         <!--- 졸업인증평가 관리  -->
         <li class="side-nav-item"><a href="javascript: void(0);"
            class="side-nav-link"> <i class="mdi mdi-school"></i> <span
               class="badge badge-success float-right"></span> <span> 졸업</span> <span
               class="menu-arrow"></span>
         </a>

            <ul class="side-nav-second-level" aria-expanded="false">
               <li><a href="/admin/graduation/list">졸업심사</a></li>
               <li><a href="/admin/estimation/list">학생 졸업점수 현황</a></li>
               <li><a href="/admin/statistics/list">자격증 취득현황</a></li>

            </ul></li>





         <!--- 수정 추후 예정  -->
         <!--- 수정 추후 예정  -->

         <!--- 수정 추후 예정  -->
         <!--- 수정 추후 예정  -->




         <!--- 가족기업  -->
         <!-- 
         <li class="side-nav-item"><a href="javascript: void(0);"
            class="side-nav-link"> <i class="mdi mdi-office-building"></i> <span
               class="badge badge-success float-right"></span> <span> 가족 기업 관리
            </span>
         </a></li>

 -->

         <li class="side-nav-item"><a href="javascript: void(0);"
            class="side-nav-link"> <i class="mdi mdi-city-variant-outline"></i>
               <span class="badge badge-success float-right"></span> <span>
                  가족 기업</span> <span class="menu-arrow"></span>
         </a>

            <ul class="side-nav-second-level" aria-expanded="false">
               <li><a href="/admin/fcom/list">가족 기업 목록</a></li>


            </ul></li>






         <!--- 기초정보 관리  -->
         <li class="side-nav-item"><a href="javascript: void(0);"
            class="side-nav-link"> <!-- <i class="dripicons-view-apps"></i> -->
               <i class="mdi mdi-database"></i> <span>기초 정보 관리 </span> <span
               class="menu-arrow"></span>
         </a>
            <ul class="side-nav-second-level" aria-expanded="false">
               <li><a href="/admin/user/list">학생 등록 및 정보 관리</a></li>
               <li><a href="/admin/major/list">전공 등록 및 관리</a></li>
               <li><a href="/admin/subject/list">자격증 등록 및 관리</a></li>
               <li><a href="/admin/carrier/listAll">진로 분야 등록 및 관리</a></li>
            </ul></li>

         <li class="side-nav-item"><a href="/admin/QnA/list"
            class="side-nav-link"> <i class="mdi mdi-comment-question"></i>
               <span> 사용자 문의 </span>
         </a></li>

      </ul>


      <!-- Help Box -->
      <div class="help-box text-white text-center">
         <a href="javascript: void(0);"
            class="float-right close-btn text-white"> <i
            class="mdi mdi-close"></i>
         </a> <img src="/resources/dist/assets/images/help-icon.svg" height="90"
            alt="Helper Icon Image" />
         <h5 class="mt-3">시스템 관련 문의</h5>
         <p class="mb-3">시스템 관련 문의는 Email로 부탁드립니다.</p>
         <a href="tel:042-629-6711" class="btn btn-outline-light btn-sm">연락하기</a>
      </div>
      <!-- end Help Box -->
      <!-- End Sidebar -->


      <div class="clearfix"></div>


   </div>
   <!-- Sidebar -left -->

</div>
<!-- Left Sidebar End -->
