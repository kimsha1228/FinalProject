package balgil.com.trip.coupon.model;

import java.util.List;

public interface CouponDAO {

	CouponVO selectOne(CouponVO vo);

	List<CouponVO> selectList(CouponVO vo);
	
	void updateTime();

	List<CouponVO> selectAllCoupon();

}