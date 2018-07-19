package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.yes.model.S_CsDao;
import com.bit.yes.model.entity.S_CsVo;
import com.bit.yes.model.entity.UserVo;

@Service
public class S_CsService {

	@Autowired
	S_CsDao scsDao;
	
	public S_CsVo selectPage(int idx) throws SQLException {
		return scsDao.selcetOne(idx);
	}
	
	public void addPage(S_CsVo bean) throws SQLException {
		scsDao.insertOne(bean);
	}
	
	// ∆‰¿Ã¬° √≥∏Æ
	public List<S_CsVo> writeList(int offset, int noOfRecords,String writer) throws SQLException {
		return scsDao.writeList(offset, noOfRecords, writer);
	}
	
	public int writeGetCount(String writer) throws Exception {
		return scsDao.writeGetCount(writer);
	}
	
	public UserVo selectNick(String id) throws SQLException{
		return scsDao.s_selectnickname(id);
	}
}
