package com.hmis.domain;

/*--전공
CREATE TABLE TBL_MAJOR
(
    MAJOR_NO             NUMBER NOT NULL ,
   COURSE_NO            NUMBER NOT NULL ,
   MAJOR_NAME           VARCHAR2(50) NOT NULL ,
   GRADE                NUMBER NOT NULL ,
   TRACK_CODE           CHAR(1) NULL ,
   PROF_NO              NUMBER NOT NULL 
);

*/

public class MajorVO {

   public int majorNo;
   public int courseNo;
   public String majorName;
   public int grade;
   public String trackCode;
   public int profNo;
   public String profName;

   public String getProfName() {
      return profName;
   }

   public void setProfName(String profName) {
      this.profName = profName;
   }

   public int getCourseNo() {
      return courseNo;
   }

   public void setCourseNo(int courseNo) {
      this.courseNo = courseNo;
   }

   public String getMajorName() {
      return majorName;
   }

   public void setMajorName(String majorName) {
      this.majorName = majorName;
   }

   public int getGrade() {
      return grade;
   }

   public void setGrade(int grade) {
      this.grade = grade;
   }

   public int getMajorNo() {
      return majorNo;
   }

   public void setMajorNo(int majorNo) {
      this.majorNo = majorNo;
   }

   public String getTrackCode() {
      return trackCode;
   }

   public void setTrackCode(String trackCode) {
      this.trackCode = trackCode;
   }

   public int getProfNo() {
      return profNo;
   }

   public void setProfNo(int profNo) {
      this.profNo = profNo;
   }

   @Override
   public String toString() {
      return "MajorVO [majorNo=" + majorNo + ", courseNo=" + courseNo + ", majorName=" + majorName + ", grade="
            + grade + ", trackCode=" + trackCode + ", profNo=" + profNo + ", profName=" + profName + "]";
   }

   

}