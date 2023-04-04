package com.hmis.domain;



import java.util.Date;

/*
 * CREATE TABLE TBL_QnA (
 * QnA_NO NUMBER NOT NULL ,
 * USER_NO NUMBER NOT NULL , 
 * QnA_TITLE VARCHAR2(50) NOT NULL ,
 * QnA_CONTENTS VARCHAR2(2000) NOT NULL , 
 * HITS CHAR(18) NULL , 
 * REGDATE DATE NULL );
 */

public class QnAVO {

	public int qnaNo;
	public String qnaTitle;
	public String qnaContents;
	public int hits;
	public Date regDate;
	public int userNo;
	public String userName;
	public int replyNo;

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents + ", hits=" + hits
				+ ", regDate=" + regDate + ", userNo=" + userNo + ", userName=" + userName + ", replyNo=" + replyNo
				+ "]";
	}

}