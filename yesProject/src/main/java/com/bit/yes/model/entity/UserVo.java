package com.bit.yes.model.entity;

import java.sql.Date;

public class UserVo {

	private String id;
	private String pw;
	private String nickName;
	private String phoneNum;
	private String pwQuestion;
	private Date birthDate;
	private String branchNum;
	
	
	
	public UserVo() {
		// TODO Auto-generated constructor stub
	}
	
	public UserVo(String id, String pw, String nickName, String phoneNum, String pwQuestion, Date birthDate,
			String branchNum) {
		super();
		this.id = id;
		this.pw = pw;
		this.nickName = nickName;
		this.phoneNum = phoneNum;
		this.pwQuestion = pwQuestion;
		this.birthDate = birthDate;
		this.branchNum = branchNum;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public String getPhoneNum() {
		return phoneNum;
	}



	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}



	public String getPwQuestion() {
		return pwQuestion;
	}



	public void setPwQuestion(String pwQuestion) {
		this.pwQuestion = pwQuestion;
	}



	public Date getBirthDate() {
		return birthDate;
	}



	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}



	public String getBranchNum() {
		return branchNum;
	}



	public void setBranchNum(String branchNum) {
		this.branchNum = branchNum;
	}



	@Override
	public String toString() {
		return "UserVo [id=" + id + ", pw=" + pw + ", nickName=" + nickName + ", phoneNum=" + phoneNum + ", pwQuestion="
				+ pwQuestion + ", birthDate=" + birthDate + ", branchNum=" + branchNum + "]";
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((branchNum == null) ? 0 : branchNum.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nickName == null) ? 0 : nickName.hashCode());
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + ((pw == null) ? 0 : pw.hashCode());
		result = prime * result + ((pwQuestion == null) ? 0 : pwQuestion.hashCode());
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
		UserVo other = (UserVo) obj;
		if (branchNum == null) {
			if (other.branchNum != null)
				return false;
		} else if (!branchNum.equals(other.branchNum))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nickName == null) {
			if (other.nickName != null)
				return false;
		} else if (!nickName.equals(other.nickName))
			return false;
		if (phoneNum == null) {
			if (other.phoneNum != null)
				return false;
		} else if (!phoneNum.equals(other.phoneNum))
			return false;
		if (pw == null) {
			if (other.pw != null)
				return false;
		} else if (!pw.equals(other.pw))
			return false;
		if (pwQuestion == null) {
			if (other.pwQuestion != null)
				return false;
		} else if (!pwQuestion.equals(other.pwQuestion))
			return false;
		return true;
	}
	
	
	
	
}
