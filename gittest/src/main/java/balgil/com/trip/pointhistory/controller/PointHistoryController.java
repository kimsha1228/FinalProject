package balgil.com.trip.pointhistory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.coupon.model.CouponVO;
import balgil.com.trip.pointhistory.model.PointHistoryVO;
import balgil.com.trip.pointhistory.service.PointHistoryService;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class PointHistoryController {
	
	@Autowired
	PointHistoryService service;
	
	@RequestMapping(value = "/selectAllPointHistory.do", method = RequestMethod.GET)
	public String selectAllPointHistory(Model model) {
		log.info("/selectAllPointHistory.do");

		List<PointHistoryVO> vos = service.selectAllPointHistory();

		model.addAttribute("vos", vos);

		return "pointhistory/selectAllPointHistory";
	}
	
}