package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.FileVO;
import com.hmis.domain.ProgramVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;
import com.hmis.persistence.ProgramDAO;

@Service
public class ProgramServiceImpl implements ProgramService {

   
   @Inject
   ProgramDAO dao;
   
   // 1. 관리자 :: 기초정보관리 - 프로그램 등록
   @Override
   public void register(ProgramVO vo) throws Exception {
      
      // 1. 텍스트에어리어 줄바꿈 적용
      vo.setContents(vo.getContents().replace("\\r\\n", "<br>"));
      
      // 2. 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
      int proNo = dao.adCreate(vo);
     
      
      // 4. 추가 이미지 존재 여부 IF문
         if (vo.getFiles() != null) {

            // 4. 추가 이미지 저장 FOR문
            for (int i = 0; i < vo.getFiles().length; i++) {

               // 4-1.추가 이미지 저장

               FileVO fVo = new FileVO();
               fVo.setProNo(proNo);
               fVo.setFileName(vo.getFiles()[i]);

            
               // 4-2.추가 이미지 저장
               dao.insertFile(fVo);

            }
         }
   }
   
   // 2. 관리자, 학생 :: 기초정보관리 - 프로그램상세내역
   @Override
   public ProgramVO read(int proNo) throws Exception {
      return dao.read(proNo);
   }

   //3.  관리자 :: 기초정보관리 - 프로그램 수정
   @Override
   public void modify(ProgramVO vo) throws Exception {
      
     
   // 1. 텍스트에어리어 줄바꿈 적용
      vo.setContents(vo.getContents().replace("\\r\\n", "<br>"));
      
      //프로그램 게시글 수정
      dao.adUpdate(vo);

      //프로그램 소속된 첨부파일 삭제
      dao.deleteFile(vo.getProNo());
      
      // 4. 추가 이미지 존재 여부 IF문
         if (vo.getFiles() != null) {

            // 4. 추가 이미지 저장 FOR문
            for (int i = 0; i < vo.getFiles().length; i++) {

               // 4-1.추가 이미지 저장

               FileVO fVo = new FileVO();
               fVo.setProNo(vo.getProNo());
               fVo.setFileName(vo.getFiles()[i]);

              

               // 4-2.추가 이미지 저장
               dao.insertFile(fVo);

            }
         }
      
   }
   
   //4. 프로그램  조회수
   @Override
   public void updateHits(Integer proNO) throws Exception {
      dao.updateHits(proNO);
      
   }

   @Override
   public List<ProgramVO> listSearch(SearchCriteria cri) throws Exception {
      return dao.listSearch(cri);
   }

   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      return dao.listSearchCount(cri);
   }
   
   // 프로그램 - 해당하는프로그램 업로드 파일
   @Override
   public List<FileVO> fileList(int proNo) throws Exception {
      
      return dao.list(proNo);
   }
   // 프로그램 - 신청, 마감 상태
   @Override
   public UserProgramVO stateCheck(int proNo, int userNo) throws Exception {
   // TODO Auto-generated method stub
   return dao.stateCheck(proNo, userNo);
}
   
   
}