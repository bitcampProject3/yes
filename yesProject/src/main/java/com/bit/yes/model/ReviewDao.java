package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.ReviewVo;

public interface ReviewDao {
	
	List<ReviewVo> reviewList() throws SQLException;
	ReviewVo reviewSelect(int index) throws SQLException;
	int reviewDelete(int index) throws SQLException;
	int reviewWrite(ReviewVo bean) throws SQLException;
	int reviewEdit(ReviewVo bean) throws SQLException;
}
