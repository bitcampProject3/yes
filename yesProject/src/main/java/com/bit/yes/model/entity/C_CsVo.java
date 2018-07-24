package com.bit.yes.model.entity;

import java.sql.Date;

public class C_CsVo {
	
	private String branchID;
	private String ClientID;
	private int index;
	private String title;
	private String content;
	private String writer;
	private Date calendar;
	private String comment;
	private String reserveList;
	private Date sDate;
	private Date eDate;

	public C_CsVo() {
		// TODO Auto-generated constructor stub
	}

	public String getBranchID() {
		return branchID;
	}

	public void setBranchID(String branchID) {
		this.branchID = branchID;
	}

	public String getClientID() {
		return ClientID;
	}

	public void setClientID(String clientID) {
		ClientID = clientID;
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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getReserveList() {
		return reserveList;
	}

	public void setReserveList(String reserveList) {
		this.reserveList = reserveList;
	}

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ClientID == null) ? 0 : ClientID.hashCode());
		result = prime * result + ((branchID == null) ? 0 : branchID.hashCode());
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((eDate == null) ? 0 : eDate.hashCode());
		result = prime * result + index;
		result = prime * result + ((reserveList == null) ? 0 : reserveList.hashCode());
		result = prime * result + ((sDate == null) ? 0 : sDate.hashCode());
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
		C_CsVo other = (C_CsVo) obj;
		if (ClientID == null) {
			if (other.ClientID != null)
				return false;
		} else if (!ClientID.equals(other.ClientID))
			return false;
		if (branchID == null) {
			if (other.branchID != null)
				return false;
		} else if (!branchID.equals(other.branchID))
			return false;
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
		if (eDate == null) {
			if (other.eDate != null)
				return false;
		} else if (!eDate.equals(other.eDate))
			return false;
		if (index != other.index)
			return false;
		if (reserveList == null) {
			if (other.reserveList != null)
				return false;
		} else if (!reserveList.equals(other.reserveList))
			return false;
		if (sDate == null) {
			if (other.sDate != null)
				return false;
		} else if (!sDate.equals(other.sDate))
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
		return "C_CsVo [branchID=" + branchID + ", ClientID=" + ClientID + ", index=" + index + ", title=" + title
				+ ", content=" + content + ", writer=" + writer + ", calendar=" + calendar + ", comment=" + comment
				+ ", reserveList=" + reserveList + ", sDate=" + sDate + ", eDate=" + eDate + "]";
	}

	public C_CsVo(String branchID, String clientID, int index, String title, String content, String writer,
			Date calendar, String image, String comment, String reserveList, Date sDate, Date eDate) {
		super();
		this.branchID = branchID;
		ClientID = clientID;
		this.index = index;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.calendar = calendar;
		this.comment = comment;
		this.reserveList = reserveList;
		this.sDate = sDate;
		this.eDate = eDate;
	}

	
	
	
	
	
}
