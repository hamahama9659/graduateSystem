package com.hmis.dto;

import com.hmis.domain.UserVO;

public class TotalDTO extends UserVO {

	private int userNo;
	private String userName;
	private int total;
	private int misTotal;
	private int subTotal;
	private int grade;
	private String state;

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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getMisTotal() {
		return misTotal;
	}

	public void setMisTotal(int misTotal) {
		this.misTotal = misTotal;
	}

	public int getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "TotalDTO [userNo=" + userNo + ", userName=" + userName + ", total=" + total + ", misTotal=" + misTotal
				+ ", subTotal=" + subTotal + ", grade=" + grade + ", state=" + state + "]";
	}

}
