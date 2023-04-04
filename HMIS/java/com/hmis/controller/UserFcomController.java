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

import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.service.FcomService;

@Controller
@RequestMapping("/user/fcom/*")
public class UserFcomController {
	@Inject
	private FcomService service;

	private static final Logger logger = LoggerFactory.getLogger(FcomController.class);

	// 1. 학생 :: 가족기업 관리 - 가족기업 목록
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

	
	// 2. 학생 :: 가족기업 관리 - 가족기업 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("fcomNo") int fcomNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("fcom read get.,...........");
		model.addAttribute(service.read(fcomNo));

	}

}
