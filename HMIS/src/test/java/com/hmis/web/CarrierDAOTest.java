package com.hmis.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmis.domain.CarrierVO;
import com.hmis.persistence.CarrierDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class CarrierDAOTest {
   
   @Inject
   private CarrierDAO dao;
   
   private static Logger logger = LoggerFactory.getLogger(CarrierDAOTest.class);

   
   
   
   
   /*
    * @Test public void adcreate() throws Exception{
    * 
    * CarrierVO carrier = new CarrierVO(); carrier.setCarName("ggg");
    * 
    * dao.adcreate(carrier);
    * 
    * }
    */
    
    
    

   
   
   /*
    * @Test public void read() throws Exception {
    * logger.info(dao.read(1).toString()); }
    */
    
     
   
   /*
    * @Test public void adUpdate() throws Exception {
    * 
    * CarrierVO carrier = new CarrierVO(); carrier.setCarNo(1);
    * carrier.setCarName("수정된 글입니다.");
    * 
    * dao.adupdate(carrier); }
    * 
    * 
    * 
    * 
    */ 
     @Test public void testDelete() throws Exception {
     
     
     
      dao.addelete(1); }
    
     
    
   
   
}