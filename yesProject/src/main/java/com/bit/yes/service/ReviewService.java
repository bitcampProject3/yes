package com.bit.yes.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.yes.model.ReviewDao;
import com.bit.yes.model.entity.CommentVo;
import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.LikeVo;
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
	public void listPageImage(Model model, HashMap<String, Object> params) throws SQLException {
		model.addAttribute("imageList", reviewDao.reviewListImage(params));
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
	
	public void reviewAddComment(CommentVo bean) throws SQLException {
		reviewDao.reviewAddComment(bean);
	}
	
	public ArrayList<CommentVo> reviewCommentList(int review_idx) throws SQLException {
		return (ArrayList<CommentVo>) reviewDao.reiviewCommentList(review_idx); 
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
	
	public int deleteFile(int index) throws SQLException {
		return reviewDao.reviewDeleteFile(index);
	}
	
	public int deleteComment(CommentVo bean) throws SQLException {
		return reviewDao.reviewDeleteComment(bean);
	}
	
	public void editOne(ReviewVo bean) throws SQLException {
		
		reviewDao.reviewEdit(bean);
		
	}
	
	public void reviewClickLike(LikeVo bean) throws SQLException {
		
		reviewDao.reviewClickLike(bean);
		
	}
	
	public int reviewCountLike(LikeVo bean) throws SQLException {
		return reviewDao.reviewCountLike(bean);
	}
	
	public LikeVo reviewCheckLike(LikeVo bean) throws SQLException {
		return reviewDao.reviewCheckLike(bean);
	}
	
//	public void reviewChangeLike(LikeVo bean) throws SQLException {
//		reviewDao.reviewChangeLike(bean);
//	}
	
	public void reviewChangeLike(HashMap<String, Object> params) throws SQLException {
		reviewDao.reviewChangeLike(params);
	}
	
//	public LikeVo reviewIsExistLike(LikeVo bean) throws SQLException {
//		return reviewDao.reviewIsExistLike(bean);
//	}
	
	public void reviewNewLike(LikeVo bean) throws SQLException {
		reviewDao.reviewNewLike(bean);
	}
	
	public int reviewDeleteLike(LikeVo bean) throws SQLException {
		return reviewDao.reviewDeleteLike(bean);
	}
	
	
//	--------------------paging
	
	// ��ü ����Ʈ
/*	public List<ReviewVo> writeList(int offset, int noOfRecords) throws SQLException {
		return reviewDao.writeList(offset, noOfRecords);
	}*/
	public List<ReviewVo> writeList(HashMap<String, Object> params) throws SQLException {
		return reviewDao.writeList(params);
	}
	
	// �˻� ����Ʈ
//	public List<ReviewVo> writeList(int offset, int noOfRecords, String category, String keyword) throws SQLException {
//		return reviewDao.writeList(offset, noOfRecords, category, keyword);
//	}
	
	public int writeGetCount() throws Exception {
		return reviewDao.writeGetCount();
	}
	public int writeGetCount(HashMap<String, Object> params) throws Exception {
		return reviewDao.writeGetCount(params);
	}


	public int editComment(CommentVo commentVo) {
		return reviewDao.reviewEditComment(commentVo);
	}

	public int loadReviewScoreAvg(String branchId) {
		return reviewDao.loadReviewScoreAvg(branchId);
	}
}
