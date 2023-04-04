package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.ProfessorVO;
import com.hmis.domain.SearchCriteria;

@Repository
public class ProfessorDAOImpl implements ProfessorDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.hmis.mapper.MajorMapper";
   
   // 1. 관리자 :: 기초정보관리 - 교수 등록
   @Override
   public void create(ProfessorVO vo) throws Exception {
      // TODO Auto-generated method stub
   }
   
   // 2. 관리자 :: 기초정보관리 - 교수상세내역
   @Override
   public ProfessorVO read(int profNo) throws Exception {
      // TODO Auto-generated method stub
      return null;
   }

   // 3. 관리자 :: 기초정보관리 - 교수 수정
   @Override
   public void update(ProfessorVO vo) throws Exception {
      // TODO Auto-generated method stub
   }

   // 4. 관리자 :: 기초정보관리 - 교수 삭제
   @Override
   public void delete(int profNo) throws Exception {
      // TODO Auto-generated method stub
   }

   // 5. 관리자 :: 전공 등록 - 교수 명단
   @Override
   public List<ProfessorVO> listProf(SearchCriteria cri) {
      // TODO Auto-generated method stub
      return session.selectList(namespace + ".listProf", cri);
   }




}