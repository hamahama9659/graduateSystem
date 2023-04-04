package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.FileVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;

public interface UserProgramDAO {


   // 1. 학생 :: 기초정보관리 - 프로그램리스트 - 상세보기 - 신청
   public int create(UserProgramVO vo) throws Exception;

   // 2. 학생 :: 기초정보관리 - 프로그램리스트 - 신청현황 나오게 표시
   public UserProgramVO read(int userProNo) throws Exception;


   // 3. 학생 :: 기초정보관리 - 프로그램리스트 - 상세보기 - 삭제
   public void delete(int userProNo) throws Exception;

   // 4. 학생 :: 파일 등록
    public void insertFile(FileVO fVo) throws Exception;
    
    // 5. 학생 :: 파일 삭제
    public void delete(FileVO fVo) throws Exception;
    
    // 6. 학생 :: 파일 목록
    public List<FileVO> list(int userProNo) throws Exception;
   

    //7. 관리자  ::프로그램 상세보기 화면 신청자 리스트
    public List<UserProgramVO> adUserList(int proNo) throws Exception;
    
    // 8. 관리자 :: 프로그램리스트 - 프로그램신청자목록 - 승인
    public void accept(int userProNo) throws Exception;

    // 9. 관리자 :: 프로그램 - 프로그램신청자목록 - 거절
    public void deny(int userProNo) throws Exception;

    // 10. 관리자 :: 졸업인증신청 관리 - 상세조회
    public UserProgramVO adUserProgramSelect(int userProNo) throws Exception;
    
    //11. 관리자 ::  프로그램신청서 검색처리

    public List<UserProgramVO> adlistSearch(SearchCriteria cri) throws Exception;

    public int adlistSearchCount(SearchCriteria cri) throws Exception;

    public List<UserProgramVO> acceptProList(int userNo) throws Exception;
    
    //12. 학생,관리자  :: 학생 신청 상태 리스트(승인대기,승인,거부)  
     public List<UserProgramVO> ProList(int userNo) throws Exception;
    
    

}