package balgil.com.trip.usercoupon.model;

import java.util.List;

public interface UserCouponDAO {

	List<UserCouponVO> selectAll(UserCouponVO vo);

	int update(String user_id, String code);

}
