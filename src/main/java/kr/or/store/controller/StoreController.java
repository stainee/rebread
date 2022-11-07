package kr.or.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreDetail;
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
	
	@RequestMapping(value="/allStoreList.do")
	public String allStoreList(int reqPage,Model model) {
		StorePageData spd = sservice.selectStoreList(reqPage);
		//System.out.println(spd);
		model.addAttribute("list",spd.getList());
		model.addAttribute("pageNavi",spd.getPageNavi());
		model.addAttribute("reqPage",spd.getReqPage());
		model.addAttribute("numPerPage", spd.getNumPerPage());
		return "store/storeList";
	}
	@RequestMapping(value="/detailStore.do")
	public String detailStore(int storeNo, Model model) {
		//Store s = sservice.selectOneStore2(storeNo);
		//System.out.println(s);
		//model.addAttribute("s",s);
		StoreDetail sd = sservice.selectOneStore2(storeNo);
		System.out.println(sd);
		model.addAttribute("sd",sd);
		return "store/detailStore";
	}
	
	@ResponseBody 
	@RequestMapping(value="/storeSearch.do", produces = "application/json;charset=utf-8")
	public String storeSearch(String storeName) {
		ArrayList<Store> list = sservice.searchStore(storeName);
		return new Gson().toJson(list);
	}
}
