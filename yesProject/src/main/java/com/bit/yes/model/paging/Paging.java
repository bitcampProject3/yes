package com.bit.yes.model.paging;

public class Paging {

	int maxPost;
	int firstPageNo;
	int prevPageNo;
	int startPageNo;
	int currentPageNo;
	int endPageNo;
	int nextPageNo;
	int finalPageNo;
	int numberOfRecords;
	int sizeOfPage;
	
	public Paging(int currentPageNo, int maxPost) {
		this.currentPageNo = currentPageNo;
		this.sizeOfPage = 5;
		this.maxPost = (maxPost !=0) ? maxPost : 10;
	}

	public int getMaxPost() {
		return maxPost;
	}

	public void setMaxPost(int maxPost) {
		this.maxPost = maxPost;
	}

	public int getFirstPageNo() {
		return firstPageNo;
	}

	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	public int getPrevPageNo() {
		return prevPageNo;
	}

	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getFinalPageNo() {
		return finalPageNo;
	}

	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}

	public int getNumberOfRecords() {
		return numberOfRecords;
	}

	public void setNumberOfRecords(int numberOfRecords) {
		this.numberOfRecords = numberOfRecords;
	}

	public int getSizeOfPage() {
		return sizeOfPage;
	}

	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}
	// 페이징
	public void makePaging() {
		if(numberOfRecords == 0)
			return;
		// 만약 총 레코드의 개수가 0일 경우 종료 표시안함
		if(currentPageNo == 0)
			setCurrentPageNo(1);
		// 만약 현재페이지가 0일 경우 1로 강제 지정
		if(maxPost == 0)
			setMaxPost(10);
		// 한 게시판에서 나타내는 총 레코드 개수 10으로 지정
		int finalPage = (numberOfRecords + (maxPost -1)) / maxPost;
		// 총 레코드수를 이용해서 밑에 하단의 게시판 페이지 넘기는 것 총 개수 구하기
		if(currentPageNo > finalPage)
			setCurrentPageNo(finalPage);
		// 만약 다음(>>) 버튼을 눌러서 넘어갔는데 그 경우의 수가 하단 페이지의 
		//총 개수를 넘기면 무조건 하단페이지 마지막으로 이동
		if(currentPageNo < 0)
			currentPageNo = 1;
		// 현재 페이지를 0보다 작게갈경우 무조건 1로 가도록 고정 (게시판 페이지 넘기는 하단버튼)
		boolean isNowFirst = currentPageNo == 1 ? true : false;
		boolean isNowFinal = currentPageNo == finalPage ? true : false;
		// 만약 하단 페이지 버튼을 1눌렀을경우 true OR false 만약 끝페이지를 눌렀을 경우 true OR false
		int startPage = ((currentPageNo -1 ) / sizeOfPage) * sizeOfPage + 1;
		int endPage = startPage + sizeOfPage -1;
		// 하단 페이지 버튼의 1~5 6~10 11~15 를 구하는 공식 , 만약 곱셈을 할 경우 소수점은 계산안하므로 공식성립
		if(endPage > finalPage)
			endPage = finalPage;
		// 만약 하단 페이지 버튼을 클릭했는데 다음 버튼을 눌러서 총페이지의 개수를 넘겼을 경우 총페이지 개수 마지막으로 넘어가도록 설정
		setFirstPageNo(1);
		// 맨 처음 페이지를 1로 설정
		if(!isNowFirst)
			setPrevPageNo(((startPageNo -1) < 1 ? 1 : (startPage -1)));
		// 만약 하단 페이지 버튼의 수가 1~5 일경우는 맨처음이 1 이므로 1페이지를 표시하지만 
		// 6~10 일경우 6이 맨처음 값이므로 -1을 해서 이전 페이지인 1~5에서 5페이지를 호출
		setStartPageNo(startPage);
		setEndPageNo(endPage);
		// 위의 설정들로 해서 하단 페이지의 처음과 끝을 설정
		
		if(!isNowFinal)
			setNextPageNo(((endPage +1) > finalPage ? finalPage : (endPage +1)));
		// 6~10하단 버튼에서 다음 버튼을 눌렀을 경우 현재페이지가 7일 경우 끝인 10에서  1을 더한 값이 클 경우 
		// fianlPage를 호출하고 아니면 끝인 10(endPage)+1의 11페이지 호출
		setFinalPageNo(finalPage);
		// finalPage 내용을 No에 추가
		
		
		
		
	}
	
	
	
	
	
}
