package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.NoticeVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_addressVo;
import com.bit.yes.model.entity.branch_infoVo;

public interface AdminDao {

	List<UserVo> allwriteList(int alloffset, int allnoOfRecords) throws SQLException;
	List<UserVo> userwriteList(int useroffset, int usernoOfRecords) throws SQLException;
	List<UserVo> branchwriteList(int branchoffset, int branchnoOfRecords) throws SQLException;
	List<branch_infoVo> management_writeList(int offset, int noOfRecords) throws SQLException;
	
	branch_addressVo management_address(String id) throws SQLException;
	
	int allwriteGetCount() throws SQLException;
	int userwriteGetCount() throws SQLException;
	int branchwriteGetCount() throws SQLException;
	int management_writeGetCount() throws SQLException;
	
	// ��ȸ�ϱ� ���� ���� Detail�� ���� ��
	UserVo user_selcetOne(String id) throws SQLException;
	// ��ȸ�ϱ� ������ ���� Detail�� ���� ��
	branch_infoVo user_branch_selectOne(String id) throws SQLException;
	// ��ȸ�ϱ� ������ �ּ� ���� Detail�� ���� ��
	branch_addressVo user_branch_selectOne_address(String id) throws SQLException;
	
	// ���� ��� 
	int manage_update(String id) throws SQLException;
	int manage_registNum(String id) throws SQLException;
	// ���� ����
	int manage_delete(String id) throws SQLException;
	// ���� ����
	
}
