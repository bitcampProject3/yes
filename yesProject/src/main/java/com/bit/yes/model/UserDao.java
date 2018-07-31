package com.bit.yes.model;

import java.sql.SQLException;


import com.bit.yes.model.entity.UserVo;
public interface UserDao {

	
	
	public void insertOne(UserVo bean) throws SQLException;
	public UserVo loginCheck(String id,String password) throws SQLException;
	public UserVo login(String id) throws SQLException;
	public String findId(String name,String email,String birth) throws SQLException;
	public String findPw(String id,String name,String birth,String email,String answer) throws SQLException;
	public int updatePw(String password,String id) throws SQLException;
	public int updateInfo(UserVo bean) throws SQLException;
}
