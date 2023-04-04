package com.hmis.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmis.domain.MajorVO;
import com.hmis.persistence.MajorDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class MajorDAOTest {

	@Inject
	private MajorDAO dao;

	private static Logger logger = LoggerFactory.getLogger(MajorDAOTest.class);

	@Test
	public void adCreate() throws Exception {

		MajorVO major = new MajorVO();
		major.setCourseNo(130);
		major.setMajorName("테스트함");
		major.setGrade(2);
		major.setTrackCode("0");
		major.setProfNo(1);
		dao.adcreate(major);

	}

	@Test
	public void adUpdate() throws Exception {

		MajorVO major = new MajorVO();
		major.setMajorNo(14);
		major.setCourseNo(400);
		major.setMajorName("수정했다");
		major.setGrade(2);
		major.setTrackCode("1");
		major.setProfNo(1);
		dao.adupdate(major);
	}

	@Test
	public void addDelete() throws Exception {
		dao.addelete(12);
	}

}