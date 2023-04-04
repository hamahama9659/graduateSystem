package com.hmis.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmis.domain.UscarVO;
import com.hmis.persistence.UscarDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class UscarDAOTest {

	@Inject
	private UscarDAO dao;

	private static Logger logger = LoggerFactory.getLogger(UscarDAOTest.class);

	@Test
	public void Create() throws Exception {

		UscarVO uscar = new UscarVO();
		uscar.setUserNo(20133334);
		uscar.setCarNo(1);
		dao.create(uscar);

	}

	/*
	 * @Test public void delete() throws Exception{
	 * 
	 * dao.delete(2);
	 * 
	 * }
	 */

}