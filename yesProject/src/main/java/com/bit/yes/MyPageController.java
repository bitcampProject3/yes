package com.bit.yes;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.yes.model.UserDao;
import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;
import com.bit.yes.model.entity.ReviewVo;
import com.bit.yes.model.entity.UserVo;
import com.bit.yes.service.ReserveListService;


@Controller
public class MyPageController {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	ReserveListService service;
	
	
	
	public void setService(ReserveListService service) {
		this.service = service;
	}
	
	
	//-------------내정보------------------
	@RequestMapping("/myInfo.yes")
	public String myInfo(HttpSession session,Model model) throws SQLException {
		UserVo user=(UserVo) session.getAttribute("member");
		UserVo bean=sqlSession.getMapper(UserDao.class).login(user.getId());
		model.addAttribute("user", bean);
		return "mypage/myInfo";
	}
	
	@RequestMapping(value="mypageUpdate",method=RequestMethod.POST)
	public String update(HttpSession session,@ModelAttribute UserVo bean,Model model) throws SQLException {
		if(bean.getRegistNum()==null)
		{
			bean.setRegistNum("0");
		}
		int result=sqlSession.getMapper(UserDao.class).updateInfo(bean);
		UserVo user=sqlSession.getMapper(UserDao.class).login(bean.getId());
		if(result>0)
		{
			model.addAttribute("user", user);
			System.out.println(user);
			return "mypage/myInfo";
		}
		else
		{
			System.out.println("실패"); 
			//실패 경로 아마 틀릴거임!
			return "redirect:../myInfo.yes";
		}
	
	}
	//-----------회원 탈퇴-----------
	@ResponseBody
	@RequestMapping(value="/deleteUser",method=RequestMethod.POST,produces="application/text; charset=utf8")
	public String deleteUser (String id,HttpSession session) throws SQLException {
		System.out.println(id);
		int result=sqlSession.getMapper(UserDao.class).deleteOne(id);
		if(result>0) {
			session.invalidate();
			return "성공";
			}
		else {
			return "회원가입실패";
		}
	}
	//------------(고객)예약 현황리스트 불러오기-----------
	@RequestMapping("/reservation.yes")
	public String reservation(HttpSession session,Model model,HttpServletRequest req) throws SQLException {
		String id=((UserVo)session.getAttribute("member")).getId();
		service.listPage(model,id);
		return "mypage/myReserve";
	}
	
	//-----------(고객)작성글 보기-----------------------

	@RequestMapping("/myWrite.yes")
	public String myWrite(HttpSession session,Model model,HttpServletRequest req) throws SQLException {
		String id=((UserVo)session.getAttribute("member")).getId();
		List<ReviewVo> list=service.writeList(model,id);
		System.out.println(list);
		return "mypage/mywrite";
	}
	
	//---------마이페이지 달력-----------
	@ResponseBody
	@RequestMapping(value="/loadReserve",method=RequestMethod.POST)
	public List<ReserveListVo> loadReserve(HttpSession session,Model model) throws SQLException {
		String id=((UserVo)session.getAttribute("member")).getId();
		UserVo user=sqlSession.getMapper(UserDao.class).login(id);
		List<ReserveListVo> list;
		if(user.getRegistNum().equals("0"))//고객
		{
			list=service.listPage(model, id);
			return list;
		}
		else { //사업자
			list=service.reserveAll(model,id);
			return list;
		}
	}


	//----------예약한 가게의 정보 불러오기----------
	@ResponseBody
	@RequestMapping(value="/member_branchInfo",method=RequestMethod.POST)
	public BranchVo reservation2(String id) throws SQLException {
		BranchVo bean=service.selectOne(id);
		return bean;
	}
	
	//-----------예약 취소하기---------------
	@ResponseBody
	@RequestMapping(value="/delreserve",method=RequestMethod.POST)
	public String delReserve(String time,HttpSession session) throws SQLException{
		String id=((UserVo)session.getAttribute("member")).getId();
		ReserveListVo bean=new ReserveListVo();
		bean.setClientID(id);
		bean.setReserveTime(time);
		service.deleteOne(bean);
		return "/reservation.yes";
	}
	
	//------------------사업자 mypage-----------------
	@RequestMapping("/branchReserve.yes")
	public String branchReserve(HttpSession session,Model model) throws SQLException{
		UserVo bean=(UserVo) session.getAttribute("member");
		String id=bean.getId();
		//예약 리스트 불러오기
		service.reserveAll(model,id);
		return "mypage/branchReserve";
	}
	
	
	
