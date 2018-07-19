package com.bit.yes;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.NoticeVo;
import com.bit.yes.model.entity.S_CsVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.paging.Paging;
import com.bit.yes.service.CounselAllService;


@Controller
public class CounselAllController {
	
	@Autowired
	CounselAllService caService;
	
	public void setService(CounselAllService service) {
		this.caService = service;
	}
	
	// 화면 출력
		@RequestMapping("/counselAll/")
		public String listpage(Model model,HttpServletRequest req) throws Exception { 
			int currentPageNo = 1;
			int maxPost = 10;
			
			if(req.getParameter("cpages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("cpages"));
			
			Paging cpaging = new Paging(currentPageNo, maxPost);
			
			int coffset = (cpaging.getCurrentPageNo() -1) * cpaging.getMaxPost();
			
			ArrayList<C_CsVo> cpage = new ArrayList<C_CsVo>();
			cpage = (ArrayList<C_CsVo>) caService.cwriteList(coffset, cpaging.getMaxPost());
			cpaging.setNumberOfRecords(caService.cwriteGetCount());
			
			cpaging.makePaging();
			
			if(req.getParameter("spages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("spages"));
			
			Paging spaging = new Paging(currentPageNo, maxPost);
			
			int soffset = (spaging.getCurrentPageNo() -1) * spaging.getMaxPost();
			
			ArrayList<S_CsVo> spage = new ArrayList<S_CsVo>();
			spage = (ArrayList<S_CsVo>) caService.swriteList(soffset, spaging.getMaxPost());
			spaging.setNumberOfRecords(caService.swriteGetCount());
			
			spaging.makePaging();
			
			int i=0;
			String id = null;
			String ids[] = new String[spage.size()];
			for(i=0; i<spage.size(); i++) {
				id= spage.get(i).getWriter();
				UserVo nickName = caService.sselectNick(id);
				ids[i] = nickName.getNickName();
			}
			
			
			model.addAttribute("userNick", ids);
			model.addAttribute("spage", spage);
			model.addAttribute("spaging",spaging);
			
			model.addAttribute("cpage", cpage);
			model.addAttribute("cpaging",cpaging);
			
			return "counselAll";

		
		}
		
		@RequestMapping("/counselAll/client={idx}")
		public String detail(@PathVariable int idx, Model model) throws SQLException { 
			
			String id = (caService.cselectPage(idx)).getBranchID();
				model.addAttribute("id",id);
			 	model.addAttribute("beans", caService.creserveOne(id));
				model.addAttribute("bean", caService.cselectPage(idx));
				
			return "counselAllcDetail";
		}

		
		@RequestMapping("/counselAll/store={idx}")
		public String detail(@PathVariable int idx,UserVo nickName, Model model) throws SQLException {
			
			String id=caService.sselectPage(idx).getWriter();
			nickName = caService.sselectNick(id);
			
			model.addAttribute("userInfo", nickName);
			model.addAttribute("bean", caService.sselectPage(idx));
			return "counselAllsDetail";
		}
		
		@RequestMapping(value="/counselAll/client={idx}",method=RequestMethod.POST)
		public String insert(@PathVariable int idx, @ModelAttribute C_CsVo bean) throws SQLException {
			caService.cupdatePage(bean);
			return "redirect:/counselAll/";
		}
		
		@RequestMapping(value="/counselAll/store={idx}",method=RequestMethod.POST)
		public String insert(@PathVariable int idx, @ModelAttribute S_CsVo bean) throws SQLException {
			caService.supdatePage(bean);
			return "redirect:/counselAll/";
		}


}
