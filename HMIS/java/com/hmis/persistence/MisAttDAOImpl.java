package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.MisAttVO;
import com.hmis.domain.UserVO;

@Repository
public class MisAttDAOImpl implements MisAttDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.hmis.mapper.MisAttMapper";
	
	@Override
	public List<UserVO> stuList() throws Exception {
		return session.selectList(namespace + ".stuList");
	}

	@Override
	public void insert(MisAttVO mVo) throws Exception {
		session.insert(namespace +".insert", mVo);
	}

	@Override
	public List<MisAttVO> list(int misNo) throws Exception {
		return session.selectList(namespace + ".list", misNo);
	}

	@Override
	public void delete(int misAttNo) throws Exception {
		session.delete(namespace + ".delete", misAttNo);

	}

	@Override
	public List<MisAttVO> myMisList(int userNo) throws Exception {
		return session.selectList(namespace + ".list");
	}

	@Override
	public List<UserVO> stuOtherList(int misNo) throws Exception {
		return session.selectList(namespace + ".stuOtherList",misNo);
	}

}
