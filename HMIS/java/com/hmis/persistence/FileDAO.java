package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.FileVO;

public interface FileDAO {

	// 1. 파일 등록
	public void insert(FileVO fVo) throws Exception;
	
	// 2. 파일 삭제
	public void delete(FileVO fVo) throws Exception;
	
	// 3. 파일 목록
	public List<FileVO> list(int applyNo) throws Exception;
	
}
