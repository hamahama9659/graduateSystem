package com.hmis.service;

import java.util.List;



import com.hmis.domain.GraduationVO;
import com.hmis.domain.SearchCriteria;

public interface GraduationService {

   // 1. 관리자 :: GRADUATION 등록
   public int adRegister(GraduationVO vo) throws Exception;
   
   // 2. 관리자 :: GRADUATION 상세보기
   public GraduationVO adRead(int graduNo) throws Exception;

   // 3. 관리자 :: GRADUATION 수정
   public void adModify(GraduationVO vo) throws Exception;

   // 4. 관리자 :: GRADUATION 검색 가능한 목록
   //    학생 :: GRADUATION 검색 가능한 목록
   public List<GraduationVO> listSearch(SearchCriteria cri) throws Exception;

   // 5. 관리자 :: GRADUATION 검색 가능한 목록 ---> 페이징 , 카운트
   //    학생 :: GRADUATION 검색 가능한 목록 ---> 페이징 , 카운트
   public int listSearchCount(SearchCriteria cri) throws Exception;

   
}