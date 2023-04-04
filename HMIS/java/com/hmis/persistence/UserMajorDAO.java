package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.UserMajorVO;

public interface UserMajorDAO {


   
   // 학생 :: 전공목록 수정페이지 - 수강한 전공리스트에 추가
   public void create(UserMajorVO vo) throws Exception;
   
   // 학생 :: 전공목록 수정페이지 - 수강한 전공리스트에서 삭제
   public void umdelete(int userNo) throws Exception;
   
   
   // 학생 :: 수강한 전공 리스트 불러오기
   public List<UserMajorVO> listAll(int userNo) throws Exception;

   // 학생 :: 수강하지 않은 전공 리스트 불러오기
   public List<UserMajorVO> otherList(int userNo) throws Exception;
   
   
  

}