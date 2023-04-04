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

import com.hmis.domain.FcomVO;
import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.service.FcomService;

@Controller
@RequestMapping("/admin/fcom/*")
public class FcomController {

   @Inject
   private FcomService service;

   private static final Logger logger = LoggerFactory.getLogger(FcomController.class);

   // 1. 관리자 :: 가족기업 관리 - 가족기업 목록
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

      logger.info(cri.toString()); // 정보 확인
      logger.info("get fcom list......................"); // 정보 확인
      model.addAttribute("list", service.listSearch(cri));
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(service.listSearchCount(cri));
      model.addAttribute("pageMaker", pageMaker);

      logger.info("get fcom list......................"); // 정보 확인

   }
   
   
   // 2. 관리자 :: 가족기업 관리 - 등록
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void adregistGET(FcomVO fcom,Model model) throws Exception {
      logger.info("adregister get.,...........");
   }

   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String adregistPOST(FcomVO fcom, RedirectAttributes rttr) throws Exception {
      logger.info("regist post...........");
      logger.info(fcom.toString());

      service.adregist(fcom);

      rttr.addFlashAttribute("msg", "SUCCESS");
        rttr.addFlashAttribute("fcom", fcom);
        
      return "redirect:/admin/fcom/list";

   }

   // 3. 관리자 :: 가족기업 관리 - 가족기업 목록
   @RequestMapping(value = "/read", method = RequestMethod.GET)
   public void read(@RequestParam("fcomNo") int fcomNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
         throws Exception {
      logger.info("fcom read get.,...........");
      model.addAttribute(service.read(fcomNo));

   }

   // 4. 관리자 :: 가족기업 관리 - 가족기업 삭제
   @RequestMapping(value = "/remove", method = RequestMethod.POST)
   public String adremove(@RequestParam("fcomNo") int fcomNo, SearchCriteria cri, RedirectAttributes rttr)
         throws Exception {

      service.adremove(fcomNo);

      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addAttribute("searchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());

      rttr.addFlashAttribute("msg", "REMOVE");
      return "redirect:/admin/fcom/list";

   }

   // 5. 관리자 :: 가족기업 관리 - 가족기업 수정
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public void modifyGET(@RequestParam("fcomNo") int fcomNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
         throws Exception {

      model.addAttribute(service.read(fcomNo));

   }

   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public String modifyPOST(FcomVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
         throws Exception {

      logger.info(cri.toString());
      
      service.admodify(vo);
      logger.info("fcom modify post ....................");
      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addAttribute("searchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());

      rttr.addFlashAttribute("msg", "MODIFY");
      rttr.addFlashAttribute("vo", "vo");

      logger.info("fcom modify post ....................");


      return "redirect:/admin/fcom/list";
   }

}