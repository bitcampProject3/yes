package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.yes.model.AdminDao;
import com.bit.yes.model.entity.NoticeVo;
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
	
	
	// 其捞隆 贸府
	public List<UserVo> allwriteList(int alloffset, int allnoOfRecords) throws SQLException {
		return adminDao.allwriteList(alloffset, allnoOfRecords);
	}
	
	public int allwriteGetCount() throws Exception {
		return adminDao.allwriteGetCount();
	}
	// 其捞隆 贸府
	public List<UserVo> userwriteList(int useroffset, int usernoOfRecords) throws SQLException {
		return adminDao.userwriteList(useroffset, usernoOfRecords);
	}
	
	public int userwriteGetCount() throws Exception {
		return adminDao.userwriteGetCount();
	}
	// 其捞隆 贸府
	public List<UserVo> branchwriteList(int branchoffset, int branchnoOfRecords) throws SQLException {
		return adminDao.branchwriteList(branchoffset, branchnoOfRecords);
	}
	
	public int branchwriteGetCount() throws Exception {
		return adminDao.branchwriteGetCount();
	}
	// 其捞隆 贸府
	public List<branch_infoVo> management_writeList(int offset, int noOfRecords) throws SQLException {
		return adminDao.management_writeList(offset, noOfRecords);
	}
	
	public int management_writeGetCount() throws Exception {
		return adminDao.management_writeGetCount();
	}
	
	public branch_addressVo management_address(String id) throws SQLException{
		return adminDao.management_address(id);
	}
	
	//
	public void manage_update(String id) throws SQLException {
		adminDao.manage_update(id);
	}
	public void manage_registNum(String id) throws SQLException {
		adminDao.manage_registNum(id);
	}
	public void manage_delete(String id) throws SQLException {
		adminDao.manage_delete(id);
	}
	
	
}
