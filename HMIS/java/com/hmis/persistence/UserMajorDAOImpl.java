package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.UserMajorVO;

@Repository
public class UserMajorDAOImpl implements UserMajorDAO {

   @Inject
   private SqlSession session;
      
   private static String namespace = "com.hmis.mapper.UserMajorMapper";
   
   
   @Override
   public void create(UserMajorVO vo) throws Exception {
      session.insert(namespace + ".create", vo);
   }
         
   @Override
   public void umdelete(int userNo) throws Exception {
      session.delete(namespace + ".umdelete", userNo);
   }
     
      @Override
   public List<UserMajorVO> listAll(int userNo) throws Exception {
      return session.selectList(namespace + ".listAll",userNo);
   }
   
   @Override
   public List<UserMajorVO> otherList(int userNo) throws Exception {
      return session.selectList(namespace + ".otherList",userNo);
   }
   

}