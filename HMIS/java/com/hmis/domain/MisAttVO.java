package com.hmis.domain;

import java.util.Date;

/*CREATE TABLE TBL_MIS_ATT
(
	MIS_ATT_NO           NUMBER NOT NULL ,
	MIS_ATT_DATE         DATE NOT NULL ,
	USER_NO              NUMBER NOT NULL ,
	MIS_NO               NUMBER NOT NULL 
);*/

public class MisAttVO {

	private int misAttNo;
	private Date misAttDate; //등록일
	private int userNo;//학번
	private int misNo;
	private int grade; // user의 grade를 받을 그릇
	private String userName;

	public int getMisAttNo() {
		return misAttNo;
	}

	public void setMisAttNo(int misAttNo) {
		this.misAttNo = misAttNo;
	}

	public Date getMisAttDate() {
		return misAttDate;
	}

	public void setMisAttDate(Date misAttDate) {
		this.misAttDate = misAttDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getMisNo() {
		return misNo;
	}

	public void setMisNo(int misNo) {
		this.misNo = misNo;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "MisAttVO [misAttNo=" + misAttNo + ", misAttDate=" + misAttDate + ", userNo=" + userNo + ", misNo="
				+ misNo + ", grade=" + grade + ", userName=" + userName + "]";
	}

}
