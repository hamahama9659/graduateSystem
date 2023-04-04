package com.hmis.web;

import java.sql.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmis.domain.ProgramVO;
import com.hmis.persistence.ProgramDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ProgramDAOTest {

	@Inject
	private ProgramDAO dao;

	private static Logger logger = LoggerFactory.getLogger(ProgramDAOTest.class);

	@Test
	public void adcreate() throws Exception {

		ProgramVO program = new ProgramVO();
		program.setProName("333");
		program.setWriter("최승원");
		program.setType("아이티");
		program.setAppStart(new Date(2020 - 07 - 26));
		program.setAppEnd(new Date(2020 - 07 - 29));
		program.setLimitParti(5);
		program.setContents("내용");

		dao.adCreate(program);
	}

	@Test
	public void read() throws Exception {
		logger.info(dao.read(4).toString());
	}

	@Test
	public void adUpdate() throws Exception {

		ProgramVO program = new ProgramVO();
		program.setProNo(1);
		program.setProName("수정합니다.");

		program.setWriter("최승원1");
		program.setType("아이티");
		program.setAppStart(new Date(2020 - 07 - 26));
		program.setAppEnd(new Date(2020 - 07 - 29));
		program.setLimitParti(5);
		program.setContents("내용");

		dao.adUpdate(program);
	}

}