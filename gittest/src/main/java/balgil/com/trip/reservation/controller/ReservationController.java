package balgil.com.trip.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "/reservation_api.do", method = RequestMethod.GET)
	public String reservation_api() {
		log.info("/reservation_api.do");

		return "reservation_api";
	}
	
	@RequestMapping(value = "/reservationOne.do", method = RequestMethod.GET)
	public String reservationOne() {
		log.info("/reservationOne.do");

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
	
	@RequestMapping(value = "/insertOneReservation.do", method = RequestMethod.GET)
	public String insertOneReservation(ReservationVO vo) {
		log.info("/insertOneReservation.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result : {}", result);
		
		return "home"; //나중에 바꾸기 예약완료되면 포인트 -, 쿠폰 사용됨으로 바꾸기
//		if (result == 1) {
//			return "redirect:reservation_api.do";
//		} else {
//			return "redirect:reservationInsert.do";
//		}
	}
	
	@RequestMapping(value = "/cancelReservation.do", method = RequestMethod.GET)
	public String cancelReservation(ReservationVO vo) {
		log.info("/cancelReservation.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result: ", result);
		
		return "reservation/insert";
	}

}
