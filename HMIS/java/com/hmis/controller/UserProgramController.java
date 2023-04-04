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

import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;
import com.hmis.domain.UserVO;
import com.hmis.service.ProgramService;
import com.hmis.service.UserProgramService;

@Controller
@RequestMapping("/user/program/*")
public class UserProgramController {
   
   @Inject
   private ProgramService service;
   
   @Inject
   private UserProgramService UPservice;
   
   private static Logger logger = LoggerFactory.getLogger(AdminApplyController.class);

   
   //1. 학생 :: 리스트 띄우기
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

      logger.info("Program listGET...");
    
      
      model.addAttribute("list", service.listSearch(cri));
      
      logger.info("list size: "+service.listSearch(cri).size());

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(service.listSearchCount(cri));

      model.addAttribute("pageMaker", pageMaker);

   }
   
   

   //2.  학생::상세보기
   @RequestMapping(value = "/read", method = RequestMethod.GET)
   public void read(@RequestParam("proNo") int proNo, Model model, HttpServletRequest request) throws Exception {
      logger.info("readPage.........");
      
      HttpSession session = request.getSession();
      UserVO uVo = (UserVO) session.getAttribute("login");
      int userNo = uVo.getUserNo();
      
      //프로그램 내용
      model.addAttribute(service.read(proNo));
      
      
      //신청 후 '신청'버튼 숨김
      model.addAttribute("userNo", userNo);
      model.addAttribute("stateCheck", service.stateCheck(proNo, userNo));
      logger.info("read.UserProgramVO: " + service.stateCheck(proNo, userNo));
      
      //업로드한 파일 리스트
      logger.info("readPage.adProFileVO: " + service.fileList(proNo).size());
      model.addAttribute("fileVO",service.fileList(proNo));
   }
   
   //3. 학생::프로그램 신청
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void registerGET(@RequestParam("proNo") int proNo, Model model) throws Exception {
      logger.info("User Apply Register .......");
      model.addAttribute(service.read(proNo));
   }

   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String registerPOST(UserProgramVO vo, RedirectAttributes rttr) throws Exception {
      logger.info("User Program Register POST .......");
      
      logger.info("vo : " + vo);

      UPservice.register(vo);
      
      rttr.addFlashAttribute("msg", "처리 완료되었습니다.");
      
      return "redirect:/user/program/list";
   }
   

}