package com.hmis.service;

import java.util.List;

import com.hmis.domain.ReplyVO;

public interface ReplyService {

	// 1. 관리자, 학생 :: QnA - 댓글 생성
	public void add(ReplyVO revo) throws Exception;

	//  2. 관리자, 학생 :: QnA - 댓글 삭제
	public void remove(int replyNo) throws Exception;

	// 3. 관리자, 학생 :: QnA - 댓글 전체 삭제
	public void removeAll(int qnaNo) throws Exception;
	
	// 4. 관리자, 학생 :: QnA - 댓글 전체 보기 
	List<ReplyVO> list(int qnaNo) throws Exception;
}
