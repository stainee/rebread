package kr.or.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.vo.Member;
import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StorePageData;

@Controller
public class StoreController {

	@Autowired
	private StoreService sservice;
	
	@ResponseBody
	@RequestMapping(value="/storeUpdate.do", produces = "application/json;charset=utf-8")
	public void storeUpdate(Store s) {
		int result = sservice.updateStoreDetail(s);
	}
	
	// ceoStoreInfo 이동 (가게 정보)
	@RequestMapping(value="/ceoStoreInfo.do")
	public String ceoStoreInfo(Member m, Model model, HttpSession session) {
		ArrayList<Store> list = sservice.selectOneStore1(m);
		model.addAttribute("list",list);
		session.setAttribute("m", m);
		System.out.println(list);
		System.out.println(m);
		return "store/ceoStoreInfo";
	}
	
	// 가게 정보 페이징 처리
	@RequestMapping(value = "/storeInfoList.do")
	public String storeInfoList(int reqPage, Model model) {
		StorePageData spd = sservice.selectStoreList(reqPage);
		model.addAttribute("list",spd.getList());
		model.addAttribute("pageNavi",spd.getPageNavi());
		model.addAttribute("reqPage",spd.getReqPage());
		model.addAttribute("numPerPage",spd.getNumPerPage());
		return "store/ceoStoreInfo";
	}
		
	// ceoStoreSalesInfo 이동 (판매 정보 관리)
	@RequestMapping(value="/ceoStoreSalesInfo.do")
	public String ceoStoreSalesInfo() {
		return "/store/ceoStoreSalesInfo";
	}
	
}
