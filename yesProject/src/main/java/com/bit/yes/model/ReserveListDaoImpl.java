package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;

@Repository
public class ReserveListDaoImpl implements ReserveListDao {

	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ReserveListVo> reserveList(String id) throws SQLException {
		return sqlSession.selectList("reserveList.c_reserveList",id);
	}

	@Override
	public BranchVo selectOne(String branchID) throws SQLException {
		return sqlSession.selectOne("reserveList.branchInfo", branchID);
	}

	
}
