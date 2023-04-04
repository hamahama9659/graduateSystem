package com.hmis.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.UserVO;
import com.hmis.service.CarrierService;

@Controller
@RequestMapping("admin/carrier/*")
public class AdminCarrierController {
   private static final Logger logger = LoggerFactory.getLogger(AdminCarrierController.class);

   @Inject
   private CarrierService service;

   // 1. 관리자 :: 진로 작성
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void registGET(CarrierVO Carrier, Model model) throws Exception {
      logger.info("adregister get.................");
   }

   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String registPOST(CarrierVO Carrier, RedirectAttributes rttr) throws Exception {
      logger.info("regist post.................");
      logger.info(Carrier.toString());

      service.adregist(Carrier);

      rttr.addFlashAttribute("msg", "SUCCESS");

      rttr.addFlashAttribute("Carrier", Carrier);

      return "redirect:/admin/carrier/listAll";

   }

   // 2. 관리자 :: 진로 삭제
   @RequestMapping(value = "/adremove", method = RequestMethod.GET)
   public String adremove(@RequestParam("carNo") int carNo, CarrierVO Carrier, RedirectAttributes rttr)
         throws Exception {
      logger.info("adremove post.................");
      logger.info(Carrier.toString());
      service.adremove(carNo);

      rttr.addFlashAttribute("msg", "REMOVE");
      return "redirect:/admin/carrier/listAll";

   }

   // 3. 관리자 :: 진로 목록
   @RequestMapping(value = "/listAll", method = RequestMethod.GET)
   public void myScore(HttpServletRequest request, Model model) throws Exception {
      HttpSession session = request.getSession();
      UserVO uVo = (UserVO) session.getAttribute("login");
      int userNo = uVo.getUserNo();

      logger.info("show all list......................");
      model.addAttribute(service.listAll());
      model.addAttribute("listAll", service.listAll());

   }

   // 4. 관리자 :: 진로 중복등록 체크
   @RequestMapping(value = "/checkCarName", method = RequestMethod.GET)
   @ResponseBody
   public boolean checkCarName(@RequestParam("carName") String carName) throws Exception {
      logger.info("Check Car Name");
      boolean check = false;
      int count = service.checkCarName(carName);

      if (count == 0) {
         check = true;
      } else {
         check = false;
      }

      logger.info("Check Val : " + check);

      return check;
   }

}