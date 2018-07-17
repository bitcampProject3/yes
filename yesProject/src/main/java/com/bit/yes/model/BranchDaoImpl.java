package com.bit.yes.model;

import com.bit.yes.model.entity.BranchVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class BranchDaoImpl implements BranchDao{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<BranchVo> selectAll() throws SQLException {
        return sqlSession.getMapper(BranchDao.class).selectAll();
    }



    @Override
    public Integer insertBranch(BranchVo branchVo) {
        return sqlSession.getMapper(BranchDao.class).insertBranch(branchVo);
    }

    @Override
    public List<BranchVo> menuLoad(String branchID) {
        return sqlSession.getMapper(BranchDao.class).menuLoad(branchID);
    }

    @Override
    public List<BranchVo> searchResult(Map<String, Object> searchMap) {
        return sqlSession.getMapper(BranchDao.class).searchResult(searchMap);
    }

//    @Override
//    public void updateLatLng(Map<String, Object> updateLatLng) {
//        sqlSession.getMapper(BranchDao.class).updateLatLng(updateLatLng);
//    }
}
