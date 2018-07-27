package com.bit.yes;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.yes.model.UserDao;
import com.bit.yes.model.entity.UserVo;

@Controller
public class LoginController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/login.yes")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/findId.yes",method=RequestMethod.GET)
	public String findId() {
		return "findId";
	}
	
	
	@RequestMapping(value="/find",method=RequestMethod.POST)
	public String find(String name, String email,String birth, Model model) throws SQLException {
		String id=sqlSession.getMapper(UserDao.class).findId(name, email,birth);
		model.addAttribute("result", id);
		return "findId";
	}
	@RequestMapping(value="/findPw.yes",method=RequestMethod.GET)
	public String findPw() {
		return "findPw";
	}

	
	@RequestMapping(value="/find2",method=RequestMethod.POST)
	public String find2(String id,String name, String email,String birth, String answer,Model model) throws SQLException {
		String pw=sqlSession.getMapper(UserDao.class).findPw(id, name, birth, email, answer);
		if(pw!=null) {
			model.addAttribute("id", id);
			model.addAttribute("result", pw);
		}else {
			model.addAttribute("err","고객님의 정보를 확인해주세요");
		}
		return "findPw";
	}	
	
	@RequestMapping(value="/pwUpdate", method=RequestMethod.POST)
	public String pwUpdate(String id,String password,Model model) throws SQLException {
		sqlSession.getMapper(UserDao.class).updatePw(password,id);
		model.addAttribute("result", "수정완료");
		
		return "login";
	}
	
	//로그인
	@RequestMapping(value="/check",method=RequestMethod.POST)
	public String loginCheck(String id,String password,HttpSession session,Model model) throws SQLException {
		
		
		UserVo bean=sqlSession.getMapper(UserDao.class).loginCheck(id,password);

		if(bean!=null)
		{ //로그인 성공
			session.setAttribute("member", bean);
			return "redirect:/";
		}
		else
		{
			return "redirect:/login.yes";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/naverlogin", method = RequestMethod.POST)
	public String naverlogin(@RequestBody String email,HttpSession session,Model model) {
		session.setAttribute("member", email);
		return "redirect:/";
	}

	
	@ResponseBody
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	public String kakaologin(@RequestBody String name,HttpSession session,Model model) {
		//System.out.println(name);
		session.setAttribute("member", name);
		return "redirect:/";
	}	
	
	
}
