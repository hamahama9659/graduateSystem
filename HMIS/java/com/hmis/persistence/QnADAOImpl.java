package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.hmis.domain.QnAVO;
import com.hmis.domain.SearchCriteria;

@Repository
public class QnADAOImpl implements QnADAO{

   
   @Inject
   private SqlSession session;
   
   private static String namespace = "com.hmis.mapper.QnaMapper";

   // 1. 학생 :: QnA - 등록
   @Override
   public int create(QnAVO vo) throws Exception {
       session.insert(namespace + ".create", vo);
      return vo.getQnaNo();
   }
   
   // 2. 관리자 또는 학생 :: QnA - 조회
   @Override
   public QnAVO read(int qnaNo) throws Exception {
      return session.selectOne(namespace + ".read", qnaNo);
   }

   // 3. 학생 :: QnA - 수정
   @Override
   public void update(QnAVO vo) throws Exception {
      session.update(namespace + ".update", vo);
      
   }

   // 4. 관리자 또는 학생 :: QnA - 삭제
   @Override
   public void delete(int qnaNo) throws Exception {
      session.delete(namespace + ".delete", qnaNo);
      
   }
   
   // 5. 관리자 또는 학생 :: QnA 내역 및 검색 리스트
   @Override
   public List<QnAVO> listSearch(SearchCriteria cri) throws Exception {
      return session.selectList(namespace + ".listSearch", cri);
   }

   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      return session.selectOne(namespace + ".listSearchCount", cri);
   }

   // 6. 관리자 또는 학생:: QnA - 조회수
   @Override
   public void updateHits(int qnaNo) throws Exception {
      session.update(namespace + ".updateHits", qnaNo);
   }
   
   
    //파일 업로드
/*      @Override
      public void insertFile(FileVO fVo) throws Exception {
         session.insert(namespace+".insertFile", fVo);
         
      }*/
/*
      @Override
      public void delete(FileVO fVo) throws Exception {
         // TODO Auto-generated method stub
         
      }

      @Override
      public List<FileVO> list(int proNo) throws Exception {
         return session.selectList(namespace+".fileList", proNo);
      }
   */
   
   
   
}