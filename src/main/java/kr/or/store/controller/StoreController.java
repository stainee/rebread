package kr.or.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;

@Controller
public class StoreController {

	@Autowired
	private StoreService sservice;
	
	@ResponseBody
	@RequestMapping(value="/storeUpdate.do", produces = "application/json;charset=utf-8")
	public void storeUpdate(Store s) {
		int result = sservice.updateStoreDetail(s);
	}
}
