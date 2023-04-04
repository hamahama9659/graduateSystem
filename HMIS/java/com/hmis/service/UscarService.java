package com.hmis.service;

import java.util.List;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.UscarVO;

public interface UscarService {

   // 1. 학생 :: 진로 선택 팝업창 -> 진로명 검생 결과 페이지
   public List<CarrierVO> searchCar(String carName) throws Exception;

   // 2. 학생 :: myPage/myScore -> 진로 목록 팝업창
   public List<CarrierVO> carList(int userNo) throws Exception;

   // 3. 학생 :: 선택한 진로 목록
   public List<UscarVO> everyUscarList(int userNo) throws Exception;

   // 4. 학생 :: myPage/myScore -> 학생 진로 등록
   public void register(UscarVO vo) throws Exception;

   // 5. 학생 :: myPage -> 선택한 진로 삭제
   public void remove(int uscarNo) throws Exception;

}