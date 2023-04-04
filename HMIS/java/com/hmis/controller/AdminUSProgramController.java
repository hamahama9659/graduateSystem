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
import com.hmis.domain.SearchCriteria;
import com.hmis.service.UserProgramService;

@Controller
@RequestMapping("admin/userprogram/*")
public class AdminUSProgramController {
   
   @Inject
   private UserProgramService service;
   private static Logger logger = LoggerFactory.getLogger(AdminUSProgramController.class);

   
   //1. 관리자 :: 유저프로그램 관리 - 신청 승인
      @RequestMapping(value = "/accept", method = RequestMethod.POST)
      public String accept( @RequestParam("userProNo") int userProNo, 
            @RequestParam("mapping") String mapping,
             RedirectAttributes rttr) throws Exception {
         logger.info("Admin Accept UserProgram");
         service.accept(userProNo);

         rttr.addFlashAttribute("msg", "승인 처리 되었습니다.");
         
         String url = "";
         if(mapping.equals("list")) {
            url = mapping;
         }

         return "redirect:/admin/userprogram/" + url;
      }

      //2. 관리자 :: 유저프로그램 관리 - 신청 거절
      @RequestMapping(value = "/deny", method = RequestMethod.POST)
      public String deny(@RequestParam("userProNo") int userProNo, 
            @RequestParam("mapping") String mapping,
            RedirectAttributes rttr) throws Exception {
         
         logger.info("Admin Deny UserProgram");
         service.deny(userProNo);

         rttr.addFlashAttribute("msg", "거절되었습니다.");
       
         String url = "";
         if(mapping.equals("list")) {
            url = mapping;
         }
         
         return "redirect:/admin/userprogram/" + url;
      }
   
   
   
      //3. 관리자 :: 졸업인증신청 관리 - 신청 목록
      @RequestMapping(value = "/list", method = RequestMethod.GET)
      public void list(
            
            @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
         logger.info("Admin Apply List Form.....");
         logger.info(cri.toString());
        
         
         
         
         
         model.addAttribute("adlistSearch", service.adlistSearch(cri));
         logger.info("검색중.....");
         PageMaker pageMaker = new PageMaker();
         pageMaker.setCri(cri);
         pageMaker.setTotalCount(service.adlistSearchCount(cri));

         model.addAttribute("pageMaker", pageMaker);

      }

         /*
          * logger.info("list.ProFileVO: " + service.fileList(userProNo).size());
          * model.addAttribute("ProFileVO", service.fileList(userProNo));
          */
      

      //4. 관리자 :: 프로그램신청 관리 - 승인대기 신청 상세 조회
      @RequestMapping(value = "/Read", method = RequestMethod.GET)
      public void Read(@RequestParam("userProNo") int userProNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
         logger.info("Admin UserProgram Wait Read Page..");
         model.addAttribute(service.adUserProgramRead(userProNo));
         

         
         logger.info("readPage.FileVO: " + service.fileList(userProNo).size());
         model.addAttribute("fileVO",service.fileList(userProNo));
      }
      
   

}