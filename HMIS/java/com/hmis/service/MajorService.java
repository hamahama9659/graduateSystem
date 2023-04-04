package com.hmis.service;

import java.util.List;

import com.hmis.domain.MajorVO;
import com.hmis.domain.ProfessorVO;
import com.hmis.domain.SearchCriteria;

public interface MajorService {

   
      // 1. 기초정보관리 - 전공 등록
      public void adRegister(MajorVO Vo) throws Exception;
      
      // 2. 기초정보관리 - 전공 목록
      public List<MajorVO> listSearch(SearchCriteria cri) throws Exception;
      
      // 3. 전공 목록 - 페이징, 검색처리
      public int listSearchCount(SearchCriteria cri) throws Exception;
      
      // 4. 기초정보관리 - 전공 상세보기
      public MajorVO adRead(int majorNo) throws Exception;
      
      
      // 5. 기초정보관리 - 전공  수정
      public void adModify(MajorVO Vo) throws Exception;
      
      // 6. 기초정보관리 - 전공 삭제
      public void adRemove(int majorNo) throws Exception;
      
      // 7. 기초정보관리 - 전공 등록 - 교수 목록
      public List<ProfessorVO> listProf(SearchCriteria cri) throws Exception;
   
   
}