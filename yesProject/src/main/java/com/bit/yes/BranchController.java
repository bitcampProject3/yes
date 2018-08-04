package com.bit.yes;

import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;
import com.bit.yes.model.entity.ReviewVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.service.BranchService;
import com.bit.yes.service.ReserveListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
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
		System.out.println("insertStep1 controller run");
		String id = ((UserVo)httpSession.getAttribute("member")).getId();
		map.put("id", id);
		branchService.insertBranchInfo(map);
		branchService.insertBranchAddress(map);
	}
	@ResponseBody
	@RequestMapping(value = "/insertstep2", method = RequestMethod.POST)
	public void insertStep2 (@RequestBody Map<String, Object> map, HttpSession httpSession){
		System.out.println("insertStep2 controller run");
		String id = ((UserVo)httpSession.getAttribute("member")).getId();
		map.put("id",id);
		branchService.insertBranchMenu(map);
	}
	@ResponseBody
	@RequestMapping(value = "/insertstep3", method = RequestMethod.POST)
	public void insertStep3 (@RequestBody String markerImage, HttpSession httpSession){
		System.out.println("insertStep3 controller run");
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
	public List<BranchVo> branchDetail(@RequestBody String branchID, Model model){
		List<BranchVo> allMenuList = branchService.allMenuLoad(branchID.substring(0, branchID.length()-1));

		return allMenuList;
	}
    @ResponseBody
    @RequestMapping(value = "/mybranchdetail", method = RequestMethod.POST)
	public List<BranchVo> myBranchDetail(HttpSession httpSession){
		String branchId = ((UserVo)httpSession.getAttribute("member")).getId();
		List<BranchVo> myAllMenuList = branchService.myAllMenuLoad(branchId);

		return myAllMenuList;
	}

	@ResponseBody
	@RequestMapping(value = "/waitingList", method = RequestMethod.POST)
	public int waitingList(@RequestBody String branchId){
		return branchService.waitingList(branchId.substring(0, branchId.length()-1));
	}


	@ResponseBody
	@RequestMapping(value = "/updatelatlng", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public void updateLatLng(@RequestBody Map<String, Object> updateLatLng){
		branchService.updateLatLng(updateLatLng);
		System.out.println("updateLatLng run");
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
	public ArrayList<String> reservePreviewDate(String id, String date){//@RequestBody Map<String, Object> map){

		System.out.println(id);
		System.out.println(date);
		Map map = new HashMap();
		map.put("id", id);
		map.put("date", date);

		List<ReserveListVo> reserveList = reserveListService.reserveDatePreview(map);
		List<BranchVo> branchTimeList = branchService.reserveInfoPreview((map.get("id")).toString());

		String opTime = branchTimeList.get(0).getOpTime();
		String[] opTimes = opTime.split("~");

		String[] openTimes = opTimes[0].split(":");
		int openTimeHour = Integer.parseInt(openTimes[0]);
		int openTimeMin = Integer.parseInt(openTimes[1]);
		String[] closeTimes = opTimes[1].split(":");
		int closeTimeHour = Integer.parseInt(closeTimes[0]);
		int closeTimeMin = Integer.parseInt(closeTimes[1]);

		ArrayList<String> resultTimeArr = new ArrayList<String>();
		int maxMin = 60;
		// 영업시간에서 예약 가능한 시간을 구하는 로직. 10분단위
		for (int j = openTimeHour; j <= closeTimeHour; j++) {
			for (int i = openTimeMin; i < maxMin ; i = i + 10) {

				if(j < 10){
					if(i == 0) resultTimeArr.add("0"+j+":"+"00");
					else resultTimeArr.add("0"+j+":"+i);
				}else{
					if(i == 0) resultTimeArr.add(j+":"+"00");
					else resultTimeArr.add(j+":"+i);
				}



			}
			if(j == closeTimeHour-1) maxMin = closeTimeMin;
			else openTimeMin = 0;
		}

//		System.out.println("resultTimeArr : " +resultTimeArr);


		if(reserveList.size() == 0){
			return resultTimeArr;
		}else{
			for (int i = 0; i < reserveList.size(); i++) {
				Map temp = (Map) reserveList.get(i);
				String reserveTime = String.valueOf(temp.get("reserveTime"));
				String reserved = reserveTime.substring(11, 16);
				resultTimeArr.remove(reserved);
				System.out.println("resultRemove : " +reserved);
			}


			// 예약된 시간
			// 예약된 시간을 제한 예약 가능 배열
			System.out.println("resultTimeArr : " +resultTimeArr);

			return resultTimeArr;
		}

	}

	@ResponseBody
    @RequestMapping(value = "/ticketingStart", method = RequestMethod.POST)
	public void ticketingStart(@RequestBody String branchID, HttpSession httpSession){
		System.out.println("ticketingStart Controller run..");
		String clientId = ((UserVo)httpSession.getAttribute("member")).getId();
		branchService.ticketingStart(branchID.substring(0, branchID.length()-1), clientId);
	}
	@ResponseBody
    @RequestMapping(value = "/ticketingCheck", method = RequestMethod.POST)
	public int ticketingCheck(@RequestBody String branchID, HttpSession httpSession){
		System.out.println("ticketingCheck Controller run..");
		if(httpSession.getAttribute("member") == null) return 1001;
		String clientId = ((UserVo)httpSession.getAttribute("member")).getId();
		return branchService.ticketingCheck(branchID.substring(0, branchID.length()-1), clientId);
	}

	@ResponseBody
	@RequestMapping(value = "/branchReview", method = RequestMethod.POST)
	public List<ReviewVo> branchReview(@RequestBody String branchId){
		System.out.println("branchReview Controller run..");
		return branchService.branchReview(branchId);
	}



}
