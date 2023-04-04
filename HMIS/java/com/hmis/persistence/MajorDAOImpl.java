package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.MajorVO;
import com.hmis.domain.SearchCriteria;

@Repository
public class MajorDAOImpl implements MajorDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.hmis.mapper.MajorMapper";

   // 1. 관리자 :: 전공 작성
   @Override
   public void adcreate(MajorVO Vo) throws Exception {
      session.insert(namespace + ".adcreate", Vo);
   }

   // 2. 관리자 :: 전공 업데이트
   @Override
   public void adupdate(MajorVO Vo) throws Exception {
      session.update(namespace + ".adupdate", Vo);

   }

   // 3. 관리자 :: 전공 삭제
   @Override
   public void addelete(int majorNo) throws Exception {
      session.delete(namespace + ".addelete", majorNo);
   }

   // 4. 관리자 :: 전공 상세보기
   @Override
   public MajorVO adread(int majorNo) throws Exception {
      // TODO Auto-generated method stub
      return session.selectOne(namespace + ".adread", majorNo);
   }
   
   // 5. 전공 검색처리리스트
   @Override
   public List<MajorVO> listSearch(SearchCriteria cri) throws Exception {
      return session.selectList(namespace + ".listSearch", cri);

   }
   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      return session.selectOne(namespace + ".listSearchCount", cri);
   }




}