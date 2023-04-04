package com.hmis.domain;

import java.util.Date;

public class GoalVO {

	private int goalNo;
	private String goalName;
	private String goalState;
	private int goalScore;
	private Date startDate;
	private Date endDate;
	private String resolution;
	private int userNo;
	private Date targetDate;
	private int dDay;
	private int progress;
	private String substring;

	public int getGoalNo() {
		return goalNo;
	}

	public void setGoalNo(int goalNo) {
		this.goalNo = goalNo;
	}

	public String getGoalName() {
		return goalName;
	}

	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}

	public int getGoalScore() {
		return goalScore;
	}

	public void setGoalScore(int goalScore) {
		this.goalScore = goalScore;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getGoalState() {
		return goalState;
	}

	public void setGoalState(String goalState) {
		this.goalState = goalState;
	}

	public Date getTargetDate() {
		return targetDate;
	}

	public void setTargetDate(Date targetDate) {
		this.targetDate = targetDate;
	}

	public int getdDay() {
		return dDay;
	}

	public void setdDay(int dDay) {
		this.dDay = dDay;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public String getSubstring() {
		return substring;
	}

	public void setSubstring(String substring) {
		this.substring = substring;
	}

	@Override
	public String toString() {
		return "GoalVO [goalNo=" + goalNo + ", goalName=" + goalName + ", goalState=" + goalState + ", goalScore="
				+ goalScore + ", startDate=" + startDate + ", endDate=" + endDate + ", resolution=" + resolution
				+ ", userNo=" + userNo + ", targetDate=" + targetDate + ", dDay=" + dDay + ", progress=" + progress
				+ ", substring=" + substring + "]";
	}

}
