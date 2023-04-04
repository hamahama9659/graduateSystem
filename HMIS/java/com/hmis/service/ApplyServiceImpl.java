package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.ApplyVO;
import com.hmis.domain.FileVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.SubjectVO;
import com.hmis.dto.TotalDTO;
import com.hmis.persistence.ApplyDAO;
import com.hmis.persistence.FileDAO;

@Service
public class ApplyServiceImpl implements ApplyService {

	@Inject
	ApplyDAO dao;
	
	@Inject
	FileDAO fDao;
	
	@Override
	public List<SubjectVO> searchSub(String subName) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchSub(subName);
	}

	@Override
	public void register(ApplyVO aVo) throws Exception {
		// 1. 텍스트에어리어 줄바꿈 적용
		aVo.setContent(aVo.getContent().replace("\\r\\n", "<br>"));
		
		// 2. 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
		int applyNo = dao.insert(aVo);
		
		
		// 4. 추가 이미지 존재 여부 IF문
	      if (aVo.getFiles() != null) {

	         // 4. 추가 이미지 저장 FOR문
	         for (int i = 0; i < aVo.getFiles().length; i++) {

	            // 4-1.추가 이미지 저장

	            FileVO fVo = new FileVO();
	            fVo.setApplyNo(applyNo);
	            fVo.setFileName(aVo.getFiles()[i]);

	         

	            // 4-2.추가 이미지 저장
	            fDao.insert(fVo);

	         }
	      }
	}

	@Override
	public List<ApplyVO> stuApplyList(int userNo) throws Exception {
		
		return dao.stuApplyList(userNo);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);
	}

	@Override
	public ApplyVO stuApplyRead(int applyNo) throws Exception {

		return dao.stuApplySelect(applyNo);
	}

	@Override
	public List<ApplyVO> adApplyList(SearchCriteria cri) throws Exception {

		return dao.adApplyList(cri);
	}

	@Override
	public ApplyVO adApplyRead(int applyNo) throws Exception {
		
		return dao.adApplySelect(applyNo);
	}

	@Override
	public void accept(int applyNo, String reason) throws Exception {
		dao.accept(applyNo, reason);
		
	}

	@Override
	public void deny(int applyNo, String reason) throws Exception {
		dao.deny(applyNo, reason);
		
	}

	@Override
	public List<SubjectVO> subList() throws Exception {
		// TODO Auto-generated method stub
		return dao.subList();
	}

	@Override
	public List<ApplyVO> waitList() throws Exception {
		
		return dao.waitList();
	}

	@Override
	public List<FileVO> fileList(int applyNo) throws Exception {
		
		return fDao.list(applyNo);
	}

	@Override
	public List<TotalDTO> esList(SearchCriteria cri) throws Exception {
		
		return dao.esList(cri);
	}

	@Override
	public TotalDTO esSelect(int userNo) throws Exception {
		
		return dao.esSelect(userNo);
	}

	@Override
	public List<ApplyVO> acceptList(int userNo) throws Exception {
		
		return dao.acceptList(userNo);
	}

	@Override
	public int esListCount(SearchCriteria cri) throws Exception {
		
		return dao.esListCount(cri);
	}

	@Override
	public List<TotalDTO> excelEsList() throws Exception {
		
		return dao.excelEsList();
	}

	@Override
	public int adApplyListSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.adApplyListSearchCount(cri);
	}
	
	

}
