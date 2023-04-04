package com.hmis.service;

import java.util.List;

import com.hmis.domain.FileVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;

public interface UserProgramService {

   
   
	  // 1. 학생 :: 기초정보관리 - 프로그램리스트 - 상세보기 - 신청
      public void register(UserProgramVO vo) throws Exception;

      // 2. 학생 :: 기초정보관리 - 프로그램리스트 - 신청현황 나오게 표시
      public UserProgramVO read(int userProNo) throws Exception;


      // 3. 학생 :: 기초정보관리 - 프로그램리스트 - 상세보기 - 삭제
      public void remove(int userProNo) throws Exception;
      
      // 4. 관리자 :: 프로그램리스트 - 프로그램신청자목록 - 승인
      public void accept(int userProNo) throws Exception;

      // 5. 관리자 :: 프로그램 - 프로그램신청자목록 - 거절
      public void deny(int userProNo) throws Exception;
   
      //6. 관리자:: 검색처리
      public List<UserProgramVO> adlistSearch(SearchCriteria cri) throws Exception;

      public int adlistSearchCount(SearchCriteria cri) throws Exception;
    
      //7. 관리자 :: 졸업인증신청 관리 - 상세조회
      public UserProgramVO adUserProgramRead(int userProNo) throws Exception;
     
      
      //8. 프로그램 - 해당하는프로그램 업로드 파일
      public List<FileVO> fileList(int userProNo) throws Exception;

      public List< UserProgramVO> acceptProList(int userNo) throws Exception;
     

      //9. 관리자 :: 프로그램 상세보기 화면 신청자 리스트
      public List<UserProgramVO> adUserList(int proNo) throws Exception;
      
      //10. 학생,관리자  :: 학생 신청 상태 리스트(승인대기,승인,거부)  
      public List< UserProgramVO> ProList(int userNo) throws Exception;
      
}