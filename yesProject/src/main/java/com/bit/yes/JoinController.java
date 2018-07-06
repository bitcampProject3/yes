package com.bit.yes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	
	
	@RequestMapping("/join.bit")
	public String join() {
		return "join";
	}
	//사업자 회원가입 화면
	@RequestMapping("/branchJoin.bit")
	public String branchJoin() {
		return "branchJoin";
	}
	//고객 회원가입 화면
	@RequestMapping("/customerJoin.bit")
	public String customerJoin() {
		return "customerJoin";
	}
}
