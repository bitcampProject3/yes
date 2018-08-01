package com.bit.yes;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.yes.model.UserDao;
import com.bit.yes.model.entity.UserVo;


@Controller
public class JoinController {


	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping("/join.yes")
	public String join() {
		return "join";
	}
	
	
	@RequestMapping("/branchJoin.yes")
	public String branchJoin() throws SQLException {

		return "branchJoin";
	}
	
	@RequestMapping("/customerJoin.yes")
	public String customerJoin() {
		return "customerJoin";
	}
	
	
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(@ModelAttribute  UserVo bean,Model model,ServletRequest req) throws SQLException, UnsupportedEncodingException{
		req.setCharacterEncoding("UTF-8");
		sqlSession.getMapper(UserDao.class).insertOne(bean);
		return "redirect:/";
		
		
	}
	
	@ResponseBody
    @RequestMapping(value = "/test/remote", method = RequestMethod.POST)
    public  String remoteTest(String id,Model model,HttpServletRequest req) throws SQLException, IOException {
    	
    	//String ref=req.getHeader("Referer").substring(26);
    	UserVo user=sqlSession.getMapper(UserDao.class).login(id);
    	
    	if(user!=null) {
    		return "false";	
    	}
    	else {
    		return "true";
    	}
                        
    }
	

	
	
}
