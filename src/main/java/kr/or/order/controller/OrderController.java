package kr.or.order.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
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
	
	// 주문페이지 이동
	@RequestMapping("/order.do")
	public String order() {
		return "order/order";
	}
	
	// 주문상세페이지 이동
	@RequestMapping("/orderDetail.do")
	public String orderDetail(int orderNo, Model model) {
		Order o = service.selectOneOrder(orderNo);
		model.addAttribute("o",o);
		return "order/orderDetail";
	}
	
	// 결제전 정보 DB저장
	@ResponseBody
	@RequestMapping("/insertOrder.do")
	public String insertOrder(Order o) {
		int result = service.insertOrder(o);
		return "1";
		
	}
	
	// 주문 api
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
			
			// 결제 후 paymentKey를 DB에 저장
			int orderNo = service.searchOrderNo();
			Order o = new Order();
			o.setOrderNo(orderNo);
			o.setPaymentKey(paymentKey);
			int result = service.updatePaymentKey(o);
			
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
	
	// 주문 취소 api
	@RequestMapping("/orderCancel.do")
	public String orderCancel(int orderNo, Model model) throws Exception {
		String paymentKey = service.selectPaymentKey(orderNo);
		String cancelReason = "고객변심";
		
		// base64로 인코딩
//		Encoder encoder = Base64.getEncoder();
//		byte[] encodedBytes = encoder.encode(SECRET_KEY.getBytes("UTF-8"));
//		byte[] encodedBytes = Base64.getEncoder().encode(SECRET_KEY.getBytes("UTF-8"));
//		String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);
		
		String authorizations = "Basic " + Base64.getEncoder().encodeToString((SECRET_KEY+":").getBytes());
		
		URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey + "/cancel");
		
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Authorization", authorizations);
		connection.setRequestProperty("Content-Type", "application/json");
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		
		JSONObject obj = new JSONObject();
		obj.put("cancelReason", cancelReason);
		
		OutputStream outputStream = connection.getOutputStream();
		outputStream.write(obj.toString().getBytes("UTF-8"));
		
		int code = connection.getResponseCode();
		boolean isSuccess = code == 200 ? true : false;
		InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
		Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(reader);
		responseStream.close();
		if(isSuccess) {
			return "order/orderSuccess";
		}
		else {
			return "order/orderFail";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
