package com.hmis.domain;

/*CREATE TABLE TBL_FILE
(
   FILE_NAME            VARCHAR2(100) NOT NULL ,
   FILE_NO              NUMBER NOT NULL ,
   APPLY_NO             NUMBER NOT NULL 
);*/

public class FileVO {

   private int fileNo;
   //각 첨부파일 사용하는 테이블No
   private int applyNo;
   private int proNo;
   private int userProNo;
   private int qnaNo;
   
   private String fileName;
   private String fileLocation;
public int getFileNo() {
   return fileNo;
}
public void setFileNo(int fileNo) {
   this.fileNo = fileNo;
}
public int getApplyNo() {
   return applyNo;
}
public void setApplyNo(int applyNo) {
   this.applyNo = applyNo;
}
public int getProNo() {
   return proNo;
}
public void setProNo(int proNo) {
   this.proNo = proNo;
}
public int getUserProNo() {
   return userProNo;
}
public void setUserProNo(int userProNo) {
   this.userProNo = userProNo;
}
public int getQnaNo() {
   return qnaNo;
}
public void setQnaNo(int qnaNo) {
   this.qnaNo = qnaNo;
}
public String getFileName() {
   return fileName;
}
public void setFileName(String fileName) {
   this.fileName = fileName;
}
public String getFileLocation() {
   return fileLocation;
}
public void setFileLocation(String fileLocation) {
   this.fileLocation = fileLocation;
}
@Override
public String toString() {
   return "FileVO [fileNo=" + fileNo + ", applyNo=" + applyNo + ", proNo=" + proNo + ", userProNo=" + userProNo
         + ", qnaNo=" + qnaNo + ", fileName=" + fileName + ", fileLocation=" + fileLocation + "]";
}
   
   


}