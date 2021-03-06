package com.bit.yes.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.yes.model.ReserveListDao;
import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;
import com.bit.yes.model.entity.ReviewVo;

@Service
public class ReserveListService {

   @Autowired
   ReserveListDao reserveDao;


   public List<ReserveListVo> listPage(Model model,String id) throws SQLException{
      List<ReserveListVo> list=reserveDao.reserveList(id);
      model.addAttribute("rlist",reserveDao.reserveList(id));
      return list;
   }
   public BranchVo selectOne(String branchID) throws SQLException{
      return reserveDao.selectOne(branchID);
   }
   public void deleteOne(ReserveListVo bean) throws SQLException{
      reserveDao.deleteOne(bean);
   }
   public List<ReserveListVo> reserveAll(Model model, String id) throws SQLException {
      List<ReserveListVo> list=reserveDao.b_reserveList(id);
      model.addAttribute("alist",reserveDao.b_reserveList(id));
      System.out.println(list);
      return list;
   }
   public BranchVo selectBranch(String id) {
      return reserveDao.selectBranch(id);
   }
   public void updateState(BranchVo bean) {
      reserveDao.updateState(bean);
   }
   public int loadTicket(String id) {
      return reserveDao.countTicket(id);
   }
   public void updateWaiting(BranchVo bean) {
      reserveDao.updateWaiting(bean);
   }
   public void deleteTicket(int entry) {
      reserveDao.deleteTicket(entry);
   }
   public void end(String id) {
      reserveDao.end(id);
   }
   public int getNum(String id) {
      return reserveDao.getNum(id);
   }
   public int getState(String id) {
      return reserveDao.getState(id);
   }

	public List<ReserveListVo> reserveDatePreview(Map<String,Object> map) {
       return reserveDao.reserveDatePreview(map);
    }

    public void insertReserve(Map<String, Object> map, String id){
      reserveDao.insertReserve(map, id);
    }
	public int updateUseState(ReserveListVo bean) {
		return reserveDao.updateUseState(bean);
	}
	public List<ReviewVo> writeList(Model model, String id) throws SQLException {
	      List<ReviewVo> list=reserveDao.writeList(id);
	      model.addAttribute("rlist",reserveDao.writeList(id));
	      return list;
	}
	public List<ReviewVo> selectAll(Model model, String id) throws SQLException {
		List<ReviewVo>	list=reserveDao.selectAll(id);
		model.addAttribute("page",reserveDao.selectAll(id));
		System.out.println(list);
		return list;
	}


    // 자신의 매장 조회
	public List<BranchVo> selectOneBranch(String id) {
      return reserveDao.selectOneBranch(id);
	}
	public int deleteReview(String idx) throws NumberFormatException, SQLException {
		return reserveDao.deleteReview(Integer.parseInt(idx));
	}
}
