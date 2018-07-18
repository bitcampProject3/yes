package com.bit.yes.model.entity;

import java.sql.Date;

public class reserve_listVo {
	private String branchID;
	private String clientID;
	private Date reserveTime;
	private int personal;
	private String request;
	
	public reserve_listVo() {
		// TODO Auto-generated constructor stub
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

	public Date getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(Date reserveTime) {
		this.reserveTime = reserveTime;
	}

	public int getPersonal() {
		return personal;
	}

	public void setPersonal(int personal) {
		this.personal = personal;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((branchID == null) ? 0 : branchID.hashCode());
		result = prime * result + ((clientID == null) ? 0 : clientID.hashCode());
		result = prime * result + personal;
		result = prime * result + ((request == null) ? 0 : request.hashCode());
		result = prime * result + ((reserveTime == null) ? 0 : reserveTime.hashCode());
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
		reserve_listVo other = (reserve_listVo) obj;
		if (branchID == null) {
			if (other.branchID != null)
				return false;
		} else if (!branchID.equals(other.branchID))
			return false;
		if (clientID == null) {
			if (other.clientID != null)
				return false;
		} else if (!clientID.equals(other.clientID))
			return false;
		if (personal != other.personal)
			return false;
		if (request == null) {
			if (other.request != null)
				return false;
		} else if (!request.equals(other.request))
			return false;
		if (reserveTime == null) {
			if (other.reserveTime != null)
				return false;
		} else if (!reserveTime.equals(other.reserveTime))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "reserve_listVo [branchID=" + branchID + ", clientID=" + clientID + ", reserveTime=" + reserveTime
				+ ", personal=" + personal + ", request=" + request + "]";
	}

	public reserve_listVo(String branchID, String clientID, Date reserveTime, int personal, String request) {
		super();
		this.branchID = branchID;
		this.clientID = clientID;
		this.reserveTime = reserveTime;
		this.personal = personal;
		this.request = request;
	}
	
	
	 
}
