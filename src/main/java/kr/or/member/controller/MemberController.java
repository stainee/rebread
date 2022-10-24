package kr.or.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	
	@RequestMapping(value="/brandIntro.do")
	public String brandIntro() {
		return "/member/brandIntro";
	}
	
	@RequestMapping(value="/customerService.do")
	public String customerService() {
		return "/member/customerService";
	}
	
	@RequestMapping(value="/chatting.do")
	public String chatting() {
		return "/member/csChat";
	}
}
