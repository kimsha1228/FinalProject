package balgil.com.trip.usercoupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.usercoupon.model.UserCouponDAO;
import balgil.com.trip.usercoupon.model.UserCouponVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserCouponService {

	@Autowired
	UserCouponDAO dao;

	public UserCouponService() {
		log.info("UserCouponService()...");
	}

	public List<UserCouponVO> selectAll(UserCouponVO vo) {
		return dao.selectAll(vo);
	}

	public int update(String user_id, String code) {
		return dao.update(user_id, code);
	}

}
