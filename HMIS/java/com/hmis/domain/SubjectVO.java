package com.hmis.domain;

import java.util.Date;

/*CREATE TABLE TBL_SUBJECT
(
	SUB_NO               NUMBER NOT NULL ,
	SUB_NAME             VARCHAR2(100) NOT NULL ,
	SCORE                NUMBER DEFAULT 0 NULL ,
	CATEG                VARCHAR2(10) NOT NULL ,
	AREA                 VARCHAR2(30) NOT NULL ,
	PUBLICATION          VARCHAR2(50) NULL ,
	REGDATE              DATE DEFAULT SYSDATE NOT NULL ,
	GUIDE                VARCHAR2(3000) NULL 
);*/

public class SubjectVO {

	private int subNo;
	private String subName;
	private int score;
	private String categ;
	private String area;
	private String publication;
	private Date regdate;
	private String guide;

	public int getSubNo() {
		return subNo;
	}

	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getCateg() {
		return categ;
	}

	public void setCateg(String categ) {
		this.categ = categ;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPublication() {
		return publication;
	}

	public void setPublication(String publication) {
		this.publication = publication;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	@Override
	public String toString() {
		return "SubjectVO [subNo=" + subNo + ", subName=" + subName + ", score=" + score + ", categ=" + categ
				+ ", area=" + area + ", publication=" + publication + ", regdate=" + regdate + ", guide=" + guide + "]";
	}
}
