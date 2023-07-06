package balgil.com.trip.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
public class ReservationController {

	@Autowired
	ReservationService service;
	
	@Autowired
	PaymentService pay_service;
	
	@Autowired
	UsersService u_service; 
	
	@Autowired
	UserCouponService uc_service; 

	@Autowired
	PointHistoryService p_service; 
	
	@RequestMapping(value = "/reservation_api.do", method = RequestMethod.GET)
	public String reservation_api() {
		log.info("/reservation_api.do");

		return "reservation_api";
	}
	
	@RequestMapping(value = "/insertOneReservation.do", method = RequestMethod.GET)
	public String insertOneReservation() {
		log.info("/insertOneReservation.do");

		return "reservation/insertOne";
	}

//	@RequestMapping(value = "/insertManyReservation.do", method = RequestMethod.GET)
//	public String insertManyReservation(String datas) {
//		log.info("/insertManyReservation.do...{}", datas);
//		
//		String[] arr = datas.split(":");//2,10000,2023-07-30
//		for (int i = 0; i < arr.length; i++) {
//			ReservationVO vo = new ReservationVO();
//			vo.setQuantity(Integer.parseInt(arr[i].split(",")[0]));//"2"
//			vo.setPrice(Integer.parseInt(arr[i].split(",")[1]));//"10000"
//			vo.setRes_date(arr[i].split(",")[2]);//"2023-07-30"
//			log.info("vo...{}", vo);
////			int result = service.insert(vo);
////			log.info("result : {}", result);
//		}
//		
////		
//		return "reservation/insertOne";//나중에 바꾸기
////		if (result == 1) {
////			return "redirect:reservation_api.do";
////		} else {
////			return "redirect:reservationInsert.do";
////		}
//	}
	
	@RequestMapping(value = "/cancelReservation.do", method = RequestMethod.GET)
	public String cancelReservation(ReservationVO vo) {
		log.info("/cancelReservation.do...{}", vo);//reservation id, user_id 넘어올 것
		
		int result = service.update(vo);//iscanceled 1로 변경 후 
		
		String res_id = vo.getId();
		PaymentVO pay_vo = pay_service.selectCancelObject(res_id);
		log.info("{}", pay_vo);
		
		int result_user = u_service.pointInsertBack(vo.getUser_id(), pay_vo.getPoint());
		int result_pointHistory = p_service.useInsertBack(vo.getUser_id(), pay_vo.getPoint());
		int result_userCoupon = 0;
		if(pay_vo.getCode().equals("0")) {
			result_userCoupon = 1;
		}else {
			result_userCoupon = uc_service.updateCouponBack(vo.getUser_id(), pay_vo.getCode());
		}
		
		log.info("result: {}", result);
		log.info("result_user: {}", result_user);
		log.info("result_pointHistory: {}", result_pointHistory);
		log.info("result_userCoupon: {}", result_userCoupon);
		
		return "redirect:selectCancelReservation.do?user_id="+vo.getUser_id();
	}
	
	@RequestMapping(value = "/reservationComplete.do", method = RequestMethod.GET)
	public String reservationComplete(ReservationVO vo) {
		log.info("/reservationComplete.do...{}", vo);
		
		return "reservation/reservationComplete";
	}
	
	@RequestMapping(value = "/selectAllReservation.do", method = RequestMethod.GET)
	public String selectAllReservation(ReservationVO vo, Model model) {
		log.info("/selectAllReservation.do");
		
		List<ReservationVO> vos1 = service.selectAll(vo);
		log.info("{}", vos1);
		
		model.addAttribute("vos1",vos1);

		return "reservation/reservationSelectAll";
	}
	
	@RequestMapping(value = "/selectCancelReservation.do", method = RequestMethod.GET)
	public String selectCancelReservation(ReservationVO vo, Model model) {
		log.info("/selectCancelReservation.do");
		
		List<ReservationVO> vos2 = service.selectCancel(vo);
		log.info("{}", vos2);
		
		model.addAttribute("vos2",vos2);
		
		return "reservation/reservationSelectAll";
	}
	
	@RequestMapping(value = "/selectOneReservation.do", method = RequestMethod.GET)
	public String selectOneReservation(ReservationVO vo, Model model) {
		log.info("/selectOneReservation.do");
		
		ReservationVO vo1 = service.selectOne(vo);
		log.info("{}", vo1);
		
		model.addAttribute("vo1",vo1);

		return "reservation/reservationSelectOne";
	}
	
	@RequestMapping(value = "/selectOneCancelReservation.do", method = RequestMethod.GET)
	public String selectOneCancelReservation(ReservationVO vo, Model model) {
		log.info("/selectOneCancelReservation.do");
		
		ReservationVO vo1 = service.selectOne(vo);
		log.info("{}", vo1);
		
		model.addAttribute("vo1",vo1);
		
		return "reservation/reservationSelectOneCancel";
	}
	
	
}
