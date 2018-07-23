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
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.paging.Paging;
import com.bit.yes.service.C_CsService;

@Controller
public class C_CsController {
	
	@Autowired
	C_CsService csService;
	
	public void setService(C_CsService service) {
		this.csService = service;
	}
	
	// 화면 출력
		@RequestMapping("/yesC_cs/")
		public String list(Model model, HttpServletRequest req) throws Exception {
			int currentPageNo = 1;
			int maxPost = 10;
			
			// 로그인하여 들어오는 로그인 아이디 값을 넣어주면 clientid에 해당하는 게시글만 보임
			String clientID = "ghdlf"; 

			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			ArrayList<C_CsVo> page = new ArrayList<C_CsVo>();
			page = (ArrayList<C_CsVo>) csService.writeList(offset, paging.getMaxPost(), clientID);
			paging.setNumberOfRecords(csService.writeGetCount(clientID));
			
			paging.makePaging();
			
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
			return "./clientCounsel/yesC_cs";
		}
		
		@RequestMapping(value="/yesC_cs/{idx}", method=RequestMethod.GET)
		public String detail(@PathVariable int idx, Model model) throws SQLException { 
			
			String id = (csService.selectPage(idx)).getBranchID();

				model.addAttribute("id",id);
			 	model.addAttribute("beans", csService.reserveOne(id));
				model.addAttribute("bean", csService.selectPage(idx));
			
			return "./clientCounsel/yesC_csDetail";
		}
		
		@RequestMapping("/yesC_cs/yesC_csInsert")
		public String insertpage(String id, UserVo nickName, Model model) throws SQLException {

			// 로그인할 경우 들어오는 id 값
			id="ghdlf"; 

			nickName=csService.selectNick(id);
			model.addAttribute("clientID", id);
			model.addAttribute("userInfo",nickName);
			
			model.addAttribute("bean", csService.reserveList(id));
			return "./clientCounsel/yesC_csInsert";
		}
		
		@RequestMapping(value="/yesC_cs/yesC_csInsert",method=RequestMethod.POST)
		public String insert(C_CsVo csvo, Model model) throws SQLException {
			csService.addPage(csvo);
			return "redirect:/yesC_cs/";
		}

}
