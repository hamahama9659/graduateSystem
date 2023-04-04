package com.hmis.domain;

import java.util.Date;

public class ReplyVO {
	
	
	private int replyNo; //댓글 번호
    private int qnaNo; //게시글 번호
    private int userNo; //사용자 번호
    private String userName; //사용자 이름
    private String replyText; //댓글 내용
    private Date regDate; //댓글 날짜
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", qnaNo=" + qnaNo + ", userNo=" + userNo + ", userName=" + userName
				+ ", replyText=" + replyText + ", regDate=" + regDate + "]";
	}
	
    
   
}
