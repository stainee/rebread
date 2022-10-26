package kr.or.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.cs.model.service.CSService;
import kr.or.cs.model.vo.CS;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreDetail;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private StoreService sservice;
	@Autowired
	private CSService csservice;
	
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
	public String sellerList(Model model) {
		ArrayList<Store> list = sservice.selectAllStore();
		model.addAttribute("list",list);
		return "/admin/storeList";
	}
	
	@RequestMapping(value="/csList.do")
	public String csList(Model model) {
		ArrayList<CS> list = csservice.selectAllCS();
		model.addAttribute("list",list);
		return "/admin/csList";
	}
	

	@RequestMapping(value="/memberDetail.do")
	public String memberDetail(int memberNo,Model model) {
		Member m = service.selectOneMember(memberNo);
		model.addAttribute("m",m);
		return "/admin/memberDetail";
	}
	
	@RequestMapping(value="/storeDetail.do")
	public String storeDetail(int storeNo, Model model) {
		StoreDetail sd = sservice.selectOneStore(storeNo);
		model.addAttribute("sd", sd);
		return "/admin/storeDetail";
	}
	
	@RequestMapping(value="/storeAccount.do")
	public String storeAccount() {
		return "/admin/storeAccount";
	}
}
