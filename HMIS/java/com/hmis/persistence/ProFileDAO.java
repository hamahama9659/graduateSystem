package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.ProFileVO;

public interface ProFileDAO {

   
   // 1. 학생 ::등록
   public void create(ProFileVO pVo) throws Exception;
   
   // 2. 학생 ::삭제
   public void delete(ProFileVO pVo) throws Exception;
   
   // 3. 파일 목록
   public List<ProFileVO> list(int userProNo) throws Exception;
   
}