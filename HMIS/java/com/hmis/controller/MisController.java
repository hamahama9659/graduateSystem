package com.hmis.controller;

import java.util.List;

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

import com.hmis.domain.MisAttVO;
import com.hmis.domain.MisVO;
import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserVO;
import com.hmis.service.MisAttService;
import com.hmis.service.MisService;

@Controller
@RequestMapping("/admin/mis/*")
public class MisController {

	// inject 서비스마다 각각 하나씩 해줘야됨
	@Inject
	private MisService service;

	@Inject
	private MisAttService attService;

	private static final Logger logger = LoggerFactory.getLogger(MisController.class);

	// 리스트 띄우기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("MIS listGET...");
		
		
		model.addAttribute("list", service.list(cri));
		
		logger.info("list size: "+service.list(cri).size());

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);

	}

	// 글 등록 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(Model model) throws Exception {
		logger.info("register get..");

		List<UserVO> stuList = attService.stuList();
		model.addAttribute("stuList", stuList);

	}

	// 글 등록
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(MisVO mis, @RequestParam(value = "arrayUser", required = true) List<Integer> userNos,
			RedirectAttributes rttr) throws Exception {

		logger.info("register post...");
		logger.info(mis.toString());

		Integer misNo = service.register(mis);

		logger.info("misNo : " + misNo);
		mis.setMisNo(misNo);

		logger.info(mis.toString());

		// 출석 리스트 VO 설정하기, userNos=학생 여러명 넣기
		for (int i = 0; i < userNos.size(); i++) {

			MisAttVO aVo = new MisAttVO();
			aVo.setMisNo(misNo);
			aVo.setUserNo(userNos.get(i));
			aVo.setMisAttDate(mis.getMisDate());

			logger.info("misAtt userNos: " + aVo.getUserNo());
			attService.register(aVo);
		}

		rttr.addFlashAttribute("msg", "REGISTER");

		return "redirect:/admin/mis/list";
	}

	// 삭제하기
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePage(@RequestParam("misNo") int misNo, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.remove(misNo);
		attService.removeAtt(misNo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "REMOVE");

		return "redirect:/admin/mis/list";
	}

	// 수정하기
	/*
	 * @RequestMapping(value = "/read", method = RequestMethod.GET) public void
	 * updateGET(@RequestParam("misNo") int misNo,
	 * 
	 * @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	 * 
	 * List<UserVO> stuList = attService.stuList(); model.addAttribute("stuList",
	 * stuList);
	 * 
	 * model.addAttribute(service.read(misNo)); model.addAttribute("attList",
	 * attService.list(misNo));
	 * 
	 * 
	 * }
	 */

	// 수정, 상세페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void read(@RequestParam("misNo") int misNo, SearchCriteria cri, Model model) throws Exception {

		logger.info("read..... misNo : " + misNo);

		model.addAttribute("cri", cri); // cri
		model.addAttribute(service.read(misNo)); // MIS VO
		model.addAttribute("attList", attService.list(misNo));// 출석한 학생 LIST

		logger.info("==================================");

		model.addAttribute("stuOtherList", attService.stuOtherList(misNo));// 제외된 학생 LIST

	}
	
	// 수정 유지해서 값 넘김
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String updatePOST(MisVO mis, SearchCriteria cri, RedirectAttributes rttr,
			@RequestParam(value = "arrayUser", required = true) List<Integer> userNos) throws Exception {

		logger.info("misVO============" + mis);
		service.modify(mis);

		// 기존 리스트 삭제
		attService.removeAtt(mis.getMisNo());

		// 새로등록
		for (int i = 0; i < userNos.size(); i++) {

			MisAttVO aVo = new MisAttVO();

			aVo.setMisNo(mis.getMisNo());
			aVo.setUserNo(userNos.get(i));
			aVo.setMisAttDate(mis.getMisDate());

			logger.info("misAtt userNos: " + aVo.getUserNo());
			attService.register(aVo);

		}

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		
		rttr.addFlashAttribute("msg", "MODIFY");

		return "redirect:/admin/mis/list";

	}
	
}
