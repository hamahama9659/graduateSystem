package com.hmis.persistence;


import java.util.List;


import com.hmis.domain.QnAVO;
import com.hmis.domain.SearchCriteria;

public interface QnADAO {

   // 1. 학생 :: QnA - 등록
   public int create(QnAVO vo) throws Exception;
   
   // 2. 관리자 또는 학생 :: QnA - 조회
   public QnAVO read(int qnaNo) throws Exception;

   // 3. 학생 :: QnA - 수정
   public void update(QnAVO vo) throws Exception;
   
   // 4. 관리자 또는 학생 :: QnA - 삭제
   public void delete(int qnaNo) throws Exception;

   // 5. 관리자 또는 학생 :: QnA 내역 및 검색 리스트
   public List<QnAVO> listSearch(SearchCriteria cri) throws Exception;

   public int listSearchCount(SearchCriteria cri) throws Exception;

   // 6. 관리자 또는 학생:: QnA - 조회수
   void updateHits(int qnaNo) throws Exception;

   
/*    // 파일 업로드 등 수 리스트
    //1. 등록
    public void insertFile(FileVO fVo) throws Exception;
    
    // 2. 삭제
    public void delete(FileVO fVo) throws Exception;
    
    // 3. 파일 목록
    
    public List<FileVO> list(int proNo) throws Exception;
    */
   
   
   
   
}