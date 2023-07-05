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
	
	@RequestMapping(value = "/selectAllAnswer.do", method = RequestMethod.GET)
	public String selectAllAnswer() {
		log.info("/selectAllAnswer.do");
		
		List<AnswerVO> vos = service.selectAll();
		
		
		return "answer/selectAll";
	}
	
	@RequestMapping(value = "/selectOneAnswer.do", method = RequestMethod.GET)
	public String selectOneAnswer(AnswerVO vo) {
		log.info("/selectOneAnswer.do....{}", vo);
		
		AnswerVO vo2 = service.selectOne(vo);
		
		return "answer/selectOne";
	}
	
	@RequestMapping(value = "/insertAnswer.do", method = RequestMethod.GET)
		public String insertAnswer() {
		log.info("/insertAnswer.do...");	
		
		return "answer/insert";
	}
	
	@RequestMapping(value = "/inserAnswertOK.do", method = RequestMethod.POST)
	public String insertAnswerOK(AnswerVO vo) {
		log.info("/insertAnswerOK.do....");
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllAnswer.do";
		}else {
			return "redirect:insertAnswer.do";
		}
	}
	
	@RequestMapping(value = "/updateAnswer.do", method = RequestMethod.GET)
	public String updateAnswer(AnswerVO vo) {
	log.info("/updateAnswer.do...", vo);
	
	AnswerVO vo2 = service.selectOne(vo);
	
	return "answer/update";
	}
	
	@RequestMapping(value = "/updateAnswerOK.do", method = RequestMethod.POST)
	public String updateAnswerOK(AnswerVO vo) {
		log.info("/updateAnswerOK.do....");
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectOneAnswer.do?num="+vo.getNum();
		}else {
			return "redirect:updateAnswer.do?num="+vo.getNum();
		}
	}
	
	
	
	
}
	

