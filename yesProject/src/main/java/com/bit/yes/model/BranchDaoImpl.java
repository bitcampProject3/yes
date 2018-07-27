package com.bit.yes.model;

import com.bit.yes.model.entity.BranchVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BranchDaoImpl implements BranchDao{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<BranchVo> selectAll() throws SQLException {
        return sqlSession.selectList("branchList.selectAll");
    }

    @Override
    public Integer insertBranch(BranchVo branchVo) {
        return sqlSession.insert("branchList.insertBranchInfo", branchVo);
    }

    @Override
    public List<BranchVo> menuLoad(String branchID) {
        return sqlSession.selectList("branchList.menuLoad", branchID);
    }

    @Override
    public List<BranchVo> allMenuLoad(String branchID) {
        return sqlSession.selectList("branchList.allMenuLoad", branchID);
    }

    @Override
    public List<BranchVo> searchResult(Map<String, Object> searchMap) {
        return sqlSession.selectList("branchList.searchResult", searchMap);
    }

    @Override
    public String imageUpload(MultipartHttpServletRequest mtfRequest, String id) {
        List<MultipartFile> fileList = mtfRequest.getFiles("file");
        String src = mtfRequest.getParameter("src");
//        System.out.println("src value : " + src);

        // 파일을 담을 서버의 경로
        String path = "/Users/pro/yes/yesProject/src/main/webapp/resources/imgs/foodimgs/";
        int cnt = 0;
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

//            System.out.println("originFileName : " + originFileName);
//            System.out.println("fileSize : " + fileSize);
            cnt++;
            String safeFile = path + "food_" + id + "_" + cnt + ".jpg";
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return "redirect:/";
    }

    @Override
    public void insertBranchInfo(Map<String, String> map) {
        map.put("acceptState","false");

        sqlSession.insert("branchList.insertBranchInfo",map);

    }

    @Override
    public void insertBranchMenu(Map<String, Object> map) {

        System.out.println(map);
        Map<String, Object> insertMap;


        ArrayList menuArr = (ArrayList) map.get("menu");
        ArrayList priceArr = (ArrayList) map.get("price");
        ArrayList checkboxArr = (ArrayList) map.get("checkbox");

        for (int i = 0; i < menuArr.size(); i++) {
            insertMap = new HashMap<>();
//            System.out.println(map.get("menu"+(i+1)));
//            System.out.println(map.get("price"+(i+1)));
//            System.out.println(map.get("checkbox"+(i+1)));
            insertMap.put("id", map.get("id"));
            insertMap.put("menu",menuArr.get(i));
            insertMap.put("price",priceArr.get(i));
            insertMap.put("mainmenu",checkboxArr.get(i));
            sqlSession.insert("branchList.insertBranchMenu", insertMap);
//
        }
    }

    @Override
    public void insertImageNames(Map<String, String> imageMap) {
        sqlSession.insert("branchList.insertImageNames", imageMap);
    }

    @Override
    public void insertBranchAddress(Map<String, String> map) {
        sqlSession.insert("branchList.insertBranchAddress", map);
    }

    @Override
    public void updateLatLng(Map<String, Object> updateLatLng) {
        sqlSession.update("branchList.updateLatLng", updateLatLng);
    }

    @Override
    public List<BranchVo> reserveInfoPreview(String id) {
        return sqlSession.selectList("branchList.reserveInfoPreview", id);
    }


}
