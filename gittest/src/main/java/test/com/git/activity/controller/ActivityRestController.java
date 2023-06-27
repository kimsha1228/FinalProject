package test.com.git.activity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.git.activity.service.ActivityService;

@Slf4j
@Controller
public class ActivityRestController {

	@Autowired
	ActivityService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonSearchAct.do", method = RequestMethod.GET)
	public String jsonSearchAct() {
		log.info("jsonSearchAct.do..");
		return "Activity_test";
	}
	
}
