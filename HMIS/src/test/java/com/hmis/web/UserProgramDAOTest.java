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
import com.hmis.domain.UserProgramVO;
import com.hmis.persistence.UserProgramDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class UserProgramDAOTest {
	@Inject
	private UserProgramDAO dao;

	private static Logger logger = LoggerFactory.getLogger(UserProgramDAOTest.class);

	/*@Test
	public void create() throws Exception{
		
		UserProgramVO userProgram = new UserProgramVO();
		userProgram.setUserNo(20133334);
		userProgram.setApplyDate(new Date(2020-07-26));
		userProgram.setProState("승인대기");
		userProgram.setProNo(1);
		dao.create(userProgram);
		
	}*/
	  @Test
	   public void testDelete() throws Exception {
	      dao.delete(1);
	   }
	
}
