package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.yes.model.C_CsDao;
import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_infoVo;

@Service
public class C_CsService {

	@Autowired
	C_CsDao csDao;
	
	public C_CsVo selectPage(int idx) throws SQLException {
		return csDao.selcetOne(idx);
	}
	
	public void addPage(C_CsVo bean) throws SQLException {
		csDao.insertOne(bean);
	}
	
	public List<branch_infoVo> reserveList(String id) throws SQLException{
		return csDao.reserveList(id);
	}
	
	public List<branch_infoVo> reserveOne(String id) throws SQLException{
		return csDao.reserveOne(id);
	}
	
	// ∆‰¿Ã¬° √≥∏Æ
	public List<C_CsVo> writeList(int offset, int noOfRecords,String clientID) throws SQLException {
		return csDao.writeList(offset, noOfRecords, clientID);
	}
	
	public int writeGetCount(String clientID) throws Exception {
		return csDao.writeGetCount(clientID);
	}

	public UserVo selectNick(String id) throws SQLException{
		return csDao.c_selectnickname(id);
	}
}
