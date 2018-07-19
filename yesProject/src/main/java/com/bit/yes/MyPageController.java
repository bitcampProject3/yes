package com.bit.yes;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.yes.model.UserDao;
import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.service.ReserveListService;


@Controller
public class MyPageController {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	ReserveListService service;
	
	
	
	public void setService(ReserveListService service) {
		this.service = service;
	}
	
	
	//내정보------------------
	@RequestMapping("/myInfo.yes")
	public String myInfo(HttpSession session,Model model) throws SQLException {
		UserVo user=(UserVo) session.getAttribute("member");
		UserVo bean=sqlSession.getMapper(UserDao.class).login(user.getId());
		model.addAttribute("user", bean);
		return "mypage/myInfo";
	}
	
	@RequestMapping(value="mypageUpdate",method=RequestMethod.POST)
	public String update(HttpSession session,@ModelAttribute UserVo bean,Model model) throws SQLException {
		
		int result=sqlSession.getMapper(UserDao.class).updateInfo(bean);
		UserVo user=sqlSession.getMapper(UserDao.class).login(bean.getId());
    	if(result>0)
		{
			model.addAttribute("user", user);
			return "mypage/myInfo";
		}
		else
		{
			System.out.println("실패"); 
			//실패 경로 아마 틀릴거임!
			return "redirect:../myInfo.yes";
		}
	
	}
	//------------예약 현황-----------
	@RequestMapping("/reservation.yes")
	public String reservation(HttpSession session,Model model) throws SQLException {
		String id=((UserVo)session.getAttribute("member")).getId();
		service.listPage(model,id);
		return "mypage/myReserve";
	}

	//----------예약한 가게의 정보 불러오기----------
	@ResponseBody
	@RequestMapping(value="/branchInfo",method=RequestMethod.POST)
	public BranchVo reservation2(String id,Model model) throws SQLException {
		BranchVo bean=service.selectOne(id);
		return bean;
	}
	
	
	
	
}
