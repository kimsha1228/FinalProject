package balgil.com.trip.destination.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.destination.service.DestinationService;
import balgil.com.trip.destination.model.DestinationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DestinationController {

	@Autowired
	DestinationService service;

	@RequestMapping(value = "/destination.do", method = RequestMethod.GET)
	public String destination() {
		log.info("/destination.do");

		return "destination";
	}

	@RequestMapping(value = "/selectAllDestination.do", method = RequestMethod.GET)
	public String selectAllDestination(DestinationVO vo, Model model) {
		log.info("/selectAllDestination.do");

		List<DestinationVO> vos1 = service.selectAll(vo);
		log.info("{}", vos1);

		model.addAttribute("vos1", vos1);

		return "destination/destinationSelectAll";
	}




}
