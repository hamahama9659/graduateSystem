package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.FcomVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.persistence.FcomDAO;

@Service
public class FcomServiceImpl implements FcomService {

	
	@Inject
	private FcomDAO dao;
	
	// 1. 관리자 :: 가족기업 작성
	@Override
	public void adregist(FcomVO vo) throws Exception {
		dao.adcreate(vo);
		
	}

	// 2. 학생 :: 가족기업 조회
	@Override
	public FcomVO read(int fcomNo) throws Exception {
		return dao.read(fcomNo);
	}

	// 3. 관리자 :: 가족기업 수정
	@Override
	public void admodify(FcomVO vo) throws Exception {
		dao.adupdate(vo);
		
	}

	 // 4. 관리자 :: 가족기업 삭제
	@Override
	public void adremove(int fcomNo) throws Exception {
		dao.addelete(fcomNo);
		
	}

	
	// 5. 가족기업 검색처리리스트
	@Override
	public List<FcomVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	

}
