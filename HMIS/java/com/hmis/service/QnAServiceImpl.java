package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.QnAVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.persistence.QnADAO;
import com.hmis.persistence.ReplyDAO;

@Service
public class QnAServiceImpl implements QnAService{

   @Inject
   private QnADAO dao;
   
   @Inject
   private ReplyDAO redao;
   
   // 1. 관리자 또는 학생 :: QnA - 게시물 등록
   @Override
   public void register(QnAVO vo) throws Exception {
      // 1. 텍스트에어리어 줄바꿈 적용
         vo.setQnaContents(vo.getQnaContents().replace("\\r\\n", "<br>"));
         
         // 2. 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
         int qnaNo = dao.create(vo);
 
         
         // 4. 추가 이미지 존재 여부 IF문
           /* if (vo.getFiles() != null) {

               // 4. 추가 이미지 저장 FOR문
               for (int i = 0; i < vo.getFiles().length; i++) {

                  // 4-1.추가 이미지 저장

                  FileVO fVo = new FileVO();
                  fVo.setQnaNo(qnaNo);
                  fVo.setFileName(vo.getFiles()[i]);

                  

                  // 4-2.추가 이미지 저장
                  dao.insertFile(fVo);

               }
            }*/
   }

   // 2. 관리자 또는 학생 :: QnA - 조회
   @Override
   public QnAVO read(int qnaNo) throws Exception {
      dao.updateHits(qnaNo);
      return dao.read(qnaNo);
      
   }

   // 3. 학생 :: QnA - 수정
   @Override
   public void modify(QnAVO vo) throws Exception {
      dao.update(vo);
      
   }

   // 4. 관리자 또는 학생 :: QnA - 삭제
   @Override
   public void remove(int qnaNo) throws Exception {
     redao.deleteAll(qnaNo); // 댓글(FK)부터 전체 삭제
      dao.delete(qnaNo); // 댓글 삭제 후 게시글 삭제 
      
   }

   // 5. 관리자 또는 학생 :: QnA 내역 및 검색 리스트
   @Override
   public List<QnAVO> listSearch(SearchCriteria cri) throws Exception {
     
      return dao.listSearch(cri);
   }

   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      return dao.listSearchCount(cri);
   }
   


   
/*      @Override
      public List<FileVO> fileList(int qnaNo) throws Exception {
         
         return dao.list(qnaNo);
      }
*/
}