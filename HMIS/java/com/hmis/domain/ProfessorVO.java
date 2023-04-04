package com.hmis.domain;

/*--교수
CREATE TABLE TBL_PROFESSOR
(
	PROF_NO              NUMBER NOT NULL ,
	PROF_EMAIL           VARCHAR2(70) NULL ,
	PROF_TEL             VARCHAR2(20) NULL ,
	PROF_NAME            VARCHAR2(15) NOT NULL ,
	PROF_PW              VARCHAR2(30) NOT NULL ,
	EMP_NO               NUMBER NOT NULL 
);
*/
public class ProfessorVO {

	public int profNo;
	public String profName;
	public String profPw;
	public String profTel;
	public String proEmail;
	public int empNo;

	public int getProfNo() {
		return profNo;
	}

	public void setProfNo(int profNo) {
		this.profNo = profNo;
	}

	public String getProfName() {
		return profName;
	}

	public void setProfName(String profName) {
		this.profName = profName;
	}

	public String getProfPw() {
		return profPw;
	}

	public void setProfPw(String profPw) {
		this.profPw = profPw;
	}

	public String getProfTel() {
		return profTel;
	}

	public void setProfTel(String profTel) {
		this.profTel = profTel;
	}

	public String getProEmail() {
		return proEmail;
	}

	public void setProEmail(String proEmail) {
		this.proEmail = proEmail;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "ProfessorVO [profNo=" + profNo + ", profName=" + profName + ", profPw=" + profPw + ", profTel="
				+ profTel + ", proEmail=" + proEmail + ", empNo=" + empNo + "]";
	}

}
