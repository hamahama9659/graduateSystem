package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.MisAttVO;
import com.hmis.domain.UserVO;
import com.hmis.persistence.MisAttDAO;

@Service
public class MisAttServiceImpl implements MisAttService {

	@Inject
	private MisAttDAO dao;

	@Override
	public List<UserVO> stuList() throws Exception {
		return dao.stuList();
	}

	@Override
	public void register(MisAttVO mVo) throws Exception {
		dao.insert(mVo);
	}

	@Override
	public List<MisAttVO> list(int misNo) throws Exception {
		return dao.list(misNo);
	}

	@Override
	public void removeAtt(int misNo) throws Exception {
		dao.delete(misNo);
	}

	@Override
	public List<MisAttVO> myMisList(int userNo) throws Exception {
		return dao.myMisList(userNo);
	}

	@Override
	public List<UserVO> stuOtherList(int misNo) throws Exception {
		return dao.stuOtherList(misNo);
	}

}
