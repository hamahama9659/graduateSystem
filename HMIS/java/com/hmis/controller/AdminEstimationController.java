package com.hmis.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmis.domain.ApplyVO;
import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.TotalDTO;
import com.hmis.service.ApplyService;

@Controller
@RequestMapping("/admin/estimation/*")
public class AdminEstimationController {

	@Inject
	private ApplyService service;

	private static Logger logger = LoggerFactory.getLogger(AdminApplyController.class);

	// 관리자 :: 졸업인증신청 관리 - 신청 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("Admin Estimation List....");
		
		model.addAttribute("esList", service.esList(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.esListCount(cri));

		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("userNo") int userNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("Admin Estimation Read....");

		model.addAttribute(service.esSelect(userNo));
		model.addAttribute("acceptList", service.acceptList(userNo));

	}

	@RequestMapping(value = "/excelEsListDown", method = RequestMethod.GET)
	public void excelEsListDown(HttpServletResponse response) throws Exception {

		List<TotalDTO> list = service.excelEsList();

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("졸업인증평가 총점목록");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();

		Font headerFont = wb.createFont();
		headerFont.setFontName("맑은 고딕 Semilight");
		headerFont.setBold(true);

		Font bodyFont = wb.createFont();
		bodyFont.setFontName("맑은 고딕 Semilight");

		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 노란색입니다.
		headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_25_PERCENT.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 헤더 폰트 셋팅
		headStyle.setFont(headerFont);

		// 데이터용 경계 스타일 테두리만 지정
		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);

		// 바디 폰트 셋팅
		bodyStyle.setFont(bodyFont);

		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("NO");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("학번");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이름");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("총점");

		// 데이터 부분 생성
		for (TotalDTO tDto : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(rowNo - 1);
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(tDto.getUserNo());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(tDto.getUserName());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(tDto.getTotal());

		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		String fileName = "졸업인증평가_목록.xls";
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "utf-8") + ";");

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();

	}

	@RequestMapping(value = "/excelEsSelectDown", method = RequestMethod.GET)
	public void excelEsSelectDown(HttpServletResponse response, @RequestParam("userNo") int userNo) throws Exception {

		TotalDTO tDTO = service.esSelect(userNo);

		List<ApplyVO> acceptList = service.acceptList(userNo);

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("졸업인증평가_" + tDTO.getUserNo() + "_" + tDTO.getUserName() + "_총점상세목록");
		sheet.setColumnWidth((short)1, (short)5000);
		sheet.setColumnWidth((short)3, (short)5000);
		Row row = null;
		// Row row1 = null;
		Cell cell = null;
		int rowNo = 0;

		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 4));
		sheet.addMergedRegion(new CellRangeAddress(4, 4, 0, 3));
		sheet.addMergedRegion(new CellRangeAddress(8, 8, 0, 4));

		Font headerFont = wb.createFont();
		headerFont.setFontName("맑은 고딕 Semilight");
		headerFont.setBold(true);

		Font bodyFont = wb.createFont();
		bodyFont.setFontName("맑은 고딕 Semilight");

		// 테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 노란색입니다.
		headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_25_PERCENT.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 폰트 지정
		headStyle.setFont(headerFont);

		// 데이터용 경계 스타일 테두리만 지정
		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);

		bodyStyle.setAlignment(HorizontalAlignment.CENTER);

		bodyStyle.setFont(bodyFont);

		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("학생정보");
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("학번");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이름");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("학년");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("학적상태");
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("총점");

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue(tDTO.getUserNo());
		cell = row.createCell(1);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue(tDTO.getUserName());
		cell = row.createCell(2);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue(tDTO.getGrade());
		cell = row.createCell(3);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue(tDTO.getState());
		cell = row.createCell(4);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue(tDTO.getTotal());

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");
		cell = row.createCell(3);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");
		cell = row.createCell(4);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("MIS 총점");

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("분류");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("영역");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("항목명");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("총점");

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("필수");
		cell = row.createCell(1);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("학생활동/봉사");
		cell = row.createCell(2);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("MIS");
		cell = row.createCell(3);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue(tDTO.getMisTotal());

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");
		cell = row.createCell(1);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");
		cell = row.createCell(2);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");
		cell = row.createCell(3);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");
		cell = row.createCell(4);
		cell.setCellStyle(bodyStyle);
		cell.setCellValue("");

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("인증항목 총점");
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("NO");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("분류");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("영역");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("항목명");
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("취득점수");

		if (acceptList.isEmpty() == true) {
			sheet.addMergedRegion(new CellRangeAddress(10, 10, 0, 4));
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue("내역이 없습니다.");
		} else {
			// 데이터 부분 생성
			for (ApplyVO aVo : acceptList) {
				row = sheet.createRow(rowNo++);
				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(rowNo - 10);
				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(aVo.getCateg());
				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(aVo.getArea());
				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(aVo.getSubName());
				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(aVo.getAcScore());

			}
		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		String fileName = "졸업인증평가_" + tDTO.getUserNo() + "_" + tDTO.getUserName() + "_총점상세목록.xls";
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "utf-8") + ";");

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();

	}

}
