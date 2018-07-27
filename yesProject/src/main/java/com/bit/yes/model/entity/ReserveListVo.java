package com.bit.yes.model.entity;

import java.sql.Date;


public class ReserveListVo {

	private String branchID;
	private String branchName;
	private String clientID;
	private String name;//고객 이름
	private String reserveTime; //예약한 시간
	private Date checkTime; //예약했을 때 시간
	private int personel;
	private String request;
	private String useState;

	public ReserveListVo() {
		// TODO Auto-generated constructor stub
	}

	public ReserveListVo(String branchID, String branchName, String clientID, String name, String reserveTime,
			Date checkTime, int personel, String request, String useState) {
		super();
		this.branchID = branchID;
		this.branchName = branchName;
		this.clientID = clientID;
		this.name = name;
		this.reserveTime = reserveTime;
		this.checkTime = checkTime;
		this.personel = personel;
		this.request = request;
		this.useState = useState;
	}

	public String getBranchID() {
		return branchID;
	}

	public void setBranchID(String branchID) {
		this.branchID = branchID;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getClientID() {
		return clientID;
	}

	public void setClientID(String clientID) {
		this.clientID = clientID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}

	public Date getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}

	public int getPersonel() {
		return personel;
	}

	public void setPersonel(int personel) {
		this.personel = personel;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getUseState() {
		return useState;
	}

	public void setUseState(String useState) {
		this.useState = useState;
	}

	@Override
	public String toString() {
		return "ReserveListVo [branchID=" + branchID + ", branchName=" + branchName + ", clientID=" + clientID
				+ ", name=" + name + ", reserveTime=" + reserveTime + ", checkTime=" + checkTime + ", personel="
				+ personel + ", request=" + request + ", useState=" + useState + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((branchID == null) ? 0 : branchID.hashCode());
		result = prime * result + ((branchName == null) ? 0 : branchName.hashCode());
		result = prime * result + ((clientID == null) ? 0 : clientID.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + personel;
		result = prime * result + ((request == null) ? 0 : request.hashCode());
		result = prime * result + ((reserveTime == null) ? 0 : reserveTime.hashCode());
		result = prime * result + ((useState == null) ? 0 : useState.hashCode());
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
		ReserveListVo other = (ReserveListVo) obj;
		if (branchID == null) {
			if (other.branchID != null)
				return false;
		} else if (!branchID.equals(other.branchID))
			return false;
		if (branchName == null) {
			if (other.branchName != null)
				return false;
		} else if (!branchName.equals(other.branchName))
			return false;
		if (clientID == null) {
			if (other.clientID != null)
				return false;
		} else if (!clientID.equals(other.clientID))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (personel != other.personel)
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
		if (useState == null) {
			if (other.useState != null)
				return false;
		} else if (!useState.equals(other.useState))
			return false;
		return true;
	}

	
}
