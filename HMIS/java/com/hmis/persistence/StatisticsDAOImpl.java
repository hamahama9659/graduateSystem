package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.SearchCriteria;
import com.hmis.dto.StatisticsDTO;

@Repository
public class StatisticsDAOImpl implements StatisticsDAO {

	@Inject
	SqlSession session;
	
	private static final String namespace = "com.hmis.mapper.StatisticsMapper";
	
	@Override
	public List<StatisticsDTO> statisticsList(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+".statisticsList", cri);
	}

	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+".listCount", cri);
	}

	@Override
	public List<StatisticsDTO> excel() throws Exception {
		
		return session.selectList(namespace+".excel");
	}

	@Override
	public List<StatisticsDTO> mainList() throws Exception {
		
		return session.selectList(namespace+".mainList");
	}

}
