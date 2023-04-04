package com.hmis.dto;

public class LoginDTO {

	private int userNo;
	private String userPw;

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

	@Override
	public String toString() {
		return "LoginDTO [userNo=" + userNo + ", userPw=" + userPw + "]";
	}

}
