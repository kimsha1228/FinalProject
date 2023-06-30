package balgil.com.trip.payment.model;

import lombok.Data;

@Data
public class PaymentVO {

	private int id;
	private int price_total;
	private String method;
	private String coupon_name;
	private String point;
	private int price_final;
	private int res_id;
	
}
