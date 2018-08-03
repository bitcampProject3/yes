package com.bit.yes.model.entity;

import java.sql.Date;
import java.util.Objects;

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
	String nickName;

	public ReviewVo() {
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		ReviewVo reviewVo = (ReviewVo) o;
		return idx == reviewVo.idx &&
				Double.compare(reviewVo.rating, rating) == 0 &&
				Objects.equals(branchID, reviewVo.branchID) &&
				Objects.equals(clientID, reviewVo.clientID) &&
				Objects.equals(title, reviewVo.title) &&
				Objects.equals(content, reviewVo.content) &&
				Objects.equals(writer, reviewVo.writer) &&
				Objects.equals(image, reviewVo.image) &&
				Objects.equals(comment, reviewVo.comment) &&
				Objects.equals(calendar, reviewVo.calendar) &&
				Objects.equals(nickName, reviewVo.nickName);
	}

	@Override
	public int hashCode() {

		return Objects.hash(branchID, clientID, idx, title, content, writer, image, comment, calendar, rating, nickName);
	}

	@Override
	public String toString() {
		return "ReviewVo{" +
				"branchID='" + branchID + '\'' +
				", clientID='" + clientID + '\'' +
				", idx=" + idx +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", writer='" + writer + '\'' +
				", image='" + image + '\'' +
				", comment='" + comment + '\'' +
				", calendar=" + calendar +
				", rating=" + rating +
				", nickName='" + nickName + '\'' +
				'}';
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

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public ReviewVo(String branchID, String clientID, int idx, String title, String content, String writer, String image, String comment, Date calendar, double rating, String nickName) {
		this.branchID = branchID;
		this.clientID = clientID;
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.image = image;
		this.comment = comment;
		this.calendar = calendar;
		this.rating = rating;
		this.nickName = nickName;
	}
}
