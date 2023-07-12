package balgil.com.trip.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import balgil.com.trip.coupon.service.CouponService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CouponRestController {

	
	@Autowired
	CouponService service;
	

}
