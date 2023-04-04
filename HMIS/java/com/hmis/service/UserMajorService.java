package com.hmis.service;

import java.util.List;

import com.hmis.domain.UserMajorVO;

public interface UserMajorService {

   

   // 1. 학생 :: 전공목록 수정페이지 - 수강한 전공리스트에 추가
   public void register(UserMajorVO vo) throws Exception;
   
   // 2. 학생 :: 전공목록 수정페이지 - 수강한 전공리스트에서 삭제
   public void umremove(int userNo) throws Exception;
   
   // 3. 학생 :: 수강한 전공 리스트 불러오기
   public List<UserMajorVO> listAll(int userNo) throws Exception;

   // 4. 학생 :: 수강하지 않은 전공 리스트 불러오기
   public List<UserMajorVO> otherList(int userNo) throws Exception;

   

   
}