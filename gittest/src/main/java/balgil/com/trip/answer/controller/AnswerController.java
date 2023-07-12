package balgil.com.trip.answer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.answer.model.AnswerVO;
import balgil.com.trip.answer.service.AnswerService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AnswerController {

	@Autowired
	AnswerService service;
	
	@RequestMapping(value = "/deleteAnswerOk.do", method = RequestMethod.GET)
	public String deleteAnswerOk(AnswerVO vo) {
		log.info("/deleteAnswerOK.do...{}", vo);
		
		int result = service.delete(vo);
		log.info("result..{}", result);
		
		return "redirect:selectOneContact.do?id="+vo.getId();
	}
	
	@RequestMapping(value = "/insertAnswerOK.do", method = RequestMethod.GET)
	public String insertAnswerOK(AnswerVO vo) {
		log.info("/insertAnswerOK.do....");
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		return "redirect:selectOneContact.do?id="+vo.getId();
		
	}
	
	
	@RequestMapping(value = "/updateAnswerOK.do", method = RequestMethod.GET)
	public String updateAnswerOK(AnswerVO vo) {
		log.info("/updateAnswerOK.do....");
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		return "redirect:selectOneContact.do?id="+vo.getId();
	}
	
	
	
	
}
	

