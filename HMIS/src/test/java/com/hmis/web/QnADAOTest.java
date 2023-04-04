package com.hmis.web;

import java.sql.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmis.domain.FcomVO;
import com.hmis.domain.QnAVO;
import com.hmis.persistence.QnADAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class QnADAOTest {

	@Inject
	private QnADAO dao;

	private static Logger logger = LoggerFactory.getLogger(QnADAOTest.class);

	/*
	 * @Test public void create() throws Exception{
	 * 
	 * QnAVO qna = new QnAVO(); qna.setQnaTitle("test");
	 * qna.setQnaContents("내용입니다."); qna.setRegDate(new Date(2020 - 07 - 28));
	 * qna.setUserNo(20172221); dao.create(qna);
	 * 
	 * }
	 */
/*	@Test
	public void read() throws Exception {
		logger.info(dao.read(2).toString());
	}
*/
/*	@Test
	public void update() throws Exception {

		QnAVO qna = new QnAVO();
		qna.setQnaNo(2);
		qna.setQnaTitle("수정 test");
		qna.setQnaContents("수정된 내용입니다.");
		dao.update(qna);

	}*/
	
	 @Test
	   public void delete() throws Exception {
	      dao.delete(2);
	   }

}
