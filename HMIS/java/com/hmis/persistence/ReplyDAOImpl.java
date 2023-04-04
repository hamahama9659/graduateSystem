package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.hmis.mapper.ReplyMapper";

	// 1. 관리자, 학생 :: QnA - 댓글 생성
	@Override
	public void create(ReplyVO revo) throws Exception {
		session.insert(namespace + ".create", revo);
	}

	// 2. 관리자, 학생 :: QnA - 댓글 삭제
	@Override
	public void delete(int replyNo) throws Exception {
		session.delete(namespace + ".delete", replyNo);
	}

	//  3. 관리자, 학생 :: QnA - 댓글 전체 삭제
	@Override
	public void deleteAll(int replyNo) throws Exception {
		session.delete(namespace + ".deleteAll", replyNo);

	}

	// 4. 관리자, 학생 :: QnA - 댓글 전체 보기
	@Override
	public List<ReplyVO> list(int qnaNo) throws Exception {
		return session.selectList(namespace + ".list", qnaNo);
	}

}
