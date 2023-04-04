package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.ApplyVO;
import com.hmis.domain.Criteria;
import com.hmis.domain.GoalVO;
import com.hmis.domain.MisVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserVO;
import com.hmis.dto.LoginDTO;
import com.hmis.dto.TotalDTO;
import com.hmis.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

   @Inject
   private UserDAO dao;
   
   @Override
   public UserVO login(LoginDTO dto) throws Exception {

      return dao.login(dto);
   }

   @Override
   // 1. 관리자 :: 기초정보관리 - 학생 등록
   public void register(UserVO uVo) throws Exception {
      // TODO Auto-generated method stub
      dao.insert(uVo);
   }

   @Override
   // 2. 관리자 :: 학생 목록
   public List<UserVO> list(SearchCriteria cri) throws Exception {
      // TODO Auto-generated method stub
      return dao.list(cri);
      
   }

   @Override
   // 3. 관리자 :: 기초정보관리 - 학생상세내역
   public UserVO read(int userNo) throws Exception {
      // TODO Auto-generated method stub
      return dao.read(userNo);
   }
   
   @Override
   // 4. 관리자 :: 기초정보관리 - 학생 수정
   public void modify(UserVO uVo) throws Exception {
      // TODO Auto-generated method stub
      dao.update(uVo);
   }

   @Override
   // 5. 관리자 :: 기초정보관리 - 학생 삭제
   public void remove(int userNo) throws Exception {
      // TODO Auto-generated method stub
      dao.delete(userNo);
   }

   // 6. MY PAGE - 내 점수(MIS 총점)
   @Override
   public TotalDTO misTotal(int userNo) throws Exception {
      // TODO Auto-generated method stub
      return null;
   }

   // 7. MY PAGE - 내 점수(인증항목 총점)
   @Override
   public TotalDTO subTotal(int userNo) throws Exception {
      // TODO Auto-generated method stub
      return null;
   }
   
   // 8. MY PAGE - 내 정보
   @Override
   public UserVO myInfo(int userNo) throws Exception {
      // TODO Auto-generated method stub
      return dao.myInfo(userNo);
   }

   // 9 . MY PAGE - 내 정보 수정
   @Override
   public void myInfoModify(UserVO uVo) throws Exception {
      // TODO Auto-generated method stub
      dao.myInfoUpdate(uVo);
   }

   // 10. 페이징처리
   @Override
   public List<UserVO> listCriteria(Criteria cri) throws Exception {
      // TODO Auto-generated method stub
      return dao.listCriteria(cri);
   }

   
   @Override
   public int countPaging(Criteria cri) throws Exception {
      // TODO Auto-generated method stub
      return dao.countPaging(cri);
   }

   // 11. 검색처리
   @Override
   public List<UserVO> listSearch(SearchCriteria cri) throws Exception {
      // TODO Auto-generated method stub
      return dao.listSearch(cri);
   }

   @Override
   public int listSearchCount(SearchCriteria cri) throws Exception {
      // TODO Auto-generated method stub
      return dao.listSearchCount(cri);
   }

   // 12. 관리자 :: 대시보드 - 신청 건수
   @Override
   public int applyCount() throws Exception {
      
      return dao.applyCount();
   }

   // 13. 관리자 :: 대시보드 - 졸업예정자 수
   @Override
   public int graduateCount() throws Exception {
      
      return dao.graduateCount();
   }

   
   
   @Override
   public  List<UserVO> graduateList() throws Exception {
      
      return dao.graduateList();
   }
   
   
   

   
   // 14. 관리자 :: 대시보드 - 졸업대상자 수
   @Override
   public int graduateToBeCount() throws Exception {
      
      return dao.graduateToBeCount();
   }

   // 15. 관리자 :: 대시보드 - 최근 MIS 3개 정보
   @Override
   public List<MisVO> misInfo() throws Exception {
      
      return dao.misInfo();
   }
   // 16. 학생 :: 대시보드 - 최근 승인 대기 신청내역 3개 리스트
   @Override
   public List<ApplyVO> mainApplyWaitList(int userNo) throws Exception {
      
      return dao.mainApplyWaitList(userNo);
   }
   // 17. 학생 :: MY PAGE - 내 목표 설정(등록)
   @Override
   public void goalInsert(GoalVO gVo) throws Exception {
      dao.goalInsert(gVo);
      
   }
   // 18. 학생 :: MY PAGE - 내 목표 리스트
   @Override
   public List<GoalVO> goalList(int userNo) throws Exception {
      // TODO Auto-generated method stub
      return dao.goalList(userNo);
   }
   // 19. 학생 :: MY PAGE - 내 목표 상세보기
   @Override
   public GoalVO goalRead(int goalNo) throws Exception {
      // TODO Auto-generated method stub
      return dao.goalSelect(goalNo);
   }
   // 20. 관리자 :: 학생 등록 - 학번 중복체크 AJAX.
   @Override
   public int checkUserNo(int userNo) throws Exception {
      return dao.checkUserNo(userNo);
   }
   
   // 비밀번호 체크
   /*@Override
   public boolean checkPw(int userNo, String userPw) throws Exception {
      // TODO Auto-generated method stub
      return dao.checkPw(userNo, userPw);
   }*/

}