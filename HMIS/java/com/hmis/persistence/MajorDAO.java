package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.MajorVO;
import com.hmis.domain.SearchCriteria;

public interface MajorDAO {

   // 1. 관리자 :: 전공 작성
   public void adcreate(MajorVO Vo) throws Exception;

   // 2. 관리자 :: 전공 업데이트
   public void adupdate(MajorVO Vo) throws Exception;

   // 3. 관리자 :: 전공 삭제
   public void addelete(int majorNo) throws Exception;

   // 4. 관리자:: 전공 상세보기 
   public MajorVO adread(int majorNo) throws Exception;
   
   
   // 5. 전공과목 검색처리
   public List<MajorVO> listSearch(SearchCriteria cri) throws Exception;

   public int listSearchCount(SearchCriteria cri) throws Exception;

   

   
   
   
   
   
}