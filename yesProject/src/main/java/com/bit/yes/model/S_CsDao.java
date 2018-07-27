package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.S_CsVo;


public interface S_CsDao {

	S_CsVo selcetOne(int index) throws SQLException;
	
	int insertOne(S_CsVo bean) throws SQLException;
	
	List<S_CsVo> writeList(int offset, int noOfRecords) throws SQLException;
	
	int writeGetCount() throws SQLException;
}
