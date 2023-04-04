package com.hmis.service;

import java.util.List;

import com.hmis.domain.ApplyVO;
import com.hmis.domain.FileVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.SubjectVO;
import com.hmis.dto.TotalDTO;

public interface ApplyService {

	// 1. 학생 :: 졸업인증신청 관리 - 항목 명 검색
	public List<SubjectVO> searchSub(String subName) throws Exception;

	// 2. 학생 :: 졸업인증신청 관리 - 신청 등록
	public void register(ApplyVO aVo) throws Exception;

	// 3. 학생 :: 졸업인증신청 관리 - 한 학생의 신청 내역 목록
	public List<ApplyVO> stuApplyList(int userNo) throws Exception;

	// 4. 리스트 카운트
	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 5. 학생 :: 졸업인증신청 관리 - 신청 내역 상세조회
	public ApplyVO stuApplyRead(int applyNo) throws Exception;

	// 6. 관리자 :: 졸업인증신청 관리 - 모든 학생 신청 내역
	public List<ApplyVO> adApplyList(SearchCriteria cri) throws Exception;

	// 관리자 :: 졸업인증신청 관리 - 모든학생 신청내역(전체) 리스트 카운트
	public int adApplyListSearchCount(SearchCriteria cri) throws Exception;

	// 7. 관리자 :: 졸업인증신청 관리 - 상세조회
	public ApplyVO adApplyRead(int applyNo) throws Exception;

	// 8. 관리자 :: 졸업인증신청 관리 - 신청
	public void accept(int applyNo, String reason) throws Exception;

	// 9. 관리자 :: 졸업인증신청 관리 - 거절
	public void deny(int applyNo, String reason) throws Exception;

	// 10. 학생 :: 졸업인증신청 관리 - 졸업인증항목 목록
	public List<SubjectVO> subList() throws Exception;

	// 관리자 :: 졸업인증신청 관리 - 신청 승인 대기 리스트
	public List<ApplyVO> waitList() throws Exception;

	// 졸업인증신청관리 - 해당하는 신청내역의 파일 리스트
	public List<FileVO> fileList(int applyNo) throws Exception;

	// 관리자 :: 졸업인증평가관리 - 졸업인증평가 목록
	public List<TotalDTO> esList(SearchCriteria cri) throws Exception;

	// 관리자 :: 졸업인증평가 관리 - 졸업인증평가 상세조회
	public TotalDTO esSelect(int userNo) throws Exception;

	// 관리자 또는 학생 :: 졸업인증평가 관리 또는 내 점수 - 해당하는 학생의 신청 승인된 신청 내역 리스트
	public List<ApplyVO> acceptList(int userNo) throws Exception;

	public int esListCount(SearchCriteria cri) throws Exception;

	// 관리자 :: 액셀 다운용 esList
	public List<TotalDTO> excelEsList() throws Exception;
}
