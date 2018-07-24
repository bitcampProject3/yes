package com.bit.yes.model.entity;

public class branch_infoVo {
	
	private String id;
	private String opTime;
	private String breakTime;
	private String opDate;
	private String menu;
	private String address;
	private String phoneNum;
	private int score;
	private String name;
	
	public branch_infoVo() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOpTime() {
		return opTime;
	}

	public void setOpTime(String opTime) {
		this.opTime = opTime;
	}

	public String getBreakTime() {
		return breakTime;
	}

	public void setBreakTime(String breakTime) {
		this.breakTime = breakTime;
	}

	public String getOpDate() {
		return opDate;
	}

	public void setOpDate(String opDate) {
		this.opDate = opDate;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((breakTime == null) ? 0 : breakTime.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((menu == null) ? 0 : menu.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((opDate == null) ? 0 : opDate.hashCode());
		result = prime * result + ((opTime == null) ? 0 : opTime.hashCode());
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + score;
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
		branch_infoVo other = (branch_infoVo) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (breakTime == null) {
			if (other.breakTime != null)
				return false;
		} else if (!breakTime.equals(other.breakTime))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (menu == null) {
			if (other.menu != null)
				return false;
		} else if (!menu.equals(other.menu))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (opDate == null) {
			if (other.opDate != null)
				return false;
		} else if (!opDate.equals(other.opDate))
			return false;
		if (opTime == null) {
			if (other.opTime != null)
				return false;
		} else if (!opTime.equals(other.opTime))
			return false;
		if (phoneNum == null) {
			if (other.phoneNum != null)
				return false;
		} else if (!phoneNum.equals(other.phoneNum))
			return false;
		if (score != other.score)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "branch_infoVo [id=" + id + ", opTime=" + opTime + ", breakTime=" + breakTime + ", opDate=" + opDate
				+ ", menu=" + menu + ", address=" + address + ", phoneNum=" + phoneNum + ", score=" + score + ", name="
				+ name + "]";
	}

	public branch_infoVo(String id, String opTime, String breakTime, String opDate, String menu, String address,
			String phoneNum, String image, int score, String name) {
		super();
		this.id = id;
		this.opTime = opTime;
		this.breakTime = breakTime;
		this.opDate = opDate;
		this.menu = menu;
		this.address = address;
		this.phoneNum = phoneNum;
		this.score = score;
		this.name = name;
	}
	
	
	
	
	
	
}
