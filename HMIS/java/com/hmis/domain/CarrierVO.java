package com.hmis.domain;

/*--진로테이블
CREATE TABLE TBL_CARRIER
(
   CAR_NO               NUMBER NOT NULL ,
   CAR_NAME             VARCHAR2(30) NOT NULL 
);*/
public class CarrierVO {
   public int carNo;
   public String carName;

   public int getCarNo() {
      return carNo;
   }

   public void setCarNo(int carNo) {
      this.carNo = carNo;
   }

   public String getCarName() {
      return carName;
   }

   public void setCarName(String carName) {
      this.carName = carName;
   }

   @Override
   public String toString() {
      return "CarrierVO [carNo=" + carNo + ", carName=" + carName + "]";
   }

}