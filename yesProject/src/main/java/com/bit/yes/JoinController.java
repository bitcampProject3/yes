package com.bit.yes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	
	
	@RequestMapping("/join.yes")
	public String join() {
		return "join";
	}
	//����� ȸ������ ȭ��
	@RequestMapping("/branchJoin.yes")
	public String branchJoin() {
		return "branchJoin";
	}
	//�� ȸ������ ȭ��
	@RequestMapping("/customerJoin.yes")
	public String customerJoin() {
		return "customerJoin";
	}
}
