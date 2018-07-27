package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;

@Repository
public class ReserveListDaoImpl implements ReserveListDao {

   @Autowired
   SqlSession sqlSession;

   @Override
   public List<ReserveListVo> reserveList(String id) throws SQLException {
      return sqlSession.selectList("reserveList.c_reserveList",id);
   }

   @Override
   public BranchVo selectOne(String branchID) throws SQLException {
      return sqlSession.selectOne("reserveList.branchInfo", branchID);
   }

   @Override
   public void deleteOne(ReserveListVo bean) throws SQLException {
      sqlSession.delete("reserveList.deleteReserve", bean);
   }

   //사업자 예약 현황 리스트 가져오기
   @Override
   public List<ReserveListVo> b_reserveList(String id) throws SQLException {
      return sqlSession.selectList("reserveList.b_reserveList", id);
   }

   @Override
   public BranchVo selectBranch(String id) {
      return sqlSession.selectOne("reserveList.selectBranch",id);
   }

   @Override
   public void updateState(BranchVo bean) {
      sqlSession.update("reserveList.updateState",bean);
   }

   @Override
   public int countTicket(String id) {
      return sqlSession.selectOne("reserveList.countTicket", id);
   }

   @Override
   public void updateWaiting(BranchVo bean) {
      sqlSession.update("reserveList.updateWaiting",bean);
   }
   @Override
   public int deleteTicket(int entry) {
      return sqlSession.delete("reserveList.deleteTicket",entry);
   }
   @Override
   public void end(String id) {
      sqlSession.delete("reserveList.end",id);
   }
   @Override
   public int getNum(String id) {
      if(sqlSession.selectOne("reserveList.getNum",id)!=null)
         return sqlSession.selectOne("reserveList.getNum",id);
      return 0;
   }

   @Override
   public int getState(String id) {
      return sqlSession.selectOne("reserveList.getState", id);
   }

   @Override
   public List<ReserveListVo> reserveDatePreview(Map<String, Object> map) {
      return sqlSession.selectList("reserveList.reserveDatePreview", map);

   }
}
