package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.yes.model.entity.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ReviewVo> reviewList() throws SQLException {
		
		return sqlSession.selectList("review.reviewList");
	}
	
	@Override
	public ReviewVo reviewSelect(int index) throws SQLException {
		
		return sqlSession.selectOne("review.reviewSelect", index);
	}
	
	@Override
	public int reviewDelete(int index) throws SQLException {
		
		return sqlSession.delete("review.reviewDelete", index);
	}
	
	@Override
	public int reviewWrite(ReviewVo bean) throws SQLException {
		
		return sqlSession.insert("review.reviewWrite", bean);
	
	}

	@Override
	public int reviewEdit(ReviewVo bean) throws SQLException {

		return sqlSession.update("review.reviewEdit", bean);
	}
}
