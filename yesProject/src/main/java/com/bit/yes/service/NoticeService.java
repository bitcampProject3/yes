package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.yes.model.NoticeDao;
import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.NoticeVo;
import com.bit.yes.model.entity.UserVo;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDao noticeDao;
	
	public void listPage(Model model) throws SQLException {
		model.addAttribute("alist", noticeDao.selectAll());
	}
	
	public NoticeVo selectPage(int idx) throws SQLException {
		return noticeDao.selcetOne(idx);
	}
	
	public void addPage(NoticeVo bean) throws SQLException {
		noticeDao.insertOne(bean);
	}
	
	public void deletePage(int index) throws SQLException {
		noticeDao.deleteOne(index);
		
	}
	
	public void updatedeletePage(int index) throws SQLException {
		noticeDao.updatedelete(index);
	}
	
	public void updateimgPage(ImageVo beans) throws SQLException {
		noticeDao.updateimg(beans);
	}
	
	public void updatePage(NoticeVo bean) throws SQLException {
		noticeDao.updateOne(bean);
	}
	
	// ����¡ ó��
	public List<NoticeVo> writeList(int offset, int noOfRecords) throws SQLException {
		return noticeDao.writeList(offset, noOfRecords);
	}
	
	public int writeGetCount() throws Exception {
		return noticeDao.writeGetCount();
	}
	
	// ���ε� ó��
	public void noticeImgUpload(ImageVo bean) throws SQLException {
		noticeDao.noticeImgUpload(bean);
	}

	public List<ImageVo> noticeSubImage(int index) throws SQLException {
		return noticeDao.noticeSubImage(index);
	}
	
	public UserVo user_selectOne(String id) throws SQLException {
		return noticeDao.user_selcetOne(id);
	}
	
}
