package com.hmis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmis.domain.UserVO;
import com.hmis.service.ApplyService;
import com.hmis.service.StatisticsService;
import com.hmis.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserMainController {

	@Inject
	private ApplyService service;
	
	@Inject
	private UserService userService;
	
	@Inject StatisticsService sService;

	private static Logger logger = LoggerFactory.getLogger(AdminApplyController.class);

	@RequestMapping("/main")
	public void main(HttpServletRequest request, Model model) throws Exception {
		logger.info("User Main........");

		HttpSession session = request.getSession();

		UserVO uVo = (UserVO) session.getAttribute("login");
		int userNo = uVo.getUserNo();

		model.addAttribute(service.esSelect(userNo));
		model.addAttribute("mainApplyWaitList", userService.mainApplyWaitList(userNo));
		model.addAttribute("certList", sService.mainList());

	}

}
