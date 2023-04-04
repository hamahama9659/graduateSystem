package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.FileVO;


@Repository
public class FileDAOImpl implements FileDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.hmis.mapper.ApplyMapper";
	
	@Override
	public void insert(FileVO fVo) throws Exception {
		session.insert(namespace+".insertFiles", fVo);
	}

	@Override
	public void delete(FileVO fVo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FileVO> list(int applyNo) throws Exception {
		
		return session.selectList(namespace+".fileList", applyNo);
	}

}
