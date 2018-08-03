package com.bit.yes.model.entity;

import java.sql.Date;
import java.util.Objects;


public class UserVo {

	private String id;
	private String password;
	private String name;
	private String nickname;
	private String nickName;
	private String email;
	private String phoneNum;
	private String pwQuestion;
	private Date birthDate;
	private String registNum; //사업자 등록번호
	private String acceptState;     //branch_info의 매장 등록 여부

	@Override
	public String toString() {
		return "UserVo{" +
				"id='" + id + '\'' +
				", password='" + password + '\'' +
				", name='" + name + '\'' +
				", nickname='" + nickname + '\'' +
				", nickName='" + nickName + '\'' +
				", email='" + email + '\'' +
				", phoneNum='" + phoneNum + '\'' +
				", pwQuestion='" + pwQuestion + '\'' +
				", birthDate=" + birthDate +
				", registNum='" + registNum + '\'' +
				", acceptState='" + acceptState + '\'' +
				'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		UserVo userVo = (UserVo) o;
		return Objects.equals(id, userVo.id) &&
				Objects.equals(password, userVo.password) &&
				Objects.equals(name, userVo.name) &&
				Objects.equals(nickname, userVo.nickname) &&
				Objects.equals(nickName, userVo.nickName) &&
				Objects.equals(email, userVo.email) &&
				Objects.equals(phoneNum, userVo.phoneNum) &&
				Objects.equals(pwQuestion, userVo.pwQuestion) &&
				Objects.equals(birthDate, userVo.birthDate) &&
				Objects.equals(registNum, userVo.registNum) &&
				Objects.equals(acceptState, userVo.acceptState);
	}

	@Override
	public int hashCode() {

		return Objects.hash(id, password, name, nickname, nickName, email, phoneNum, pwQuestion, birthDate, registNum, acceptState);
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

  public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public String getacceptState() {
		return acceptState;
	}

	public void setacceptState(String acceptState) {
		this.acceptState = acceptState;
	}

	public UserVo(String id, String password, String name, String nickname, String nickName, String email, String phoneNum, String pwQuestion, Date birthDate, String registNum, String acceptState) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.nickName = nickName;
		this.email = email;
		this.phoneNum = phoneNum;
		this.pwQuestion = pwQuestion;
		this.birthDate = birthDate;
		this.registNum = registNum;
		this.acceptState = acceptState;
	}

	public UserVo() {
	}
}
