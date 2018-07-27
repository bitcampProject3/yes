package com.bit.yes;

import com.bit.yes.model.BranchDao;
import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.service.BranchService;
import com.bit.yes.service.ReserveListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BranchController {

	@Autowired
	private BranchService branchService;
	@Autowired
	private ReserveListService reserveListService;

	@RequestMapping("/insert")
	public String insert() {
		return "branch/insert";
	}

	@ResponseBody
	@RequestMapping(value = "/insertstep1", method = RequestMethod.POST)
	public void insertStep1 (@RequestBody Map<String, String> map, HttpSession httpSession){
		String id = ((UserVo)httpSession.getAttribute("member")).getId();
		map.put("id", id);
		branchService.insertBranchInfo(map);
		branchService.insertBranchAddress(map);
	}
	@ResponseBody
	@RequestMapping(value = "/insertstep2", method = RequestMethod.POST)
	public void insertStep2 (@RequestBody Map<String, Object> map, HttpSession httpSession){
		String id = ((UserVo)httpSession.getAttribute("member")).getId();
		map.put("id",id);
		branchService.insertBranchMenu(map);
	}
	@ResponseBody
	@RequestMapping(value = "/insertstep3", method = RequestMethod.POST)
	public void insertStep3 (@RequestBody String markerImage, HttpSession httpSession){
		String id = ((UserVo)httpSession.getAttribute("member")).getId();
		System.out.println("markerImage : "+markerImage.substring(0,markerImage.length()-1));
		System.out.println("id : "+id);
		Map<String, String> imageMap = new HashMap<>();
		imageMap.put("id", id);
		imageMap.put("markerImage", markerImage.substring(0,markerImage.length()-1));
		imageMap.put("mainImage", "mainImage.jpg");
		for(int i = 1; i<9; i++){
			String safeFile = "food_" + id + "_" + i + ".jpg";
			imageMap.put("image"+i, safeFile);
		}
		branchService.insertImageNames(imageMap);
	}

	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		List<BranchVo> articleList = branchService.selectAll();
		model.addAttribute("alist", articleList);
		return "branch/list";
	}
	@ResponseBody
	@RequestMapping(value = "/popup", method = RequestMethod.POST)
	public List<BranchVo> markerMenuLoad(@RequestBody String branchID, Model model){
        String[] id = branchID.split("=");
        List<BranchVo> menuList = branchService.menuLoad(id[0]);
        return menuList;
    }

    @ResponseBody
    @RequestMapping(value = "/branchdetail", method = RequestMethod.POST)
	public List<BranchVo> branchDetail(@RequestBody String branchID){
		List<BranchVo> allMenuList = branchService.allMenuLoad(branchID.substring(0, branchID.length()-1));
		return allMenuList;
	}
	@ResponseBody
	@RequestMapping(value = "/updatelatlng", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public void updateLatLng(@RequestBody Map<String, Object> updateLatLng){
		branchService.updateLatLng(updateLatLng);
//		System.out.println(updateLatLng.get("id"));
	}

	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public List<BranchVo> search(@RequestBody Map<String, Object> searchMap){

		List<BranchVo> searchResult = branchService.searchResult(searchMap);
		return searchResult;
	}

//	@RequestMapping(value = "/add", method = RequestMethod.GET)
//	public String branchAdd(@ModelAttribute BranchVo branchInfoVo){
//		System.out.println("controller");
//		branchDao.addBranch(branchInfoVo);
//		return "redirect:/list";
//	}

	@RequestMapping(value = "requestupload2")
    public String requestupload2(MultipartHttpServletRequest mtfRequest, HttpSession httpSession) {

		String id = ((UserVo)httpSession.getAttribute("member")).getId();
		String uploadResult;
        return uploadResult = branchService.imageUpload(mtfRequest, id);
	}

	@ResponseBody
	@RequestMapping(value = "reservepreview", method = RequestMethod.POST)
	public void reservePreviewDate(@RequestBody Map<String, Object> map){
	//	List<ReserveListVo> reserveList = reserveListService.reserveDatePreview(map);
	//	List<BranchVo> branchTimeList = branchService.reserveInfoPreview((map.get("id")).toString());
	//	System.out.println(branchTimeList.get(0).getOpTime());
	//	System.out.println(reserveList.get(0).getReserveTime());
	}

}
