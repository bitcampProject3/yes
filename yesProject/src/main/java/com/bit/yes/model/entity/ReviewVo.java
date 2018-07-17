package com.bit.yes.model.entity;

import java.sql.Date;

public class ReviewVo {

	String branchID;
	String clientID;
	int idx;
	String title;
	String content;
	String writer;
	String image;
	String comment;
	Date calendar;
	double rating;
	
	public ReviewVo() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewVo(String branchID, String clientID, int idx, String title, String content, String writer, String image,
			String comment, Date calendar, double rating) {

		this.branchID = branchID;
		this.clientID = clientID;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.image = image;
		this.comment = comment;
		this.calendar = calendar;
		this.idx = idx;
		this.rating = rating;
	}

	


	@Override
	public String toString() {
		return "ReviewVo [branchID=" + branchID + ", clientID=" + clientID + ", idx=" + idx + ", title=" + title
				+ ", content=" + content + ", writer=" + writer + ", image=" + image + ", comment=" + comment
				+ ", calendar=" + calendar + ", rating=" + rating + "]";
	}

	public String getBranchID() {
		return branchID;
	}
	public void setBranchID(String branchID) {
		this.branchID = branchID;
	}
	public String getClientID() {
		return clientID;
	}
	public void setClientID(String clientID) {
		this.clientID = clientID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCalendar() {
		return calendar;
	}
	public void setCalendar(Date calendar) {
		this.calendar = calendar;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}
	
	
	
}
