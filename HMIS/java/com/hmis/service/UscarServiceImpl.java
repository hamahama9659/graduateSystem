package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.UscarVO;
import com.hmis.persistence.UscarDAO;

@Service
public class UscarServiceImpl implements UscarService {

   @Inject
   private UscarDAO dao;

   // 1. 학생 :: 진로 선택 팝업창 -> 진로명 검생 결과 페이지
   @Override
   public List<CarrierVO> searchCar(String carName) throws Exception {
      return dao.searchCar(carName);
   }

   // 2. 학생 :: myPage/myScore -> 진로 목록 팝업창
   @Override
   public List<CarrierVO> carList(int userNo) throws Exception {
      return dao.carList(userNo);
   }

   // 3. 학생 :: 선택한 진로 목록
   @Override
   public List<UscarVO> everyUscarList(int userNo) throws Exception {
      return dao.everyUscarList(userNo);
   }

   // 4. 학생 :: myPage/myScore -> 학생 진로 등록
   public void register(UscarVO vo) throws Exception {

      // 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
      int uscarNo = dao.create(vo);
    
   }

   // 5. 학생 :: myPage -> 선택한 진로 삭제
   @Override
   public void remove(int uscarNo) throws Exception {
      dao.delete(uscarNo);

   }

}