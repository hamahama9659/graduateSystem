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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.StatisticsDTO;
import com.hmis.service.StatisticsService;

@Controller
@RequestMapping("/admin/statistics/*")
public class AdminStatisticsController {

	@Inject
	private StatisticsService service;

	private static Logger logger = LoggerFactory.getLogger(AdminStatisticsController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		logger.info("Admin Statistics List....");
		logger.info(cri.toString());
		
		model.addAttribute("list", service.statisticsList(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri));
		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/excel", method = RequestMethod.GET)
	public void excelEsListDown(HttpServletResponse response) throws Exception {

		List<StatisticsDTO> list = service.excel();

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("졸업인증 취득현황");
		sheet.setColumnWidth((short)1, (short)10000);
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
		cell.setCellValue("항목명");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("취득 인원");

		// 데이터 부분 생성
		for (StatisticsDTO sDto : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(rowNo - 1);
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(sDto.getSubName());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(sDto.getCnt());

		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		String fileName = "졸업인증_취득현황.xls";
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "utf-8") + ";");

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();

	}

}
