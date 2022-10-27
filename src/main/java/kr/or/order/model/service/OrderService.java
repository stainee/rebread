package kr.or.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import kr.or.order.model.dao.OrderDao;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;
}
