package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.ProFileVO;

@Repository
public class ProFileDAOImpl implements ProFileDAO {
   
   @Inject
     private SqlSession session;
   
   private static String namespace = "com.hmis.mapper.UserProgramMapper";

   // 1. 학생 ::등록
   @Override
   public void create(ProFileVO pVo) throws Exception {
      session.insert(namespace+".createFiles", pVo);
   }
   
   // 2. 학생 ::삭제
   @Override
   public void delete(ProFileVO pVo) throws Exception {
      // TODO Auto-generated method stub
      
   }
   
   // 3. 파일목록
   @Override
   public List<ProFileVO> list(int userProNo) throws Exception {
      return session.selectList(namespace+".fileList", userProNo);
   }

}