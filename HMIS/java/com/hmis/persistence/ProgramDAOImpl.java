package com.hmis.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.FileVO;
import com.hmis.domain.ProgramVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;

@Repository
public class ProgramDAOImpl implements ProgramDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.hmis.mapper.ProgramMapper";

   
   
   //1. 관리자 :: 프로그램 생성
   @Override
   public int adCreate(ProgramVO vo) throws Exception {
      session.insert(namespace + ".adCreate", vo);
      return vo.getProNo();

   }
   
   
   //2. 학생, 관리자 :: 프로그램 상세정보
   @Override
   public ProgramVO read(int proNo) throws Exception {
      return session.selectOne(namespace + ".read", proNo);
   }
   

   //3. 관리자 :: 프로그램 업데이트
   @Override
   public void adUpdate(ProgramVO vo) throws Exception {
      session.update(namespace + ".adUpdate", vo);

   }

   //4.  관리자, 학생 :: 프로그램  조회수
   @Override
   public void updateHits(Integer proNo) throws Exception {
      session.update(namespace + ".updateHits", proNo);
   }
   
   // 5. 관리자, 학생 :: 검색처리  // 검색과 페이징이 포함된 리스트 띄우기(SearchCriteria와 Criteria)
   
     @Override public List<ProgramVO> listSearch(SearchCriteria cri) throws
     Exception { return session.selectList(namespace + ".listSearch", cri); }
     
     @Override public int listSearchCount(SearchCriteria cri) throws Exception {
     return session.selectOne(namespace + ".listSearchCount", cri); }

     //6. 관리자 :: 프로그램 신청,마감 상태프로그램 신청, 마감 상태
     @Override
     public UserProgramVO stateCheck(int proNo, int userNo) throws Exception {
     // TODO Auto-generated method stub
  	   Map<String, Object> paramMap = new HashMap<String, Object>();
  	   paramMap.put("userNo", userNo);
  	   paramMap.put("proNo", proNo);
     return session.selectOne(namespace + ".stateCheck", paramMap);
     }
     

   // 6. 관리자 :: 파일 등록
   @Override
   public void insertFile(FileVO fVo) throws Exception {
      session.insert(namespace+".insertFile", fVo);
      
   }
   // 7. 관리자 :: 파일 삭제
   @Override
   public void deleteFile(int proNo) throws Exception {
      session.delete(namespace+".deleteFile", proNo);
      
   }
   // 8. 관리자 :: 파일 목록
   @Override
   public List<FileVO> list(int proNo) throws Exception {
      return session.selectList(namespace+".fileList", proNo);
   }

   
 
   
     

  

}