package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.NoticeVo;

public interface NoticeDao {
	
	List<NoticeVo> selectAll() throws SQLException;

	NoticeVo selcetOne(int index) throws SQLException;
	
	int insertOne(NoticeVo bean) throws SQLException;
	
	int updatedelete(int index) throws SQLException;
	
	int updateimg(ImageVo beans) throws SQLException;
	
	int updateOne(NoticeVo bean) throws SQLException;
	
	int deleteOne(int index) throws SQLException;
	
	List<NoticeVo> writeList(int offset, int noOfRecords) throws SQLException;
	
	int writeGetCount() throws SQLException;

	List<ImageVo> noticeSubImage(int index) throws SQLException;
	
	int noticeImgUpload(ImageVo bean) throws SQLException;
}
