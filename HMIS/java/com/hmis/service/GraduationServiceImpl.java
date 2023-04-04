package com.hmis.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.hmis.domain.GraduationVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.persistence.GraduationDAO;

@Service
public class GraduationServiceImpl implements GraduationService {

   @Inject
   private GraduationDAO dao;

   // 1. 관리자 :: GRADUATION 등록
   @Override
   public int adRegister(GraduationVO vo) throws Exception {
      return dao.adCreate(vo);
   }

   // 2. 관리자 :: GRADUATION 상세보기
   @Override
   public GraduationVO adRead(int graduNo) throws Exception {
      
      return dao.adRead(graduNo);
      
   }
      
   // 3. 관리자 :: GRADUATION 수정
   @Override
   public void adModify(GraduationVO vo) throws Exception {
      dao.adUpdate(vo);
   }

   // 4. 관리자 :: GRADUATION 검색 가능한 목록
   //    학생 :: GRADUATION 검색 가능한 목록
   @Override
   public List<GraduationVO> listSearch(SearchCriteria cri) throws Exception {
      return dao.listSearch(cri);

   }

   // 5. 관리자 :: GRADUATION 검색 가능한 목록 ---> 페이징 , 카운트
   //    학생 :: GRADUATION 검색 가능한 목록 ---> 페이징 , 카운트
   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      return dao.listSearchCount(cri);
   }





}