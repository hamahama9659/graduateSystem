package com.hmis.dto;

public class MisInfoDTO {

	private int misNo;
	private int times;
	private String title;
	private int cnt;

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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "MisInfoDTO [misNo=" + misNo + ", times=" + times + ", title=" + title + ", cnt=" + cnt + "]";
	}

}
