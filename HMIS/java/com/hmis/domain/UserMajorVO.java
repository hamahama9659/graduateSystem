package com.hmis.domain;

/*
 * --수강정보
CREATE TABLE TBL_USER_MAJOR
(
    USER_MAJOR_NO        NUMBER NOT NULL ,
   USER_NO              NUMBER NOT NULL ,
   MAJOR_NO  
              NUMBER NOT NULL 
   M.COURSE_NO,
      M.MAJOR_NAME,
      P.PROF_NAME,
      M.GRADE,
      TRACK_CODE
);*/
public class UserMajorVO {

   public int userMajorNo;
   public int userNo;
   public int majorNo;
   //추가된거
   public String majorName;   
   public int courseNo;
   public String profName;
   public int grade;
   public String trackCode;
   
   public int getProfNo() {
   return profNo;
}

public void setProfNo(int profNo) {
   this.profNo = profNo;
}

public int profNo;
   

   public String getMajorName() {
   return majorName;
}

public void setMajorName(String majorName) {
   this.majorName = majorName;
}

public int getCourseNo() {
   return courseNo;
}

public void setCourseNo(int courseNo) {
   this.courseNo = courseNo;
}

public String getProfName() {
   return profName;
}

public void setProfName(String profName) {
   this.profName = profName;
}

public int getGrade() {
   return grade;
}

public void setGrade(int grade) {
   this.grade = grade;
}

public String getTrackCode() {
   return trackCode;
}

public void setTrackCode(String trackCode) {
   this.trackCode = trackCode;
}

public int getUserMajorNo() {
      return userMajorNo;
   }

   public void setUserMajorNo(int userMajorNo) {
      this.userMajorNo = userMajorNo;
   }

   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public int getMajorNo() {
      return majorNo;
   }

   public void setMajorNo(int majorNo) {
      this.majorNo = majorNo;
   }

   @Override
public String toString() {
   return "UserMajorVO [userMajorNo=" + userMajorNo + ", userNo=" + userNo + ", majorNo=" + majorNo + ", majorName="
         + majorName + ", courseNo=" + courseNo + ", profName=" + profName + ", grade=" + grade + ", trackCode="
         + trackCode + ", profNo=" + profNo + "]";
}

   

}