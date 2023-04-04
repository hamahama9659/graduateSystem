package com.hmis.service;

import java.util.List;

import com.hmis.domain.FileVO;
import com.hmis.domain.ProgramVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;

public interface ProgramService {
   
   
      // 1. 관리자 :: 기초정보관리 - 프로그램 등록
      public void register(ProgramVO vo) throws Exception;

      // 2. 관리자, 학생 :: 기초정보관리 - 프로그램상세내역
      public ProgramVO read(int proNo) throws Exception;

      //3.  관리자 :: 기초정보관리 - 프로그램 수정
      public void modify(ProgramVO vo) throws Exception;
      
      //4. 프로그램  조회수
      void updateHits(Integer proNO) throws Exception;

      //5.  검색처리 
       public List<ProgramVO> listSearch(SearchCriteria cri) throws Exception;
       
       public int listSearchCount(SearchCriteria cri) throws Exception;
      
      // 프로그램 - 해당하는프로그램 업로드 파일
      public List<FileVO> fileList(int proNo) throws Exception;
      
      // 프로그램 - 신청, 마감 상태
      public UserProgramVO stateCheck(int proNo,int userNo) throws Exception;
      
      
   
   
}