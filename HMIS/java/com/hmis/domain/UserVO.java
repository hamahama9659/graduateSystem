package com.hmis.domain;

/*CREATE TABLE TBL_USER
(
   USER_NO              NUMBER NOT NULL ,
   USER_PW              VARCHAR(30) DEFAULT '1234' NOT NULL ,
   USER_NAME            VARCHAR2(15) NOT NULL ,
   REG_NUM              NUMBER NOT NULL ,
   STATE                VARCHAR2(10) NOT NULL ,
   GRADE                 NUMBER      NOT NULL,
   AUTHORITY            VARCHAR2(10) DEFAULT '0' NOT NULL 
);*/

public class UserVO {

   private int userNo;
   private String userPw;
   private String userName;
   private int regNum;
   private String state;
   private int grade;
   private String authority;
public int getUserNo() {
	return userNo;
}
public void setUserNo(int userNo) {
	this.userNo = userNo;
}
public String getUserPw() {
	return userPw;
}
public void setUserPw(String userPw) {
	this.userPw = userPw;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public int getRegNum() {
	return regNum;
}
public void setRegNum(int regNum) {
	this.regNum = regNum;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public int getGrade() {
	return grade;
}
public void setGrade(int grade) {
	this.grade = grade;
}
public String getAuthority() {
	return authority;
}
public void setAuthority(String authority) {
	this.authority = authority;
}
@Override
public String toString() {
	return "UserVO [userNo=" + userNo + ", userPw=" + userPw + ", userName=" + userName + ", regNum=" + regNum
			+ ", state=" + state + ", grade=" + grade + ", authority=" + authority + "]";
}


   
}