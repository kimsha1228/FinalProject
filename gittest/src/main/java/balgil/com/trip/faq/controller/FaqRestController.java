package balgil.com.trip.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.faq.model.FaqVO;
import balgil.com.trip.faq.service.FaqService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FaqRestController {
	
	@Autowired
	FaqService service;
	
	@ResponseBody
	@RequestMapping (value = "/jsonSelectAllFaq.do", method = RequestMethod.GET)
	public List<FaqVO> jsonSelectAllFaq(){
		log.info("jsonSelectAllFaq.do....");
		return service.selectAll();
	}
}