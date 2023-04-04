package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.UscarVO;


public interface UscarDAO {

	// 1. 학생 :: 진로 선택 팝업창 -> 진로명 검생 결과 페이지
      public List<CarrierVO> searchCar(String carName) throws Exception;
      
   // 2. 학생 :: myPage/myScore -> 진로 목록 팝업창
      public List<CarrierVO> carList(int userNo) throws Exception;
      
   // 3. 학생 :: 선택한 진로 목록
   public List<UscarVO> everyUscarList(int userNo) throws Exception;

   // 4. 학생 :: myPage/myScore -> 학생 진로 등록
   public int create(UscarVO vo) throws Exception;
   
   // 5. 학생 :: myPage -> 선택한 진로 삭제
   public void delete(int uscarNo) throws Exception;

// 학생 :: myPage - 학생진로 보기
   // public UscarVO read(int uscarNo) throws Exception;

   // 학생 :: myPage/myScore - 학생진로 수정
   // public void update(UscarVO vo) throws Exception;

   // 관리자 :: 기초정보관리(?) - 학생진로 등록
   // public void adcreate(UscarVO vo) throws Exception;

   // 관리자 :: 기초정보관리 - 진로목표관리 - 학생진로 보기
   // public UscarVO adread(int uscarNo) throws Exception;

   // 관리자 :: 기초정보관리 - 진로목표관리 - 학생진로 수정
   // public void adupdate(UscarVO vo) throws Exception;

   // 관리자 :: 기초정보관리 - 진로목표관리 - 학생진로 삭제
   // public void addelete(int uscarNo) throws Exception;

   // 관리자 :: 학생진로 리스트
   // public List<UscarVO> listCriteria(Criteria cri) throws Exception;
}
