package com.bit.yes.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.branch_infoVo;

@Repository
public class C_CsDaoImpl01 implements C_CsDao {

	@Autowired
	SqlSession sqlSession;
	int noOfRecords;
	
	@Override
	public C_CsVo selcetOne(int index) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("yes.c_selectOne", index);
	}

	@Override
	public int insertOne(C_CsVo bean) throws SQLException {
		sqlSession.insert("yes.c_insertOne",bean);
		return 0;
		
	}

	@Override
	public List<C_CsVo> writeList(int offset, int noOfRecords) throws SQLException {
		List<C_CsVo> writeList = new ArrayList<C_CsVo>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		writeList = sqlSession.selectList("c_writeList", params);
		this.noOfRecords = sqlSession.selectOne("c_writeGetCount");
		
		return writeList;
	}

	@Override
	public int writeGetCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("c_writeGetCount");
		
	}

	@Override
	public List<branch_infoVo> reserveList(String id) throws SQLException {
		
		return sqlSession.selectList("yes.reserveselectAll", id);
	}

	@Override
	public List<branch_infoVo> reserveOne(String id) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("yes.reserveOne", id);
	}

}
