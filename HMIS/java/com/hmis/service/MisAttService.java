package com.hmis.service;

import java.util.List;

import com.hmis.domain.MisAttVO;
import com.hmis.domain.UserVO;

public interface MisAttService {

	// 0. MIS 출결관리 - 학생 목록
	public List<UserVO> stuList() throws Exception;

	// 1. MIS 출결관리 - 출결 등록 --> 수정할 경우에도 사용 됨
	public void register(MisAttVO mVo) throws Exception;

	// 2. MIS 출결관리 - 출결 학생 목록
	public List<MisAttVO> list(int misNo) throws Exception;
	
	// 2. MIS 출결관리 - 출결 제외(출석 등록 가능한 학생) 내역 목록
	public List<UserVO> stuOtherList(int misNo) throws Exception;

	// 3. MIS 출결관리 - 출결 내역 삭제 --> 수정할 경우 원래 출결 내역 지우는 것을 말함
	public void removeAtt(int misNo) throws Exception;

	// 4. 내 점수 MIS 출결 상세
	public List<MisAttVO> myMisList(int userNo) throws Exception;

}
