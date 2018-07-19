package com.bit.yes;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.S_CsVo;
import com.bit.yes.model.entity.UserVo;
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
	
	// ȭ�� ���
		@RequestMapping("/yesS_cs/")
		public String list(Model model, HttpServletRequest req) throws Exception {
			int currentPageNo = 1;
			int maxPost = 10;
			
			// �̰͵� �α����ؼ� ���� ������� id���� �־��ָ� id�� �ش��ϴ� �Խñ� ��ϸ� ���
			String writer = "ghdlf"; 

			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			ArrayList<S_CsVo> page = new ArrayList<S_CsVo>();
			page = (ArrayList<S_CsVo>) scsService.writeList(offset, paging.getMaxPost(), writer);
			paging.setNumberOfRecords(scsService.writeGetCount(writer));
			
			paging.makePaging();
			int i=0;
			String id = null;
			String ids[] = new String[page.size()];
			for(i=0; i<page.size(); i++) {
				id= page.get(i).getWriter();
				UserVo nickName = scsService.selectNick(id);
				ids[i] = nickName.getNickName();
			}
			model.addAttribute("userNick", ids);
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
			return "yesS_cs";
		}
		
		@RequestMapping(value="/yesS_cs/{idx}", method=RequestMethod.GET)
		public String detail(@PathVariable int idx,UserVo nickName, Model model) throws SQLException {
			
			String id=scsService.selectPage(idx).getWriter();
			nickName = scsService.selectNick(id);
			
			model.addAttribute("userInfo", nickName);
			model.addAttribute("bean", scsService.selectPage(idx));
			return "yesS_csDetail";
		}
		
		@RequestMapping("/yesS_cs/yesS_csInsert")
		public String insertpage(String id, UserVo nickName,Model model) throws SQLException {
			
			id="ghdlf2"; // �α��� �ؼ� ���� �ش� ���� ���̵� �Է� 
			
			nickName=scsService.selectNick(id);
			model.addAttribute("userInfo",nickName);
			model.addAttribute("clientID", id);
			return "yesS_csInsert";
		}
		
		@RequestMapping(value="/yesS_cs/yesS_csInsert",method=RequestMethod.POST)
		public String insert(S_CsVo csvo, Model model) throws SQLException {
			scsService.addPage(csvo);
			return "redirect:/yesS_cs/";
		}
}
