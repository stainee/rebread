package kr.or.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.order.model.vo.Order;

@Repository
public class OrderDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertOrder(Order o) {
		int result = sqlSession.insert("order.insertOrder",o);
		return result;
	}

	public int searchOrderNo() {
		int orderNo = sqlSession.selectOne("order.searchOrderNo");
		return orderNo;
	}

	public int insertPaymentKey(Order o) {
		int result = sqlSession.insert("order.insertPaymentKey",o);
		return result;
	}

}
