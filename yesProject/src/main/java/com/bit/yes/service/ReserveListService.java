package com.bit.yes.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.yes.model.ReserveListDao;
import com.bit.yes.model.entity.BranchVo;

@Service
public class ReserveListService {

	
	@Autowired
	ReserveListDao reserveDao;
	
	
	public void listPage(Model model,String id) throws SQLException{
		
		model.addAttribute("rlist",reserveDao.reserveList(id));
	}
	public BranchVo selectOne(String branchID) throws SQLException{
		
		return reserveDao.selectOne(branchID);
	}
}
