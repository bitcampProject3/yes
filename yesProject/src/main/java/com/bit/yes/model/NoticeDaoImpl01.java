package com.bit.yes.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.NoticeVo;

@Repository
public class NoticeDaoImpl01 implements NoticeDao {

	@Autowired
	SqlSession sqlSession;
	int noOfRecords;
	
	@Override
	public List<NoticeVo> selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("yes.selectAll");
	}

	@Override
	public NoticeVo selcetOne(int index) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("yes.selectOne",index);
	}

	@Override
	public int insertOne(NoticeVo bean) throws SQLException {
		sqlSession.insert("yes.insertOne", bean);
		return 0;
	}

	@Override
	public int updatedelete(int index) throws SQLException {
		return sqlSession.delete("yes.updatedelete", index);
	}
	
	@Override
	public int updateimg(ImageVo beans) throws SQLException {
		sqlSession.insert("yes.updateimg", beans);
		return 0;
	}
	@Override
	public int updateOne(NoticeVo bean) throws SQLException {
		return sqlSession.update("yes.updateOne", bean);
		
	}

	@Override
	public int deleteOne(int index) throws SQLException {
		return sqlSession.delete("yes.deleteOne", index);

	}

	@Override
	public List<NoticeVo> writeList(int offset, int noOfRecords) throws SQLException {
		List<NoticeVo> writeList = new ArrayList<NoticeVo>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		writeList = sqlSession.selectList("writeList", params);
		this.noOfRecords = sqlSession.selectOne("writeGetCount");
		
		return writeList;
	}

	@Override
	public int writeGetCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("writeGetCount");
		
	}
	
	///////////////¾÷·Îµå

	@Override
	public List<ImageVo> noticeSubImage(int index) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("yes.noticeSubImage", index);
	}

	@Override
	public int noticeImgUpload(ImageVo bean) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.insert("yes.noticeImgUpload", bean);
	}
	

}
