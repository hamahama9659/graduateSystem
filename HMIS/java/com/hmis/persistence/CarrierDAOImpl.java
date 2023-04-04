
package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.CarrierVO;
import com.hmis.domain.SearchCriteria;

@Repository
public class CarrierDAOImpl implements CarrierDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.hmis.mapper.CarrierMapper";

   // 1. 학생 :: mypage/myScore/uscar 진로 리스트
   @Override
   public List<CarrierVO> list(SearchCriteria cri) throws Exception {
      return session.selectList(namespace + ".listSearch", cri);
   }

   // 2. 학생 :: 리스트 카운트
   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      return session.selectOne(namespace + ".listSearchCount", cri);
   }

   // 1. 관리자 :: 진로 작성
   @Override
   public void adcreate(CarrierVO vo) throws Exception {
      session.insert(namespace + ".adcreate", vo);

   }

   // 2. 관리자 :: 진로 삭제
   @Override
   public void addelete(int carNo) throws Exception {
      session.delete(namespace + ".addelete", carNo);
   }

   // 3. 관리자 :: 진로 목록
   @Override
   public List<CarrierVO> listAll() throws Exception {
      return session.selectList(namespace + ".listAll");
   }

   // 4. 관리자::진로 중복등록 검사 AJAX.
   @Override
   public int checkCarName(String carName) throws Exception {
      return session.selectOne(namespace + ".checkCarName", carName);
   }

}