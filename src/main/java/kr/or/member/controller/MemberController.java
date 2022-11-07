package kr.or.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.NaverLoginBO;
import kr.or.order.model.vo.OrderPageData;
import kr.or.store.model.service.StoreService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
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
	
	// memberMain(마이페이지) 이동
	@RequestMapping(value="/memberMain.do")
	public String memberMain(int memberNo, HttpSession session) {
		// memberMileage 구하기
		int memberMileage = service.selectMemberMileage(memberNo);
		session.setAttribute("memberMileage", memberMileage);
		return "member/memberMain";
	}
	
	// memberOrderList 이동
	@RequestMapping(value="/memberOrderList.do")
	public String memberOrderList(int reqPage, int memberNo, Model model, HttpSession session) {
		OrderPageData opd = service.selectOrderList(reqPage, memberNo);
		model.addAttribute("list", opd.getList());
		model.addAttribute("pageNavi",opd.getPageNavi());
		model.addAttribute("reqPage",opd.getReqPage());
		model.addAttribute("numPerPage",opd.getNumPerPage());
		model.addAttribute("memberNo",opd.getMemberNo());
		
		// memberMileage 구하기
		int memberMileage = service.selectMemberMileage(memberNo);
		session.setAttribute("memberMileage", memberMileage);
		return "member/memberOrderList";
	}
	
	// memberReview 이동
	@RequestMapping(value="/memberReview.do")
	public String memberReview(int memberNo, HttpSession session) {
		// memberMileage 구하기
		int memberMileage = service.selectMemberMileage(memberNo);
		session.setAttribute("memberMileage", memberMileage);
		return "member/memberReview";
	}
	
	@RequestMapping(value="/chatting.do")
	public String chatting() {
		return "/member/csChat";
	}
	
	
	//joinStep이동f
	@RequestMapping(value = "/joinStep.do")
	public String joinStep() {
		return "/member/joinStep";
	};
	//joinFrm이동
	@RequestMapping(value = "/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	
	
	
	
	
	
	
	
	
	
	
	//login
	@RequestMapping(value = "/login.do")
	public String login(Member member, HttpSession session) {
		Member m = service.loginMember(member);
		if(m!=null) {
			session.setAttribute("m", m);
			session.setAttribute("errMsg", "");
			return "redirect:/";
		}else {
			session.setAttribute("errMsg", "아이디 또는 패스워드가 일치하지 않습니다.");
			return "member/loginFrm";
		}
	}
	//logout
	@RequestMapping(value = "/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	//joinSuccess이동
	@RequestMapping(value = "joinSuccess")
	public String joinSuccess() {
		return "member/joinSuccess";
	}
	//중복된 아이디체크
	@ResponseBody
	@RequestMapping(value = "/idCheck.do")
	public String idCheck(Member m) {
		Member member = service.idCheck(m);
		if(member == null) {
			return "0";
		}else {
			return "1";
		}
	}
	//회원가입
	@RequestMapping(value = "/join.do")
	public String join(Member m ) {
		int result = service.insertMember(m);
		if(result >0) {
			return "member/loginFrm";
		}else {
			return "redirect:/";
		}
	}
	//전화번호 문자인증
	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { 
		// 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		//난수 생성
		service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		return Integer.toString(randomNumber);
	}
	//searchId이동
	@RequestMapping(value = "/searchId.do")
	public String searchIdFrm() {
		return "member/searchId";
	}
	//searchId1
	@RequestMapping(value = "/seachId1.do")
	public String searchId(Member m, Model model) {
		ArrayList<Member> list = service.searchId(m);
		if(list.isEmpty()) {
			return "member/searchId";
		}else {
			model.addAttribute("list",list);
			return "member/searchIdList";
		}
	}
	//searchPw이동
	@RequestMapping(value = "/searchPw.do")
	public String searchPwFrm() {
		return "member/searchPw";
	}
	//searchPw1
	@RequestMapping(value = "/searchPw1.do", method = RequestMethod.GET)
	public String searchPw(Member m, Model model) {
		Member member = service.searchPw(m);
		if(member == null) {
			return "member/searchPw";
		}else {
			model.addAttribute("m", member);
			return "member/searchPwList";
		}
	}
	//패스워드변경
	@ResponseBody
	@RequestMapping(value = "/changePw.do" , produces = "application/json;charset=utf-8")
	public String updatePw(Member m ) {
		int result = service.updatePwMember(m);
		System.out.println(result);
		if(result>0) {
			return "0";
		}else {
			return "1";
		}
	}
	//기존 패스워드와 동일 여부
	@ResponseBody
	@RequestMapping(value = "/checkPw.do", produces = "application/json;charset=utf-8")
	public String pwCheck(Member m) {
		Member member = service.checkPwMember(m);
		if(member == null) {
			//사용가능
			return "0";
		}else {
			//사용중임
			return "1";
		}
	}
	//카카오톡 회원가입 2단계
		@RequestMapping(value = "/addProfil.do")
		public String addProfile(Member m, HttpSession session) {
		int result = service.insertProfileMember(m);
		if(result > 0) {
			return "member/loginFrm";
		}else {
			return "redirect:/";
		}
	}
	//네이버 로그아웃 2단계
		@RequestMapping(value = "/addProfileNaver.do")
		public String addProfileNaver(Member m, HttpSession session) {
			int result = service.insertProfileNaver(m);
			if(result >0) {
				return "redirect:/loginFrm.do";
			}else {
				return "redirect:/";
			}
		}
	//카카오로그아웃 choose
		@RequestMapping(value = "/logoutChoose.do")
		public String logoutChoose() {
			return "member/logoutChoose";
		}
		
	// ceoMain 이동 (판매자 정보)
	@RequestMapping(value="/ceoMain.do")
	public String ceoMain() {
		
		return "member/ceoMain";
	}
	// 판매자 정보 수정
	@RequestMapping(value = "/updateCeo.do")
	public String updateCeo(Member m, HttpSession session) {
		Member member = service.updateCeo(m);
		if(member != null) {
			session.setAttribute("m", member);
			return "member/ceoMain";
		}else {
			return "redirect:/";
		}
	}
	
	
}

























