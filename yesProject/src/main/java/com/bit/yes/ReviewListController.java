package com.bit.yes;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.yes.model.entity.CommentVo;
import com.bit.yes.model.entity.ImageVo;
import com.bit.yes.model.entity.LikeVo;
import com.bit.yes.model.entity.ReviewVo;
import com.bit.yes.model.paging.Paging;
import com.bit.yes.service.ReviewService;

@Controller
public class ReviewListController {

	@Autowired
	ReviewService service;
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("");
	int detailIndex;
	
	public void setService(ReviewService service) {
		this.service = service;
	}

	@RequestMapping(value = "/review_list")
	public String reviewList(Model listModel, Model imageModel, HttpServletRequest request) throws Exception {

		System.out.println("list(get)");
		HashMap<String, Object> params = new HashMap<String, Object>();
		int currentPageNo = 1;
		int maxPost = 10;
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		
		if(category == null && keyword == null) {
			System.out.println("category and keyword is null");
		}
		
		if(request.getParameter("pages") != null) {
			System.out.println("pages is null");
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		}
		

		
		System.out.println("current page(get) : " + currentPageNo);
		
		System.out.println("-------------------------");
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<ReviewVo> page = new ArrayList<ReviewVo>();
		
		params.put("offset", offset);
		params.put("noOfRecords", paging.getMaxPost());
		
		page = (ArrayList<ReviewVo>) service.writeList(params);
		
		paging.setNumberOfRecords(service.writeGetCount());
		
		paging.makePaging();
		
		listModel.addAttribute("page", page);
		listModel.addAttribute("paging",paging);
		service.listPageImage(imageModel);
		
		return "review/review_list";

//		service.listPage(listModel);
//		return "review/review_list"; // jsp���ϸ�
	}
	
//	@RequestMapping(value= {"/review_list/location/{words}", "/review_list/store/{words}", "/review_list/menu/{words}"}, method=RequestMethod.POST)
//	@RequestMapping(value= "/review_search", method=RequestMethod.POST)
	@RequestMapping(value= "/review_search")
	public String reviewSearchList(Model listModel, Model imageModel, HttpServletRequest request) throws Exception {
		
		
		HttpSession session = request.getSession();
		HashMap<String, Object> params = new HashMap<String, Object>();
		System.out.println("list(post)");
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
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<ReviewVo> page = new ArrayList<ReviewVo>();
		
		params.put("offset", offset);
		params.put("noOfRecords", paging.getMaxPost());
		params.put("keyword", keyword);
		params.put("category", category);
		page = (ArrayList<ReviewVo>) service.writeList(params);
		
		int count = service.writeGetCount(params);
		
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		System.out.println("count : " + count);
		

		
		System.out.println("-------------------------");
		
		paging.setNumberOfRecords(count);
		
		paging.makePaging();
		
		listModel.addAttribute("page", page);
		listModel.addAttribute("paging",paging);
		service.listPageImage(imageModel, params);

		
		return "review/review_list";
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
	public String reviewWritePage(HttpServletRequest req,Model model) {
		String branchID=req.getParameter("branchID");
		
		
		model.addAttribute("branchID",branchID);
		return "review/review_write";

	}

	@RequestMapping(value = "/review_write", method = RequestMethod.POST)
	public String reviewWrite(ReviewVo reviewBean, MultipartHttpServletRequest mtfRequest, HttpServletRequest httpRequest) throws SQLException {

		System.out.println("write(POST)");

		int rating = Integer.parseInt(httpRequest.getParameter("rating"));
		reviewBean.setRating(rating);

		String content = reviewBean.getContent();
        String replacedContent="";
        int startIdx = 0;

        for(int i = 0; i < content.length(); i++) {
            if(content.charAt(i) == '\n') {
               replacedContent += content.substring(startIdx, i);
               replacedContent += "<br>";
               startIdx=i+1;
            }
        }

        replacedContent +=  content.substring(startIdx, content.length());

        reviewBean.setContent(replacedContent);


		service.reviewWrite(reviewBean);
		String genId, fileName, path;
		ImageVo imageBean = new ImageVo();
		MultipartFile mainFile = mtfRequest.getFile("mainImage");
		List<MultipartFile> subFiles = mtfRequest.getFiles("subImages");
		

		String originalFileName = mainFile.getOriginalFilename();

		genId = UUID.randomUUID().toString();
		
		String attach_path = "resources/review_imgs/";
		
		String root_path=mtfRequest.getSession().getServletContext().getRealPath("/");
		
		
/*		File dirFile = new File(root_path + "resources/review_imgs/");
		
		File[] fileList = dirFile.listFiles();
		
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

		detailIndex = index;
		detailModel.addAttribute("bean", service.selectPage(index));
		mainModel.addAttribute("mainImage", service.reviewMainImage(index));
		subModel.addAttribute("subImages", service.reviewSubImage(index));
//		service.reviewMainImage(mainModel, index);
//		service.reviewSubImage(subModel, index);
		
		
		return "review/review_detail"; // jsp���ϸ�
	}

	@RequestMapping(value = "/review_list/{index}", method = RequestMethod.POST)
	public String reviewDelete(@PathVariable int index) throws SQLException {

		service.deleteOne(index);
		service.deleteFile(index);

		return "redirect:/review_list";
	}
	
	
	@RequestMapping(value="/review_list/addComment", method=RequestMethod.POST)
	@ResponseBody
	public String reviewAddComment(@ModelAttribute("commentVo") CommentVo commentVo, HttpServletRequest request) throws SQLException {
		
		HttpSession session = request.getSession();
		
		System.out.println("reviewAddComment");
		
		System.out.println("content : " + commentVo.getComment());
		System.out.println("review_idx : " + commentVo.getReview_idx());
		
		commentVo.setWriter("jaeseon");
		service.reviewAddComment(commentVo);
		
		return "success";
	}
	
	
	@RequestMapping(value="/review_list/deleteComment", method=RequestMethod.POST)
	@ResponseBody
	public String reviewDeleteComment(@ModelAttribute("commentVo") CommentVo commentVo, HttpServletRequest request) throws SQLException {		
		
		HttpSession session = request.getSession();
		
		
		commentVo.setWriter("jaeseon");
		
		service.deleteComment(commentVo);
		
		System.out.println("reviewDeleteComment");
		
		System.out.println("review_idx(delete) : " + commentVo.getReview_idx());
		System.out.println("comment_idx(delete) : " + commentVo.getComment_idx());
		
		return "success";
	}
	
	
	@RequestMapping(value="/review_list/commentList", produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> commentList(@ModelAttribute("commentVo") CommentVo commentVo, HttpServletRequest request) throws SQLException {
		
		
		System.out.println("commentList(get)");
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> commentList = new ArrayList<HashMap>();
		HashMap<String, Object> temp = new HashMap<String, Object>();
		
		List<CommentVo> selectList = service.reviewCommentList(commentVo.getReview_idx());
		
		if(selectList.size() > 0) {
			
			temp = new HashMap<String, Object>();
			
			temp.put("comment_idx", null);
			
			commentList.add(temp);
			
			for(CommentVo bean : selectList) {
				
				temp = new HashMap<String, Object>();
				
				temp.put("comment_idx", bean.getComment_idx());
				temp.put("comment", bean.getComment());
				temp.put("writer", bean.getWriter());
				
				commentList.add(temp);
				
			}
			
		}
		
		
		
		JSONArray json = new JSONArray(commentList);
		
		return new ResponseEntity<String>(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	
	@RequestMapping(value="/review_list/clickLike", method=RequestMethod.POST)
	@ResponseBody
	public String reviewClickLike(@ModelAttribute("likeVo") LikeVo likeVo, HttpServletRequest request) throws SQLException {
		
		HttpSession session = request.getSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		LikeVo isExist;
		
		System.out.println("reviewClickLike(post)");
		
		System.out.println("review idx(click) : " + likeVo.getReview_idx());
		System.out.println("review writer(click) : " + likeVo.getWriter());
		System.out.println("before review checked(click) : " + likeVo.isChecked());
		
		params.put("checked", likeVo.isChecked());
		params.put("bean", likeVo);
		
		isExist = service.reviewCheckLike(likeVo);
		
		if(isExist == null) {
			System.out.println("not exist!!!");
			service.reviewNewLike(likeVo);
			
		} else {
			System.out.println("exist!!!");
			service.reviewDeleteLike(likeVo);
//			service.reviewChangeLike(params);
			
		}
//		service.reviewChangeLike(likeVo); 
		
		
		System.out.println("--------------------------");
		
		
		
		
//		System.out.println("content : " + commentVo.getComment());
//		System.out.println("review_idx : " + commentVo.getReview_idx());
//		
//		commentVo.setWriter("jaeseon");
//		service.reviewAddComment(commentVo);
		
		return "success";
	}
	
	
	@RequestMapping(value="/review_list/reviewLike", produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> review_like(HttpServletRequest request) throws SQLException {
//	public ResponseEntity<String> review_like(@ModelAttribute("likeVo") LikeVo likeVo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		LikeVo bean = new LikeVo();
		LikeVo checkBean = new LikeVo();
		String id;
		int likeCount;
		boolean likeChecked;
		
		id = "jaeseon3";
		
//		id = session.getAttribute("id");  // session���� id�� �޾Ƽ� �ʱ�ȭ
		
		System.out.println("reviewLike(get)");
		
		System.out.println("review idx(like) : " + detailIndex);
		
		bean.setReview_idx(detailIndex);
		bean.setWriter(id);
		
		likeCount = service.reviewCountLike(bean);
		System.out.println("likeCount : " + likeCount);
		
		checkBean = service.reviewCheckLike(bean);
		
		if(checkBean == null) {
			System.out.println("bean is null!!");
			bean.setChecked(false);
		} else {
			System.out.println("bean is not null!!");
			bean.setChecked(checkBean.isChecked());
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap<String, Object>> likeList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> temp = new HashMap<String, Object>();
		
		temp.put("likeCount", likeCount);
		temp.put("checked", bean.isChecked());
		
		likeList.add(temp);
		
		JSONArray json = new JSONArray(likeList);
		
		return new ResponseEntity<String>(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/review_list/editComment", method=RequestMethod.POST)
	@ResponseBody
	public String reviewEditComment(@ModelAttribute("commentVo") CommentVo commentVo, HttpServletRequest request) throws SQLException {

		HttpSession session = request.getSession();


		commentVo.setWriter("jaeseon");

//		service.deleteComment(commentVo);

		System.out.println("reviewEditComment");

		service.editComment(commentVo);

		System.out.println("editComment : " + commentVo.getComment());
		System.out.println("review_idx(edit) : " + commentVo.getReview_idx());
		System.out.println("comment_idx(edit) : " + commentVo.getComment_idx());

		return "success";
	}

	//20180806 추가
	@ResponseBody
	@RequestMapping(value = "/loadReviewScoreAvg", method = RequestMethod.POST)
	public double loadReviewScoreAvg(@RequestBody String branchId){
		System.out.println("branchId : "+branchId);
		return service.loadReviewScoreAvg(branchId.substring(0, branchId.length()-1));
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