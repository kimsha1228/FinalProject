package balgil.com.trip.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CouponService {

	@Autowired
	CouponDAO dao;

	public CouponService() {
		log.info("CouponService()...");
	}

	public List<CouponVO> selectList(CouponVO vo) {
		return dao.selectList(vo);
	}

}
