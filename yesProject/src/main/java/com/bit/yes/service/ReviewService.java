package com.bit.yes.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.yes.model.ReviewDao;
import com.bit.yes.model.entity.ReviewVo;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDao reviewDao;
	
	public void listPage(Model model) throws SQLException {
		model.addAttribute("alist", reviewDao.reviewList());
	}
	
	public void reviewWrite(ReviewVo bean) throws SQLException {
		reviewDao.reviewWrite(bean);
	}
	
	
	public ReviewVo selectPage(int index) throws SQLException {
		
		return reviewDao.reviewSelect(index);
	}
	
	public ReviewVo reviewEditPage(int index) throws SQLException {
		
		return reviewDao.reviewSelect(index);
		
	}
	
	public int deleteOne(int index) throws SQLException {
		
		return reviewDao.reviewDelete(index);
	}
	
	public void editOne(ReviewVo bean) throws SQLException {
		
		reviewDao.reviewEdit(bean);
		
	}
}
