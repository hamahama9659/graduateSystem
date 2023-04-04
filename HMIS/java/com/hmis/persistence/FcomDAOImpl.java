package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.FcomVO;
import com.hmis.domain.SearchCriteria;

@Repository
public class FcomDAOImpl implements FcomDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.hmis.mapper.FcomMapper";

	// 1. 관리자 :: 가족기업 작성
	@Override
	public void adcreate(FcomVO vo) throws Exception {
		session.insert(namespace + ".adcreate", vo);

	}


	// 2. 관리자 :: 가족기업 조회
/*
	@Override
	public FcomVO read(int fcomNo) throws Exception {
		return session.selectOne(namespace + ".read", fcomNo);
	}*/

	// 3. 관리자 :: 가족기업 업데이트

	@Override
	public void adupdate(FcomVO vo) throws Exception {
		session.update(namespace + ".adupdate", vo);

	}
	// 4. 관리자 :: 가족기업 삭제

	@Override 
	  public void addelete(int fcomNo) throws Exception {
	  session.delete(namespace + ".addelete", fcomNo);
}

	// 5. 가족기업 검색처리리스트

	@Override
	public List<FcomVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	// 1. 학생 :: 가족기업 조회

	@Override
	public FcomVO read(int fcomNo) throws Exception {
		return session.selectOne(namespace + ".read", fcomNo);
	}

}
