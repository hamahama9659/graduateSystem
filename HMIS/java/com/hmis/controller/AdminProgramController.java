package com.hmis.controller;

import javax.inject.Inject;

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
import com.hmis.domain.ProgramVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.service.ProgramService;
import com.hmis.service.UserProgramService;



@Controller
@RequestMapping("/admin/program/*")
public class AdminProgramController {
   
   @Inject
   private ProgramService service;
   
   @Inject
   private UserProgramService UPservice;
   
   
   private static Logger logger = LoggerFactory.getLogger(AdminProgramController.class);

   
   //1. 관리자:: 리스트 띄우기
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
   
   //2. 관리자 :: 글 등록 화면
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void registerGET() throws Exception {
      logger.info("Admin program register get..");

   }

   //3. 관리자 :: 글 등록
   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String registerPOST(ProgramVO vo, RedirectAttributes rttr) throws Exception {

      logger.info("Admin program Register POST .......");
      logger.info("vo : " + vo);

      service.register(vo);
      
      rttr.addFlashAttribute("msg", "register");
      
      return "redirect:/admin/program/list";
   }

   //4. 관리자 :: 상세보기
   @RequestMapping(value = "/read", method = RequestMethod.GET)
   public void read(@RequestParam("proNo") int proNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
      logger.info("readPage.........");
      //프로그램 내용
      model.addAttribute(service.read(proNo));
      
      //신청자 리스트
      
      logger.info("User list GET..."+ UPservice.adUserList(proNo));
      model.addAttribute(UPservice.adUserList(proNo));
      model.addAttribute("adUserList", UPservice.adUserList(proNo));
      
      //업로드한 파일 리스트
      
      logger.info("readPage.FileVO: " + service.fileList(proNo).size());
      model.addAttribute("fileVO",service.fileList(proNo));
   }
   
   //5. 관리자 :: 수정
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public void modifyGET(@RequestParam("proNo") int proNo,@ModelAttribute("cri") SearchCriteria cri,  Model model) throws Exception {

      logger.info("Admin program modifyGET....");
      model.addAttribute(service.read(proNo));
      model.addAttribute("fileVO",service.fileList(proNo));
   } 

   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public String modifyPOST(ProgramVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {

      logger.info("program modifyPOST.............");
      logger.info(cri.toString());
      
      service.modify(vo);

   /*   rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addAttribute("searchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());*/

      rttr.addFlashAttribute("msg", "MODIFY");
      rttr.addFlashAttribute("vo", vo);

      logger.info(rttr.toString());

      return "redirect:/admin/program/list";
   }
   
}