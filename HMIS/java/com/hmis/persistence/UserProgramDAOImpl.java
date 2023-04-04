package com.hmis.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.FileVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;

@Repository
public class UserProgramDAOImpl implements UserProgramDAO {
   
   @Inject
   private SqlSession session;

   private static String namespace = "com.hmis.mapper.UserProgramMapper";

   
   
   // 1. 학생 :: 기초정보관리 - 프로그램리스트 - 상세보기 - 신청
   @Override
   public int create(UserProgramVO vo) throws Exception {
      session.insert(namespace + ".create", vo);
      return vo.getUserProNo();
   }

   // 2. 학생 :: 기초정보관리 - 프로그램리스트 - 신청현황 나오게 표시
   @Override
   public UserProgramVO read(int userProNo) throws Exception {
      return session.selectOne(namespace + ".read", userProNo);

   }
   
   //3. 학생 :: 기초정보관리 - 프로그램리스트 - 상세보기 - 삭제
   @Override
   public void delete(int userProNo) throws Exception {
      session.delete(namespace + ".delete", userProNo);
      
   }
   

   // 4. 학생 :: 파일 등록
    @Override
    public void insertFile(FileVO fVo) throws Exception {
       session.insert(namespace+".insertFile", fVo);
       
    }

    
    // 5. 학생 :: 파일 삭제
    @Override
    public void delete(FileVO fVo) throws Exception {
       // TODO Auto-generated method stub
       
    }
    // 6. 학생 :: 파일 목록
    @Override
    public List<FileVO> list(int userProNo) throws Exception {
       return session.selectList(namespace+".fileList", userProNo);
    }
   
    //7. 관리자  ::프로그램 상세보기 화면 신청자 리스트
    @Override
    public List<UserProgramVO> adUserList(int proNo) throws Exception {
       
       return session.selectList(namespace + ".adUserList", proNo);
         
    } 
   
   
   
    // 8. 관리자 :: 프로그램리스트 - 프로그램신청자목록 - 승인

   @Override
   public void accept(int userProNo) throws Exception {
      Map<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("userProNo", userProNo);
      
      
      session.update(namespace+".accept", paramMap);
      
   }

   // 9. 관리자 :: 프로그램 - 프로그램신청자목록 - 거절
   @Override
   public void deny(int userProNo) throws Exception {
      Map<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("userProNo", userProNo);
      
      session.update(namespace+".deny", paramMap);
      
   }
   
   // 10. 관리자 :: 졸업인증신청 관리 - 상세조회
   @Override
   public UserProgramVO adUserProgramSelect(int userProNo) throws Exception {
      
      return session.selectOne(namespace+".adUserProgramSelect", userProNo);
   }
    

   
   //11. 관리자 ::  프로그램신청서 검색처리(SearchCriteria와 Criteria)
   
     @Override public List<UserProgramVO> adlistSearch(SearchCriteria cri) throws
     Exception { return session.selectList(namespace + ".adlistSearch", cri);
     
     }
     
     @Override public int adlistSearchCount(SearchCriteria cri) throws Exception {
     return session.selectOne(namespace + ".adlistSearchCount", cri); }
     
     
      
     
     @Override
      public List<UserProgramVO> acceptProList(int userNo) throws Exception {
         
         
         return session.selectList(namespace+".acceptProList", userNo);
      }
     
     //12. 학생,관리자  :: 학생 신청 상태 리스트(승인대기,승인,거부)  
     @Override
      public List<UserProgramVO> ProList(int userNo) throws Exception {
         
         
         return session.selectList(namespace+".ProList", userNo);
      }
     
   
      
      
     
     }