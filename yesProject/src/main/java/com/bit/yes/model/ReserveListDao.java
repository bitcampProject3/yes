package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;

public interface ReserveListDao {
   //고객 예약 현황 리스트
   public List<ReserveListVo> reserveList(String id) throws SQLException;
   public BranchVo selectOne(String branchID) throws SQLException;
   public void deleteOne(ReserveListVo bean) throws SQLException;
   public List<ReserveListVo> b_reserveList(String id) throws SQLException;
   public BranchVo selectBranch(String id);
   public void updateState(BranchVo bean);
   public int countTicket(String id);
   public void updateWaiting(BranchVo bean);
   public int deleteTicket(int entry);
   public void end(String id);
   public int getNum(String id);
   public int getState(String id);

	public List<ReserveListVo> reserveDatePreview(Map<String,Object> map);
}
