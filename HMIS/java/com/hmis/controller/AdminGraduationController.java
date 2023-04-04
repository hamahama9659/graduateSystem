package com.hmis.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hmis.domain.ApplyVO;
import com.hmis.domain.GraduationVO;
import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.SubjectVO;
import com.hmis.service.ApplyService;
import com.hmis.service.GraduationService;
import com.hmis.service.GraduationTestService;

@Controller
@RequestMapping("admin/graduation/*")
public class AdminGraduationController {

   private static final Logger logger = LoggerFactory.getLogger(AdminGraduationController.class);

   @Inject
   private GraduationService service;
   
   @Inject
   private GraduationTestService testservice;
   
   @Inject
   private ApplyService ApplyService;

   //1.  관리자:: 졸업심사 등록폼으로 이동
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void registerGET(GraduationVO vo, Model model) throws Exception {

      logger.info("graduation register GET................");
   }

   //2.  관리자::졸업심사 등록
   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String registerPOST(GraduationVO vo, RedirectAttributes rttr) throws Exception {

      logger.info("graduation registerPOST...............");
      logger.info(vo.toString());

      service.adRegister(vo);

      rttr.addFlashAttribute("msg", "SUCCESS");
      rttr.addFlashAttribute("vo", vo);

      return "redirect:/admin/graduation/list";

   }

   //3.  관리자:: 졸업심사 수정폼으로 이동
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public void modifyGET(@RequestParam("graduNo") int graduNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
         throws Exception {

      logger.info("Admin graduation modify GET....");
      model.addAttribute(service.adRead(graduNo));

      logger.info(cri.toString());
   }

   //4. 관리자:: 졸업심사 수정
   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public String modifyPOST(GraduationVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
         throws Exception {

      logger.info("Admin graduation modify POST.............");
      logger.info(cri.toString());

      service.adModify(vo);
      
      
      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      logger.info("perpagenum.............");
      rttr.addAttribute("searchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());
      
      rttr.addFlashAttribute("msg", "MODIFY");
      rttr.addFlashAttribute("vo", vo);

      logger.info(rttr.toString());

      return "redirect:/admin/graduation/list";
   }
   
   //5. 관리자:: 졸업심사 목록
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public void listGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

      logger.info("Admin graduation list GET..................");
      logger.info(cri.toString());

    
      model.addAttribute("listSearch", service.listSearch(cri));
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(service.listSearchCount(cri));
      
      model.addAttribute("pageMaker", pageMaker);
   }
   
   
   
//6. 관리자::  졸업심사 관리(GRADUATIONTEST) - 모든 학생 신청 목록 (전체)
   @RequestMapping(value = "/testlist", method = RequestMethod.GET)
   public void adGraduTestListSearch(@ModelAttribute("cri") SearchCriteria cri,@RequestParam("graduNo")int graduNo, Model model) throws Exception {

      logger.info("Admin GraduTest List Search Form.....");
      logger.info(cri.toString());

     
      model.addAttribute("allList", testservice.adGraduTestListSearch(cri, graduNo));


   }   
   @RequestMapping(value = "/testmodify", method = RequestMethod.GET)
   public void read(@RequestParam("testNo") int testNo,
                @RequestParam("userNo") int userNo, @RequestParam("graduNo") int graduNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
         throws Exception {
      logger.info("Admin testmodify Read....");

       model.addAttribute("GraduationTestVO",testservice.adGraduTestRead(testNo));
       model.addAttribute("totalDTO",testservice.esSelect(userNo));
       model.addAttribute("acceptList", ApplyService.acceptList(userNo));
   }



 
 
//7. 관리자:: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 승인 (승인)
 @RequestMapping(value = "/accept", method = RequestMethod.POST)
 public String accept(@RequestParam("testNo") int testNo, ApplyVO aVO, HttpServletRequest req,
       @RequestParam("mapping") String mapping, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
       throws Exception {

    logger.info("Admin Accept GraduationTest");
    
    logger.info("aVO : " + aVO);
    
    testservice.accept(testNo, aVO);

    rttr.addFlashAttribute("msg", "SUCCESS");
    String url = "testmodify?";
    
    if(mapping != null) {
       
        url += mapping;
     }
    
    return "redirect:/admin/graduation/"+url;
 }

 
   //8. 관리자::  졸업심사 관리(GRADUATIONTEST) - 졸업심사 거절 (거절)
   @RequestMapping(value = "/deny", method = RequestMethod.POST)
   public String deny(@RequestParam("testNo") int testNo, 
         @RequestParam("mapping") String mapping, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
         throws Exception {
      
      logger.info("Admin Deny GraduationTest");
      testservice.deny(testNo);
      
      rttr.addFlashAttribute("msg", "DENY");
      
      String url = "testmodify?";
      
      if(mapping != null) {
         
          url += mapping;
       }


      return "redirect:/admin/graduation/"+url;
   }
 

 //9. 학생 :: 졸업인증신청 관리 - 신청 - 항목 명 검색 팝업 + 졸업인증항목리스트
   @RequestMapping(value = "/searchPopup", method = RequestMethod.GET)
   public void searchPopup(Model model) throws Exception {
      logger.info("saerchPopup......");
      List<SubjectVO> subList = testservice.subList();
      model.addAttribute("subList", subList);
      logger.info("saerchPopup......" + subList);
   }

 //10.  학생 :: 졸업인증신청 관리 - 신청 - 항목 명 검색
 @RequestMapping(value = "/searchSub", method = RequestMethod.GET)
 public void searchSub(@RequestParam("subName") String subName, Model model) throws Exception {

    List<SubjectVO> searchSubList = testservice.searchSub(subName);

    logger.info("searchSub : " + searchSubList.toString());
    model.addAttribute("searchSubList", searchSubList);

 }
 
 
 
 @RequestMapping(value = "/graduateToBeList", method=RequestMethod.GET)
 public void graduateToBeListGET(Model model) throws Exception {
       
    logger.info("user graduateToBeListGET..................");
 
    
    model.addAttribute("graduateToBeList", testservice.graduateToBeList());
  
    
 }
 
}