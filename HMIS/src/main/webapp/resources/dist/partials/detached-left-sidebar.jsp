<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Topbar Start -->
<div class="left-side-menu left-side-menu-detached">

   <div class="leftbar-user">
      <a href="javascript: void(0);"> <img
         src="/resources/dist/assets/images/users/avatar-1.jpg"
         alt="user-image" height="42" class="rounded-circle shadow-sm">
         <span class="leftbar-user-name">${login.userName} 님</span>
          <small><a href="/user/mypage/myInfo">내 정보 수정</a></small>
      </a>
   </div>

   <!--- Sidemenu -->
   <ul class="metismenu side-nav side-nav-light">

      <li class="side-nav-title side-nav-item">카테고리</li>


      <li class="side-nav-item"><a href="/user/main"
         class="side-nav-link"> <i class="mdi mdi-home"></i> <span>
               전체 </span>
      </a></li>


      <li class="side-nav-item"><a href="/user/mypage/myScore"
         class="side-nav-link"> <i class="  mdi mdi-clipboard-text"></i> <span>
               내 포트폴리오 </span>
      </a></li>


      <li class="side-nav-item"><a href="/user/apply/list"
         class="side-nav-link"> <i class=" mdi mdi-note-multiple"></i> <span>
               취득 자격증 관리 </span>
      </a></li>
      
      
   <!-- 프로그램 관리   -->
         <li class="side-nav-item"><a href="javascript: void(0);"
            class="side-nav-link"> <i class="mdi mdi-human-greeting"></i> <span
               class="badge badge-success float-right"></span> <span> 프로그램</span>
               <span class="menu-arrow"></span>
         </a>
            <ul class="side-nav-second-level" aria-expanded="false">
               <li><a href="/user/program/list">프로그램 목록</a></li>
               <li><a href="/user/userprogram/list">프로그램 신청목록</a></li>
            </ul></li>

      <!-- <li class="side-nav-item"><a href="/user/program/list"
         class="side-nav-link"> <i class="  mdi mdi-human-greeting"></i> <span>
               프로그램 신청 </span>
      </a></li> -->



      <li class="side-nav-item"><a href="/user/graduation/list"
         class="side-nav-link"> <i class=" mdi mdi-school"></i> <span>
               졸업 심사 신청 </span>
      </a></li>



      <li class="side-nav-item"><a href="/user/fcom/list"
         class="side-nav-link"> <i class="mdi mdi-office-building"></i> <span>
               가족 기업 </span>
      </a></li>


      <li class="side-nav-item"><a href="/user/QnA/list"
         class="side-nav-link"> <i class="mdi mdi-comment-question"></i> <span>
               Q&A </span>
      </a></li>

   </ul>

   <!-- Help Box -->
   <div class="help-box help-box-light text-center">
      <a href="javascript: void(0);" class="float-right close-btn text-body">
         <i class="mdi mdi-close"></i>
      </a> <img src="/resources/dist/assets/images/help-icon.svg" height="90"
         alt="Helper Icon Image" />
      <h5 class="mt-3">졸업 인증 문의</h5>
      <p class="mb-3">졸업 인증 관련 자세한 사항은 학과 사무실로 연락부탁드립니다.</p>
      <a href="tel:042-629-6711" class="btn btn-outline-primary btn-sm">연락하기</a>
   </div>
   <!-- end Help Box -->
   <!-- End Sidebar -->

   <div class="clearfix"></div>
   <!-- Sidebar -left -->

</div>
<!-- Left Sidebar End -->