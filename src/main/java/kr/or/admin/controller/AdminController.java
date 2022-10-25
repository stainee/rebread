package kr.or.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value="/adminMain.do")
	public String adminMain(){
		return "/admin/adminMain";
	}
	
	@RequestMapping(value="/memberList.do")
	public String memberList() {
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
	public String memberDetail() {
		return "/admin/memberDetail";
	}
	
	@RequestMapping(value="/memberModify.do")
	public String memberModify() {
		return "/admin/memberModify";
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
