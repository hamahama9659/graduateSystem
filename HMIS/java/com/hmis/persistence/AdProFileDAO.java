package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.AdProFileVO;

public interface AdProFileDAO {


   // 1. 관리자 ::등록 (프로그램 파일)
   public void create(AdProFileVO apVo) throws Exception;
   
   // 2. 관리자 ::삭제
   public void delete(AdProFileVO apVo) throws Exception;
   
   // 3. 파일 목록
   public List<AdProFileVO> list(int proNo) throws Exception;
   
   
}