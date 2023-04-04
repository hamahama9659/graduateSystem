package com.hmis.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmis.domain.GraduationTestVO;
import com.hmis.persistence.GraduationTestDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class GraduationTestDAOTest {

	@Inject
	private GraduationTestDAO dao;

	private static Logger logger = LoggerFactory.getLogger(GraduationTestDAO.class);
/*
	@Test
	public void create() throws Exception {
		GraduationTestVO graduationTest = new GraduationTestVO();
		graduationTest.setTestState("승인");
		graduationTest.setUserNo(20172221);
		

	}
	*/
	
	
	/* 
	 @Test
	   public void adUpdate() throws Exception {
			GraduationTestVO graduationTest = new GraduationTestVO();
			graduationTest.setTestNo(1);
			graduationTest.setTestState("거절");
			graduationTest.setUserNo(20172221);
	      dao.adupdate(graduationTest);
	   }
*/
	
	

	   @Test
	   public void testDelete() throws Exception {
	      dao.delete(1);
	   }
	
}
