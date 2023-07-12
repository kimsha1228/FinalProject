package balgil.com.trip.coupon.model;

import java.util.List;

public interface CouponDAO {

	List<CouponVO> selectList(CouponVO vo);

	void updateTime();

}
