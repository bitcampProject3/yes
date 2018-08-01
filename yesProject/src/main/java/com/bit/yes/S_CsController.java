package com.bit.yes;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.yes.model.entity.C_CsVo;
import com.bit.yes.model.entity.ImageVo;
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
	
	// 화면 출력
		@RequestMapping("/yesS_cs/")
		public String list(Model model, HttpServletRequest req) throws Exception {
			int currentPageNo = 1;
			int maxPost = 10;
			
			// 로그인 했을 경우 들어오는 세션 id값 
			// id값을 통해서 해당 id에 해당하는 게시판 글 출력
			// admin이 관리자이여야함
			String writer = "ghdlf2"; 

			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			params.put("offset", offset);
			params.put("noOfRecords", paging.getMaxPost());
			params.put("writer", writer);
			
			ArrayList<S_CsVo> page = new ArrayList<S_CsVo>();
			page = (ArrayList<S_CsVo>) scsService.writeList(params);
			paging.setNumberOfRecords(scsService.writeGetCount(params));
			
			paging.makePaging();
			int i=0;
			String id = "";
			String ids[] = new String[page.size()];
			for(i=0; i<page.size(); i++) {
				id= page.get(i).getWriter();
				UserVo nickName = scsService.selectNick(id);
				ids[i] = nickName.getNickname();
			}
			model.addAttribute("userNick", ids);
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
			return "./branchCounsel/yesS_cs";
		}
		
		@RequestMapping(value="/S_Cs_search")
		public String S_CsSearchList(Model model, HttpServletRequest request) throws Exception {
			
			System.out.println("S_CsSearchList(post)");
			
			HttpSession session = request.getSession();
			HashMap<String, Object> params = new HashMap<String, Object>();

			// 로그인 했을 경우 들어오는 세션 id값 
			// id값을 통해서 해당 id에 해당하는 게시판 글 출력
			// admin이 관리자이여야함
			String writer = "ghdlf2"; 
			int currentPageNo = 1;
			int maxPost = 10;
			
			String category = request.getParameter("category");
			String keyword = request.getParameter("keyword");
			
			
			if(request.getParameter("pages") != null) {
				System.out.println("pages is null");
				currentPageNo = Integer.parseInt(request.getParameter("pages"));
			}
			
			if(category == null && keyword == null) {
				category = (String) session.getAttribute("category");
				keyword = (String) session.getAttribute("keyword");
			} else {
				/*req.setAttribute("category", category);
				req.setAttribute("keyword", keyword);*/
				session.setAttribute("category", category);
				session.setAttribute("keyword", keyword);
			}
			
			System.out.println("current page(post) : " + currentPageNo);
			Paging paging = new Paging(currentPageNo, maxPost);
			
			
			ArrayList<S_CsVo> page = new ArrayList<S_CsVo>();
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			params.put("offset", offset);
			params.put("noOfRecords", paging.getMaxPost());
			params.put("keyword", keyword);
			params.put("category", category);
			params.put("writer", writer);
			
			page = (ArrayList<S_CsVo>) scsService.writeList(params);
			paging.setNumberOfRecords(scsService.writeGetCount(params));
			
			paging.makePaging();
			int i=0;
			String id = "";
			String ids[] = new String[page.size()];
			for(i=0; i<page.size(); i++) {
				id= page.get(i).getWriter();
				UserVo nickName = scsService.selectNick(id);
				ids[i] = nickName.getNickname();
			}
			
			System.out.println("category : " + category);
			System.out.println("keyword : " + keyword);
			
			model.addAttribute("userNick",ids);
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
			return "./branchCounsel/yesS_cs";
		}
		
		@RequestMapping(value="/yesS_cs/{idx}", method=RequestMethod.GET)
		public String detail(@PathVariable int idx,UserVo nickName, Model model) throws SQLException {
			
			String id=scsService.selectPage(idx).getWriter();
			nickName = scsService.selectNick(id);
			
			model.addAttribute("userInfo", nickName);
			model.addAttribute("bean", scsService.selectPage(idx));
			model.addAttribute("subImages", scsService.s_counselSubImage(idx));
			
			return "./branchCounsel/yesS_csDetail";
		}
		
		@RequestMapping("/yesS_cs/yesS_csInsert")
		public String insertpage(String id, UserVo nickName,Model model) throws SQLException {
			
			// 로그인 했을 경우 들어오는 세션 id값 
			// id값을 통해서 해당 id에 해당하는 게시판 글 출력
			// admin이 관리자이여야함
			id="ghdlf2"; 
			
			nickName=scsService.selectNick(id);
			model.addAttribute("userInfo",nickName);
			model.addAttribute("clientID", id);
			return "./branchCounsel/yesS_csInsert";
		}
		
		@RequestMapping(value="/yesS_cs/yesS_csInsert",method=RequestMethod.POST)
		public String insert(S_CsVo csvo, MultipartHttpServletRequest mtfrequest, Model model) throws SQLException {
			scsService.addPage(csvo);
			
			String genId, fileName, path;
			ImageVo imageBean = new ImageVo();
			java.util.List<MultipartFile> subFiles = mtfrequest.getFiles("subImages");
			genId = UUID.randomUUID().toString();
			String attach_path = "resources/s_counsel_imgs/";
			String root_path=mtfrequest.getSession().getServletContext().getRealPath("/");
			path = root_path + attach_path;
			
			try {
				for(MultipartFile subFile : subFiles) {
					String originalFileName = subFile.getOriginalFilename();
					if(originalFileName == "") {
						fileName = "0" + originalFileName;
						System.out.println(fileName);
						imageBean.setImageName(fileName);
						scsService.s_counselImgUpload(imageBean);
					}else {
						fileName = genId + originalFileName;
						genId = UUID.randomUUID().toString();
						imageBean.setImageName(fileName);
						subFile.transferTo(new File(path + fileName));
						scsService.s_counselImgUpload(imageBean);
					}
					
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:/yesS_cs/";
		}

}