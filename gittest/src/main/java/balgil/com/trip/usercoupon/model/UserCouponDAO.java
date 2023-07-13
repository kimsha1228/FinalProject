package balgil.com.trip.usercoupon.model;

import java.util.List;

import balgil.com.trip.coupon.model.CouponVO;

public interface UserCouponDAO {

	List<UserCouponVO> selectAll(UserCouponVO vo);

	int updateCouponUse(String user_id, String code);

	int updateCouponBack(String user_id, String code);

	int insert(UserCouponVO vo);

}