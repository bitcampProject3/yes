package com.bit.yes;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.yes.model.entity.ReviewVo;
import com.bit.yes.service.ReviewService;

@Controller
public class ReviewListController {
	
	@Autowired
	ReviewService service;

	public void setService(ReviewService service) {
		this.service = service;
	}



	@RequestMapping(value="/review_list")
	public String reviewList(Model model) throws SQLException {
		
		service.listPage(model);
		
		return "review_list"; // jsp파일명
		
	}
	
	@RequestMapping(value="/review_edit/{index}", method=RequestMethod.GET)
	public String reviewEditPage(@PathVariable int index, Model model) throws SQLException {
		
		ReviewVo vo = service.selectPage(index);
		
		System.out.println("controller rating : " + vo.getRating());
		System.out.println("controller content : " + vo.getContent());
		
		model.addAttribute("bean", service.selectPage(index));
		
		return "review_edit";
		
	}
	
	@RequestMapping(value="/review_edit/{index}", method=RequestMethod.POST)
	public String reviewEdit(@PathVariable int index, ReviewVo bean, Model model) throws SQLException {
		
		bean.setIdx(index);
		service.editOne(bean);
		return "redirect:../review_list";
	}
	
	@RequestMapping(value="/review_write")
	public String reviewWritePage(Model model) {
		
		return "review_write";
		
	}
	
	@RequestMapping(value="/review_write", method=RequestMethod.POST)
	public String reviewWrite(ReviewVo bean) throws SQLException {
		
		System.out.println("write(POST)");
		service.reviewWrite(bean);
		
		return "redirect:/review_list";
	}
	
	@RequestMapping(value="/review_list/{index}", method=RequestMethod.GET)
	public String reviewDetail(@PathVariable int index, Model model) throws SQLException {
		
		model.addAttribute("bean", service.selectPage(index));
		
		return "review_detail"; // jsp파일명
		
	}
	
	@RequestMapping(value="/review_list/{index}", method=RequestMethod.POST)
	public String reviewDelete(@PathVariable int index) throws SQLException {
		
		service.deleteOne(index);
		
		return "redirect:/review_list";
	}

	
/*	@RequestMapping("/review_list.yes")
	public String reviewList() {
		
		return "review_list";
		
	}*/
	


	/*public void listAll(Model model) {
		model.addAttribute("alist", sqlSession.getMapper(type));
	}*/
}