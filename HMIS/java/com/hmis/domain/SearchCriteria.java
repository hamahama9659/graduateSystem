package com.hmis.domain;

public class SearchCriteria extends Criteria {
	
	// ex) 타입 : 글쓴이, 내용 .. 
	private String searchType;
	
	// ex) 이한, 특정한 내용
	private String keyword;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword
				+ ", getPageStart()=" + getPageStart() +  ", getPageEnd()=" + getPageEnd() +"]";
	}



	
}
