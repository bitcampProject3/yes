package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_addressVo;
import com.bit.yes.model.entity.branch_infoVo;

public interface C_CsDao {

	C_CsVo selcetOne(int index) throws SQLException;
	
	int insertOne(C_CsVo bean) throws SQLException;
	
	List<C_CsVo> writeList(int offset, int noOfRecords,String clientID) throws SQLException;
	
	branch_addressVo c_selectAddress(String id) throws SQLException;
	
	List<branch_infoVo> reserveList(String id) throws SQLException;

	List<branch_infoVo> reserveOne(String id) throws SQLException;
	
	int writeGetCount(String clientID) throws SQLException;
	
	UserVo c_selectnickname(String id) throws SQLException;
	
	List<ImageVo> c_counselSubImage(int index) throws SQLException;
	
	int c_counselImgUpload(ImageVo bean) throws SQLException;
}
