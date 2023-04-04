package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.ProfessorVO;
import com.hmis.domain.SearchCriteria;



public interface ProfessorDAO {

   // 교수로그인DTO만들어줘야함
   // public ProfessorVO login(LoginDTO dto) throws Exception;

   // 1. 관리자 :: 기초정보관리 - 교수 등록
   public void create(ProfessorVO vo) throws Exception;

   // 2. 관리자 :: 기초정보관리 - 교수상세내역
   public ProfessorVO read(int profNo) throws Exception;

   // 3. 관리자 :: 기초정보관리 - 교수 수정
   public void update(ProfessorVO vo) throws Exception;

   // 4. 관리자 :: 기초정보관리 - 교수 삭제
   public void delete(int profNo) throws Exception;

   // 5. 관리자 :: 전공 등록 - 교수 명단
   public List<ProfessorVO> listProf(SearchCriteria cri);
   
   


   /*
    * 
    * 검색처리 public List<ProfessorVO> listSearch(SearchCriteria cri) throws
    * Exception;
    * 
    * public int listSearchCount(SearchCriteria cri) throws Exception;
    */

   
}