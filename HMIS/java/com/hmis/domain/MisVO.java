package com.hmis.domain;

import java.util.Date;

/*CREATE TABLE TBL_MIS
(
	MIS_NO               NUMBER NOT NULL ,
	TIMES                NUMBER NOT NULL ,
	TITLE                VARCHAR2(50) NOT NULL ,
	MIS_REGDATE          DATE	DEFAULT SYSDATE	NOT NULL 
);*/

public class MisVO {

	private int misNo;
	private int times;
	private Date misDate;
	private String title;
	private Date misRegdate;

	public int getMisNo() {
		return misNo;
	}

	public void setMisNo(int misNo) {
		this.misNo = misNo;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getMisRegdate() {
		return misRegdate;
	}

	public void setMisRegdate(Date misRegdate) {
		this.misRegdate = misRegdate;
	}

	public Date getMisDate() {
		return misDate;
	}

	public void setMisDate(Date misDate) {
		this.misDate = misDate;
	}

	@Override
	public String toString() {
		return "MisVO [misNo=" + misNo + ", times=" + times + ", misDate=" + misDate + ", title=" + title
				+ ", misRegdate=" + misRegdate + "]";
	}

	
}
