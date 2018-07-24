package com.bit.yes.model.entity;

public class ImageVo {

	private int index;
	private String imageName;
	
	public ImageVo() {
		// TODO Auto-generated constructor stub
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	@Override
	public String toString() {
		return "ImageVo [index=" + index + ", imageName=" + imageName + "]";
	}
	
	
	
	
	
}
