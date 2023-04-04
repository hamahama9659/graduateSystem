package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.MajorVO;
import com.hmis.domain.ProfessorVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.persistence.MajorDAO;
import com.hmis.persistence.ProfessorDAO;

@Service
public class MajorServiceImpl implements MajorService{

   
   @Inject
   private MajorDAO dao;
   
   
   @Inject
   private ProfessorDAO pDAO;
   
   // 1. 기초정보관리 - 전공 등록
   @Override
   public void adRegister(MajorVO Vo) throws Exception {
      // TODO Auto-generated method stub
      dao.adcreate(Vo);
   }
   
   // 2. 기초정보관리 - 전공 목록
   @Override
   public List<MajorVO> listSearch(SearchCriteria cri) throws Exception {
      // TODO Auto-generated method stub
      return dao.listSearch(cri);
   }
   
   // 3. 전공 목록 - 페이징, 검색처리
   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      // TODO Auto-generated method stub
      return dao.listSearchCount(cri);
   }
   
   // 4. 기초정보관리 - 전공 상세보기
   @Override
   public MajorVO adRead(int majorNo) throws Exception {
      // TODO Auto-generated method stub
      return dao.adread(majorNo);
   }
   
   // 5. 기초정보관리 - 전공  수정
   @Override
   public void adModify(MajorVO Vo) throws Exception {
      // TODO Auto-generated method stub
      dao.adupdate(Vo);
   }
   
   // 6. 기초정보관리 - 전공 삭제
   @Override
   public void adRemove(int majorNo) throws Exception {
      // TODO Auto-generated method stub
      dao.addelete(majorNo);
   }
   
   // 7. 기초정보관리 - 전공 등록 - 교수 목록
   @Override
   public List<ProfessorVO> listProf(SearchCriteria cri) throws Exception {
      // TODO Auto-generated method stub
      return pDAO.listProf(cri);
   }








}