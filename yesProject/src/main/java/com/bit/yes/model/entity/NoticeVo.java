package com.bit.yes.model.entity;

public class NoticeVo {
	private int index;
	private String title;
	private String content;
	private String writer;
	private String calendar;
	
	public NoticeVo() {
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "NoticeVo [index=" + index + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", calendar=" + calendar + "]";
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

	public String getCalendar() {
		return calendar;
	}

	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}


	public NoticeVo(int index, String title, String content, String writer, String calendar, String image) {
		super();
		this.index = index;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.calendar = calendar;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((calendar == null) ? 0 : calendar.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + index;
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
		NoticeVo other = (NoticeVo) obj;
		if (calendar == null) {
			if (other.calendar != null)
				return false;
		} else if (!calendar.equals(other.calendar))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (index != other.index)
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
	
	
}
