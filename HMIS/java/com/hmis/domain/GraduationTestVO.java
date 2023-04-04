package com.hmis.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

/*
졸업 심사
CREATE TABLE TBL_GRADUATION_TEST
(
    TEST_NO              NUMBER NOT NULL ,
   TEST_STATE           VARCHAR2(20) NOT NULL ,
   APPLY_DATE           DATE NOT NULL ,
   REASON               VARCHAR2(1000) NULL ,
   USER_NO              NUMBER NOT NULL ,
   GRADU_NO             NUMBER NOT NULL 
);
*/

public class GraduationTestVO {
   

   public int testNo;//졸업심사번호
   public String testState;//승인 여부
   public Date applyDate;//신청일
   public String reason;//사유
   public int userNo;//학번(FK)
   public int graduNo;//졸업번호(FK)
   
   //GRADUATION 목록으로 정보를 가져오기 위해서 추가
   public Date appStart; // 신청 시작일
   public Date appEnd;// 신청 종료일
   public String title;// 제목
   public String graduState;// 마감 상태
   
   private String[] files;
   private String userName;
   private int grade;

   // 상세보기 file 여러개 가져오기
   private ArrayList<FileVO> fileList;

public int getTestNo() {
   return testNo;
}

public void setTestNo(int testNo) {
   this.testNo = testNo;
}

public String getTestState() {
   return testState;
}

public void setTestState(String testState) {
   this.testState = testState;
}

public Date getApplyDate() {
   return applyDate;
}

public void setApplyDate(Date applyDate) {
   this.applyDate = applyDate;
}

public String getReason() {
   return reason;
}

public void setReason(String reason) {
   this.reason = reason;
}

public int getUserNo() {
   return userNo;
}

public void setUserNo(int userNo) {
   this.userNo = userNo;
}

public int getGraduNo() {
   return graduNo;
}

public void setGraduNo(int graduNo) {
   this.graduNo = graduNo;
}

public Date getAppStart() {
   return appStart;
}

public void setAppStart(Date appStart) {
   this.appStart = appStart;
}

public Date getAppEnd() {
   return appEnd;
}

public void setAppEnd(Date appEnd) {
   this.appEnd = appEnd;
}

public String getTitle() {
   return title;
}

public void setTitle(String title) {
   this.title = title;
}

public String getGraduState() {
   return graduState;
}

public void setGraduState(String graduState) {
   this.graduState = graduState;
}

public String[] getFiles() {
   return files;
}

public void setFiles(String[] files) {
   this.files = files;
}

public String getUserName() {
   return userName;
}

public void setUserName(String userName) {
   this.userName = userName;
}

public int getGrade() {
   return grade;
}

public void setGrade(int grade) {
   this.grade = grade;
}

public ArrayList<FileVO> getFileList() {
   return fileList;
}

public void setFileList(ArrayList<FileVO> fileList) {
   this.fileList = fileList;
}

@Override
public String toString() {
   return "GraduationTestVO [testNo=" + testNo + ", testState=" + testState + ", applyDate=" + applyDate + ", reason="
         + reason + ", userNo=" + userNo + ", graduNo=" + graduNo + ", appStart=" + appStart + ", appEnd=" + appEnd
         + ", title=" + title + ", graduState=" + graduState + ", files=" + Arrays.toString(files) + ", userName="
         + userName + ", grade=" + grade + ", fileList=" + fileList + "]";
}

   
   
 
   
   

   
   
}