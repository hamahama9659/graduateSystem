package com.hmis.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.GraduationTestVO;
import com.hmis.domain.GraduationVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.SubjectVO;
import com.hmis.dto.TotalDTO;

@Repository
public class GraduationTestDAOImpl implements GraduationTestDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.hmis.mapper.GraduationTestMapper";

   // 1. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 수정
   @Override
   public void adUpdate(GraduationTestVO vo) throws Exception {

      session.update(namespace + ".adUpdate", vo);

   }

   
   // 2. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 모든 학생 신청 목록 (전체)
   @Override
   public List<GraduationTestVO> adGraduTestListSearch(SearchCriteria cri, int graduNo) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", cri);
		paramMap.put("graduNo", graduNo);
	   
      return session.selectList(namespace + ".adGraduTestListSearch", paramMap);

   }

   // 3. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 모든 학생 신청 목록 (전체) ---> 페이징 , 카운트
   @Override
   public int adGraduTestListSearchCount(SearchCriteria cri) throws Exception {

      return session.selectOne(namespace + ".adGraduTestListSearchCount", cri);

   }

   // 4. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 승인대기 학생 신청 목록 (승인대기)
   @Override
   public List<GraduationTestVO> adWaitList() throws Exception {

      return session.selectList(namespace + ".adWaitList");

   }

   // 5. 학생 :: 졸업심사 신청(GRADUATIONTEST) - 졸업심사 신청 학생 상세보기
   // 	  관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 신청 학생 상세보기
   @Override
   public GraduationTestVO adGraduTestSelect(int testNo) throws Exception {

      return session.selectOne(namespace + ".adGraduTestSelect", testNo);

   }

   // 6. 관리자:: 신청학생 상세페이지
   @Override
   public TotalDTO esSelect(int userNo) throws Exception {
      return session.selectOne(namespace + ".esSelect", userNo);
   }

   // 7. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 승인 (승인)
   @Override
   public void accept(int testNo) throws Exception {

      Map<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("testNo", testNo);
   

      session.update(namespace + ".accept", paramMap);

   }

   // 8. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 승인된 학생 목록
   @Override
   public List<GraduationTestVO> acceptList(int userNo) throws Exception {

      return session.selectList(namespace + ".acceptList", userNo);

   }

   // 9. 관리자 : 졸업심사 관리(GRADUATIONTEST) - 졸업심사 거절 (거절)
   @Override
   public void deny(int testNo) throws Exception {

      Map<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("testNo", testNo);


      session.update(namespace + ".deny", paramMap);

   }

   // 10. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업점수
   @Override
   public List<TotalDTO> esList(SearchCriteria cri) throws Exception {

      return session.selectList(namespace + ".esList", cri);

   }

   
   
   @Override
   public List<TotalDTO> graduateToBeList() throws Exception{
	   return session.selectList(namespace + ".graduateToBeList");
   }
   // 11. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업점수 ---> 페이징 , 카운트
   @Override
   public int esListCount(SearchCriteria cri) throws Exception {

      return session.selectOne(namespace + ".esListConut", cri);

   }

   // ---------------------------------------------------------------------------------

   // 1. 학생 :: 졸업심사신청(GRADUATION) - GRADUATION 목록
   @Override
   public List<GraduationTestVO> graduList(SearchCriteria cri) throws Exception {

      return session.selectList(namespace + ".graduList", cri);

   }

   // 2. 학생 :: 졸업심사신청(GRADUATION) - 제목 검색
   @Override
   public List<GraduationVO> graduListSearch(String title) throws Exception {

      return session.selectList(namespace + ".graduListSearch", title);

   }

   // 3. 학생 : 졸업심사신청(GRADUATION) - 제목 검색 ---> 페이징 , 카운트
   @Override
   public int graduListSearchCount(SearchCriteria cri) throws Exception {

      return session.selectOne(namespace + ".graduListSearchCount", cri);

   }

   // 4. 학생 :: 졸업심사신청(GRADUATIONTEST) - 등록(신청)
   @Override
   public int create(GraduationTestVO vo) throws Exception {

      session.insert(namespace + ".create", vo);
      return vo.getTestNo();

   }

   // 5. 학생 : 졸업심사신청(GRADUATIONTEST) - 삭제(신청 취소)
   @Override
   public void delete(int testNo) throws Exception {

      session.delete(namespace + ".delete", testNo);

   }

   // 6. 학생 :: 졸업심사신청(GRADUATIONTEST) - 졸업 신청 상세조회 (팝업창 ---> 목적 : 승인여부 확인)
   @Override
   public GraduationTestVO stuGraduTestRead(int testNo) throws Exception {

      return session.selectOne(namespace + ".stuGraduTestRead", testNo);

   }

   @Override
   public List<GraduationTestVO> stuGraduTestList(int userNo) throws Exception {

      return session.selectList(namespace + ".stuGraduTestList", userNo);

   }
   // 관리자 팝업---------------------------------------------------------------
   // 1. 관리자 :: 추가점수 - 항목 명 검색

   @Override
   public List<SubjectVO> searchSub(String subName) throws Exception {
      // TODO Auto-generated method stub
      return session.selectList(namespace + ".searchSub", subName);
   }

   // 2. 관리자 :: 추가점수
   @Override
   public List<SubjectVO> subList() throws Exception {
      // TODO Auto-generated method stub
      return session.selectList(namespace + ".subList");
   }

   // 학생 팝업----------------------------------------------------------------
   // 학생 :: 졸업신청 - 졸업신청결과 팝업
   @Override
   public List<GraduationTestVO> graduTestList(int userNo) throws Exception {
      // TODO Auto-generated method stub
      return session.selectList(namespace + ".graduTestList", userNo);
   }




}