package com.bit.yes.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.ReviewVo;

public interface ReviewDao {
	
	List<ReviewVo> reviewList() throws SQLException;
	List<ImageVo> reviewListImage() throws SQLException;
	List<ImageVo> reviewListImage(HashMap<String, Object> params) throws SQLException;
	ImageVo reviewMainImage(int index) throws SQLException;
	List<ImageVo> reviewSubImage(int index) throws SQLException;
	ReviewVo reviewSelect(int index) throws SQLException;
	int reviewDelete(int index) throws SQLException;
	int reviewDeleteFile(int index) throws SQLException;
	int reviewWrite(ReviewVo bean) throws SQLException;
	int reviewImgUpload(ImageVo bean) throws SQLException;
	int reviewEdit(ReviewVo bean) throws SQLException;
	
	
//	-------------------------------- paging
	
	List<ReviewVo> writeList(HashMap<String, Object> params) throws SQLException;
//	List<ReviewVo> writeList(int offset, int noOfRecords, String category, String keyword) throws SQLException;
	
	int writeGetCount() throws SQLException;
	int writeGetCount(HashMap<String, Object> params) throws SQLException;
}
