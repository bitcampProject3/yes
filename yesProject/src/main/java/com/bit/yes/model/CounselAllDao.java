package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.S_CsVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_infoVo;

public interface CounselAllDao {

	C_CsVo cselcetOne(int index) throws SQLException;
	
	List<C_CsVo> cwriteList(int coffset, int cnoOfRecords) throws SQLException;
	
	List<branch_infoVo> creserveList(String id) throws SQLException;

	List<branch_infoVo> creserveOne(String id) throws SQLException;
	
	int cwriteGetCount() throws SQLException;
	
	UserVo c_selectnickname(String id) throws SQLException;
	
	int cupdateOne(C_CsVo bean) throws SQLException;
	
	
	////////////////////////////////////////////////////////
	
	S_CsVo sselcetOne(int index) throws SQLException;
	
	List<S_CsVo> swriteList(int soffset, int snoOfRecords) throws SQLException;
	
	int swriteGetCount() throws SQLException;
	
	UserVo s_selectnickname(String id) throws SQLException;
	
	int supdateOne(S_CsVo bean) throws SQLException;
	
}
