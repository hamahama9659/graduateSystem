package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.UserMajorVO;
import com.hmis.persistence.UserMajorDAO;

@Service
public class UserMajorServiceImpl implements UserMajorService {

   @Inject
   private UserMajorDAO dao;
   


   // 1. 학생 :: 전공목록 수정페이지 - 수강한 전공리스트에 추가
   @Override
   public void register(UserMajorVO vo) throws Exception {
      dao.create(vo);
    }
   
   // 2. 학생 :: 전공목록 수정페이지 - 수강한 전공리스트에서 삭제
   @Override
   public void umremove(int userNo) throws Exception {
      dao.umdelete(userNo);
   }
   
   // 3. 학생 :: 수강한 전공 리스트 불러오기
   @Override
   public List<UserMajorVO> listAll(int userNo) throws Exception {
      return dao.listAll(userNo);
   }

   // 4. 학생 :: 수강하지 않은 전공 리스트 불러오기
   @Override
   public List<UserMajorVO> otherList(int userNo) throws Exception {
      return dao.otherList(userNo);
   }
   
   
}