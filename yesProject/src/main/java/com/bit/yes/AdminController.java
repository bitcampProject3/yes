package com.bit.yes;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.paging.Paging;
import com.bit.yes.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;

	public void setService(AdminService service) {
		this.adminService = service;
	}
		@RequestMapping("/admin/")
		public String adminpage() {
			
			return "./admin/admin";
		}
	
	// �� ó�� ���� �� ȸ�� ����Ʈ ������
	@RequestMapping("/admin/userAllList")
	public String userAllListpage(Model model, HttpServletRequest req) throws Exception {
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("allpages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("allpages"));
		
		Paging allpaging = new Paging(currentPageNo, maxPost);
		
		int alloffset = (allpaging.getCurrentPageNo() -1) * allpaging.getMaxPost();
		
		ArrayList<UserVo> allpage = new ArrayList<UserVo>();
		allpage = (ArrayList<UserVo>) adminService.allwriteList(alloffset, allpaging.getMaxPost());
		allpaging.setNumberOfRecords(adminService.allwriteGetCount());
		
		allpaging.makePaging();
		
		model.addAttribute("page", allpage);
		model.addAttribute("paging",allpaging);
		
		return "./admin/userAllList";
	}
	
	//��� ȸ�� ����Ʈ���� �ش� ȸ�� Ŭ���� Detail�� �̵� ������ �� POST 
	//���⼭ registNum�� ���ؼ� �������� ����(������)���� �Ǻ��ؼ� ���δٸ� ���� ����
	@RequestMapping(value="/admin/AllListDetail" ,method=RequestMethod.POST)
	public String userAllListDetailpage(String userID, Model model) throws Exception {
		
		String registNum = adminService.user_selectPage(userID).getRegistNum();
		if(registNum == null || registNum == "") {
			System.out.println("����");
			
			model.addAttribute("bean", adminService.user_selectPage(userID));
		}else if (registNum != null || registNum != "") {
			System.out.println("����");
			
			model.addAttribute("bean", adminService.user_selectPage(userID));
			model.addAttribute("branchinfo",adminService.user_branch_selectOne(userID));
			model.addAttribute("branchaddress", adminService.user_branch_selectOne_address(userID));
		}
		
		return "./admin/AllListDetail";
	}
	
	
	
	@RequestMapping("/admin/AllListDetail")
	public String AllListpage() {
		
		return "./admin/AllListDetail";
	}

}
