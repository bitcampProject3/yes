package com.bit.yes.service;

import com.bit.yes.model.BranchDao;
import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReviewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Service
public class BranchService {

	@Autowired
	BranchDao branchDao;

	public void insertBranchInfo(Map<String,String> map) {
		branchDao.insertBranchInfo(map);
	}

	public void insertBranchAddress(Map<String,String> map) {
		branchDao.insertBranchAddress(map);
	}

	public void insertBranchMenu(Map<String,Object> map) {
		branchDao.insertBranchMenu(map);
	}

	public void insertImageNames(Map<String,String> imageMap) {
		branchDao.insertImageNames(imageMap);
	}

	public List<BranchVo> selectAll() throws SQLException {
		return branchDao.selectAll();
	}

	public List<BranchVo> menuLoad(String id) {
		return branchDao.menuLoad(id);
	}

	public List<BranchVo> allMenuLoad(String id) {
		return branchDao.allMenuLoad(id);
	}

	public List<BranchVo> searchResult(Map<String,Object> searchMap) {
		return branchDao.searchResult(searchMap);
	}

	public String imageUpload(MultipartHttpServletRequest mtfRequest, String id) {
		return branchDao.imageUpload(mtfRequest, id);
	}

	public List<BranchVo> reserveInfoPreview(String id) {
		return branchDao.reserveInfoPreview(id);
	}

	public void updateLatLng(Map<String,Object> updateLatLng) {
		branchDao.updateLatLng(updateLatLng);
	}

	public int waitingList(String id) {
		return branchDao.waitingList(id);
	}

	public void ticketingStart(String id, String clientId) {
		branchDao.ticketingStart(id, clientId);
	}

	public int ticketingCheck(String id, String clientId){
		return branchDao.ticketingCheck(id, clientId);
	}

	public List<ReviewVo> branchReview(String branchId) {
		return branchDao.branchReview(branchId);
	}

	public List<BranchVo> myAllMenuLoad(String branchId) {
		return branchDao.myAllMenuLoad(branchId);
	}
}
