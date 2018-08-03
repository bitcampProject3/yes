package com.bit.yes.model;

import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReviewVo;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface BranchDao {
    List<BranchVo> selectAll() throws SQLException;
    Integer insertBranch(BranchVo branchVo);
    List<BranchVo> menuLoad(String branchID);
    List<BranchVo> allMenuLoad(String branchID);
    List<BranchVo> searchResult(Map<String, Object> searchMap);

    String imageUpload(MultipartHttpServletRequest mtfRequest, String id);

    void insertBranchInfo(Map<String, String> map);

    void insertBranchAddress(Map<String, String> map);

    void insertBranchMenu(Map<String, Object> map);

    void insertImageNames(Map<String,String> imageMap);

    void updateLatLng(Map<String, Object> updateLatLng);

    List<BranchVo> reserveInfoPreview(String id);

    int waitingList(String id);

    void ticketingStart(String id, String clientId);
    int ticketingCheck(String id, String clientId);

	List<ReviewVo> branchReview(String branchId);

    List<BranchVo> myAllMenuLoad(String branchId);


//    void addBranch(BranchVo branchInfoVo);
}
