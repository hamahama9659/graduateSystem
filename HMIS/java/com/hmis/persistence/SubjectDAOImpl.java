package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.Criteria;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.SubjectVO;
import com.hmis.domain.UserVO;

@Repository
public class SubjectDAOImpl implements SubjectDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.hmis.mapper.SubjectMapper";

	@Override
	//1. 인증항목 등록
	public void insert(SubjectVO sVo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace +  ".insert", sVo);
	}

	@Override
	//2. 검색이 가능한 인증항목 전체목록
	public List<SubjectVO> list(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	//4. 인증항목 상세보기
	public SubjectVO select(int subNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".select", subNo);
	}

	@Override
	//5. 인증항목 수정
	public void update(SubjectVO sVo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", sVo);
	}

	@Override
	//6. 인증항목 삭제
	public void delete(int subNo) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", subNo);
	}

	@Override
	public List<UserVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".countPaging", cri);
	}

	
}
