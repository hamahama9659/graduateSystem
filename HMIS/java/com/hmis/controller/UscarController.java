package com.hmis.controller;

import java.util.List;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.UscarVO;
import com.hmis.domain.UserVO;
import com.hmis.service.CarrierService;
import com.hmis.service.UscarService;

@Controller
@RequestMapping("user/mypage/myScore/*")
public class UscarController {

   private static final Logger logger = LoggerFactory.getLogger(UscarController.class);

   @Inject
   private UscarService USservice;

   @Inject
   private CarrierService service;

   // 1. 학생 :: 진로 선택 팝업창 -> 진로명 검생 결과 페이지
   @RequestMapping(value = "/searchCar", method = RequestMethod.GET)
   public void searchCar(@RequestParam("carName") String carName, Model model) throws Exception {

      List<CarrierVO> searchCarList = USservice.searchCar(carName);

      logger.info("searchCar : " + searchCarList.toString());
      model.addAttribute("searchCarList", searchCarList);

   }

   // 2. 학생 :: myPage/myScore -> 진로 목록 팝업창
   @RequestMapping(value = "/searchPopup", method = RequestMethod.GET)
   public void searchPopup(@RequestParam("userNo") int userNo, Model model) throws Exception {
      logger.info("saerchPopup......");
      List<CarrierVO> carList = USservice.carList(userNo);
      model.addAttribute("carList", carList);

   }

   // 3. 학생 :: 선택한 진로 목록 
   @RequestMapping(value = "/uscar", method = RequestMethod.GET)
   public void myScore(HttpServletRequest request, Model model) throws Exception {
      HttpSession session = request.getSession();
      UserVO uVo = (UserVO) session.getAttribute("login");
      int userNo = uVo.getUserNo();

      //logger.info("show all list......");
      model.addAttribute(service.listAll());
      model.addAttribute("listAll", service.listAll());
   }



   // 학생 :: myPage/myScore -> 진로 목록 팝업창

   /*
    * @RequestMapping(value = "/searchPopup", method = RequestMethod.GET) public
    * void searchPopup(Model model) throws Exception {
    * logger.info("saerchPopup......"); List<CarrierVO> carList =
    * USservice.carList(); model.addAttribute("carList", carList);
    */
   
   /*
    * @RequestMapping(value = "/searchPopup", method = RequestMethod.GET) public
    * void myScore(Model model,@RequestParam(value="make_date") String make_date)
    * throws Exception {
    * 
    * model.addAttribute("make_date", make_date);
    * 
    * 
    * 
    * }
    */

   
   // 학생 :: 졸업인증신청 관리 - 신청 - 항목 명 검색 팝업 + 졸업인증항목리스트
   /*
    * @RequestMapping(value = "/searchCar", method = RequestMethod.GET) public void
    * searchCar(@RequestParam("carName") String carName, Model model) throws
    * Exception {
    * 
    * List<CarrierVO> searchCarList = USservice.searchCar(carName);
    * 
    * logger.info("searchCar : " + searchCarList.toString());
    * model.addAttribute("searchCarList", searchCarList);
    * 
    * }
    */

   // 4. 학생 :: myPage/myScore -> 학생 진로 등록 GET
   @RequestMapping(value = "", method = RequestMethod.GET)
   public void registerGET() throws Exception {

      logger.info("register get ......");
   }

   /*
    * @RequestMapping(value = "register", method = RequestMethod.GET) public void
    * registerGET(UscarVO uscar, Model model) throws Exception {
    * 
    * logger.info("register get ......"); }
    */

   // 5. 학생 :: myPage/myScore -> 학생 진로 등록 POST
   @RequestMapping(value = "", method = RequestMethod.POST)
   public String registerPOST(UscarVO uscar, RedirectAttributes rttr) throws Exception {

      logger.info("Uscar Register POST .......");

      logger.info("uscar : " + uscar);

      USservice.register(uscar);

      rttr.addFlashAttribute("msg", "처리 완료되었습니다.");

      return "redirect:/user/mypage/myScore";
   }

   /*
    * @RequestMapping(value = "/uscar", method = RequestMethod.POST) public String
    * myScore(UscarVO uscar, Model model) throws Exception {
    * 
    * 
    * logger.info("register post ......"); logger.info(uscar.toString());
    * 
    * USservice.register(uscar);
    * 
    * model.addAttribute("result", "success");
    * 
    * return "redirect:/user/mypage/myScore"; }
    */
   
   /*
    * @RequestMapping(value = "", method = RequestMethod.POST) public String
    * registerPOST(UscarVO uscar, Model model) throws Exception {
    * 
    * logger.info("register post ......"); logger.info(uscar.toString());
    * 
    * USservice.register(uscar);
    * 
    * model.addAttribute("result", "success");
    * 
    * return "redirect:/user/mypage/myScore"; }
    */

   // 삭제 POST
   /*
    * @RequestMapping(value = "/uscarremove", method = RequestMethod.POST) public
    * String uscarremove(@RequestParam("uscarNo") int uscarNo,UscarVO uscar,
    * RedirectAttributes rttr) throws Exception {
    * 
    * 
    * logger.info("uscarremove post.................");
    * logger.info(uscar.toString()); USservice.remove(uscarNo);
    * 
    * rttr.addFlashAttribute("msg", "SUCCESS"); return
    * "redirect:/user/mypage/myScore"; }
    */

   // 로그아웃 GET
   @RequestMapping(value = "/uscarlogout", method = RequestMethod.GET)
   public String logout(HttpSession session) throws Exception {

      session.invalidate();

      return "redirect:/user/mypage/myScore";
   }

}