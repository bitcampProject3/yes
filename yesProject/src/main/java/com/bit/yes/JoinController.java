package com.bit.yes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	
	
	@RequestMapping("/join.yes")
	public String join() {
		return "join";
	}
	//사업자 회원가입 화면
	@RequestMapping("/branchJoin.yes")
	public String branchJoin() {
		return "branchJoin";
	}
	//고객 회원가입 화면
	@RequestMapping("/customerJoin.yes")
	public String customerJoin() {
		return "customerJoin";
	}
}
