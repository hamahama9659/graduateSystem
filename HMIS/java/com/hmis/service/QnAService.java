package com.hmis.service;

import java.util.List;


import com.hmis.domain.QnAVO;
import com.hmis.domain.SearchCriteria;

public interface QnAService {
   
   // 1. 학생 :: QnA - 등록
   public void register(QnAVO vo) throws Exception;
   
   // 2. 관리자 또는 학생 :: QnA - 조회
   public QnAVO read(int qnaNo) throws Exception;

   // 3. 학생 :: QnA - 수정
   public void modify(QnAVO vo) throws Exception;

   // 4. 관리자 또는 학생 :: QnA - 삭제
   public void remove(int qnaNo) throws Exception;

   // 5. 관리자 또는 학생 :: QnA 내역 및 검색 리스트
   public List<QnAVO> listSearch(SearchCriteria cri) throws Exception;

   public int listSearchCount(SearchCriteria cri) throws Exception;

   


     // QNA - 해당하는프로그램 업로드 파일
   /* public List<FileVO> fileList(int qnaNo) throws Exception;*/
    
   
}