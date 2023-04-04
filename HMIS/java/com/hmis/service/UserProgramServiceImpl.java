package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.FileVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserProgramVO;
import com.hmis.persistence.UserProgramDAO;

@Service
public class UserProgramServiceImpl implements UserProgramService {

   @Inject
   private UserProgramDAO dao;

   // 1. 학생 :: 기초정보관리 - 프로그램리스트 - 상세보기 - 신청
   @Override
   public void register(UserProgramVO vo) throws Exception {
      // 1. 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
      int userProNo = dao.create(vo);
     

      // 2. 추가 이미지 존재 여부 IF문
      if (vo.getFiles() != null) {

         // 2. 추가 이미지 저장 FOR문
         for (int i = 0; i < vo.getFiles().length; i++) {

            // 2-1.추가 이미지 저장
            FileVO fVo = new FileVO();
            fVo.setUserProNo(userProNo);
            fVo.setFileName(vo.getFiles()[i]);

            

            // 2-2.추가 이미지 저장
            dao.insertFile(fVo);

         }
      }
   }

   // 2. 학생 :: 기초정보관리 - 프로그램리스트 - 신청현황 나오게 표시
   @Override
   public UserProgramVO read(int userProNo) throws Exception {
      return dao.read(userProNo);

   }


   // 3. 학생 :: 기초정보관리 - 프로그램리스트 - 상세보기 - 삭제
   @Override
   public void remove(int userProNo) throws Exception {
      dao.delete(userProNo);

   }

   // 4. 관리자 :: 프로그램리스트 - 프로그램신청자목록 - 승인
   @Override
   public void accept(int userProNo) throws Exception {
      dao.accept(userProNo);
   }

   // 5. 관리자 :: 프로그램 - 프로그램신청자목록 - 거절
   @Override
   public void deny(int userProNo) throws Exception {
      dao.deny(userProNo);

   }

   //6. 관리자:: 검색처리
   @Override
   public List<UserProgramVO> adlistSearch(SearchCriteria cri) throws Exception {
      return dao.adlistSearch(cri);
   }

   //7. 관리자 :: 졸업인증신청 관리 - 상세조회
   @Override
   public int adlistSearchCount(SearchCriteria cri) throws Exception {

      return dao.adlistSearchCount(cri);
   }
   
   @Override
   public UserProgramVO adUserProgramRead(int userProNo) throws Exception {

      return dao.adUserProgramSelect(userProNo);
   }

   //8.  프로그램 - 해당하는프로그램 업로드 파일
   @Override
   public List<FileVO> fileList(int userProNo) throws Exception {

      return dao.list(userProNo);
   }

   @Override
   public List<UserProgramVO> acceptProList(int userNo) throws Exception {
      return dao.acceptProList(userNo);
   }


   //9. 관리자 :: 프로그램 상세보기 화면 신청자 리스트
   @Override
   public List<UserProgramVO> adUserList(int proNo) throws Exception {
      
      return dao.adUserList(proNo);
      
   }
   
   //10. 학생,관리자  :: 학생 신청 상태 리스트(승인대기,승인,거부)   
   @Override
   public List<UserProgramVO> ProList(int userNo) throws Exception {
      return dao.ProList(userNo);
   }

}