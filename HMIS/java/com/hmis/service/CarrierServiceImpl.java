package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.persistence.CarrierDAO;

@Service
public class CarrierServiceImpl implements CarrierService {

   @Inject
   private CarrierDAO dao;

   // 1. 학생 :: mypage/myScore/uscar 진로 리스트
   @Override
   public List<CarrierVO> list(SearchCriteria cri) throws Exception {

      return dao.list(cri);
   }

   // 2. 학생 :: 리스트 카운트
   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {

      return dao.listSearchCount(cri);
   }

   // 1. 관리자 :: 진로 작성
   @Override
   public void adregist(CarrierVO vo) throws Exception {
      dao.adcreate(vo);

   }

   // 2. 관리자 :: 진로 삭제
   @Override
   public void adremove(int carNo) throws Exception {
      dao.addelete(carNo);

   }

   // 3. 관리자 :: 진로 목록
   @Override
   public List<CarrierVO> listAll() throws Exception {
      return dao.listAll();
   }

   // 4. 관리자 :: 진로 중복등록 체크
   @Override
   public int checkCarName(String carName) throws Exception {
      return dao.checkCarName(carName);
   }

}