package balgil.com.trip.coupon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.coupon.model.CouponVO;
import balgil.com.trip.coupon.service.CouponService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CouponController {
	
	@Autowired
	CouponService service;
	
	@RequestMapping(value = "/Coupon.do", method = RequestMethod.GET)
	public String Coupon() {
		log.info("/Coupon.do");

		return "coupon";
	}
	
	@RequestMapping(value = "/selectAllCoupon.do", method = RequestMethod.GET)
	public String selectAllCoupon(Model model) {
		log.info("/selectAllCoupon.do");

		List<CouponVO> vos = service.selectAll();

		model.addAttribute("vos", vos);

		return "coupon/selectAllCoupon";
	}
	
	@RequestMapping(value = "/selectOneCoupon.do", method = RequestMethod.GET)
	public String selectOneCoupon(Model model, CouponVO vo) {
		log.info("/selectOneCoupon.do...{}", vo);

		CouponVO vo2 = service.selectOne(vo);
		log.info("vo2:{}", vo2);

		model.addAttribute("vo2", vo2);

		return "coupon/selectAllCoupon";
	}
	
}
