package kr.or.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping(value="/order.do")
	public String order() {
		return "order/order";
	}
}
