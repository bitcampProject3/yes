package com.bit.yes.model.entity;

import java.sql.Date;

public class UserVo {

	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String phoneNum;
	private String pwQuestion;
	private Date birthDate;
	private String registNum;
	
	
	
	public UserVo() {
		// TODO Auto-generated constructor stub
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getname() {
		return name;
	}



	public void setname(String name) {
		this.name = name;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
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



	public String getRegistNum() {
		return registNum;
	}



	public void setRegistNum(String registNum) {
		this.registNum = registNum;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((birthDate == null) ? 0 : birthDate.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + ((pwQuestion == null) ? 0 : pwQuestion.hashCode());
		result = prime * result + ((registNum == null) ? 0 : registNum.hashCode());
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
		if (birthDate == null) {
			if (other.birthDate != null)
				return false;
		} else if (!birthDate.equals(other.birthDate))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phoneNum == null) {
			if (other.phoneNum != null)
				return false;
		} else if (!phoneNum.equals(other.phoneNum))
			return false;
		if (pwQuestion == null) {
			if (other.pwQuestion != null)
				return false;
		} else if (!pwQuestion.equals(other.pwQuestion))
			return false;
		if (registNum == null) {
			if (other.registNum != null)
				return false;
		} else if (!registNum.equals(other.registNum))
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "UserVo [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", email="
				+ email + ", phoneNum=" + phoneNum + ", pwQuestion=" + pwQuestion + ", birthDate=" + birthDate
				+ ", registNum=" + registNum + "]";
	}



	public UserVo(String id, String password, String name, String nickname, String email, String phoneNum,
			String pwQuestion, Date birthDate, String registNum) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.phoneNum = phoneNum;
		this.pwQuestion = pwQuestion;
		this.birthDate = birthDate;
		this.registNum = registNum;
	}
	

	
	
	
	
}
