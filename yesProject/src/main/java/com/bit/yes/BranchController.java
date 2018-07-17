package com.bit.yes;

import com.bit.yes.model.BranchDao;
import com.bit.yes.model.entity.BranchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class BranchController {

	@Autowired
	private BranchDao branchDao;

	@RequestMapping("/insert")
	public String insert() {
		return "branch/insert";
	}
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		List<BranchVo> articleList = branchDao.selectAll();

		model.addAttribute("alist", articleList);

		return "branch/list";
	}
	@ResponseBody
	@RequestMapping(value = "/popup", method = RequestMethod.POST)
	public List<BranchVo> markerMenuLoad(@RequestBody String branchID, Model model){
        String[] id = branchID.split("=");
        List<BranchVo> menuList = branchDao.menuLoad(id[0]);
        return menuList;
    }
//	@ResponseBody
//	@RequestMapping(value = "/updatelatlng", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
//	public void updateLatLng(@RequestBody Map<String, Object> updateLatLng){
//		branchDao.updateLatLng(updateLatLng);
////		System.out.println(updateLatLng.get("id"));
//	}

	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public List<BranchVo> search(@RequestBody Map<String, Object> searchMap){
		System.out.println(searchMap.get("searchSelect"));
		System.out.println(searchMap.get("searchInput"));

		List<BranchVo> searchResult = branchDao.searchResult(searchMap);
		return searchResult;
	}

//	@RequestMapping(value = "/add", method = RequestMethod.GET)
//	public String branchAdd(@ModelAttribute BranchVo branchInfoVo){
//		System.out.println("controller");
//		branchDao.addBranch(branchInfoVo);
//		return "redirect:/list";
//	}


}
