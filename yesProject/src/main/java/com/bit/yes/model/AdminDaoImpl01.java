package com.bit.yes.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_addressVo;
import com.bit.yes.model.entity.branch_infoVo;

@Repository
public class AdminDaoImpl01 implements AdminDao {

	@Autowired
	SqlSession sqlSession;
	int alloffset;
	int allnoOfRecords;
	int useroffset;
	int usernoOfRecords;
	int branchoffset;
	int branchnoOfRecords;
	int offset;
	int noOfRecords;
	
	
//	int alloffset, int allnoOfRecords
	@Override
	public List<UserVo> allwriteList(HashMap<String, Object> params) throws SQLException {
		
		List<UserVo> allwriteList = new ArrayList<UserVo>();
		
		allwriteList = sqlSession.selectList("all_writeList", params);
		this.allnoOfRecords = sqlSession.selectOne("all_writeGetCount", params);
		
		return allwriteList;
	}

	@Override
	public int allwriteGetCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("all_writeGetCount");
	}
	
	@Override
	public int allwriteGetCount(HashMap<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("all_writeGetCount", params);
	}

	@Override
	public UserVo user_selcetOne(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("yes.user_selectOne", id);
	}

	@Override
	public branch_infoVo user_branch_selectOne(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("yes.user_branch_selectOne",id);
	}

	@Override
	public branch_addressVo user_branch_selectOne_address(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("yes.user_branch_selectOne_address",id);
	}

	@Override
	public List<UserVo> userwriteList(HashMap<String, Object> params) throws SQLException {
		List<UserVo> userwriteList = new ArrayList<UserVo>();
		
//		HashMap<String, Object> params = new HashMap<String, Object>();
//		
//		params.put("useroffset", useroffset);
//		params.put("usernoOfRecords", usernoOfRecords);
		
		userwriteList = sqlSession.selectList("user_writeList", params);
		this.usernoOfRecords = sqlSession.selectOne("user_writeGetCount");
		
		return userwriteList;
	}

	@Override
	public List<UserVo> branchwriteList(HashMap<String, Object> params) throws SQLException {
		List<UserVo> branchwriteList = new ArrayList<UserVo>();
		
//		HashMap<String, Object> params = new HashMap<String, Object>();
//		
//		params.put("branchoffset", branchoffset);
//		params.put("branchnoOfRecords", branchnoOfRecords);
		
		branchwriteList = sqlSession.selectList("branch_writeList", params);
		this.branchnoOfRecords = sqlSession.selectOne("branch_writeGetCount");
		
		return branchwriteList;
	}

	@Override
	public int userwriteGetCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user_writeGetCount");
	}
	
	@Override
	public int userwriteGetCount(HashMap<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user_writeGetCount", params);
	}

	@Override
	public int branchwriteGetCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("branch_writeGetCount");
	}
	
	@Override
	public int branchwriteGetCount(HashMap<String, Object> params) throws SQLException {
		return sqlSession.selectOne("branch_writeGetCount", params);
	}

	@Override
	public List<branch_infoVo> management_writeList(int offset, int noOfRecords) throws SQLException {
		List<branch_infoVo> managementwriteList = new ArrayList<branch_infoVo>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		System.out.println("writeList start..");
		managementwriteList = sqlSession.selectList("management_writeList", params);
		System.out.println("writeList end..");
		System.out.println("writeGetCount start..");
		this.noOfRecords = sqlSession.selectOne("management_writeGetCount");
		System.out.println("writeGetCount end..");

		return managementwriteList;
	}

	@Override
	public int management_writeGetCount() throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("writeGetCount2 start..");
		return sqlSession.selectOne("yes.management_writeGetCount");
	}

	@Override
	public branch_addressVo management_address(String id) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("management_address start..");
		return sqlSession.selectOne("yes.management_address", id);
	}

	@Override
	public int manage_update(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.update("yes.manage_update", id);
	}

	@Override
	public int manage_delete(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.delete("yes.manage_delete", id);
	}

	@Override
	public int manage_registNum(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.update("yes.manage_registNum", id);
	}

	@Override
	public int manage_delregistNum(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.update("yes.manage_delregistNum", id);
	}

	@Override
	public int manage_deldelete(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.delete("yes.manage_deldelete", id);
	}

	@Override
	public List<branch_infoVo> managementdel_writeList(int offset, int noOfRecords) throws SQLException {
		List<branch_infoVo> managementdel_writeList = new ArrayList<branch_infoVo>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		managementdel_writeList = sqlSession.selectList("yes.managementdel_writeList", params);
		this.noOfRecords = sqlSession.selectOne("yes.managementdel_writeGetCount");
		
		return managementdel_writeList;
	}

	@Override
	public int managementdel_writeGetCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("yes.managementdel_writeGetCount");
	}





}
