package com.bit.yes.model;

import java.sql.SQLException;


import com.bit.yes.model.entity.UserVo;
public interface UserDao {

	
	
	public void insertOne(UserVo bean) throws SQLException; //회원가입
	//로그인
	public UserVo loginCheck(String id,String password) throws SQLException;
	public UserVo login(String id) throws SQLException;
	//아이디 비밀번호 찾기
	public String findId(String name,String email,String birth) throws SQLException;
	public String findPw(String id,String name,String birth,String email,String answer) throws SQLException;
	public void updatePw(String password,String id) throws SQLException; //비밀번호 수정
	//내정보 
	public int updateInfo(UserVo bean) throws SQLException;
}
