package com.hmis.domain;

 

public class Criteria {
    
    private int page;
    private int perPageNum;
    private int startPage;
    
    public Criteria() {
        this.page = 1;
        // 한 페이지에 기본적으로 10개씩 보여준다.
        this.perPageNum = 10;
    }

 
    public int getPage() {
        return page;
    }
    
    // method for MyBatis SQL Mapper -
    public int getPageEnd() {
       
        
        return this.startPage + 9;
    }
    
    // method for MyBatis SQL Mapper -
    public int getPageStart() {
        
             
// 시작페이지 = (페이지 인덱스 * 화면에 출력할 게시글 수) - 9    ex) (2페이지 * 10개 단위) - 9 = 2번째 인덱스 페이지 11번째부터 시작
        this.startPage = (this.page * perPageNum) - 9;
        
        return this.startPage;
    }

 

    public void setPage(int page) {
        
       
        
        // 페이지는 0이나 마이너스 값이 나오지 못한다.(처리문)
        if(page <= 0) {
            this.page = 1;
            return;
        }
        
        this.page = page;
    }

 

    public int getPerPageNum() {
        return perPageNum;
    }

 

    public void setPerPageNum(int perPageNum) {
        //0보다 작은 값 혹은 100보다 큰 값이 들어왔을 경우 10으로  설정해주는 쿼리
        if(perPageNum <=0 || perPageNum > 100) {
        this.perPageNum =10;
        return;
        }
        this.perPageNum = perPageNum;
    }

 

    public void getPageStart(int startPage) {
        this.startPage = startPage;
    }

 

    
    public int getStartPage() {
        return startPage;
    }

 

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

 

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", startPage=" + startPage + "]";
    }

 

    
}