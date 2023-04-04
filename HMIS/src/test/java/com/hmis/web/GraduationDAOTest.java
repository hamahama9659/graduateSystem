package com.hmis.web;

import java.sql.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmis.domain.GraduationVO;
import com.hmis.persistence.GraduationDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class GraduationDAOTest {

	@Inject
	private GraduationDAO dao;
	private static Logger logger = LoggerFactory.getLogger(GraduationDAOTest.class);
	

/*	@Test
	public void adCreate() throws Exception{
		
		GraduationVO gradu = new GraduationVO();
		gradu.setTitle("test");
		gradu.setAppStart(new Date(2020 - 06 - 26));
		gradu.setAppEnd(new Date(2020 - 07 - 26));
		gradu.setRegDate(new Date(2020 - 07 - 30));
		gradu.setGraduState("신청대기");
		dao.adCreate(gradu);
		
	}
	*/
	
	 @Test
	   public void adupdate() throws Exception {

		 GraduationVO gradu = new GraduationVO();
		 gradu.setGraduNo(1);
		 gradu.setTitle("수정된 글입니다.");
		 gradu.setAppEnd(new Date(2020 - 07 - 20));
		 gradu.setGraduState("승인");
	      dao.adUpdate(gradu);
	   }

	
	
}
