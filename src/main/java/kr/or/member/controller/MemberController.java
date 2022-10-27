package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/memberModify.do")
	public String memberModify(int memberNo,Model model) {
		Member m = service.selectOneMember(memberNo);
		model.addAttribute("m",m);
		return "/admin/memberModify";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberUpdate.do", produces = "application/json;charset=utf-8")
	public void memberUpdate(Member m) {
		int result = service.updateOneMember(m);
		
	}
	@ResponseBody
	@RequestMapping(value="/memberDelete.do", produces = "application/json;charset=utf-8")
	public void memberDelete(int memberNo) {
		int result = service.deleteOneMember(memberNo);
		
	}
	
	@RequestMapping(value="/brandIntro.do")
	public String brandIntro() {
		return "/member/brandIntro";
	}
	
	@RequestMapping(value="/customerService.do")
	public String customerService() {
		return "/member/customerService";
	}
	
	@RequestMapping(value="/memberMain.do")
	public String memberMain() {
		return "member/memberMain";
	}
	
	@RequestMapping(value="/chatting.do")
	public String chatting() {
		return "/member/csChat";
	}
	//joinStep이동
	@RequestMapping(value = "/joinStep.do")
	public String joinStep() {
		return "/member/joinStep";
	};
	//joinFrm이동
	@RequestMapping(value = "/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	//loginFrm이동
	@RequestMapping(value = "/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	//login
	
	//joinSuccess이동
<<<<<<< HEAD
	
	@RequestMapping(value="/ceoMain.do")
	public String ceoMain() {
		return "/member/ceoMain";
	}
	@RequestMapping(value = "/updateCeo.do")
	public String updateCeo(Member m, HttpSession session) {
		Member member = service.updateCeo(m);
		if(member != null) {
			session.setAttribute("m", member);
			return "redirect:/ceoMain";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/ceoStoreInfo.do")
	public String ceoStoreInfo() {
		return "/member/ceoStoreInfo";
	}
	
	@RequestMapping(value="/ceoStoreSalesInfo.do")
	public String ceoStoreSalesInfo() {
		return "/member/ceoStoreSalesInfo";
	}
=======
<<<<<<< HEAD
	
	
	@RequestMapping(value="/ceoMain.do")
	public String ceoMain() {
		return "/member/ceoMain";
	}
	@RequestMapping(value = "/updateCeo.do")
	public String updateCeo(Member m, HttpSession session) {
		Member member = service.updateCeo(m);
		if(member != null) {
			session.setAttribute("m", member);
			return "redirect:/ceoMain";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/ceoStoreInfo.do")
	public String ceoStoreInfo() {
		return "/member/ceoStoreInfo";
	}
	
	@RequestMapping(value="/ceoStoreSalesInfo.do")
	public String ceoStoreSalesInfo() {
		return "/member/ceoStoreSalesInfo";
	}
	
=======
>>>>>>> branch 'master' of https://github.com/stainee/rebread.git
>>>>>>> branch 'master' of https://github.com/stainee/rebread.git
}



























