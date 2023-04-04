package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.UscarVO;

@Repository
public class UscarDAOImpl implements UscarDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.hmis.mapper.UscarMapper";

   // 1. 학생 :: 진로 선택 팝업창 -> 진로명 검생 결과 페이지
   @Override
   public List<CarrierVO> searchCar(String carName) throws Exception {
      return session.selectList(namespace + ".searchCar", carName);
   }

   // 2. 학생 :: myPage/myScore -> 진로 목록 팝업창
   @Override
   public List<CarrierVO> carList(int userNo) throws Exception {
      return session.selectList(namespace + ".carList", userNo);
   }

   // 3. 학생 :: 선택한 진로 목록
   @Override
   public List<UscarVO> everyUscarList(int userNo) throws Exception {
      return session.selectList(namespace + ".everyUscarList", userNo);
   }

   // 4. 학생 :: myPage/myScore -> 학생 진로 등록
   @Override
   public int create(UscarVO vo) throws Exception {
      session.insert(namespace + ".create", vo);
      return vo.getUscarNo();
   }

   // 5. 학생 :: myPage -> 선택한 진로 삭제
   @Override
   public void delete(int uscarNo) throws Exception {
      session.delete(namespace + ".delete", uscarNo);

   }

   /*
    * // 학생 :: 기초정보관리 - 진로목표관리 - 학생진로 수정 - 선택 안한 진로 리스트
    * 
    * @Override public List<UserVO> uscarOtherList(int uscarNo) throws Exception {
    * return session.selectList(namespace + ". uscarOtherList",uscarNo); }
    * 
    * // 학생 :: 기초정보관리 - 진로목표관리 - 학생진로 수정 - 선택 한 진로 리스트
    * 
    * @Override public List<UserVO> uscarList(int uscarNo) throws Exception {
    * return session.selectList(namespace + ". uscarList",uscarNo); }
    */

   // 학생진로 리스트
   /*
    * @Override public List<UscarVO> listCriteria(Criteria cri) throws Exception {
    * return session.selectList(namespace + ".listCriteria", cri); }
    */
}