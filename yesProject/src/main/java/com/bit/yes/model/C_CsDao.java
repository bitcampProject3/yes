package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.branch_infoVo;

public interface C_CsDao {

	C_CsVo selcetOne(int index) throws SQLException;
	
	int insertOne(C_CsVo bean) throws SQLException;
	
	List<C_CsVo> writeList(int offset, int noOfRecords) throws SQLException;
	
	List<branch_infoVo> reserveList(String id) throws SQLException;

	List<branch_infoVo> reserveOne(String id) throws SQLException;
	
	int writeGetCount() throws SQLException;
}
