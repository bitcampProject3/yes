package com.bit.yes;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.model.entity.branch_addressVo;
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
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			// 로그인 했을 경우 들어오는 세션 id값 
			// id값을 통해서 registNum값을 뽑아서 공지사항,고객상담,가맹점상담중 출력할 것을 결정
			// admin이 관리자이여야함
			String clientID = "ghdlf2"; 

			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			ArrayList<C_CsVo> page = new ArrayList<C_CsVo>();
			params.put("offset", offset);
			params.put("noOfRecords", paging.getMaxPost());
			params.put("clientID", clientID);
			
			page = (ArrayList<C_CsVo>) csService.writeList(params);
			paging.setNumberOfRecords(csService.writeGetCount(params));
			
			paging.makePaging();
			
			String registNum = csService.user_selectOne(clientID).getRegistNum();
			model.addAttribute("registNum", registNum);
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
			return "./clientCounsel/yesC_cs";

		}
		
		@RequestMapping(value="/C_Cs_search")
		public String C_CsSearchList(Model model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			HashMap<String, Object> params = new HashMap<String, Object>();
			System.out.println("list(post)");
			// 로그인 했을 경우 들어오는 세션 id값 
			// id값을 통해서 registNum값을 뽑아서 공지사항,고객상담,가맹점상담중 출력할 것을 결정
			// admin이 관리자이여야함
			String clientID = "ghdlf2"; 
			
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
			
			Paging paging = new Paging(currentPageNo, maxPost);
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			ArrayList<C_CsVo> page = new ArrayList<C_CsVo>();
			
			params.put("offset", offset);
			params.put("noOfRecords", paging.getMaxPost());
			params.put("keyword", keyword);
			params.put("category", category);
			params.put("clientID", clientID);
			
			page = (ArrayList<C_CsVo>) csService.writeList(params);
			paging.setNumberOfRecords(csService.writeGetCount(params));
			
			paging.makePaging();
			model.addAttribute("id",clientID);
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
			return "./clientCounsel/yesC_cs";
		}
		
		@RequestMapping(value="/yesC_cs/{idx}", method=RequestMethod.GET)
		public String detail(@PathVariable int idx, Model model) throws SQLException { 
			
			// 로그인 했을 경우 들어오는 세션 id값 
			// id값을 통해서 registNum값을 뽑아서 공지사항,고객상담,가맹점상담중 출력할 것을 결정
			// id값을 통해서 id에 해당하는 게시글만 출력
			// admin이 관리자이여야함
			String clientID = "ghdlf2"; 
			
			
			String registNum = csService.user_selectOne(clientID).getRegistNum();
			
			String id = (csService.selectPage(idx)).getBranchID(); // 가맹점 아이디 얻어오기
			
			if(id.equals("해당 없음")) {
				model.addAttribute("id",id);
				model.addAttribute("beans", csService.reserveOne(id)); //branch_info 값
				model.addAttribute("bean", csService.selectPage(idx));
				model.addAttribute("subImages", csService.c_counselSubImage(idx));
				model.addAttribute("registNum",registNum);
				
			}else {
				branch_addressVo address = csService.c_selectAddress(id);
				String road = address.getRoadAddress();
				String jibun = address.getJibunAddress();
				String detailaddress = address.getDetailAddress();
				String zonecode = address.getZoneCode();
				
				model.addAttribute("registNum",registNum);
				model.addAttribute("road", road );
				model.addAttribute("jibun", jibun);
				model.addAttribute("detailaddress", detailaddress);
				model.addAttribute("zonecode", zonecode);
				model.addAttribute("id",id);
				model.addAttribute("beans", csService.reserveOne(id)); //branch_info 값
				model.addAttribute("bean", csService.selectPage(idx));
				model.addAttribute("subImages", csService.c_counselSubImage(idx));			
			
			}
			return "./clientCounsel/yesC_csDetail";
		}
		
		@RequestMapping("/yesC_cs/yesC_csInsert")
		public String insertpage(String id, UserVo nickName, Model model) throws SQLException {

			// 로그인 했을 경우 들어오는 세션 id값 
			// id값을 통해서 registNum값을 뽑아서 공지사항,고객상담,가맹점상담중 출력할 것을 결정
			// admin이 관리자이여야함
			id="ghdlf2"; 
			
			String registNum = csService.user_selectOne(id).getRegistNum();
			
			nickName=csService.selectNick(id);
				
			int i=0;
			String branchID = null;
			String ids[] = new String[csService.reserveList(id).size()];
			String ids2[] = new String[csService.reserveList(id).size()];
			String ids3[] = new String[csService.reserveList(id).size()];
			String ids4[] = new String[csService.reserveList(id).size()];
			for(i=0; i<csService.reserveList(id).size(); i++) {
				branchID= csService.reserveList(id).get(i).getId();
				branch_addressVo address = csService.c_selectAddress(branchID);
				ids[i] = address.getRoadAddress();
				ids2[i] = address.getJibunAddress();
				ids3[i] = address.getDetailAddress();
				ids4[i] = address.getZoneCode();
			}
			
			model.addAttribute("registNum",registNum);
			model.addAttribute("road",ids );
			model.addAttribute("jibun", ids2);
			model.addAttribute("detailaddress", ids3);
			model.addAttribute("zonecode", ids4);
			model.addAttribute("clientID", id);
			model.addAttribute("userInfo",nickName);
			model.addAttribute("bean", csService.reserveList(id));
			return "./clientCounsel/yesC_csInsert";
		}
		
		@RequestMapping(value="/yesC_cs/yesC_csInsert",method=RequestMethod.POST)
		public String insert(C_CsVo csvo, MultipartHttpServletRequest mtfrequest, Model model) throws SQLException {
			
			csService.addPage(csvo);
			
			String genId, fileName, path;
			ImageVo imageBean = new ImageVo();
			java.util.List<MultipartFile> subFiles = mtfrequest.getFiles("subImages");
			genId = UUID.randomUUID().toString();
			String attach_path = "resources/c_counsel_imgs/";
			String root_path=mtfrequest.getSession().getServletContext().getRealPath("/");
			path = root_path + attach_path;
			
			try {
				for(MultipartFile subFile : subFiles) {
					String originalFileName = subFile.getOriginalFilename();
					if(originalFileName == "") {
						fileName = "0" + originalFileName;
						System.out.println(fileName);
						imageBean.setImageName(fileName);
						csService.c_counselImgUpload(imageBean);
					}else {
						fileName = genId + originalFileName;
						genId = UUID.randomUUID().toString();
						imageBean.setImageName(fileName);
						subFile.transferTo(new File(path + fileName));
						csService.c_counselImgUpload(imageBean);
					}
					
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:/yesC_cs/";
		}

}
