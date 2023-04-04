package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.Criteria;
import com.hmis.domain.MisVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.persistence.MisDAO;

@Service
public class MisServiceImpl implements MisService {

	@Inject
	private MisDAO dao;
	
	@Override
	public Integer register(MisVO mVo) throws Exception {
		return dao.insert(mVo);
	}

	@Override
	public List<MisVO> list(SearchCriteria cri) throws Exception {
		return dao.list(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public void remove(int misNo) throws Exception {
		dao.delete(misNo);
		
	}

	@Override
	public MisVO read(int misNo) throws Exception {
		return dao.select(misNo);
	}

	@Override
	public void modify(MisVO mVo) throws Exception {
		dao.update(mVo);
		
	}

	//misList 리스트항목
	@Override
	public MisVO misList(int misNo) throws Exception {	
		return dao.misList(misNo);
	}

	@Override
	public List<MisVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

}
