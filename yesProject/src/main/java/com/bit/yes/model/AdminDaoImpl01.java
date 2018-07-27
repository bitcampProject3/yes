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
	
	@Override
	public List<UserVo> allwriteList(int alloffset, int allnoOfRecords) throws SQLException {
		List<UserVo> allwriteList = new ArrayList<UserVo>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("alloffset", alloffset);
		params.put("allnoOfRecords", allnoOfRecords);
		
		allwriteList = sqlSession.selectList("all_writeList", params);
		this.allnoOfRecords = sqlSession.selectOne("all_writeGetCount");
		
		return allwriteList;
	}

	@Override
	public int allwriteGetCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("all_writeGetCount");
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

}
