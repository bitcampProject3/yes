package com.bit.yes.model.entity;

import java.sql.Date;

public class LikeVo {

	private int review_idx;
	private String writer;
	private boolean checked;
	private Date click_date;

	public LikeVo() {
		// TODO Auto-generated constructor stub
	}

	public LikeVo(int review_idx, String writer, boolean checked, Date click_date) {
		super();
		this.review_idx = review_idx;
		this.writer = writer;
		this.checked = checked;
		this.click_date = click_date;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public Date getClick_date() {
		return click_date;
	}

	public void setClick_date(Date click_date) {
		this.click_date = click_date;
	}

	@Override
	public String toString() {
		return "LikeVo [review_idx=" + review_idx + ", writer=" + writer + ", checked=" + checked + ", click_date="
				+ click_date + "]";
	}

}
