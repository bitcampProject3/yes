package com.bit.yes.model;

import com.bit.yes.model.entity.BranchVo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface BranchDao {
    List<BranchVo> selectAll() throws SQLException;
    Integer insertBranch(BranchVo branchVo);
    List<BranchVo> menuLoad(String branchID);

    List<BranchVo> searchResult(Map<String, Object> searchMap);

//    void updateLatLng(Map<String, Object> updateLatLng);


//    void addBranch(BranchVo branchInfoVo);
}
