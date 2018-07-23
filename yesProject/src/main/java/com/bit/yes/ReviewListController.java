package com.bit.yes;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.ReviewVo;
import com.bit.yes.model.paging.Paging;
import com.bit.yes.service.ReviewService;

@Controller
public class ReviewListController {

	@Autowired
	ReviewService service;
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("");

	public void setService(ReviewService service) {
		this.service = service;
	}

	@RequestMapping(value = "/review_list")
	public String reviewList(Model listModel, Model imageModel, HttpServletRequest req) throws Exception {

		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<ReviewVo> page = new ArrayList<ReviewVo>();
		page = (ArrayList<ReviewVo>) service.writeList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(service.writeGetCount());
		
		paging.makePaging();
		
		listModel.addAttribute("page", page);
		listModel.addAttribute("paging",paging);
		service.listPageImage(imageModel);
		
		return "review/review_list";
		
		
//		service.listPage(listModel);
//		return "review/review_list"; // jsp파일명

	}

	@RequestMapping(value = "/review_edit/{index}", method = RequestMethod.GET)
	public String reviewEditPage(@PathVariable int index, Model model) throws SQLException {

		ReviewVo vo = service.selectPage(index);

		System.out.println("controller rating : " + vo.getRating());
		System.out.println("controller content : " + vo.getContent());

		model.addAttribute("bean", service.selectPage(index));

		return "review/review_edit";

	}

	@RequestMapping(value = "/review_edit/{index}", method = RequestMethod.POST)
	public String reviewEdit(@PathVariable int index, ReviewVo bean, Model model) throws SQLException {

		bean.setIdx(index);
		service.editOne(bean);
		return "redirect:../review/review_list";
	}

	@RequestMapping(value = "/review_write")
	public String reviewWritePage(Model model) {

		return "review/review_write";

	}

	@RequestMapping(value = "/review_write", method = RequestMethod.POST)
	public String reviewWrite(ReviewVo reviewBean, MultipartHttpServletRequest mtfRequest) throws SQLException {

		System.out.println("write(POST)");
		service.reviewWrite(reviewBean);
		String genId, fileName, path;
		ImageVo imageBean = new ImageVo();
		MultipartFile mainFile = mtfRequest.getFile("mainImage");
		List<MultipartFile> subFiles = mtfRequest.getFiles("subImages");
		

		String originalFileName = mainFile.getOriginalFilename();

		genId = UUID.randomUUID().toString();
		
		String attach_path = "resources/review_imgs/";
		
		String root_path=mtfRequest.getSession().getServletContext().getRealPath("/");
		
		
		File dirFile = new File(root_path + "resources/review_imgs/");
		
/*		File[] fileList = dirFile.listFiles();
		
		for(File tempFile : fileList) {
			System.out.println("file name : " + tempFile.getName());
		}*/
		
		path = root_path + attach_path;
		fileName = "m_" + genId + originalFileName;

		imageBean.setImageName(fileName);
		
		try {
			mainFile.transferTo(new File(path + fileName));
			service.reviewImgUpload(imageBean);
			
			for(MultipartFile subFile : subFiles) {
				originalFileName = subFile.getOriginalFilename();
				genId = UUID.randomUUID().toString();
				fileName = genId + originalFileName;
				imageBean.setImageName(fileName);
				subFile.transferTo(new File(path + fileName));
				service.reviewImgUpload(imageBean);
			}
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/review_list";
	}

	@RequestMapping(value = "/review_list/{index}", method = RequestMethod.GET)
	public String reviewDetail(@PathVariable int index, Model detailModel, Model mainModel, Model subModel) throws SQLException {

		detailModel.addAttribute("bean", service.selectPage(index));
		mainModel.addAttribute("mainImage", service.reviewMainImage(index));
		subModel.addAttribute("subImages", service.reviewSubImage(index));
//		service.reviewMainImage(mainModel, index);
//		service.reviewSubImage(subModel, index);
		
		
		return "review/review_detail"; // jsp파일명
	}

	@RequestMapping(value = "/review_list/{index}", method = RequestMethod.POST)
	public String reviewDelete(@PathVariable int index) throws SQLException {

		service.deleteOne(index);
		service.deleteFile(index);

		return "redirect:/review_list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

//	@RequestMapping(value = "multiRequest")
//	public String reviewMultiUpload(MultipartHttpServletRequest mtfRequest) throws SQLException {
//
//		ImageVo bean = new ImageVo();
//		List<MultipartFile> fileList = mtfRequest.getFiles("multiFile");
//		/*
//		 * String src = mtfRequest.getParameter("src");
//		 * System.out.println("src value  : " + src);
//		 */
//
//		// System.out.println("access reviewMultiUpload controller");
//
//		String path = "C:\\Users\\1027\\Desktop\\review_image\\";
//
//		for (MultipartFile mf : fileList) {
//			String originalFileName = mf.getOriginalFilename();
//			long fileSize = mf.getSize();
//
//			String genId = UUID.randomUUID().toString();
//
//			System.out.println("originalFileName : " + originalFileName);
//			System.out.println("fileSize : " + fileSize);
//
//			String saveFile = genId + originalFileName;
//			bean.setImageName(saveFile);
//
//			try {
//				mf.transferTo(new File(saveFile));
//				service.reviewImgUpload(bean);
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//
//		}
//		return "redirect:/review_list";
//	}

	/*
	 * @RequestMapping("/review_list.yes") public String reviewList() {
	 * 
	 * return "review_list";
	 * 
	 * }
	 */

	/*
	 * public void listAll(Model model) { model.addAttribute("alist",
	 * sqlSession.getMapper(type)); }
	 */
}