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

import com.hmis.domain.ApplyVO;
import com.hmis.domain.SubjectVO;
import com.hmis.domain.UserVO;
import com.hmis.service.ApplyService;

@Controller
@RequestMapping("/user/apply/*")
public class UserApplyController {

	@Inject
	private ApplyService service;

	private static Logger logger = LoggerFactory.getLogger(UserApplyController.class);

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("User Apply Register .......");
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerPOST(ApplyVO aVo, RedirectAttributes rttr) throws Exception {
		logger.info("User Apply Register POST .......");
		
		logger.info("aVo : " + aVo);

		service.register(aVo);
		
		rttr.addFlashAttribute("msg", "처리 완료되었습니다.");
		
		return "redirect:list";
	}

	// 학생 :: 졸업인증신청 관리 - 신청 - 항목 명 검색 팝업 + 졸업인증항목리스트
	@RequestMapping(value = "/searchPopup", method = RequestMethod.GET)
	public void searchPopup(Model model) throws Exception {
		logger.info("saerchPopup......");
		List<SubjectVO> subList = service.subList();
		model.addAttribute("subList", subList);

	}

	// 학생 :: 졸업인증신청 관리 - 신청 - 항목 명 검색
	@RequestMapping(value = "/searchSub", method = RequestMethod.GET)
	public void searchSub(@RequestParam("subName") String subName, Model model) throws Exception {

		List<SubjectVO> searchSubList = service.searchSub(subName);

		logger.info("searchSub : " + searchSubList.toString());
		model.addAttribute("searchSubList", searchSubList);

	}

	// 학생 :: 졸업인증신청 관리 - 한 학생의 신청 내역 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpServletRequest request, Model model) throws Exception {
		logger.info("User Apply List Form.....");
		
		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");
		int userNo = uVo.getUserNo();

		model.addAttribute("list", service.stuApplyList(userNo));


	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("applyNo") int applyNo, Model model) throws Exception {
		logger.info("readPage.........");
		//신청내용
		model.addAttribute(service.stuApplyRead(applyNo));
		//신청한 파일 리스트
		
		logger.info("readPage.fileVO: " + service.fileList(applyNo).size());
		model.addAttribute("fileVO",service.fileList(applyNo));
	}

}
