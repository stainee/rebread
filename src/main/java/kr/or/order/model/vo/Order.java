package kr.or.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private int orderNo;
	private int memberNo;
	private int storeNo;
	private String orderState;
	private String orderDate;
	private int orderTotalQuan;
	private int orderPrice;
	private String orderId;
	private String ordererName;
	private String ordererAddr;
	private String ordererPhone;
	private int ordererMileage;
	private String paymentKey;
}
