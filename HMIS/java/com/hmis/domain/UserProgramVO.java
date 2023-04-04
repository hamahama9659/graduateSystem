package com.hmis.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

/*
--프로그램신청서
CREATE TABLE TBL_USER_PROGRAM
(
   USER_PRO_NO          NUMBER NOT NULL ,
    APPLY_DATE           DATE NOT NULL ,
    USER_NO              NUMBER NOT NULL ,
    PRO_STATE            VARCHAR2(20) DEFAULT '승인대기' NOT NULL ,
   PRO_NO               NUMBER NOT NULL 
);*/
public class UserProgramVO {
   private int userProNo;
   private int userNo;
   private Date applyDate;
   private String proState;
   private int proNo;
   private String content;
   private String[] files;
   private String userName;
   private String proName;
   private String type;
   private String applyNo;

   //상세보기 file 여러개 가져오기
   private ArrayList<FileVO> fileList;


   public int getUserProNo() {
      return userProNo;
   }


   public void setUserProNo(int userProNo) {
      this.userProNo = userProNo;
   }


   public int getUserNo() {
      return userNo;
   }


   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }


   public Date getApplyDate() {
      return applyDate;
   }


   public void setApplyDate(Date applyDate) {
      this.applyDate = applyDate;
   }


   public String getProState() {
      return proState;
   }


   public void setProState(String proState) {
      this.proState = proState;
   }


   public int getProNo() {
      return proNo;
   }


   public void setProNo(int proNo) {
      this.proNo = proNo;
   }


   public String getContent() {
      return content;
   }


   public void setContent(String content) {
      this.content = content;
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


   public String getProName() {
      return proName;
   }


   public void setProName(String proName) {
      this.proName = proName;
   }


   public String getType() {
      return type;
   }


   public void setType(String type) {
      this.type = type;
   }


   public String getApplyNo() {
      return applyNo;
   }


   public void setApplyNo(String applyNo) {
      this.applyNo = applyNo;
   }


   public ArrayList<FileVO> getFileList() {
      return fileList;
   }


   public void setFileList(ArrayList<FileVO> fileList) {
      this.fileList = fileList;
   }


   @Override
   public String toString() {
      return "UserProgramVO [userProNo=" + userProNo + ", userNo=" + userNo + ", applyDate=" + applyDate
            + ", proState=" + proState + ", proNo=" + proNo + ", content=" + content + ", files="
            + Arrays.toString(files) + ", userName=" + userName + ", proName=" + proName + ", type=" + type
            + ", applyNo=" + applyNo + ", fileList=" + fileList + "]";
   }

   

}