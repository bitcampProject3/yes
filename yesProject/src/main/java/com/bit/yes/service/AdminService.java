package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.yes.model.AdminDao;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_addressVo;
import com.bit.yes.model.entity.branch_infoVo;

@Service
public class AdminService {

	@Autowired
	AdminDao adminDao;
	
	public UserVo user_selectPage(String id) throws SQLException {
		return adminDao.user_selcetOne(id);
	}
	
	public branch_infoVo user_branch_selectOne(String id) throws SQLException {
		return adminDao.user_branch_selectOne(id);
	}
	
	public branch_addressVo user_branch_selectOne_address(String id) throws SQLException {
		return adminDao.user_branch_selectOne_address(id);
	}
	
	
	// ∆‰¿Ã¬° √≥∏Æ
	public List<UserVo> allwriteList(int alloffset, int allnoOfRecords) throws SQLException {
		return adminDao.allwriteList(alloffset, allnoOfRecords);
	}
	
	public int allwriteGetCount() throws Exception {
		return adminDao.allwriteGetCount();
	}
}
