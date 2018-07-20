package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.yes.model.ReviewDao;
import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.ReviewVo;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDao reviewDao;
	
	public void listPage(Model model) throws SQLException {
		model.addAttribute("alist", reviewDao.reviewList());
	}
	
	public void listPageImage(Model model) throws SQLException {
		model.addAttribute("imageList", reviewDao.reviewListImage());
	}
	
//	public void reviewMainImage(Model model, int index) throws SQLException {
//		model.addAttribute("MainImage", reviewDao.reviewMainImage(index));
//	}
//	
//	public void reviewSubImage(Model model, int index) throws SQLException {
//		model.addAttribute("subImageList", reviewDao.reviewSubImage(index));
//	}

	
	public void reviewWrite(ReviewVo bean) throws SQLException {
		reviewDao.reviewWrite(bean);
	}
	
	public void reviewImgUpload(ImageVo bean) throws SQLException {
		
		reviewDao.reviewImgUpload(bean);
		
	}
	
	
	public ReviewVo selectPage(int index) throws SQLException {
		
		return reviewDao.reviewSelect(index);
	}
	
	public ImageVo reviewMainImage(int index) throws SQLException {
		return reviewDao.reviewMainImage(index);
	}
	
	public List<ImageVo> reviewSubImage(int index) throws SQLException {
		return reviewDao.reviewSubImage(index);
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
	
	
//	--------------------paging
	
	public List<ReviewVo> writeList(int offset, int noOfRecords) throws SQLException {
		return reviewDao.writeList(offset, noOfRecords);
	}
	
	public int writeGetCount() throws Exception {
		return reviewDao.writeGetCount();
	}
	
	
}
