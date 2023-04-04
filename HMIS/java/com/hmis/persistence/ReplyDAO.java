package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.ReplyVO;

public interface ReplyDAO {

	// 1. 관리자, 학생 :: QnA - 댓글 생성
	public void create(ReplyVO revo) throws Exception;

	// 2. 관리자, 학생 :: QnA - 댓글 삭제
	public void delete(int replyNo) throws Exception;

	// 3. 관리자, 학생 :: QnA - 댓글 전체 삭제 
	public void deleteAll(int replyNo) throws Exception;

	// 4. 관리자, 학생 :: QnA - 댓글 전체 보기
	public List<ReplyVO> list(int qnaNo) throws Exception;

	

}
