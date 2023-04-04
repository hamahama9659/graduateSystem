package com.hmis.domain;

/*--학생진로
CREATE TABLE TBL_USCAR
(
    USCAR_NO             NUMBER NOT NULL ,
   USER_NO              NUMBER NOT NULL ,
   CAR_NO               NUMBER NOT NULL 
);*/

public class UscarVO {
   public int uscarNo;
   public int carNo;
   public int userNo;
   //추가된거
   public String carName;

   
   
   public int getUscarNo() {
      return uscarNo;
   }

   public void setUscarNo(int uscarNo) {
      this.uscarNo = uscarNo;
   }

   public int getCarNo() {
      return carNo;
   }

   public void setCarNo(int carNo) {
      this.carNo = carNo;
   }

   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public String getCarName() {
      return carName;
   }

   public void setCarName(String carName) {
      this.carName = carName;
   }

   @Override
   public String toString() {
      return "UscarVO [uscarNo=" + uscarNo + ", carNo=" + carNo + ", userNo=" + userNo + ", carName=" + carName + "]";
   }


   
}