package com.bit.yes;

import java.util.List;
import java.util.Locale;

import com.bit.yes.model.BranchDao;
import com.bit.yes.model.entity.BranchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

	@Autowired
	private BranchDao branchDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		List<BranchVo> articleList = branchDao.selectAll();
		model.addAttribute("alist", articleList);
		return "main";
	}



}
