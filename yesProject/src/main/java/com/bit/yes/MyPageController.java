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
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.yes.model.UserDao;
import com.bit.yes.model.entity.UserVo;


@Controller
public class MyPageController {

	@Autowired
	SqlSession sqlSession;
	
	//������
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
			System.out.println("����"); 
			//���� ��� �Ƹ� Ʋ������!
			return "redirect:../myInfo.yes";
		}
	
	}
	
	public String reservation() {
		return "";
	}
	
	
	
	
}
