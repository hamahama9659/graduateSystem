package com.hmis.dto;

public class StatisticsDTO {

	private String subName;
	private int cnt;

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "StatisticsDTO [subName=" + subName + ", cnt=" + cnt + "]";
	}

}
