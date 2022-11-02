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

	public int insertOrder(Order o) {
		int result = dao.insertOrder(o);
		return result;
	}

	public int searchOrderNo() {
		int orderNo = dao.searchOrderNo();
		return orderNo;
	}

	public int insertPaymentKey(Order o) {
		int result = dao.insertPaymentKey(o);
		return result;
	}

	
}
