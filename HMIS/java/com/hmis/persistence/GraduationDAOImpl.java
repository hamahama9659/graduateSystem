package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.GraduationVO;
import com.hmis.domain.SearchCriteria;

@Repository
public class GraduationDAOImpl implements GraduationDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.hmis.mapper.GraduationMapper";

   // 1. 관리자 :: GRADUATION 등록
   @Override
   public int adCreate(GraduationVO vo) throws Exception {
      session.insert(namespace + ".adCreate", vo);
      return vo.getGraduNo();
   }

   // 2. 관리자 :: GRADUATION 상세보기
   @Override
   public GraduationVO adRead(int graduNo) throws Exception {
      
      return session.selectOne(namespace + ".adRead", graduNo);
      
   }
   
   // 3. 관리자 :: GRADUATION 수정
   @Override
   public void adUpdate(GraduationVO vo) throws Exception {
      session.update(namespace + ".adUpdate", vo);

   }

   // 4. 관리자 :: GRADUATION 검색 가능한 목록
   //    학생 :: GRADUATION 검색 가능한 목록
   @Override
   public List<GraduationVO> listSearch(SearchCriteria cri) throws Exception {
      return session.selectList(namespace + ".listSearch", cri);
   }

   // 5. 관리자 :: GRADUATION 검색 가능한 목록 ---> 페이징 , 카운트
   //    학생 :: GRADUATION 검색 가능한 목록 ---> 페이징 , 카운트
   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      return session.selectOne(namespace + ".listSearchCount", cri);
   }

   

}