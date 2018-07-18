package com.bit.yes.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.yes.model.entity.S_CsVo;

@Repository
public class S_CsDaoImpl01 implements S_CsDao {

	@Autowired
	SqlSession sqlSession;
	int noOfRecords;
	
	@Override
	public S_CsVo selcetOne(int index) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("yes.s_selectOne", index);
	}

	@Override
	public int insertOne(S_CsVo bean) throws SQLException {
		sqlSession.insert("yes.s_insertOne", bean);
		return 0;
		
	}

	@Override
	public List<S_CsVo> writeList(int offset, int noOfRecords) throws SQLException {
		List<S_CsVo> writeList = new ArrayList<S_CsVo>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		writeList = sqlSession.selectList("s_writeList", params);
		this.noOfRecords = sqlSession.selectOne("s_writeGetCount");
		
		return writeList;
	}

	@Override
	public int writeGetCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("s_writeGetCount");
		
	}

}
