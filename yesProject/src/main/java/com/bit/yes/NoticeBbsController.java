package com.bit.yes;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.yes.model.entity.ImageVo;
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
		
		// 로그인 했을 경우 들어오는 세션 id값 
		// id값을 통해서 registNum값을 뽑아서 공지사항,고객상담,가맹점상담중 출력할 것을 결정
		// admin이 관리자이여야함
		String id = "ghdlf22";
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NoticeVo> page = new ArrayList<NoticeVo>();
		page = (ArrayList<NoticeVo>) noticeService.writeList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(noticeService.writeGetCount());
		
		paging.makePaging();
		
		if(id == "admin") {
			model.addAttribute("id",id);
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
		}else{
			String registNum = noticeService.user_selectOne(id).getRegistNum();
			model.addAttribute("registNum",registNum);
			model.addAttribute("id",id);
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
		}
		
		return "./notice/yesnotice";
	}
	
	@RequestMapping("/yesnotice/yesnoticeInsert")
	public String insertpage(Model model) throws SQLException {
		
		// 로그인 했을 경우 들어오는 세션 id값 
		// id값을 통해서 registNum값을 뽑아서 공지사항,고객상담,가맹점상담중 출력할 것을 결정
		// admin이 관리자이여야함
		String id = "ghdlf22";
		
		String registNum = noticeService.user_selectOne(id).getRegistNum();
		model.addAttribute("registNum",registNum);
		model.addAttribute("id",id);
		return "./notice/yesnoticeInsert";
	}
	
	@RequestMapping(value="/yesnotice/yesnoticeUpdate/{idx}",method=RequestMethod.GET)
	public String updatepage(@PathVariable int idx,Model model) throws SQLException {
		
		// 로그인 했을 경우 들어오는 세션 id값 
		// id값을 통해서 registNum값을 뽑아서 공지사항,고객상담,가맹점상담중 출력할 것을 결정
		// admin이 관리자이여야함
		String id = "ghdlf22";
				
		String registNum = noticeService.user_selectOne(id).getRegistNum();
		model.addAttribute("registNum",registNum);
		model.addAttribute("id",id);
		model.addAttribute("bean", noticeService.selectPage(idx));
		return "./notice/yesnoticeUpdate";
	}
	
	// 삽입 상세보기 삭제 수정
	// 삽입
	@RequestMapping(value="/yesnotice/yesnoticeInsert",method=RequestMethod.POST)
	public String insert(NoticeVo noticevo,MultipartHttpServletRequest mtfrequest, Model model) throws SQLException {

		noticeService.addPage(noticevo);
		
		String genId, fileName, path;
		ImageVo imageBean = new ImageVo();
		java.util.List<MultipartFile> subFiles = mtfrequest.getFiles("subImages");
		genId = UUID.randomUUID().toString();
		String attach_path = "resources/notice_imgs/";
		String root_path=mtfrequest.getSession().getServletContext().getRealPath("/");
		path = root_path + attach_path;
		
		try {
			for(MultipartFile subFile : subFiles) {
				String originalFileName = subFile.getOriginalFilename();
				if(originalFileName == "") {
					fileName = "0" + originalFileName;
					System.out.println(fileName);
					imageBean.setImageName(fileName);
					noticeService.noticeImgUpload(imageBean);
				}else {
					fileName = genId + originalFileName;
					genId = UUID.randomUUID().toString();
					imageBean.setImageName(fileName);
					subFile.transferTo(new File(path + fileName));
					noticeService.noticeImgUpload(imageBean);
				}
				
			}
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/yesnotice/";
	}

	
	// 상세보기
	@RequestMapping(value="/yesnotice/{idx}",method=RequestMethod.GET )
	public String detail(@PathVariable int idx,Model model) throws SQLException {
		
		// 로그인 했을 경우 들어오는 세션 id값 
		// id값을 통해서 registNum값을 뽑아서 공지사항,고객상담,가맹점상담중 출력할 것을 결정
		// admin이 관리자이여야함
		String id = "ghdlf22";
		
		String registNum = noticeService.user_selectOne(id).getRegistNum();
		model.addAttribute("registNum",registNum);
		model.addAttribute("id", id);
		model.addAttribute("bean", noticeService.selectPage(idx));
		model.addAttribute("subImages", noticeService.noticeSubImage(idx));
		
		return "./notice/yesnoticeDetail";
	}
	// 삭제
	@RequestMapping(value="/yesnotice/{idx}",method=RequestMethod.DELETE)
	public String delete(@PathVariable int idx) throws SQLException {
		noticeService.deletePage(idx);
		return "redirect:/yesnotice/";
	}
	// 수정
	@RequestMapping(value="/yesnotice/yesnoticeUpdate/{idx}",method=RequestMethod.POST )
	public String edit(@ModelAttribute NoticeVo bean,@PathVariable int idx,MultipartHttpServletRequest mtfrequest) throws SQLException {
		bean.setIndex(idx);
		noticeService.updatedeletePage(idx);
		noticeService.updatePage(bean);
		
		String genId, fileName, path;
		ImageVo imageBean = new ImageVo();
		java.util.List<MultipartFile> subFiles = mtfrequest.getFiles("subImages");

		genId = UUID.randomUUID().toString();
		
		String attach_path = "resources/notice_imgs/";
		
		String root_path=mtfrequest.getSession().getServletContext().getRealPath("/");
		
		path = root_path + attach_path;
		
		try {
			for(MultipartFile subFile : subFiles) {
				String originalFileName = subFile.getOriginalFilename();
				if(originalFileName == "") {
					fileName = "0" + originalFileName;
					imageBean.setImageName(fileName);
					imageBean.setIndex(idx);
					noticeService.updateimgPage(imageBean);
				}else {
					fileName = genId + originalFileName;
					genId = UUID.randomUUID().toString();
					imageBean.setImageName(fileName);
					imageBean.setIndex(idx);
					subFile.transferTo(new File(path + fileName));
					noticeService.updateimgPage(imageBean);
				}
				
			}
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/yesnotice/";
	}


}
