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
	// ����¡
	public void makePaging() {
		if(numberOfRecords == 0)
			return;
		// ���� �� ���ڵ��� ������ 0�� ��� ���� ǥ�þ���
		if(currentPageNo == 0)
			setCurrentPageNo(1);
		// ���� ������������ 0�� ��� 1�� ���� ����
		if(maxPost == 0)
			setMaxPost(10);
		// �� �Խ��ǿ��� ��Ÿ���� �� ���ڵ� ���� 10���� ����
		int finalPage = (numberOfRecords + (maxPost -1)) / maxPost;
		// �� ���ڵ���� �̿��ؼ� �ؿ� �ϴ��� �Խ��� ������ �ѱ�� �� �� ���� ���ϱ�
		if(currentPageNo > finalPage)
			setCurrentPageNo(finalPage);
		// ���� ����(>>) ��ư�� ������ �Ѿ�µ� �� ����� ���� �ϴ� �������� 
		//�� ������ �ѱ�� ������ �ϴ������� ���������� �̵�
		if(currentPageNo < 0)
			currentPageNo = 1;
		// ���� �������� 0���� �۰԰���� ������ 1�� ������ ���� (�Խ��� ������ �ѱ�� �ϴܹ�ư)
		boolean isNowFirst = currentPageNo == 1 ? true : false;
		boolean isNowFinal = currentPageNo == finalPage ? true : false;
		// ���� �ϴ� ������ ��ư�� 1��������� true OR false ���� ���������� ������ ��� true OR false
		int startPage = ((currentPageNo -1 ) / sizeOfPage) * sizeOfPage + 1;
		int endPage = startPage + sizeOfPage -1;
		// �ϴ� ������ ��ư�� 1~5 6~10 11~15 �� ���ϴ� ���� , ���� ������ �� ��� �Ҽ����� �����ϹǷ� ���ļ���
		if(endPage > finalPage)
			endPage = finalPage;
		// ���� �ϴ� ������ ��ư�� Ŭ���ߴµ� ���� ��ư�� ������ ���������� ������ �Ѱ��� ��� �������� ���� ���������� �Ѿ���� ����
		setFirstPageNo(1);
		// �� ó�� �������� 1�� ����
		if(!isNowFirst)
			setPrevPageNo(((startPageNo -1) < 1 ? 1 : (startPage -1)));
		// ���� �ϴ� ������ ��ư�� ���� 1~5 �ϰ��� ��ó���� 1 �̹Ƿ� 1�������� ǥ�������� 
		// 6~10 �ϰ�� 6�� ��ó�� ���̹Ƿ� -1�� �ؼ� ���� �������� 1~5���� 5�������� ȣ��
		setStartPageNo(startPage);
		setEndPageNo(endPage);
		// ���� ������� �ؼ� �ϴ� �������� ó���� ���� ����
		
		if(!isNowFinal)
			setNextPageNo(((endPage +1) > finalPage ? finalPage : (endPage +1)));
		// 6~10�ϴ� ��ư���� ���� ��ư�� ������ ��� ������������ 7�� ��� ���� 10����  1�� ���� ���� Ŭ ��� 
		// fianlPage�� ȣ���ϰ� �ƴϸ� ���� 10(endPage)+1�� 11������ ȣ��
		setFinalPageNo(finalPage);
		// finalPage ������ No�� �߰�
		
		
		
		
	}
	
	
	
	
	
}
