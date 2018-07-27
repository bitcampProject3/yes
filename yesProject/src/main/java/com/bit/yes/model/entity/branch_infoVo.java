package com.bit.yes.model.entity;

public class branch_infoVo {
	
	private String id;
	private String branchname;
	private String opTime;
	private String breakTime;
	private String opDate;
	private String phoneNum;
	private int score;
	private String state;
	private String category;
	private String branchExplain;
	private int maxTable;
	private int tableState;
	private String acceptState;
	private String waitingNum;
	
	public branch_infoVo() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getbranchname() {
		return branchname;
	}

	public void setbranchname(String branchname) {
		this.branchname = branchname;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBranchExplain() {
		return branchExplain;
	}

	public void setBranchExplain(String branchExplain) {
		this.branchExplain = branchExplain;
	}

	public int getMaxTable() {
		return maxTable;
	}

	public void setMaxTable(int maxTable) {
		this.maxTable = maxTable;
	}

	public int getTableState() {
		return tableState;
	}

	public void setTableState(int tableState) {
		this.tableState = tableState;
	}

	public String getAcceptState() {
		return acceptState;
	}

	public void setAcceptState(String acceptState) {
		this.acceptState = acceptState;
	}

	public String getWaitingNum() {
		return waitingNum;
	}

	public void setWaitingNum(String waitingNum) {
		this.waitingNum = waitingNum;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((acceptState == null) ? 0 : acceptState.hashCode());
		result = prime * result + ((branchExplain == null) ? 0 : branchExplain.hashCode());
		result = prime * result + ((branchname == null) ? 0 : branchname.hashCode());
		result = prime * result + ((breakTime == null) ? 0 : breakTime.hashCode());
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + maxTable;
		result = prime * result + ((opDate == null) ? 0 : opDate.hashCode());
		result = prime * result + ((opTime == null) ? 0 : opTime.hashCode());
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + score;
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + tableState;
		result = prime * result + ((waitingNum == null) ? 0 : waitingNum.hashCode());
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
		if (acceptState == null) {
			if (other.acceptState != null)
				return false;
		} else if (!acceptState.equals(other.acceptState))
			return false;
		if (branchExplain == null) {
			if (other.branchExplain != null)
				return false;
		} else if (!branchExplain.equals(other.branchExplain))
			return false;
		if (branchname == null) {
			if (other.branchname != null)
				return false;
		} else if (!branchname.equals(other.branchname))
			return false;
		if (breakTime == null) {
			if (other.breakTime != null)
				return false;
		} else if (!breakTime.equals(other.breakTime))
			return false;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (maxTable != other.maxTable)
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
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (tableState != other.tableState)
			return false;
		if (waitingNum == null) {
			if (other.waitingNum != null)
				return false;
		} else if (!waitingNum.equals(other.waitingNum))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "branch_infoVo [id=" + id + ", branchname=" + branchname + ", opTime=" + opTime + ", breakTime="
				+ breakTime + ", opDate=" + opDate + ", phoneNum=" + phoneNum + ", score=" + score + ", state=" + state
				+ ", category=" + category + ", branchExplain=" + branchExplain + ", maxTable=" + maxTable
				+ ", tableState=" + tableState + ", acceptState=" + acceptState + ", waitingNum=" + waitingNum + "]";
	}

	public branch_infoVo(String id, String branchname, String opTime, String breakTime, String opDate, String phoneNum,
			int score, String state, String category, String branchExplain, int maxTable, int tableState,
			String acceptState, String waitingNum) {
		super();
		this.id = id;
		this.branchname = branchname;
		this.opTime = opTime;
		this.breakTime = breakTime;
		this.opDate = opDate;
		this.phoneNum = phoneNum;
		this.score = score;
		this.state = state;
		this.category = category;
		this.branchExplain = branchExplain;
		this.maxTable = maxTable;
		this.tableState = tableState;
		this.acceptState = acceptState;
		this.waitingNum = waitingNum;
	}

	
	
	
	
	
	
}
