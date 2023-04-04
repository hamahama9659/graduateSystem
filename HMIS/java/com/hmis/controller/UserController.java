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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserVO;
import com.hmis.service.UserService;

@Controller
@RequestMapping("admin/user/*")
public class UserController {

   @Inject
   private UserService service;

   private static Logger logger = LoggerFactory.getLogger(UserController.class);

   //1. 학생:: 등록폼으로 이동
   @RequestMapping(value = "/register", method=RequestMethod.GET)
   public void registerGET(UserVO uVo, Model model) throws Exception {
      
      logger.info("user registerGET..............");
   }
   
   //2. 학생:: 등록
   @RequestMapping(value = "/register", method=RequestMethod.POST)
   public String registerPOST(UserVO uVo, RedirectAttributes rttr) throws Exception {
      
      logger.info("user registerPOST.............");
      logger.info(uVo.toString());
      
      service.register(uVo);
      
      rttr.addFlashAttribute("msg", "SUCCESS");
      rttr.addFlashAttribute("uVo", uVo);
      
      return "redirect:/admin/user/list";
   }
   
   //3. 학생 :: 목록
   @RequestMapping(value = "/list", method=RequestMethod.GET)
   public void listGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
      
      logger.info("user listGET..................");
      logger.info(cri.toString());
      
      
      logger.info("service.list(cri): " + service.list(cri).size());
      
      model.addAttribute("list", service.listSearch(cri));
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      
      pageMaker.setTotalCount(service.listSearchCount(cri));
      
      model.addAttribute("pageMaker", pageMaker);
   }
   
                      
   @RequestMapping(value = "/graduateList", method=RequestMethod.GET)
   public void graduateListGET(Model model) throws Exception {
         
      logger.info("user graduateListGET..................");
   
      
      model.addAttribute("graduateList", service.graduateList());
      
      
   }
   
   
   

   
   
   
   //4. 학생 :: 수정폼으로 이동
   @RequestMapping(value = "/modify", method=RequestMethod.GET)
   public void modifyGET(@RequestParam("userNo") int userNo, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
      
      logger.info("user modifyGET...............");
      model.addAttribute(service.read(userNo));
   }
   
   //5. 학생 :: 수정
   @RequestMapping(value = "/modify", method=RequestMethod.POST)
   public String modifyPOST(UserVO uVo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
      
      logger.info("user modifyPOST..............");
      
      service.modify(uVo);
      
      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addAttribute("searchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());
      
      rttr.addFlashAttribute("msg", "MODIFY");
      rttr.addFlashAttribute("uVo", uVo);
      
      return "redirect:/admin/user/list";
   }
   
   //6. 학생 :: 삭제
   @RequestMapping(value = "/remove", method=RequestMethod.GET)
   public String remove(@RequestParam("userNo") int userNo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
      
      logger.info("user removeGET..............");
      
      service.remove(userNo);
      
      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addAttribute("SearchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());
      
      rttr.addFlashAttribute("msg", "REMOVE");
      
      return "redirect:/admin/user/list";
   }

   //7. 관리자 :: 학생 등록 - 학번 중복체크 AJAX.
   @RequestMapping(value = "/checkUserNo", method = RequestMethod.GET)
   @ResponseBody
   public boolean checkUserNo(@RequestParam("userNo") int userNo) throws Exception {
      logger.info("Check User No");
      boolean check = false;
      int count = service.checkUserNo(userNo);
      
      if(count == 0) {
         check = true;
      } else {
         check = false;
      }
      
      logger.info("Check Val : " + check);
      
      return check;
   }
}