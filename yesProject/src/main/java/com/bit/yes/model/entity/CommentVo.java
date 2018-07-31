package com.bit.yes.model.entity;

import java.sql.Date;

public class CommentVo {

	private int comment_idx;
	private int review_idx;
	private String comment;
	private String writer;
	private Date reg_date;

	public CommentVo() {
		// TODO Auto-generated constructor stub
	}
	


	public CommentVo(int comment_idx, int review_idx, String comment, String writer, Date reg_date) {
		super();
		this.comment_idx = comment_idx;
		this.review_idx = review_idx;
		this.comment = comment;
		this.writer = writer;
		this.reg_date = reg_date;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}



	@Override
	public String toString() {
		return "CommentVo [comment_idx=" + comment_idx + ", review_idx=" + review_idx + ", comment=" + comment
				+ ", writer=" + writer + ", reg_date=" + reg_date + "]";
	}


	
	
}
