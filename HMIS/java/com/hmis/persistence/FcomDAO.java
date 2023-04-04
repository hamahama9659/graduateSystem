package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.FcomVO;
import com.hmis.domain.SearchCriteria;

public interface FcomDAO {

	// 1. 관리자 :: 가족기업 작성
	public void adcreate(FcomVO vo) throws Exception;

	// 2. 관리자 :: 가족기업 조회
	// public FcomVO adread(int fcomNo) throws Exception;

	// 3. 관리자 :: 가족기업 업데이트
	public void adupdate(FcomVO vo) throws Exception;

	// 4. 관리자 :: 가족기업 삭제
	public void addelete(int fcomNo) throws Exception;

	// 5. 가족기업 검색처리
	public List<FcomVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 1. 학생 :: 가족기업 조회
	public FcomVO read(int fcomNo) throws Exception;

}
