package com.bit.yes.model.entity;

public class ImageVo {
	
	private int idx;
	private String imageName;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
	@Override
	public String toString() {
		return "ImageVo [idx=" + idx + ", imageName=" + imageName + "]";
	}
	
	
	
}
