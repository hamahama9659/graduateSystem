package com.hmis.controller;

import java.util.List;

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

import com.hmis.domain.GraduationTestVO;
import com.hmis.domain.GraduationVO;
import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserVO;
import com.hmis.service.GraduationTestService;

@Controller
@RequestMapping("/user/graduation/*")
public class UserGraduationTestController {

   @Inject
   private GraduationTestService service;


   private static Logger logger = LoggerFactory.getLogger(UserGraduationTestController.class);

   //1. 학생 :: 졸업심사신청(GRADUATIONTEST) - 등록(신청)
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void registerGET(@RequestParam("userNo")int userNo, @RequestParam("graduNo")int graduNo ,Model model) throws Exception {

       
       model.addAttribute("graduNo", graduNo); 
       logger.info("graduNo : " + graduNo);
       model.addAttribute("userNo", userNo); 
       logger.info("userNo : " + userNo);
      model.addAttribute(service.esSelect(userNo));
      logger.info("read :userNo: " + service.esSelect(userNo));
   }


   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String registerPOST(GraduationTestVO vo, RedirectAttributes rttr) throws Exception {

      logger.info("User GraduationTest Register POST .......");

      logger.info("vo : " + vo);

      service.register(vo);

      rttr.addFlashAttribute("msg", "SUCCESS");

      return "redirect:/user/graduation/list";
   }

   //2. 학생 :: 졸업심사신청(GRADUATIONTEST) - 졸업 신청 상세조회
   @RequestMapping(value = "/read", method = RequestMethod.GET)
   public void read(@RequestParam("testNo") int testNo, Model model) throws Exception {

      logger.info("readPage.........");
      // 신청내용
      model.addAttribute(service.stuGraduTestRead(testNo));

/*      
      logger.info("readPage.fileVO: " + service.fileList(testNo).size());
      // 신청한 파일 리스트
      model.addAttribute("fileVO", service.fileList(testNo));
*/
      
   }

   //3. 학생 :: 졸업심사신청(GRADUATION) - GRADUATION 목록
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public void graduList(HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
         HttpSession session = request.getSession();
         UserVO uVo = (UserVO) session.getAttribute("login");
         int userNo = uVo.getUserNo();
      
         logger.info("read..... userNo : " + userNo);
         
      logger.info(" Graduation List Form.....");
      cri.setKeyword(Integer.toString(userNo));
      
      model.addAttribute("userNo", userNo);
     

      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(service.graduListSearchCount(cri));
      model.addAttribute("pageMaker", pageMaker);
      
     
      
      model.addAttribute("allList", service.graduList(cri));
      


   }
   
   //4. 학생 :: 졸업심사신청(GRADUATIONTEST) - 졸업 신청 상세조회 (팝업창 ---> 목적 : 승인여부 확인)
   @RequestMapping(value = "/testlist", method = RequestMethod.GET)
   public void list(HttpServletRequest request, Model model) throws Exception {
      logger.info("User Graduation List Form.....");
      logger.info("test.....");
      HttpSession session = request.getSession();
      UserVO uVo = (UserVO) session.getAttribute("login");
      int userNo = uVo.getUserNo();

      model.addAttribute("list", service.stuGraduTestList(userNo));


   }
   
 
    //5. 학생 :: 졸업인증신청 관리 - 신청 - 항목 명 검색
    @RequestMapping(value = "/searchGradu", method = RequestMethod.GET)
    public void searchSub(@RequestParam("title") String title, Model model) throws Exception {

       List<GraduationVO> graduListSearch = service.graduListSearch(title);

       logger.info("searchSub : " + graduListSearch.toString());
       model.addAttribute("searchSubList", graduListSearch);

      }
   //6.  학생 :: 졸업인증신청 관리 - 신청 - 항목 명 검색 팝업 + 졸업인증항목리스트
      @RequestMapping(value = "/searchPopup", method = RequestMethod.GET)
      public void searchPopup(@RequestParam("userNo") int userNo,  Model model) throws Exception {
         
         logger.info("saerchPopup......"+userNo);
         List<GraduationTestVO> graduTestList = service.graduTestList(userNo);
         
         model.addAttribute("graduTestList",graduTestList);

      }
}