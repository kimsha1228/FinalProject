package balgil.com.trip.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.payment.model.PaymentVO;
import balgil.com.trip.payment.service.PaymentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {

	@Autowired
	PaymentService service;
	
	@RequestMapping(value = "/insertPayment.do", method = RequestMethod.GET)
	public String insertPayment(PaymentVO vo) {
		log.info("/insertPayment.do");
		log.info("vo: {}", vo);
		
//		int result = service.insert(vo);
//		log.info("result : {}", result);
		
		return "reservation/insertOne"; // 나중에 연결
	}

	@ResponseBody
	@RequestMapping(value = "/jsonSelectOnePayment.do", method = RequestMethod.GET)
	public PaymentVO jsonSelectOnePayment(PaymentVO vo) {
		log.info("/jsonSelectOnePayment.do");
		
		PaymentVO vo2 = service.selectOne(vo);
		
		return vo2;
	}

}
