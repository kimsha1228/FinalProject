package test.com.git.coupon;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {

	private String code;
	private String name;
	private int rate;
	private int amount;
	private Date expire;
	
}
