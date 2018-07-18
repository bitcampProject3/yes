package com.bit.yes;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.S_CsVo;
import com.bit.yes.model.paging.Paging;
import com.bit.yes.service.C_CsService;
import com.bit.yes.service.S_CsService;

@Controller
public class S_CsController {
	@Autowired
	S_CsService scsService;
	
	public void setService(S_CsService service) {
		this.scsService = service;
	}
	
	// 화면 출력
		@RequestMapping("/yesS_cs/")
		public String list(Model model, HttpServletRequest req) throws Exception {
			int currentPageNo = 1;
			int maxPost = 10;
			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			ArrayList<S_CsVo> page = new ArrayList<S_CsVo>();
			page = (ArrayList<S_CsVo>) scsService.writeList(offset, paging.getMaxPost());
			paging.setNumberOfRecords(scsService.writeGetCount());
			
			paging.makePaging();
			
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
			return "yesS_cs";
		}
		
		@RequestMapping(value="/yesS_cs/{idx}", method=RequestMethod.GET)
		public String detail(@PathVariable int idx,Model model) throws SQLException {
			model.addAttribute("bean", scsService.selectPage(idx));
			return "yesS_csDetail";
		}
		
		@RequestMapping("/yesS_cs/yesS_csInsert")
		public String insertpage(Model model) throws SQLException {
			return "yesS_csInsert";
		}
		
		@RequestMapping(value="/yesS_cs/yesS_csInsert",method=RequestMethod.POST)
		public String insert(S_CsVo csvo, Model model) throws SQLException {
			scsService.addPage(csvo);
			System.out.println(csvo);
			return "redirect:/yesS_cs/";
		}
}
