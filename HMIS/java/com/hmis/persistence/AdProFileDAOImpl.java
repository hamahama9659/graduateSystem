package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.AdProFileVO;

@Repository
public class AdProFileDAOImpl implements AdProFileDAO {
   
   @Inject
   private SqlSession session;
   
   private static String namespace = "com.hmis.mapper.ProgramMapper";

   // 1. 관리자 ::등록 (프로그램 파일)
   @Override
   public void create(AdProFileVO apVo) throws Exception {
      session.insert(namespace+".createAdFiles",apVo);
      
   }

   // 2. 관리자 ::삭제
   @Override
   public void delete(AdProFileVO apVo) throws Exception {
      // TODO Auto-generated method stub
      
   }

   // 3. 파일 목록
   @Override
   public List<AdProFileVO> list(int proNo) throws Exception {
      return session.selectList(namespace+".fileList", proNo);
   }
   


}