package com.bit.yes;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.CSS;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.bit.yes.model.UserDao;
import com.bit.yes.model.entity.BranchVo;
import com.bit.yes.model.entity.ReserveListVo;
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
	
	
	//-------------������------------------
	@RequestMapping("/myInfo.yes")
	public String myInfo(HttpSession session,Model model) throws SQLException {
		UserVo user=(UserVo) session.getAttribute("member");
		UserVo bean=sqlSession.getMapper(UserDao.class).login(user.getId());
		model.addAttribute("user", bean);
		return "mypage/myInfo";
	}
	
	@RequestMapping(value="mypageUpdate",method=RequestMethod.POST)
	public String update(HttpSession session,@ModelAttribute UserVo bean,Model model) throws SQLException {
		
		int result=sqlSession.getMapper(UserDao.class).updateInfo(bean);
		UserVo user=sqlSession.getMapper(UserDao.class).login(bean.getId());
    	if(result>0)
		{
			model.addAttribute("user", user);
			return "mypage/myInfo";
		}
		else
		{
			System.out.println("����"); 
			//���� ��� �Ƹ� Ʋ������!
			return "redirect:../myInfo.yes";
		}
	
	}
	//------------���� ��Ȳ-----------
	@RequestMapping("/reservation.yes")
	public String reservation(HttpSession session,Model model) throws SQLException {
		String id=((UserVo)session.getAttribute("member")).getId();
		service.listPage(model,id);
		return "mypage/myReserve";
	}
	//---------���������� �޷�-----------
	@ResponseBody
	@RequestMapping(value="/loadReserve",method=RequestMethod.POST)
	public List<ReserveListVo> loadReserve(HttpSession session,Model model) throws SQLException {
		String id=((UserVo)session.getAttribute("member")).getId();
		UserVo user=sqlSession.getMapper(UserDao.class).login(id);
		List<ReserveListVo> list;
		if(Integer.parseInt(user.getRegistNum())==0)//��
		{
			list=service.listPage(model, id);
			return list;
		}
		else {
			list=service.reserveAll(model,id);
			return list;
		}
	}



	//----------������ ������ ���� �ҷ�����----------
	@ResponseBody
	@RequestMapping(value="/branchInfo",method=RequestMethod.POST)
	public BranchVo reservation2(String id,Model model) throws SQLException {
		BranchVo bean=service.selectOne(id);
		return bean;
	}
	
	//-----------���� ����ϱ�---------------
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
	
	
	
	//------------------����� mypage-----------------
	
	@RequestMapping("/branchReserve.yes")
	public String branchReserve(HttpSession session,Model model) throws SQLException{
		UserVo bean=(UserVo) session.getAttribute("member");
		String id=bean.getId();
		//���� ����Ʈ �ҷ�����
		service.reserveAll(model,id);
		return "mypage/branchReserve";
	}
	
	//-------------------����� ��������-----------------
	@RequestMapping("/branchInfo.yes")
	public String branchInfo() {
		return "mypage/branchInfo";
	}
	//----------------�������(���̺� ����)----------------------
	@RequestMapping("/branchManage.yes")
	public String branchManage(HttpSession session,Model model) throws SQLException{
		String id=((UserVo) session.getAttribute("member")).getId();
		BranchVo bean=service.selectBranch(id);
		model.addAttribute("bean",bean);
		return "mypage/branchManage";
	}
	
	
	// --------�ǽð� state����(�¼�����)-----------
	@ResponseBody
	@RequestMapping(value="/manageTable",method=RequestMethod.POST)
	public String manageTable(String state,String entry,String entryR,String end,HttpSession session) throws SQLException{
		String id=((UserVo)session.getAttribute("member")).getId();
		BranchVo bean=service.selectBranch(id);
		bean.setTableState(Integer.parseInt(state));
		service.updateState(bean);
		int count=0;
		count=service.loadTicket(id);//����ϴ� ��� �������..
		System.out.println(count);
		if(count>0)
		{
			//���� ���� ��ȣ �����ϱ�--- ���� ok
			if(Integer.parseInt(entry)>0)
			{
			bean.setWaitingNum(Integer.parseInt(entry));
			service.updateWaiting(bean);
			if(entryR!=null) {
				System.out.println("���� �����ȣ:"+entry);
				//ticketing���� �����ϱ�---(���������ȣ)
				service.deleteTicket(Integer.parseInt(entry)); //���� ok
				//���� ���� ��ȣ�� ticket��ȣ�� ������!
				count=service.loadTicket(id);//����ϴ� ��� �������..
			}
			}
			
		}
		
		if(end!=null) {
			//��������
			bean.setWaitingNum(Integer.parseInt(entry));
			service.updateWaiting(bean);
			service.end(id);
		}
		return count+"";
	}
	
	
	//---------------�ǽð� ����ο�count----------------
	// --------�ǽð� state����(�¼�����)-----------
	@ResponseBody
	@RequestMapping(value="/count",method=RequestMethod.POST,produces="application/text; charset=utf8")
	public String count(HttpSession session,String registNum) {
		String id="";
		if(session.getAttribute("member")!=null) {
		
			id=((UserVo)session.getAttribute("member")).getId();
			
			if(id!=null) {
				int count=0;
				if(Integer.parseInt(registNum)>0) { //�����
					count=service.loadTicket(id);//����ϴ� ��� �������..
					return "���"+count+"��";
				}
				else{ //���� ���...�ڽ��� ����ȣ
					count=service.getNum(id);
					
					if(count>0) {
					int state=service.getState(id);
					return "��"+count+"��/"+state+"��";
					
					}
					return "��� ���� ���԰� �����ϴ�";
					}
				}
			
		}
		
		return null;
		
	}

	@ResponseBody
	@RequestMapping(value = "/insertReserve", method = RequestMethod.POST)
	public void insertReserve(@RequestBody Map<String, Object> map, HttpSession session){
		System.out.println(map);
		String id=((UserVo) session.getAttribute("member")).getId();

		service.insertReserve(map, id);

	}
}
