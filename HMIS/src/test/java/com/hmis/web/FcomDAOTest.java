package com.hmis.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmis.domain.FcomVO;
import com.hmis.persistence.FcomDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class FcomDAOTest {
	
	@Inject
	private FcomDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(FcomDAOTest.class);

	
	
	@Test
	public void adCreate() throws Exception{
		
		FcomVO fcom = new FcomVO();
		fcom.setFcomName("test");
		fcom.setComType("유형");
		fcom.setCeo("박범수");
		fcom.setContents("내용");
		dao.adcreate(fcom);
		
	}
	
	/*
	 @Test
	   public void read() throws Exception {
	      logger.info(dao.read(2).toString());
	   }*/
	/* 
	 
	 @Test
	   public void adUpdate() throws Exception {

		 FcomVO fcom = new FcomVO();
		 fcom.setFcomNo(1);
		 fcom.setFcomName("수정된 글입니다.");
		 fcom.setComType("유형 수정");
		 fcom.setCeo("수정 테");
		 fcom.setContents("수정 테스트 ");

	      dao.adupdate(fcom);
	   }

	 */
	 /*
	   @Test
	   public void testDelete() throws Exception {

	 

	      dao.addelete(5);
	   }*/
}
