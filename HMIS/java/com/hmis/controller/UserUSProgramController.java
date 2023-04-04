package com.hmis.controller;

import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserVO;
import com.hmis.service.UserProgramService;

@Controller
@RequestMapping("user/userprogram/*")
public class UserUSProgramController {

   @Inject
   private UserProgramService service;
   private static Logger logger = LoggerFactory.getLogger(UserUSProgramController.class);

   //1. 학생::프로그램 신청 삭제
  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
   public String remove(@RequestParam("vo") int userProNo, SearchCriteria cri, RedirectAttributes rttr)
         throws Exception {

      service.remove(userProNo);

      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addAttribute("searchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());

      rttr.addFlashAttribute("msg", "SUCCESS");
      return "redirect:/userprogram/list";

   }
   
   @RequestMapping(value = "/remove", method = RequestMethod.POST)
   public String adremove(@RequestParam("userProNo") int userProNo, SearchCriteria cri, RedirectAttributes rttr)
         throws Exception {

      service.remove(userProNo);

      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addAttribute("searchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());

      rttr.addFlashAttribute("msg", "SUCCESS");
      return "redirect:/user/userprogram/list";

   }

   
    //2.  학생::내가 신청한 프로그램 리스트
      @RequestMapping(value = "/list", method = RequestMethod.GET)
      public void myScore(HttpServletRequest request, Model model) throws Exception {
         HttpSession session = request.getSession();
         UserVO uVo = (UserVO) session.getAttribute("login");
         int userNo = uVo.getUserNo();
         
         
         model.addAttribute(service.ProList(userNo));
         model.addAttribute("ProList", service.ProList(userNo));
   
}
      
      
      //3.  관리자 :: 프로그램신청 관리 - 승인대기 신청 상세 조회
      @RequestMapping(value = "/read", method = RequestMethod.GET)
      public void Read(@RequestParam("userProNo") int userProNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
         logger.info("User UsProgram Wait Read Page..");
         model.addAttribute(service.read(userProNo));
         

         
         logger.info("readPage.FileVO: " + service.fileList(userProNo).size());
         model.addAttribute("fileVO",service.fileList(userProNo));
      }

      

}