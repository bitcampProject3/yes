package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.yes.model.CounselAllDao;
import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.S_CsVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_infoVo;

@Service
public class CounselAllService {

	@Autowired
	CounselAllDao csaDao;
	
	public C_CsVo cselectPage(int idx) throws SQLException {
		return csaDao.cselcetOne(idx);
	}
	
	public List<branch_infoVo> creserveList(String id) throws SQLException{
		return csaDao.creserveList(id);
	}
	
	public List<branch_infoVo> creserveOne(String id) throws SQLException{
		return csaDao.creserveOne(id);
	}
	
	// 其捞隆 贸府
	public List<C_CsVo> cwriteList(int coffset, int cnoOfRecords) throws SQLException {
		return csaDao.cwriteList(coffset, cnoOfRecords);
	}
	
	public int cwriteGetCount() throws Exception {
		return csaDao.cwriteGetCount();
	}

	public UserVo cselectNick(String id) throws SQLException{
		return csaDao.c_selectnickname(id);
	}
	
	public void cupdatePage(C_CsVo bean) throws SQLException {
		csaDao.cupdateOne(bean);
	}
	
	////////////////////////////////////////////
	
	public S_CsVo sselectPage(int idx) throws SQLException {
		return csaDao.sselcetOne(idx);
	}
	
	// 其捞隆 贸府
	public List<S_CsVo> swriteList(int soffset, int snoOfRecords) throws SQLException {
		return csaDao.swriteList(soffset, snoOfRecords);
	}
	
	public int swriteGetCount() throws Exception {
		return csaDao.swriteGetCount();
	}
	
	public UserVo sselectNick(String id) throws SQLException{
		return csaDao.s_selectnickname(id);
	}
	
	public void supdatePage(S_CsVo bean) throws SQLException {
		csaDao.supdateOne(bean);
		
	}
	
	
	
}
