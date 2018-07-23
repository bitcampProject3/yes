package com.bit.yes.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	SqlSession sqlSession;
	int noOfRecords;
	
	@Override
	public List<ReviewVo> reviewList() throws SQLException {
		
		return sqlSession.selectList("review.reviewList");
	}
	
	@Override
	public List<ImageVo> reviewListImage() throws SQLException {
		return sqlSession.selectList("review.reviewListImage");
	}
	
	@Override
	public ImageVo reviewMainImage(int index) throws SQLException {
		
		return sqlSession.selectOne("review.reviewMainImage", index);
	}
	
	@Override
	public List<ImageVo> reviewSubImage(int index) throws SQLException {
		return sqlSession.selectList("review.reviewSubImage", index);
	}
	
	@Override
	public ReviewVo reviewSelect(int index) throws SQLException {
		
		return sqlSession.selectOne("review.reviewSelect", index);
	}
	
	@Override
	public int reviewDelete(int index) throws SQLException {
		
		return sqlSession.delete("review.reviewDelete", index);
	}
	
	
	public int reviewDeleteFile(int index) throws SQLException {
		return sqlSession.delete("review.reviewDeleteFile", index);
	}
	
	@Override
	public int reviewWrite(ReviewVo bean) throws SQLException {
		
		return sqlSession.insert("review.reviewWrite", bean);
	
	}

	@Override
	public int reviewImgUpload(ImageVo bean) throws SQLException {
		
		return sqlSession.insert("review.reviewImgUpload", bean);
	}
	
	@Override
	public int reviewEdit(ReviewVo bean) throws SQLException {
		
		return sqlSession.update("review.reviewEdit", bean);
	}

	@Override
	public List<ReviewVo> writeList(int offset, int noOfRecords) throws SQLException {
		List<ReviewVo> writeList = new ArrayList<ReviewVo>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		writeList = sqlSession.selectList("writeList", params);
		this.noOfRecords = sqlSession.selectOne("writeGetCount");
		
		return writeList;
	}

	@Override
	public int writeGetCount() throws SQLException {

		return sqlSession.selectOne("writeGetCount");
	}
}
