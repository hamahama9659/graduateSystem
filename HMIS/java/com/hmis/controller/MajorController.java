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

import com.hmis.domain.MajorVO;
import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.service.MajorService;

@Controller
@RequestMapping("admin/major/*")
public class MajorController {

   private static final Logger logger = LoggerFactory.getLogger(MajorController.class);

   @Inject
   private MajorService service;
   
   
   
   
   	  // 1. 전공과목 등록페이지로 이동
      @RequestMapping(value = "/adRegister", method = RequestMethod.GET)
      public void adRegisterGET(MajorVO Vo, Model model,SearchCriteria cri) throws Exception {
         
         model.addAttribute(service.listProf(cri));
         model.addAttribute("pList", service.listProf(cri));
         logger.info("Major registerGET................");
         
      }

      // 2. 전공과목 등록
      @RequestMapping(value = "/adRegister", method = RequestMethod.POST)
      public String adRegisterPOST(MajorVO Vo, RedirectAttributes rttr) throws Exception {

         logger.info("Major registerPOST...............");
         logger.info(Vo.toString());

         service.adRegister(Vo);

         rttr.addFlashAttribute("msg", "SUCCESS");
         rttr.addFlashAttribute("Vo", Vo);

         return "redirect:/admin/major/list";

      }

      // 3. 전공과목 목록
      @RequestMapping(value = "/list", method = RequestMethod.GET)
      public void listGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

         logger.info("Major listGET..................");
         logger.info(cri.toString());

        
         
         PageMaker pageMaker = new PageMaker();
         pageMaker.setCri(cri);
         model.addAttribute("list", service.listSearch(cri));
         pageMaker.setTotalCount(service.listSearchCount(cri));
         
         model.addAttribute("pageMaker", pageMaker);
      }


      // 4. 전공과목 수정페이지로 이동
      @RequestMapping(value = "/adModify", method = RequestMethod.GET)
      public void adModifyGET(@RequestParam("majorNo") int majorNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
            throws Exception {

         logger.info("Major modifyGET....");
         model.addAttribute(service.adRead(majorNo));
         model.addAttribute("pList", service.listProf(cri));
      }

      // 5. 전공과목 수정
      @RequestMapping(value = "/adModify", method = RequestMethod.POST)
      public String adModifyPOST(MajorVO Vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {

         logger.info("Major modifyPOST.............");
         

         service.adModify(Vo);
         logger.info("servie.adModify.............");
         
         rttr.addAttribute("page", cri.getPage());
         rttr.addAttribute("perPageNum", cri.getPerPageNum());
         logger.info("perpagenum.............");
         rttr.addAttribute("searchType", cri.getSearchType());
         rttr.addAttribute("keyword", cri.getKeyword());
         
         rttr.addFlashAttribute("msg", "MODIFY");
         logger.info("addFlash msg, MODIFY.............");
         rttr.addFlashAttribute("Vo", Vo);
         logger.info("addFlash VO.............");

         return "redirect:/admin/major/list";
      }
      
      

      // 6. 전공과목 삭제
      @RequestMapping(value = "/adRemove", method = RequestMethod.GET)
      public String adRemovePOST(@RequestParam("majorNo") int majorNo, SearchCriteria cri, RedirectAttributes rttr)
            throws Exception {

         logger.info("Major removePOST..............");

         service.adRemove(majorNo);
         
         rttr.addAttribute("page", cri.getPage());
         rttr.addAttribute("perPageNum", cri.getPerPageNum());
         rttr.addAttribute("SearchType", cri.getSearchType());
         rttr.addAttribute("keyword", cri.getKeyword());
         
         rttr.addFlashAttribute("msg", "REMOVE");
         

         return "redirect:/admin/major/list";
      }
      
   
   
}