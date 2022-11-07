package kr.or.cs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.cs.model.service.CSService;
import kr.or.cs.model.vo.CS;

@Controller
public class CSController {
	@Autowired
	private CSService service;
	
	@ResponseBody
	@RequestMapping(value="/CScheckUpdate.do" ,produces = "application/json;charset=utf-8")
	public int CSCheckUpdate(int csNo, int csCheck) {
		int result = -1;
		if(csCheck == 0) {//완료해야하는 상황이면
			result = service.updateCheck(csNo, 1);
		}else if(csCheck == 1) {//취소해야하는 상황이면
			result = service.updateCheck(csNo, 0);
		}
		int check = service.selectOneCheck(csNo);
		return check;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertCS.do", produces = "application/json;charset=utf-8")
	public void insertCS(CS cs) {
		int result = service.insertCS(cs);
	}
}
