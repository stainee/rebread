package kr.or.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import kr.or.order.model.dao.OrderDao;
import kr.or.order.model.vo.Order;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;

	// 결제 전 배송지 정보 DB 저장
	public int insertOrder(Order o) {
		int result = dao.insertOrder(o);
		return result;
	}

	// paymentKey 저장 위해 orderNo 조회
	public int searchOrderNo() {
		int orderNo = dao.searchOrderNo();
		return orderNo;
	}

	// paymentKey DB 저장
	public int updatePaymentKey(Order o) {
		int result = dao.updatePaymentKey(o);
		return result;
	}

	public Order selectOneOrder(int orderNo) {
		Order o = dao.selectOneOrder(orderNo);
		return o;
	}

	public String selectPaymentKey(int orderNo) {
		String paymentKey = dao.selectPaymentKey(orderNo);
		return paymentKey;
	}

	
}
