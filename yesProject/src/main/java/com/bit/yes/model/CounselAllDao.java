package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.S_CsVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_addressVo;
import com.bit.yes.model.entity.branch_infoVo;

public interface CounselAllDao {

	C_CsVo cselcetOne(int index) throws SQLException;
	
	List<C_CsVo> cwriteList(int coffset, int cnoOfRecords) throws SQLException;
	
	List<C_CsVo> sacwriteList(int coffset, int cnoOfRecords, String sDate, String eDate) throws SQLException;
	
	int sacwriteGetCount(String sDate, String eDate) throws SQLException;

	List<S_CsVo> saswriteList(int soffset, int snoOfRecords, String sDate, String eDate) throws SQLException;
	
	int saswriteGetCount(String sDate, String eDate) throws SQLException;
	
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
	
	////////////////////////////////////////////////////////
	
	List<ImageVo> c_counselSubImage(int index) throws SQLException;
	
	List<ImageVo> s_counselSubImage(int index) throws SQLException;
	
	branch_addressVo c_selectAddress(String id) throws SQLException;
	
}
