package com.hmis.domain;

/*--관리자프로그램신청파일
CREATE TABLE TBL_AD_PRO_FILE
(
	AD_PRO_FILE_NO          NUMBER NOT NULL ,
	AD_PRO_FILE_NAME          NUMBER NOT NULL ,
	PRO_NO        VARCHAR2(300) NOT NULL 
);*/

public class AdProFileVO {
	
	public int adProFileNo;
	public String adProFileName;
	public int proNo;
	public int getAdProFileNo() {
		return adProFileNo;
	}
	public void setAdProFileNo(int adProFileNo) {
		this.adProFileNo = adProFileNo;
	}
	public String getAdProFileName() {
		return adProFileName;
	}
	public void setAdProFileName(String adProFileName) {
		this.adProFileName = adProFileName;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	
	@Override
	public String toString() {
		return "AdProFile [adProFileNo=" + adProFileNo + ", adProFileName=" + adProFileName + ", proNo=" + proNo + "]";
	}

}
