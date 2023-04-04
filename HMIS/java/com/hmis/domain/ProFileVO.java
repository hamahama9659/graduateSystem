package com.hmis.domain;

/*--프로그램신청파일
CREATE TABLE TBL_PRO_FILE
(
   PRO_FILE_NO          NUMBER NOT NULL ,
   USER_PRO_NO          NUMBER NOT NULL ,
   PRO_FILE_NAME        VARCHAR2(300) NOT NULL 
);*/

public class ProFileVO {

   public int proFileNo;
   public int userProNo;
   public String proFileName;
   private String fileLocation;
   
   public int getProFileNo() {
      return proFileNo;
   }
   public void setProFileNo(int proFileNo) {
      this.proFileNo = proFileNo;
   }
   public int getUserProNo() {
      return userProNo;
   }
   public void setUserProNo(int userProNo) {
      this.userProNo = userProNo;
   }
   public String getProFileName() {
      return proFileName;
   }
   public void setProFileName(String proFileName) {
      this.proFileName = proFileName;
   }
   public String getFileLocation() {
      return fileLocation;
   }
   public void setFileLocation(String fileLocation) {
      this.fileLocation = fileLocation;
   }
   @Override
   public String toString() {
      return "ProFileVO [proFileNo=" + proFileNo + ", userProNo=" + userProNo + ", proFileName=" + proFileName
            + ", fileLocation=" + fileLocation + "]";
   }


   
}