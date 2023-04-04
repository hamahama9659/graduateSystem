package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.SearchCriteria;
import com.hmis.dto.StatisticsDTO;
import com.hmis.persistence.StatisticsDAO;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Inject
	private StatisticsDAO dao;
	
	@Override
	public List<StatisticsDTO> statisticsList(SearchCriteria cri) throws Exception {
		
		return dao.statisticsList(cri);
	}

	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		
		return dao.listCount(cri);
	}

	@Override
	public List<StatisticsDTO> excel() throws Exception {
		
		return dao.excel();
	}

	@Override
	public List<StatisticsDTO> mainList() throws Exception {
		
		return dao.mainList();
	}

}
