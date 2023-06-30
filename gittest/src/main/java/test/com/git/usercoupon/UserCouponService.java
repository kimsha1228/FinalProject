package test.com.git.usercoupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
