package balgil.com.trip.payment.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.ConvertOperators.ToDate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.payment.model.PaymentVO;
import balgil.com.trip.payment.service.PaymentService;
import balgil.com.trip.pointhistory.service.PointHistoryService;
import balgil.com.trip.reservation.model.ReservationVO;
import balgil.com.trip.reservation.service.ReservationService;
import balgil.com.trip.usercoupon.service.UserCouponService;
import balgil.com.trip.users.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {

	@Autowired
	PaymentService pay_service;
	
	@Autowired
	ReservationService res_service;

	@Autowired
	UsersService u_service; 
	
	@Autowired
	UserCouponService uc_service; 

	@Autowired
	PointHistoryService p_service; 
	
	@RequestMapping(value = "/insertPaymentOne.do", method = RequestMethod.GET)
	public String insertPaymentOne(PaymentVO vo) {
		log.info("/insertPaymentOne.do");
		log.info("vo: {}", vo);
		
		String res_id = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
        Calendar dateTime = Calendar.getInstance();
        res_id = sdf.format(dateTime.getTime());
        res_id = res_id+"_"+(int)(Math.random()*10000);
		vo.setRes_id(res_id);
		
		int pay_result = pay_service.insert(vo);
		log.info("pay_result : {}", pay_result);
		if(pay_result==1) {
			
			int result_user = 0;
			int result_pointHistory = 0;
			if(vo.getPoint().equals("0")) {
				result_user = 1;
				result_pointHistory = 1;
			}else {
				result_user = u_service.pointUpdate(vo.getUser_id(), vo.getPoint());
				result_pointHistory = p_service.useInsert(vo.getUser_id(), vo.getPoint());
			}
			int result_userCoupon = 0;
			if(vo.getCode().equals("0")) {
				result_userCoupon = 1;
			}else {
				result_userCoupon = uc_service.updateCouponUse(vo.getUser_id(), vo.getCode());
			}
			
			if(result_user==1 && result_pointHistory==1 && result_userCoupon==1) {
				ReservationVO resvo = new ReservationVO();
				resvo.setAct_id(vo.getAct_id());
				resvo.setId(vo.getRes_id());
				resvo.setPrice(vo.getPrice());
				resvo.setPrice_total(vo.getPrice_total());
				resvo.setQuantity(vo.getQuantity());
				resvo.setUser_id(vo.getUser_id());
				String res_date = vo.getRes_date();
				res_date = res_date.substring(0,10);
				log.info(res_date.substring(0,10));
				resvo.setRes_date(res_date);
				
				int res_result = res_service.insert(resvo);
				log.info("res_result : {}", res_result);

				return "redirect:reservationComplete.do?act_id="+vo.getAct_id()
				+"&res_id="+vo.getRes_id()
				+"&price="+vo.getPrice()
				+"&price_total="+vo.getPrice_total()
				+"&res_date="+vo.getRes_date()+"&quantity="+vo.getQuantity()
				+"&user_id="+vo.getUser_id();
			
			}else {
				return "home"; // 나중에 리다이렉트
			}
			
		}else {
			return "redirect:insertOneReservation.do?act_id=5&res_date=2023-10-31&quantity=5&price=50000"; // 나중에 리다이렉트
		}
	}


}
