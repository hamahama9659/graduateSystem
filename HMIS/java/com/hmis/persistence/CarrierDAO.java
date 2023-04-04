package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.SearchCriteria;

public interface CarrierDAO {

   // 1. 학생 :: mypage/myScore/uscar 진로 리스트
   public List<CarrierVO> list(SearchCriteria cri) throws Exception;

   // 2. 학생 :: 리스트 카운트
   public int listSearchCount(SearchCriteria cri) throws Exception;

   
   
   // 1. 관리자 :: 진로 작성
   public void adcreate(CarrierVO vo) throws Exception;

   // 2. 관리자 :: 진로 삭제
   public void addelete(int carNo) throws Exception;

   // 3. 관리자 :: 진로 목록
   public List<CarrierVO> listAll() throws Exception;

   // 4. 관리자::진로 중복등록 검사 AJAX.
   public int checkCarName(String carName) throws Exception;

   // 관리자 :: 진로 조회
   // public CarrierVO read(int carNo) throws Exception;

   // 관리자 :: 진로 업데이트
   // public void adupdate(CarrierVO vo) throws Exception;

}