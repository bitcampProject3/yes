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

import com.bit.yes.model.entity.NoticeVo;
import com.bit.yes.model.paging.Paging;
import com.bit.yes.service.NoticeService;

@Controller
public class NoticeBbsController {
	@Autowired
	NoticeService noticeService;

	public void setService(NoticeService service) {
		this.noticeService = service;
	}
	// 화면 출력
	@RequestMapping("/yesnotice/")
	public String list(Model model, HttpServletRequest req) throws Exception {
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NoticeVo> page = new ArrayList<NoticeVo>();
		page = (ArrayList<NoticeVo>) noticeService.writeList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(noticeService.writeGetCount());
		
		paging.makePaging();
		
		model.addAttribute("page", page);
		model.addAttribute("paging",paging);
		
		return "yesnotice";
	}
	
	@RequestMapping("/yesnotice/yesnoticeInsert")
	public String insertpage(Model model) throws SQLException {
		return "yesnoticeInsert";
	}
	
	@RequestMapping(value="/yesnotice/yesnoticeUpdate/{idx}",method=RequestMethod.GET)
	public String updatepage(@PathVariable int idx,Model model) throws SQLException {
		model.addAttribute("bean", noticeService.selectPage(idx));
		return "yesnoticeUpdate";
	}
	
	// 삽입 상세보기 삭제 수정
	
	@RequestMapping(value="/yesnotice/yesnoticeInsert",method=RequestMethod.POST)
	public String insert(NoticeVo noticevo, Model model) throws SQLException {
		noticeService.addPage(noticevo);
		return "redirect:/yesnotice/";
	}
	
	@RequestMapping(value="/yesnotice/{idx}",method=RequestMethod.GET )
	public String detail(@PathVariable int idx,Model model) throws SQLException {
		model.addAttribute("bean", noticeService.selectPage(idx));
		return "yesnoticeDetail";
	}
	
	@RequestMapping(value="/yesnotice/{idx}",method=RequestMethod.DELETE)
	public String delete(@PathVariable int idx) throws SQLException {
		noticeService.deletePage(idx);
		return "redirect:/yesnotice/";
	}
	
	@RequestMapping(value="/yesnotice/yesnoticeUpdate/{idx}",method=RequestMethod.POST )
	public String edit(@PathVariable int idx,@ModelAttribute NoticeVo bean) throws SQLException {
		bean.setIndex(idx);
		noticeService.updatePage(bean);
		System.out.println(bean);
		return "redirect:/yesnotice/";
	}


}
