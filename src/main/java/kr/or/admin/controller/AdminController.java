package kr.or.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/adminMain.do")
	public String adminMain(){
		return "/admin/adminMain";
	}
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model) {
		ArrayList<Member> list = service.selectAllMember();
		model.addAttribute("list", list);
		return "/admin/memberList";
	}
	
	@RequestMapping(value="/storeList.do")
	public String sellerList() {
		return "/admin/storeList";
	}
	
	@RequestMapping(value="/csList.do")
	public String csList() {
		return "/admin/csList";
	}
	
	@RequestMapping(value="/memberDetail.do")
	public String memberDetail(int memberNo,Model model) {
		return "/admin/memberDetail";
	}
	
	@RequestMapping(value="/storeDetail.do")
	public String storeDetail() {
		return "/admin/storeDetail";
	}
	
	@RequestMapping(value="/storeAccount.do")
	public String storeAccount() {
		return "/admin/storeAccount";
	}
}
