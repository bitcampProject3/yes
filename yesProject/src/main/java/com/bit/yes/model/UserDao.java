package com.bit.yes.model;

import java.sql.SQLException;

import com.bit.yes.model.entity.UserVo;

public interface UserDao {

	int insertOne(UserVo bean) throws SQLException;
	
	
}
