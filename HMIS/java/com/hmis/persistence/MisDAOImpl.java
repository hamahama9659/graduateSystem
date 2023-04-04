package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.Criteria;
import com.hmis.domain.MisVO;
import com.hmis.domain.SearchCriteria;

@Repository
public class MisDAOImpl implements MisDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.hmis.mapper.MisMapper";

	@Override
	public Integer insert(MisVO mVo) throws Exception {
		session.insert(namespace +  ".insert", mVo);
		return mVo.getMisNo();
	}

	//검색 가능한 페이징 목록
	@Override
	public List<MisVO> list(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void delete(int misNo) throws Exception {
		session.delete(namespace + ".delete", misNo);
	}

	@Override
	public MisVO select(int misNo) throws Exception {
		return session.selectOne(namespace + ".select", misNo);
	}

	@Override
	public void update(MisVO mVo) throws Exception {
		session.update(namespace + ".update", mVo);
	}

	@Override
	public MisVO misList(int misNo) throws Exception {
		return session.selectOne(namespace + ".misList", misNo);
		
	}

	@Override
	public List<MisVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

}
