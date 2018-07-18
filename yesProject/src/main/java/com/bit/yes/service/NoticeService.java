package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.yes.model.NoticeDao;
import com.bit.yes.model.entity.NoticeVo;

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
	
	public void updatePage(NoticeVo bean) throws SQLException {
		noticeDao.updateOne(bean);
		System.out.println("service update"+bean);
	}
	
	// ∆‰¿Ã¬° √≥∏Æ
	public List<NoticeVo> writeList(int offset, int noOfRecords) throws SQLException {
		return noticeDao.writeList(offset, noOfRecords);
	}
	
	public int writeGetCount() throws Exception {
		return noticeDao.writeGetCount();
	}
	
}
