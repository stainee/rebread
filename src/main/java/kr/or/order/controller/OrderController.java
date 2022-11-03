package kr.or.order.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.order.model.service.OrderService;
import kr.or.order.model.vo.Order;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
	private final RestTemplate restTemplate = new RestTemplate();
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	@PostConstruct
	private void init() {
		restTemplate.setErrorHandler(new ResponseErrorHandler() {
			
			@Override
			public boolean hasError(ClientHttpResponse response) throws IOException {
				return false;
			}
			
			@Override
			public void handleError(ClientHttpResponse response) throws IOException {
			}
		});
	}
	
	private final String SECRET_KEY = "test_sk_OEP59LybZ8BnDlRmYzQ86GYo7pRe";
	
	@RequestMapping("/order.do")
	public String order() {
		return "order/order";
	}
	@RequestMapping("/orderDetail.do")
	public String orderDetail() {
		return "order/orderDetail";
	}
	
	// 결제전 정보 DB저장
	@ResponseBody
	@RequestMapping("/insertOrder.do")
	public String insertOrder(Order o) {
		System.out.println(o);
		int result = service.insertOrder(o);
		return "1";
		
	}
	
	@RequestMapping("/success.do")
	public String confirmOrder(@RequestParam String paymentKey, @RequestParam String orderId, @RequestParam int amount, Model model) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		
		headers.set("Authorization","Basic "+Base64.getEncoder().encodeToString((SECRET_KEY+":").getBytes()));
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		Map<String, String> payloadMap = new HashMap<>();
		payloadMap.put("orderId", orderId);
		payloadMap.put("amount", String.valueOf(amount));
		
		HttpEntity<String> request = new HttpEntity<>(objectMapper.writeValueAsString(payloadMap), headers);
		
		ResponseEntity<JsonNode> responseEntity = restTemplate.postForEntity("https://api.tosspayments.com/v1/payments/"+paymentKey, request, JsonNode.class);
		
		if(responseEntity.getStatusCode() == HttpStatus.OK) {
			JsonNode successNode = responseEntity.getBody();
			model.addAttribute("orderId",successNode.get("orderId").asText());
//			String secret = successNode.get("secret").asText();
			
			// 결제 후 paymentKey를 DB에 저장
			int orderNo = service.searchOrderNo();
			Order o = new Order();
			o.setOrderNo(orderNo);
			o.setPaymentKey(paymentKey);
			int result = service.insertPaymentKey(o);
			
			return "order/orderSuccess";
		}else {
			JsonNode failNode = responseEntity.getBody();
			model.addAttribute("message",failNode.get("message").asText());
			model.addAttribute("code",failNode.get("code").asText());
			return "order/orderFail"; 
		}
	}
	
	@RequestMapping("/fail.do")
	public String failOrder(@RequestParam String message, @RequestParam String code, Model model) {
		model.addAttribute("message",message);
		model.addAttribute("code",code);
		return "order/orderFail";
	}
	
	@RequestMapping("/orderCancel.do")
	public String orderCancel(@ModelAttribute Order o, Model model) {
		String paymentKey = o.getPaymentKey();
		
		
		
		return "redirect:/orderDetail.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
