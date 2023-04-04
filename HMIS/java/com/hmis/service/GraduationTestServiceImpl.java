package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.ApplyVO;
import com.hmis.domain.FileVO;
import com.hmis.domain.GraduationTestVO;
import com.hmis.domain.GraduationVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.SubjectVO;
import com.hmis.dto.TotalDTO;
import com.hmis.persistence.ApplyDAO;
import com.hmis.persistence.FileDAO;
import com.hmis.persistence.GraduationTestDAO;

@Service
public class GraduationTestServiceImpl implements GraduationTestService {

   @Inject
   GraduationTestDAO dao;

   @Inject
   FileDAO fDao;
   
   @Inject
   ApplyDAO aDao;
   

   // 1. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 수정
   @Override
   public void adModify(GraduationTestVO vo) throws Exception {

      dao.adUpdate(vo);

   }

   //2. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 모든 학생 신청 목록 (전체)
   @Override
   public List<GraduationTestVO> adGraduTestListSearch(SearchCriteria cri,int graduNo) throws Exception {

      return dao.adGraduTestListSearch(cri, graduNo);

   }

   // 3. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 모든 학생 신청 목록 (전체) ---> 페이징 , 카운트
   @Override
   public int adGraduTestListSearchCount(SearchCriteria cri) throws Exception {

      return dao.adGraduTestListSearchCount(cri);

   }

   // 4. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 승인대기 학생 신청 목록 (승인대기)
   @Override
   public List<GraduationTestVO> adWaitList() throws Exception {

      return dao.adWaitList();

   }

   // 5. 학생 :: 졸업심사 신청(GRADUATIONTEST) - 졸업심사 신청 학생 상세보기
   //    관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 신청 학생 상세보기
   @Override
   public GraduationTestVO adGraduTestRead(int testNo) throws Exception {

      return dao.adGraduTestSelect(testNo);

   }

   
   // 6. 관리자 :: 신청학생 상세페이지
   @Override
     public TotalDTO esSelect(int userNo) throws Exception {
        
        return dao.esSelect(userNo); }
   
   // 7. 관리자  :: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 승인 (승인)
   @Override
   public void accept(int testNo, ApplyVO aVO) throws Exception {

      //1) 추가 점수가 있을 경우 인증 항목을 추가한다.
      if(aVO.getSubNo() > 0) {
         aDao.exInsert(aVO);
      }
      //2) 심사 승인한다.
      dao.accept(testNo);

   }
   

 

   // 8. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 승인된 학생 목록
   @Override
   public List<GraduationTestVO> acceptList(int userNo) throws Exception {

      return dao.acceptList(userNo);

   }

   // 9. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업심사 거절 (거절)
   @Override
   public void deny(int testNo) throws Exception {

      dao.deny(testNo);

   }

   /*
    * @Override public List<FileVO> fileList(int ApplyNo) throws Exception {
    * 
    * return fDao.list(ApplyNo);
    * 
    * }
    */

   // 10. 관리자  :: 졸업심사 관리(GRADUATIONTEST) - 졸업점수
   @Override
   public List<TotalDTO> esList(SearchCriteria cri) throws Exception {

      return dao.esList(cri);

   }
   
   
   @Override
   public  List<TotalDTO>  graduateToBeList() throws Exception{
	return dao.graduateToBeList();
	   
   }

   // 11. 관리자 :: 졸업심사 관리(GRADUATIONTEST) - 졸업점수 ---> 페이징 , 카운트
   @Override
   public int esListCount(SearchCriteria cri) throws Exception {
      return dao.esListCount(cri);

   }

   // ---------------------------------------------------------------------------------

   // 1. 학생 :: 졸업심사신청(GRADUATION) - GRADUATION 목록
   @Override
   public List<GraduationTestVO> graduList(SearchCriteria cri) throws Exception {
      return dao.graduList(cri);

   }

   // 2. 학생 :: 졸업심사신청(GRADUATION) - 제목 검색
   @Override
   public List<GraduationVO> graduListSearch(String title) throws Exception {

      return dao.graduListSearch(title);

   }

   // 3. 학생 :: 졸업심사신청(GRADUATION) - 제목 검색 ---> 페이징 , 카운트
   @Override
   public int graduListSearchCount(SearchCriteria cri) throws Exception {

      return dao.graduListSearchCount(cri);

   }

   // 4. 학생 :: 졸업심사신청(GRADUATIONTEST) - 등록(신청)
   @Override
   public void register(GraduationTestVO vo) throws Exception {

      // 졸업심사신청 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
      int testNo = dao.create(vo);

    

      // 4. 추가 이미지 존재 여부 IF문
      if (vo.getFiles() != null) {

         // 4. 추가 이미지 저장 FOR문
         for (int i = 0; i < vo.getFiles().length; i++) {

            // 4-1.추가 이미지 저장

            FileVO fVo = new FileVO();
            fVo.setApplyNo(testNo);
            fVo.setFileName(vo.getFiles()[i]);

            

            // 4-2.추가 이미지 저장
            fDao.insert(fVo);

         }
      }

   }

   // 5. 학생 :: 졸업심사신청(GRADUATIONTEST) - 삭제(신청 취소)
   @Override
   public void remove(int testNo) throws Exception {

      dao.delete(testNo);

   }

   // 6. 학생:: 졸업심사신청(GRADUATIONTEST) - 학생의 졸업신청 내역
   @Override
   public GraduationTestVO stuGraduTestRead(int testNo) throws Exception {

      return dao.stuGraduTestRead(testNo);

   }

   // 7. 학생 :: 졸업심사신청(GRADUATIONTEST) - 졸업 신청 상세조회 (팝업창 ---> 목적 : 승인여부 확인)
   @Override
   public List<GraduationTestVO> stuGraduTestList(int userNo) throws Exception {

      return dao.stuGraduTestList(userNo);

   }

   // 관리자 팝업---------------------------------------------------------------
   // 1. 관리자 :: 추가점수 - 항목 명 검색
   @Override
   public List<SubjectVO> searchSub(String subName) throws Exception {
      // TODO Auto-generated method stub
      return dao.searchSub(subName);
   }

   // 2. 관리자 :: 추가점수
   @Override
   public List<SubjectVO> subList() throws Exception {
      // TODO Auto-generated method stub
      return dao.subList();
   }

   // 학생 팝업----------------------------------------------------------------

   //학생 :: 졸업신청 - 졸업신청결과 팝업
   @Override
   public List<GraduationTestVO> graduTestList(int userNo) throws Exception {
      // TODO Auto-generated method stub
      return dao.graduTestList(userNo);
   }

}