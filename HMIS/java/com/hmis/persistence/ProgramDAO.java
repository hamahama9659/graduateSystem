package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.FileVO;
import com.hmis.domain.ProgramVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;

public interface ProgramDAO {

	
   // 1. 관리자 :: 기초정보관리 - 프로그램 등록
   public int adCreate(ProgramVO vo) throws Exception;

   // 2. 관리자, 학생 :: 기초정보관리 - 프로그램상세내역
   public ProgramVO read(int proNo) throws Exception;
   
   // 3.  관리자 :: 기초정보관리 - 프로그램 수정
   public void adUpdate(ProgramVO vo) throws Exception;
   
   // 4.  관리자, 학생 :: 프로그램  조회수
   void updateHits(Integer proNO) throws Exception;
   
   // 5. 관리자, 학생 :: 검색처리 
    public List<ProgramVO> listSearch(SearchCriteria cri) throws Exception;
    
    public int listSearchCount(SearchCriteria cri) throws Exception;
    
    // 6. 관리자 :: 프로그램 신청,마감 상태
    public UserProgramVO stateCheck(int proNo, int userNo) throws Exception;

    // 7. 관리자 :: 파일 등록
    public void insertFile(FileVO fVo) throws Exception;
    
    // 8. 관리자 :: 파일 삭제
    public void deleteFile(int proNo) throws Exception;
    
    // 9. 관리자 :: 파일 목록
    public List<FileVO> list(int proNo) throws Exception;
    

    
    
}