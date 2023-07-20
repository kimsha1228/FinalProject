package balgil.com.trip.contact.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.activity.model.ActivityVO;
import balgil.com.trip.activity.service.ActivityService;
import balgil.com.trip.contact.service.ContactService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/contact")
public class ContactRestController {

	
	@Autowired
	ContactService service;
	
	@Autowired
    ActivityService actservice;
	
	@ResponseBody
	@RequestMapping(value = "/jsonActSelectOne.do", method = RequestMethod.GET)
	public String jsonActSelectOne(ActivityVO vo) {
	    log.info("ActSelectOne.do...{}", vo);
	    
	    ActivityVO vo2 = actservice.selectOne(vo);
	    log.info("vo2: {}", vo2);
	    
	    String actName = vo2.getAct_name(); // act_name 값을 가져옴
	    
	    return actName;
	}



}