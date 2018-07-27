package com.bit.yes.model.entity;

import java.sql.Date;

public class S_CsVo {

	private int index;
	private String title;
	private String content;
	private String writer;
	private Date calendar;
	private String image;
	private String comment;
	private String questionSelect;
	
	
	public S_CsVo() {
		// TODO Auto-generated constructor stub
	}


	public int getIndex() {
		return index;
	}


	public void setIndex(int index) {
		this.index = index;
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


	public Date getCalendar() {
		return calendar;
	}


	public void setCalendar(Date calendar) {
		this.calendar = calendar;
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


	public String getQuestionSelect() {
		return questionSelect;
	}


	public void setQuestionSelect(String questionSelect) {
		this.questionSelect = questionSelect;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + index;
		result = prime * result + ((questionSelect == null) ? 0 : questionSelect.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((writer == null) ? 0 : writer.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		S_CsVo other = (S_CsVo) obj;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		if (index != other.index)
			return false;
		if (questionSelect == null) {
			if (other.questionSelect != null)
				return false;
		} else if (!questionSelect.equals(other.questionSelect))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (writer == null) {
			if (other.writer != null)
				return false;
		} else if (!writer.equals(other.writer))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "S_CsVo [index=" + index + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", calendar=" + calendar + ", image=" + image + ", comment=" + comment + ", questionSelect="
				+ questionSelect + "]";
	}


	public S_CsVo(int index, String title, String content, String writer, Date calendar, String image, String comment,
			String questionSelect) {
		super();
		this.index = index;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.calendar = calendar;
		this.image = image;
		this.comment = comment;
		this.questionSelect = questionSelect;
	}
	
	
}