	//-------------------사업자 매장정보-----------------
	@ResponseBody
	@RequestMapping(value = "/branchInfo", method = RequestMethod.POST, produces = "application/json;")
	public List<BranchVo> branchInfo(HttpSession httpSession) {
		String id=((UserVo) httpSession.getAttribute("member")).getId();
		return service.selectOneBranch(id);

	}
	//----------------매장관리(테이블 관리)----------------------
	@RequestMapping("/branchManage.yes")
	public String branchManage(HttpSession session,Model model) throws SQLException{
		String id=((UserVo) session.getAttribute("member")).getId();
		BranchVo bean=service.selectBranch(id);
		model.addAttribute("bean",bean);
		return "mypage/branchManage";
	}
	
	
	// --------실시간 state전송(좌석관리)-----------
	@ResponseBody
	@RequestMapping(value="/manageTable",method=RequestMethod.POST)
	public String manageTable(String state,String entry,String entryR,String end,HttpSession session) throws SQLException{
		String id=((UserVo)session.getAttribute("member")).getId();
		BranchVo bean=service.selectBranch(id);
		bean.setTableState(Integer.parseInt(state));
		service.updateState(bean);
		int count=0;
		count=service.loadTicket(id);//대기하는 사람 몇명인지..
		System.out.println(count);
		if(count>0)
		{
			//현재 입장 번호 저장하기--- 저장 okƒ
			if(Integer.parseInt(entry)>0)
			{
			bean.setWaitingNum(Integer.parseInt(entry));
			service.updateWaiting(bean);
			if(entryR!=null) {
				System.out.println("현재 입장번호:"+entry);
				//ticketing에서 삭제하기---(현재입장번호)
				service.deleteTicket(Integer.parseInt(entry)); //삭제 ok
				//현재 입장 번호의 ticket번호를 삭제함!
				count=service.loadTicket(id);//대기하는 사람 몇명인지..
			}
			}
			
		}
		
		if(end!=null) {
			//영업종료
			bean.setWaitingNum(Integer.parseInt(entry));
			service.updateWaiting(bean);
			service.end(id);
		}
		return count+"";
	}
	
	
	//---------------실시간 대기인원count----------------
	// --------실시간 state전송(좌석관리)-----------
	@ResponseBody
	@RequestMapping(value="/count",method=RequestMethod.POST,produces="application/text; charset=utf8")
	public String count(HttpSession session,String registNum) {
		String id="";
		if(session.getAttribute("member")!=null) {
		
			id=((UserVo)session.getAttribute("member")).getId();
			
			if(id!=null) {
				int count=0;
				if(!(registNum.equals("0"))) { //사업자
					count=service.loadTicket(id);//대기하는 사람 몇명인지..
					return "사업"+count+"명";
				}
				else{ //고객일 경우...자신의 대기번호
					count=service.getNum(id);
					
					if(count>0) {
					int state=service.getState(id);
					return "고객"+count+"번/"+state+"번";
					
					}
					return "대기 중인 가게가 없습니다";
					}
				}
			
		}
		
		return null;
		
	}

	@ResponseBody
	@RequestMapping(value = "insertReserve", method = RequestMethod.POST)
	public void insertReserve(@RequestBody Map<String, Object> map, HttpSession session, Model model){
		System.out.println(map);

//		if(session.getAttribute("member") == null) model.addAttribute("reserveResult","로그인이 필요합니다.");
//		else{
			String id=((UserVo) session.getAttribute("member")).getId();
			service.insertReserve(map, id);
//			model.addAttribute("reserveMsg","로그인이 필요합니다.");
//		}


	}
	
	//---------------(가맹점)이용현황 변경하기-----------
	
	@ResponseBody
	@RequestMapping(value="/useState_change",method=RequestMethod.POST,produces="application/text; charset=utf8")
	public String useState_change(String day,String use) throws SQLException{
		System.out.println(use);
		ReserveListVo bean=new ReserveListVo();
		bean.setUseState(use);
		bean.setReserveTime(day);
		int result=service.updateUseState(bean);
		System.out.println(result);
		return "이용현황 변경되었습니다";
	}
	
	//-------------(가맹점) 리뷰 게시판---------------
	
	@RequestMapping("/branch_ReviewList.yes")
	public String branchReview(HttpSession session,Model model) throws SQLException{
		String id=((UserVo) session.getAttribute("member")).getId();
		 List<ReviewVo> list=service.selectAll(model,id);
		System.out.println(list);
		
		/*	String id=((UserVo) session.getAttribute("member")).getId();
		BranchVo bean=service.selectBranch(id);
		model.addAttribute("bean",bean);*/
		return "mypage/branch_ReviewList";
	}
	
	
}
