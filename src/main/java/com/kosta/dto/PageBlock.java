package com.kosta.dto;

import lombok.Getter;

public class PageBlock {

	@Getter
	private int currPage;
	private int totalCount;
	private int pageSize;
	private int blockSize;
	// startRow, endRow, startBlock, endBlock, next, prev => getter
	@Getter
	private int startRow;
	@Getter
	private int endRow;
	@Getter
	private int startBlock;
	@Getter
	private int endBlock;
	@Getter
	private boolean next;
	@Getter
	private boolean prev;
	
	
	public PageBlock(int currPage, int totalCount, int pageSize, int blockSize) {		
		
		this.currPage=currPage;
		this.totalCount=totalCount;
		this.pageSize=pageSize;
		this.blockSize=blockSize;			
		
		calRow();
		calBlock();	
	}
	
	
	private void calRow() {
		
		startRow=(currPage-1)*pageSize+1;
		endRow=startRow+pageSize-1;
		
		if(endRow>totalCount) {
			endRow=totalCount;
		}	
	}
	
	
	private void calBlock() {
		
		startBlock = (((currPage-1)/blockSize)*blockSize)+1;
		endBlock = startBlock+blockSize-1;
		
		int totalPage = (int) Math.ceil(totalCount/(float)pageSize);
		
		if(endBlock > totalPage)
			endBlock = totalPage;
		
		prev=(startBlock==1)? false:true;
		next=(endBlock<totalPage)? true:false;	
	}
	
	
}
