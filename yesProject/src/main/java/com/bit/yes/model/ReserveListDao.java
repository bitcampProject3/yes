package com.bit.yes.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;

public interface ReserveListDao {

	//�� ���� ��Ȳ ����Ʈ
	List<ReserveListVo> reserveList(String id) throws SQLException;
	BranchVo selectOne(String branchID) throws SQLException;
}
