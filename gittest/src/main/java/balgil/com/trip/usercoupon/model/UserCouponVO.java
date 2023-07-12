package balgil.com.trip.usercoupon.model;

import lombok.Data;

@Data
public class UserCouponVO {
	
	private String user_id;
	private String couponcode;
	private int isused;
	
}
