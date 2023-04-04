package com.hmis.domain;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;



/*
--프로그램
CREATE TABLE TBL_PROGRAM
(
   PRO_NO               NUMBER NOT NULL ,
   PRO_NAME             VARCHAR2(200) NOT NULL ,
   APPSTART             DATE NOT NULL ,
   REGDATE              DATE NOT NULL ,
   WRITER               VARCHAR2(50) NOT NULL ,
   HITS                 NUMBER NOT NULL ,
   CONTENTS             VARCHAR2(3000) NULL ,
   TYPE                 VARCHAR2(50) NOT NULL ,
   LIMIT_PARTI          NUMBER(4) NOT NULL ,
   APPEND               DATE NOT NULL 
);*/
public class ProgramVO {

   public int proNo;
   public String proName;
   public String writer;
   public int hits;
   public String type;

   public String contents;
   public int limitParti;
   public Date regDate;
   public Date appStart;
   public Date appEnd;
   private String[] files;
   
   //상세보기 file 여러개 가져오기
   private ArrayList<FileVO> fileList;

public int getProNo() {
   return proNo;
}

public void setProNo(int proNo) {
   this.proNo = proNo;
}

public String getProName() {
   return proName;
}

public void setProName(String proName) {
   this.proName = proName;
}

public String getWriter() {
   return writer;
}

public void setWriter(String writer) {
   this.writer = writer;
}

public int getHits() {
   return hits;
}

public void setHits(int hits) {
   this.hits = hits;
}

public String getType() {
   return type;
}

public void setType(String type) {
   this.type = type;
}

public String getContents() {
   return contents;
}

public void setContents(String contents) {
   this.contents = contents;
}

public int getLimitParti() {
   return limitParti;
}

public void setLimitParti(int limitParti) {
   this.limitParti = limitParti;
}

public Date getRegDate() {
   return regDate;
}

public void setRegDate(Date regDate) {
   this.regDate = regDate;
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

public String[] getFiles() {
   return files;
}

public void setFiles(String[] files) {
   this.files = files;
}

public ArrayList<FileVO> getFileList() {
   return fileList;
}

public void setFileList(ArrayList<FileVO> fileList) {
   this.fileList = fileList;
}

@Override
public String toString() {
   return "ProgramVO [proNo=" + proNo + ", proName=" + proName + ", writer=" + writer + ", hits=" + hits + ", type="
         + type + ", contents=" + contents + ", limitParti=" + limitParti + ", regDate=" + regDate + ", appStart="
         + appStart + ", appEnd=" + appEnd + ", files=" + Arrays.toString(files) + ", fileList=" + fileList + "]";
}
   
  

   

}