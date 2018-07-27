package com.bit.yes;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
			
			// 로그인하여 들어오는 로그인 아이디 값을 넣어주면 clientid에 해당하는 게시글만 보임
			String clientID = "ghdlf"; 

			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			ArrayList<C_CsVo> page = new ArrayList<C_CsVo>();
			page = (ArrayList<C_CsVo>) csService.writeList(offset, paging.getMaxPost(), clientID);
			paging.setNumberOfRecords(csService.writeGetCount(clientID));
			
			paging.makePaging();
			
			model.addAttribute("page", page);
			model.addAttribute("paging",paging);
			
			return "./clientCounsel/yesC_cs";
		}
		
		@RequestMapping(value="/yesC_cs/{idx}", method=RequestMethod.GET)
		public String detail(@PathVariable int idx, Model model) throws SQLException { 
			
			String id = (csService.selectPage(idx)).getBranchID(); // 가맹점 아이디 얻어오기
			if(id.equals("해당 없음")) {
				model.addAttribute("id",id);
				model.addAttribute("beans", csService.reserveOne(id)); //branch_info 값
				model.addAttribute("bean", csService.selectPage(idx));
				model.addAttribute("subImages", csService.c_counselSubImage(idx));
			}else {
				branch_addressVo address = csService.c_selectAddress(id);
				String road = address.getRoadAddress();
				String jibun = address.getJibunAddress();
				model.addAttribute("road", road );
				model.addAttribute("jibun", jibun);
				model.addAttribute("id",id);
				model.addAttribute("beans", csService.reserveOne(id)); //branch_info 값
				model.addAttribute("bean", csService.selectPage(idx));
				model.addAttribute("subImages", csService.c_counselSubImage(idx));			
			
			}
			return "./clientCounsel/yesC_csDetail";
		}
		
		@RequestMapping("/yesC_cs/yesC_csInsert")
		public String insertpage(String id, UserVo nickName, Model model) throws SQLException {

			// 로그인할 경우 들어오는 id 값
			id="ghdlf"; 

			nickName=csService.selectNick(id);

			int i=0;
			String branchID = null;
			String ids[] = new String[csService.reserveList(id).size()];
			String ids2[] = new String[csService.reserveList(id).size()];
			for(i=0; i<csService.reserveList(id).size(); i++) {
				branchID= csService.reserveList(id).get(i).getId();
				branch_addressVo address = csService.c_selectAddress(branchID);
				ids[i] = address.getRoadAddress();
				ids2[i] = address.getJibunAddress();
			}
			model.addAttribute("road",ids );
			model.addAttribute("jibun", ids2);
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
