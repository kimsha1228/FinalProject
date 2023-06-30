package balgil.com.trip.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {

	@Autowired
	PaymentService service;
	
	@RequestMapping(value = "/insertPayment.do", method = RequestMethod.GET)
	public String insertPayment(PaymentVO vo) {
		log.info("/insertPayment.do");
		
		int result = service.insert(vo);
		log.info("result : {}", result);
		
		return "reservation/insert"; // 나중에 연결
	}

	@ResponseBody
	@RequestMapping(value = "/jsonSelectOnePayment.do", method = RequestMethod.GET)
	public PaymentVO jsonSelectOnePayment(PaymentVO vo) {
		log.info("/jsonSelectOnePayment.do");
		
		PaymentVO vo2 = service.selectOne(vo);
		
		return vo2;
	}

}
