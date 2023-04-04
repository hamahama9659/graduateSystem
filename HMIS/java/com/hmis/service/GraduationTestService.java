package com.hmis.service;

import java.util.List;


import com.hmis.domain.ApplyVO;
import com.hmis.domain.GraduationTestVO;
import com.hmis.domain.GraduationVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.SubjectVO;
import com.hmis.dto.TotalDTO;

public interface GraduationTestService {

   // 1. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 수정
   public void adModify(GraduationTestVO vo) throws Exception;

   // 2. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 모든 학생 신청 목록 (전체)
   public List<GraduationTestVO> adGraduTestListSearch(SearchCriteria cri, int graduNo) throws Exception;

   // 3. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 모든 학생 신청 목록 (전체) ---> 페이징 , 카운트
   public int adGraduTestListSearchCount(SearchCriteria cri) throws Exception;

   // 4. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 승인대기 학생 신청 목록 (승인대기)
   public List<GraduationTestVO> adWaitList() throws Exception;

   // 5. 학생 :: 졸업심사 신청(GRADUATIONTEST) - 졸업심사 신청 학생 상세보기
   //    관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 신청 학생 상세보기
   public GraduationTestVO adGraduTestRead(int testNo) throws Exception;
   
   public TotalDTO esSelect(int userNo) throws Exception;

   // 6. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 승인 (승인)
   public void accept(int testNo, ApplyVO aVO) throws Exception;

   // 7. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 승인된 학생 목록
   public List<GraduationTestVO> acceptList(int userNo) throws Exception;

   // 8. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 거절 (거절)
   public void deny(int testNo) throws Exception;

   /*
    * // 관리자 : 졸업심사 관리(GRADUATIONTEST) - 해당하는 신청의 파일 목록 public List<FileVO>
    * fileList(int ApplyNo) throws Exception;
    */

   // 9. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업점수
   public List<TotalDTO> esList(SearchCriteria cri) throws Exception;
   
   
   
   public  List<TotalDTO>  graduateToBeList() throws Exception;

   // 10. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업점수 ---> 페이징 , 카운트
   public int esListCount(SearchCriteria cri) throws Exception;

   // ---------------------------------------------------------------------------------

   // 1. 학생 :: 졸업심사신청(GRADUATION) - GRADUATION 목록
   public List<GraduationTestVO> graduList(SearchCriteria cri) throws Exception;

   // 2. 학생 :: 졸업심사신청(GRADUATION) - 제목 검색
   public List<GraduationVO> graduListSearch(String title) throws Exception;

   // 3. 학생 :: 졸업심사신청(GRADUATION) - 제목 검색 ---> 페이징 , 카운트
   public int graduListSearchCount(SearchCriteria cri) throws Exception;

   // 4. 학생 :: 졸업심사신청(GRADUATIONTEST) - 등록(신청)
   public void register(GraduationTestVO vo) throws Exception;

   // 5. 학생 :: 졸업심사신청(GRADUATIONTEST) - 삭제(신청 취소)
   public void remove(int testNo) throws Exception;

   // 6. 학생 :: 졸업심사신청(GRADUATIONTEST) - 학생의 졸업신청 내역
   public List<GraduationTestVO> stuGraduTestList(int userNo) throws Exception;

   // 7. 학생 :: 졸업심사신청(GRADUATIONTEST) - 졸업 신청 상세조회 (팝업창 ---> 목적 : 승인여부 확인)
   public GraduationTestVO stuGraduTestRead(int testNo) throws Exception;

   // 관리자 팝업---------------------------------------------------------------
   // 1. 관리자 :: 추가점수 - 항목 명 검색
   public List<SubjectVO> searchSub(String subName) throws Exception;

   // 2. 관리자 :: 추가점수
   public List<SubjectVO> subList() throws Exception;

   // 학생 팝업----------------------------------------------------------------

   // 학생 :: 졸업신청 - 졸업신청결과 팝업
   public List<GraduationTestVO> graduTestList(int userNo) throws Exception;

}