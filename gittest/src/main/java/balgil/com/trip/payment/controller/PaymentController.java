package balgil.com.trip.payment.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.payment.model.PaymentVO;
import balgil.com.trip.payment.service.PaymentService;
import balgil.com.trip.usercoupon.service.UserCouponService;
import balgil.com.trip.users.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {

	@Autowired
	PaymentService service;

	@Autowired
	UsersService u_service; 
	
	@Autowired
	UserCouponService uc_service; 

	
	@RequestMapping(value = "/insertPaymentOne.do", method = RequestMethod.GET)
	public String insertPaymentOne(PaymentVO vo) {
		log.info("/insertPaymentOne.do");
		log.info("vo: {}", vo);
		
		String res_id = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
        Calendar dateTime = Calendar.getInstance();
        res_id = sdf.format(dateTime.getTime());
        res_id = res_id+"_"+(int)(Math.random()*10000);
        
//        log.info(res_id);
		vo.setRes_id(res_id);
		
		int result = service.insert(vo);
		log.info("result : {}", result);
		
		if(result==1) {
			
			int result_user = u_service.point(vo.getUser_id(), vo.getPoint());
			int result_userCoupon = uc_service.update(vo.getUser_id(), vo.getCode());
//			int result_couponHistory = 
			
			if(result_user==1 && result_userCoupon==1) {
				return "redirect:insertOneReservation.do?id="+vo.getRes_id()+"&quantity="+vo.getQuantity()+
						"&price="+vo.getPrice()+"&res_date="+vo.getRes_date()+"&price_final="+vo.getPrice_final()+
						"&act_id="+vo.getAct_id()+"&user_id="+vo.getUser_id();
			}else {
				return "home"; // 나중에 리다이렉트
			}
		}else {
			return "reservation/insertOne"; // 나중에 리다이렉트
		}
	}

	@ResponseBody
	@RequestMapping(value = "/jsonSelectOnePayment.do", method = RequestMethod.GET)
	public PaymentVO jsonSelectOnePayment(PaymentVO vo) {
		log.info("/jsonSelectOnePayment.do");
		
		PaymentVO vo2 = service.selectOne(vo);
		
		return vo2;
	}

}
