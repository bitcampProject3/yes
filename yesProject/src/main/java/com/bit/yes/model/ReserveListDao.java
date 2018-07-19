package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;

public interface ReserveListDao {

	//고객 예약 현황 리스트
	List<ReserveListVo> reserveList(String id) throws SQLException;
	BranchVo selectOne(String branchID) throws SQLException;
}
