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
import com.bit.yes.model.entity.S_CsVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_addressVo;
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
		@RequestMapping("/counselAllc/")
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

			model.addAttribute("cpage", cpage);
			model.addAttribute("cpaging",cpaging);

			return "./counselAll/counselAllc";

		}
		
		@RequestMapping("/counselAlls/")
		public String listpages(Model model,HttpServletRequest req) throws Exception { 
			int currentPageNo = 1;
			int maxPost = 10;
			
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
				ids[i] = nickName.getNickname();
			}
			
			
			model.addAttribute("userNick", ids);
			model.addAttribute("spage", spage);
			model.addAttribute("spaging",spaging);
			
			return "./counselAll/counselAlls";

			
			
		}
		
		@RequestMapping("/counselAllc/client={idx}")
		public String detail(@PathVariable int idx, Model model) throws SQLException { 
			
			String id = (caService.cselectPage(idx)).getBranchID();
		
				if(id.equals("해당 없음")) {
					model.addAttribute("id",id);
					model.addAttribute("beans", caService.creserveOne(id)); //branch_info 값
					model.addAttribute("bean", caService.cselectPage(idx));
					model.addAttribute("subImages", caService.c_counselSubImage(idx));
				}else {
					branch_addressVo address = caService.c_selectAddress(id);
					String road = address.getRoadAddress();
					String jibun = address.getJibunAddress();
					String detailaddress = address.getDetailAddress();
					String zonecode = address.getZoneCode();
					model.addAttribute("road", road );
					model.addAttribute("jibun", jibun);
					model.addAttribute("detailaddress", detailaddress);
					model.addAttribute("zonecode", zonecode);
					model.addAttribute("id",id);
					model.addAttribute("beans", caService.creserveOne(id)); //branch_info 값
					model.addAttribute("bean", caService.cselectPage(idx));
					model.addAttribute("subImages", caService.c_counselSubImage(idx));			
				
				}
				
			return "./counselAll/counselAllcDetail";
		}

		
		@RequestMapping("/counselAlls/store={idx}")
		public String detail(@PathVariable int idx,UserVo nickName, Model model) throws SQLException {
			
			String id=caService.sselectPage(idx).getWriter();
			nickName = caService.sselectNick(id);
			
			model.addAttribute("userInfo", nickName);
			model.addAttribute("bean", caService.sselectPage(idx));
			model.addAttribute("subImages", caService.s_counselSubImage(idx));
			
			return "./counselAll/counselAllsDetail";
		}
		
		@RequestMapping(value="/counselAllc/client={idx}",method=RequestMethod.POST)
		public String insert(@PathVariable int idx, @ModelAttribute C_CsVo bean) throws SQLException {
			caService.cupdatePage(bean);
			return "redirect:/counselAllc/";
		}
		
		@RequestMapping(value="/counselAlls/store={idx}",method=RequestMethod.POST)
		public String insert(@PathVariable int idx, @ModelAttribute S_CsVo bean) throws SQLException {
			caService.supdatePage(bean);
			return "redirect:/counselAlls/";
		}
		
		
		@RequestMapping(value="/counselAllc/start={sDate}&end={eDate}",method=RequestMethod.GET)
		public String calendarSelect(@PathVariable String sDate, @PathVariable String eDate, Model model,HttpServletRequest req) throws Exception {
			int currentPageNo = 1;
			int maxPost = 10;

			if(req.getParameter("cpages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("cpages"));
			
			Paging cpaging = new Paging(currentPageNo, maxPost);
			
			int coffset = (cpaging.getCurrentPageNo() -1) * cpaging.getMaxPost();
			
			ArrayList<C_CsVo> cpage = new ArrayList<C_CsVo>();
			cpage = (ArrayList<C_CsVo>) caService.sacwriteList(coffset, cpaging.getMaxPost(), sDate, eDate);
			cpaging.setNumberOfRecords(caService.sacwriteGetCount(sDate, eDate));
			
			cpaging.makePaging();
			
			model.addAttribute("cpage", cpage);
			model.addAttribute("cpaging",cpaging);
			
			return "./counselAll/counselAllc";
		}
		
		@RequestMapping(value="/counselAlls/starts={sDate}&ends={eDate}",method=RequestMethod.GET)
		public String calendarSelects(@PathVariable String sDate, @PathVariable String eDate, Model model,HttpServletRequest req) throws Exception {
			int currentPageNo = 1;
			int maxPost = 10;
			
			// 사업자 상담 검색 시 나오는 것
			if(req.getParameter("spages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("spages"));
			
			Paging spaging = new Paging(currentPageNo, maxPost);
			
			int soffset = (spaging.getCurrentPageNo() -1) * spaging.getMaxPost();
			
			ArrayList<S_CsVo> spage = new ArrayList<S_CsVo>();
			spage = (ArrayList<S_CsVo>) caService.saswriteList(soffset, spaging.getMaxPost(), sDate, eDate);
			spaging.setNumberOfRecords(caService.saswriteGetCount(sDate, eDate));
			
			spaging.makePaging();
			
			int i=0;
			String id = null;
			String ids[] = new String[spage.size()];
			for(i=0; i<spage.size(); i++) {
				id= spage.get(i).getWriter();
				UserVo nickName = caService.sselectNick(id);
				ids[i] = nickName.getNickname();
			}
			
			model.addAttribute("userNick", ids);
			model.addAttribute("spage", spage);
			model.addAttribute("spaging",spaging);
			
			return "./counselAll/counselAlls";
		}


}
